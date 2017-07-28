extends Node

#Variable qui acceuille le nom du candidat
var NOM = ""

#Dictionnaire des variables qui gardent le statut de chacune des 9 catégories
var Categories = {
	 "INTROSPECTION" : 0,
	 "AUTONOMIE" : 0,
	 "GESTION" : 0,
	 "PROPENSION" : 0,
	 "OUVERTURE" : 0,
	 "ADAPTABILITE" : 0,
	 "CAPACITE" : 0,
	 "PERSEVERANCE" : 0,
	 "SENS" : 0,
	
	#Deuxième groupe
	"TECHNIQUE" : 0,
	"ANALYSE" : 0,
	"CREATIVITE" : 0,
	"RELATION" : 0,
	"RESULTATS" : 0,
	"PROCEDURES" : 0,
}

#Variables qui vérifient le statut des colonnes du premier tableau afin de les griser
var Col_Categories = {
	"INTROSPECTION" : false,
	"AUTONOMIE" : false,
	"GESTION" : false,
	"PROPENSION" : false,
	"OUVERTURE" : false,
	"ADAPTABILITE" : false,
	"CAPACITE" : false,
	"PERSEVERANCE" : false,
	"SENS" : false,
}
#Variables qui vérifient le statut des colonnes du deuxième tableau afin de les griser
var Col_Categories2 = {
	#Deuxième goupe
	"TECHNIQUE" : false,
	"ANALYSE" : false,
	"CREATIVITE" : false,
	"RELATION" : false,
	"RESULTATS" : false,
	"PROCEDURES" : false,
}


#Variables qui gardent en mémoire la date et l'heure
var date_time = OS.get_datetime()
var YEAR = date_time["year"]
var MONTH = addZero("month")
var DAY = addZero("day")
var START_HOUR = date_time["hour"]
var START_MIN = date_time["minute"]



#Fonction qui ajoute un zéro qui précède le mois ou le jour si il possède seulement un chiffre
func addZero(key):
	if (str(date_time[key])).length() == 1:
		return ("0" + str(date_time[key]))
	else:
		return(str(date_time[key]))


#Fonction qui s'occupe de désactiver les bons boutons de la colonne si un bouton est appuyé
func disableButtons(group, index):
	#On itère à travers tout les boutons qui sont dans le groupe choisi
	for bouton_individuel in get_tree().get_nodes_in_group(group):
		var index2 = int(bouton_individuel.get_name()[-1])
		#Si la valeur est nulle alors tous les boutons redeviennent actifs
		if Categories[group.to_upper()] == 0:
			bouton_individuel.set_disabled(false)
		else:
			#Tous les boutons sauf le bouton appuyé deviennent inactifs
			if index != index2:
				bouton_individuel.set_disabled(true)


#Fonction qui s'occupe d'ajuster les valeurs du dictionnaire qui garde en mémoire la valeur de chaque catégorie
func checkValues(group, index):
	if Categories[group.to_upper()] != index:
		Categories[group.to_upper()] = index
	else:
		Categories[group.to_upper()] = 0


#Fonction qui s'occupe d'updater les valeurs des variables de chaque catégorie.
func adjustValues(button):
	#On décompose la string du nom du bouton pour obtenir il se situe dans quelle rangée
	var index = int(button.get_name()[-1])
	
	if button.is_in_group("Introspection"):
		checkValues("Introspection", index)
		disableButtons("Introspection", index)

	if button.is_in_group("Autonomie"):
		checkValues("Autonomie", index)
		disableButtons("Autonomie", index)

	if button.is_in_group("Gestion"):
		checkValues("Gestion", index)
		disableButtons("Gestion", index)

	if button.is_in_group("Propension"):
		checkValues("Propension", index)
		disableButtons("Propension", index)

	if button.is_in_group("Ouverture"):
		checkValues("Ouverture", index)
		disableButtons("Ouverture", index)

	if button.is_in_group("Adaptabilite"):
		checkValues("Adaptabilite", index)
		disableButtons("Adaptabilite", index)

	if button.is_in_group("Capacite"):
		checkValues("Capacite", index)
		disableButtons("Capacite", index)

	if button.is_in_group("Perseverance"):
		checkValues("Perseverance", index)
		disableButtons("Perseverance", index)

	if button.is_in_group("Sens"):
		checkValues("Sens", index)
		disableButtons("Sens", index)

	#Deuxième tableau
	if button.is_in_group("Technique"):
		checkValues("Technique", index)
		disableButtons("Technique", index)

	if button.is_in_group("Analyse"):
		checkValues("Analyse", index)
		disableButtons("Analyse", index)

	if button.is_in_group("Creativite"):
		checkValues("Creativite", index)
		disableButtons("Creativite", index)

	if button.is_in_group("Relation"):
		checkValues("Relation", index)
		disableButtons("Relation", index)

	if button.is_in_group("Resultats"):
		checkValues("Resultats", index)
		disableButtons("Resultats", index)

	if button.is_in_group("Procedures"):
		checkValues("Procedures", index)
		disableButtons("Procedures", index)

	print([Categories["INTROSPECTION"], Categories["AUTONOMIE"], Categories["GESTION"], Categories["PROPENSION"], Categories["OUVERTURE"], Categories["ADAPTABILITE"], Categories["CAPACITE"], 
		Categories["PERSEVERANCE"], Categories["SENS"]])
		
	print([Categories["TECHNIQUE"], Categories["ANALYSE"], Categories["CREATIVITE"], Categories["RELATION"], Categories["RESULTATS"], Categories["PROCEDURES"]])