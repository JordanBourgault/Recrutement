extends Node

func _ready():
	get_node("Nom").set_text(global.NOM)
	set_process_input(true)


#Fonction qui gère les évènements après que le bouton "Continuer" est appuyé
func _on_Continuer_pressed():
	#Vérification que l'utilisateur à entré quelque chose comme Nom
	if global.NOM.length() != 0:
		get_tree().change_scene("res://Selection.tscn")
#TO DO: ajouter plus de contrôle quant à l'entrée de caractères (ex: pas de chiffres, pas de charactères spéciaux...)


#Fonction qui update la variable qui contient le num au fur et à mesure que l'utilisateur change la string
func _on_Nom_text_changed( text ):
	global.NOM = text


#Fonction qui gère le bouton pour quitter l'opération
func _on_Quitter_pressed():
	get_tree().quit()


#Fonction qui permet d'appuyer sur Enter à la place d'appuyer sur le bouton Continuer
func _input(event):
	if event.is_action_pressed("ENTER"):
		_on_Continuer_pressed()