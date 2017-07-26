extends Control

func _ready():
	set_process(true)
	setState()

#Fonction qui dait en sorte que les boites cochées restent coché.
func setState():
	for bouton in get_tree().get_nodes_in_group("COL_TOGGLE"):
		if bouton.get_name() == ("Introspection"):
			bouton.set_pressed(global.col_INTROSPECTION)
		if bouton.get_name() == ("Autonomie"):
			bouton.set_pressed(global.col_AUTONOMIE)
		if bouton.get_name() == ("Gestion"):
			bouton.set_pressed(global.col_GESTION)
		if bouton.get_name() == ("Propension"):
			bouton.set_pressed(global.col_PROPENSION)
		if bouton.get_name() == ("Ouverture"):
			bouton.set_pressed(global.col_OUVERTURE)
		if bouton.get_name() == ("Adaptabilite"):
			bouton.set_pressed(global.col_ADAPTABILITE)
		if bouton.get_name() == ("Capacite"):
			bouton.set_pressed(global.col_CAPACITE)
		if bouton.get_name() == ("Perseverance"):
			bouton.set_pressed(global.col_PERSEVERANCE)
		if bouton.get_name() == ("Sens"):
			bouton.set_pressed(global.col_SENS)


#Gestion des boutons continuer et précédent
func _on_Continuer_pressed():
	get_tree().change_scene("res://Debut.tscn")

func _on_Precedent_pressed():
	get_tree().change_scene("res://Main_Screen.tscn")


#Gestion des boutons du premier tableau
func _on_Introspection_toggled( pressed ):
	global.col_INTROSPECTION = pressed

func _on_Autonomie_toggled( pressed ):
	global.col_AUTONOMIE = pressed

func _on_Gestion_toggled( pressed ):
	global.col_GESTION = pressed

func _on_Propension_toggled( pressed ):
	global.col_PROPENSION = pressed

func _on_Ouverture_toggled( pressed ):
	global.col_OUVERTURE = pressed

func _on_Adaptabilite_toggled( pressed ):
	global.col_ADAPTABILITE = pressed

func _on_Capacite_toggled( pressed ):
	global.col_CAPACITE = pressed

func _on_Perseverance_toggled( pressed ):
	global.col_PERSEVERANCE = pressed

func _on_Sens_toggled( pressed ):
	global.col_SENS = pressed



func _on_Cocher_tout_pressed():
	verifyButtonState()


func verifyButtonState():

	#Si tous les boutons sont cochés, les décocher
	if areButtonsChecked()[0] == areButtonsChecked()[1]:
		global.col_INTROSPECTION = false
		global.col_AUTONOMIE = false
		global.col_GESTION = false
		global.col_PROPENSION = false
		global.col_OUVERTURE = false
		global.col_ADAPTABILITE = false
		global.col_CAPACITE = false
		global.col_PERSEVERANCE = false
		global.col_SENS = false
	
	if areButtonsChecked()[0] != areButtonsChecked()[1]:
		global.col_INTROSPECTION = true
		global.col_AUTONOMIE = true
		global.col_GESTION = true
		global.col_PROPENSION = true
		global.col_OUVERTURE = true
		global.col_ADAPTABILITE = true
		global.col_CAPACITE = true
		global.col_PERSEVERANCE = true
		global.col_SENS = true

	setState()


func areButtonsChecked():
	var global_status = 0
	var buttons = get_tree().get_nodes_in_group("COL_TOGGLE")
	var button_size = buttons.size()
	
	for button in buttons:
		if button.is_pressed():
			global_status += 1

	return [global_status, button_size]


func _process(delta):
	#Si tous les boutons sont cochés, cocher automatiquement le bouton "Cocher tout"
	if areButtonsChecked()[0] == areButtonsChecked()[1]:
		get_node("Cocher_tout").set_pressed(true)

	#Si tous les boutons ne sont pas cochés, décocher automatiquement le bouton "cocher tout"
	if areButtonsChecked()[0] != areButtonsChecked()[1]:
		get_node("Cocher_tout").set_pressed(false)