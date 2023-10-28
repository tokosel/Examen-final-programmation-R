library(readr)


#1. Importation des données: Comment importeriez-vous le fichier CSV de marketing dans R? 
ventesDf <- read.csv("C:/Users/hp/Desktop/corrected_sen_ndawal_marketing_data.csv")

#Affichez les premières lignes du jeu de données pour vérifier que l'importation a réussi.
head(ventesDf, 5)


#2. Structure des données: Quelle est la commande pour examiner la structure du jeu de données?
# Examiner la structure du jeu de données
str(ventesDf)

#Combien de colonnes le jeu de données contient-il?
nb_colonnes <- ncol(ventesDf)
print(nb_colonnes)

#3. Résumé des données: Utilisez une fonction pour obtenir un résumé statistique du montant dépensé par les clients
summary(ventesDf$Montant.Depense)
# Calculer la médiane du montant dépensé
median_montant <- median(ventesDf$Montant.Depense)
# Afficher la médiane
print(median_montant)



