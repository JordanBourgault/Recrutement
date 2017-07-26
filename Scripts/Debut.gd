extends Control

func _ready():
	#Exécuter la fonction qui grise les colonnes désirées
	greyColumns()
	
	#On obtient la node du label qui affiche le nom du candidat
	var label_nom = get_node("ScrollContainer/Nom/NOM")
	label_nom.set_text("Nom du candidat : " + global.NOM)
	
	#On obtient la date du système et on l'affiche
	var label_date = get_node("ScrollContainer/Date/DATE")
	label_date.set_text("Date : %s/%s/%s" % [global.DAY, global.MONTH, global.YEAR])
	
	#On trouve tous les boutons à travers leur groupe en itérant à travers tout l'arbre
	for button in get_tree().get_nodes_in_group("BOUTON"):
		#On connecte tout les boutons à la même fonctionb qui va s'occuper d'updater les items nécessaires.
		#(Quand on pèse sur n'importe quel bouton on l'insère dans la fonction _bouton_appuye)
		button.connect("pressed", self, "_bouton_appuye", [button])
		
		#On itère à travers les index de chaque bouton pour tous les détecter et les assigner au bon groupe.
		for i in range(1, 7):
			var index = str(i)
			
			#Vérification du nom et de l'index de chaque bouton pour pouvoir l'assigner au groupe adéquat
			if button.get_name() == ("Introspection" + index):
				button.add_to_group("Introspection")
			if button.get_name() == ("Autonomie" + index):
				button.add_to_group("Autonomie")
			if button.get_name() == ("Gestion" + index):
				button.add_to_group("Gestion")
			if button.get_name() == ("Propension" + index):
				button.add_to_group("Propension")
			if button.get_name() == ("Ouverture" + index):
				button.add_to_group("Ouverture")
			if button.get_name() == ("Adaptabilité" + index):
				button.add_to_group("Adaptabilite")
			if button.get_name() == ("Capacite" + index):
				button.add_to_group("Capacite")
			if button.get_name() == ("Perseverance" + index):
				button.add_to_group("Perseverance")
			if button.get_name() == ("Sens" + index):
				button.add_to_group("Sens")

func _bouton_appuye(button):
	global.adjustValues(button)


#Fonction qui vérifie l'état de la varible et qui grise (ou dégrise) la colonne au besoin
func verifyGrey(box, variable, name):
	if variable != true:
			if box.get_name() == name:
				box.set_texture(load("res://Images/Grayed_rect.png"))
	else:
		if box.get_name() == name:
			box.set_texture(load("res://Images/Trans_rect.png"))


#Fonction qui s'occupe de griser les colonnes nécessaires
func greyColumns():
	for box in get_tree().get_nodes_in_group("GREYBOX"):
		verifyGrey(box, global.col_INTROSPECTION, "Introspection")
		verifyGrey(box, global.col_AUTONOMIE, "Autonomie")
		verifyGrey(box, global.col_GESTION, "Gestion")
		verifyGrey(box, global.col_PROPENSION, "Propension")
		verifyGrey(box, global.col_OUVERTURE, "Ouverture")
		verifyGrey(box, global.col_ADAPTABILITE, "Adaptabilite")
		verifyGrey(box, global.col_CAPACITE, "Capacite")
		verifyGrey(box, global.col_PERSEVERANCE, "Perseverance")
		verifyGrey(box, global.col_SENS, "Sens")

func _on_Precedent_pressed():
	get_tree().change_scene("res://Selection.tscn")
