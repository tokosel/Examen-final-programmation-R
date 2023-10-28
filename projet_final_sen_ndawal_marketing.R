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


#4. Sélection de données: Comment sélectionneriez-vous et afficheriez-vous le montant dépensé par les 10 premiers clients du jeu de données?
#a. Sélectionner le montant dépensé par les 10 premiers clients
montant_10_premiers_client <- head(ventesDf$Montant.Depense, 10)

#b. Afficher le montant dépensé par les 10 premiers clients
print(montant_10_premiers_client)

#5. Filtrage des données: Comment filtreriez-vous et afficheriez-vous toutes les lignes où le nombre de produits achetés est supérieur à 15?
#a. Filtrer les lignes où le nombre de produits achetés est supérieur à 15
produits_plus_de_15 <- subset(ventesDf, Nombre.de.Produits.Achetes > 15)

#b. Afficher les lignes filtrées
print(produits_plus_de_15)

#6  Nom du client ayant dépensé le plus: Qui est le client qui a dépensé le plus d'argent dans ce jeu de données?
#a. Trouver l'indice du client avec la dépense maximale
indice_max_depense <- which.max(ventesDf$Montant.Depense)
print(indice_max_depense)

#b. Extraire le nom du client correspondant en fonction de l'indice du client
nom_client_max_depense <- ventesDf$Prenom.Nom[indice_max_depense]

#c. Afficher le nom du client ayant dépensé le plus
print(nom_client_max_depense)

#7. Moyenne des produits achetés: Calculez la moyenne du nombre de produits achetés par les clients.
#a. Calculer la moyenne du nombre de produits achetés
moyenne_produits_achetes <- mean(ventesDf$Nombre.de.Produits.Achetes)

#b. Afficher la moyenne
print(moyenne_produits_achetes)








