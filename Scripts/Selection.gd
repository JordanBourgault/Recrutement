extends Control

func _ready():
	set_process(true)
	setState()


#Gestion des boutons continuer et précédent
func _on_Continuer_pressed():
	get_tree().change_scene("res://Debut.tscn")

func _on_Precedent_pressed():
	get_tree().change_scene("res://Main_Screen.tscn")


#Fonction qui fait en sorte que les boites cochées restent coché.
func setState():
	#Boutons du premier groupe
	for bouton in get_tree().get_nodes_in_group("COL_TOGGLE"):
		if bouton.get_name() == ("Introspection"):
			bouton.set_pressed(global.Col_Categories["INTROSPECTION"])
		if bouton.get_name() == ("Autonomie"):
			bouton.set_pressed(global.Col_Categories["AUTONOMIE"])
		if bouton.get_name() == ("Gestion"):
			bouton.set_pressed(global.Col_Categories["GESTION"])
		if bouton.get_name() == ("Propension"):
			bouton.set_pressed(global.Col_Categories["PROPENSION"])
		if bouton.get_name() == ("Ouverture"):
			bouton.set_pressed(global.Col_Categories["OUVERTURE"])
		if bouton.get_name() == ("Adaptabilite"):
			bouton.set_pressed(global.Col_Categories["ADAPTABILITE"])
		if bouton.get_name() == ("Capacite"):
			bouton.set_pressed(global.Col_Categories["CAPACITE"])
		if bouton.get_name() == ("Perseverance"):
			bouton.set_pressed(global.Col_Categories["PERSEVERANCE"])
		if bouton.get_name() == ("Sens"):
			bouton.set_pressed(global.Col_Categories["SENS"])

	#Boutons du deuxième groupe
	for bouton in get_tree().get_nodes_in_group("COL_TOGGLE2"):
		if bouton.get_name() == ("Technique"):
			bouton.set_pressed(global.Col_Categories2["TECHNIQUE"])
		if bouton.get_name() == ("Analyse"):
			bouton.set_pressed(global.Col_Categories2["ANALYSE"])
		if bouton.get_name() == ("Creativite"):
			bouton.set_pressed(global.Col_Categories2["CREATIVITE"])
		if bouton.get_name() == ("Relation"):
			bouton.set_pressed(global.Col_Categories2["RELATION"])
		if bouton.get_name() == ("Resultats"):
			bouton.set_pressed(global.Col_Categories2["RESULTATS"])
		if bouton.get_name() == ("Procedures"):
			bouton.set_pressed(global.Col_Categories2["PROCEDURES"])


#Gestion des boutons du premier tableau
func _on_Introspection_toggled( pressed ):
	global.Col_Categories["INTROSPECTION"] = pressed

func _on_Autonomie_toggled( pressed ):
	global.Col_Categories["AUTONOMIE"] = pressed

func _on_Gestion_toggled( pressed ):
	global.Col_Categories["GESTION"] = pressed

func _on_Propension_toggled( pressed ):
	global.Col_Categories["PROPENSION"] = pressed

func _on_Ouverture_toggled( pressed ):
	global.Col_Categories["OUVERTURE"] = pressed

func _on_Adaptabilite_toggled( pressed ):
	global.Col_Categories["ADAPTABILITE"] = pressed

func _on_Capacite_toggled( pressed ):
	global.Col_Categories["CAPACITE"] = pressed

func _on_Perseverance_toggled( pressed ):
	global.Col_Categories["PERSEVERANCE"] = pressed

func _on_Sens_toggled( pressed ):
	global.Col_Categories["SENS"] = pressed


#Gestion des boutons du deuxième tableau
func _on_Technique_toggled( pressed ):
	global.Col_Categories2["TECHNIQUE"] = pressed
	
func _on_Analyse_toggled( pressed ):
	global.Col_Categories2["ANALYSE"] = pressed


func _on_Creativite_toggled( pressed ):
	global.Col_Categories2["CREATIVITE"] = pressed


func _on_Relation_toggled( pressed ):
	global.Col_Categories2["RELATION"] = pressed


func _on_Resultats_toggled( pressed ):
	global.Col_Categories2["RESULTATS"] = pressed

func _on_Procedures_toggled( pressed ):
	global.Col_Categories2["PROCEDURES"] = pressed


#Gère le bouton cocher tout pour le premier tableau
func _on_Cocher_tout_pressed():
	#Si tous les boutons sont cochés, les décocher
	if areButtonsChecked("COL_TOGGLE")[0] == areButtonsChecked("COL_TOGGLE")[1]:
		for key in global.Col_Categories:
			global.Col_Categories[key] = false
	#Si les boutons ne sont pas tous cochés, les cocher
	else:
		for key in global.Col_Categories:
			global.Col_Categories[key] = true
	
	print(global.Col_Categories)
	setState()


#Gère le bouton cocher tout pour le deuxième tableau
func _on_Cocher_tout2_pressed():
	#Si tous les boutons sont cochés, les décocher
	if areButtonsChecked("COL_TOGGLE2")[0] == areButtonsChecked("COL_TOGGLE2")[1]:
		print(areButtonsChecked("COL_TOGGLE2"))
		for key in global.Col_Categories2:
			global.Col_Categories2[key] = false
	
	else:
		print(areButtonsChecked("COL_TOGGLE2"))
		for key in global.Col_Categories2:
			global.Col_Categories2[key] = true

	print(global.Col_Categories2)
	setState()


#Fonction qui vérifie si tous les boutons sont cochés. La fonction retourne 
func areButtonsChecked(group):
	var global_status = 0
	var buttons = get_tree().get_nodes_in_group(group)
	var button_size = buttons.size()
	
	for button in buttons:
		if button.is_pressed():
			global_status += 1

	return [global_status, button_size]


func checkCocherTout(group, path):
	#Si tous les boutons sont cochés, cocher automatiquement le bouton "Cocher tout"
	if areButtonsChecked(group)[0] == areButtonsChecked(group)[1]:
		get_node(path).set_pressed(true)
	#Si tous les boutons ne sont pas cochés, décocher automatiquement le bouton "cocher tout"
	else:
		get_node(path).set_pressed(false)


func _process(delta):
	checkCocherTout("COL_TOGGLE", "Tableau1/Cocher_tout")
	checkCocherTout("COL_TOGGLE2", "Tableau2/Cocher_tout2")