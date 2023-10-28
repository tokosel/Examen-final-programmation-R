#Projet final du module Programmation R Master 1 SID CRD UADB
#Dépôt Github: https://github.com/tokosel/Examen-final-programmation-R

#Importation des packages nécessaire
library(readr)
library(ggplot2)

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


#8. Création d'une nouvelle colonne: Comment ajouteriez-vous une nouvelle colonne au jeu de données, appelée "Loyauté", qui est qualifiée de "Haute" si un client a dépensé plus de 30 000 CFA et de "Basse" sinon?
# Ajouter une nouvelle colonne "Loyauté" basée sur le montant dépensé
ventesDf$Loyaute <- ifelse(ventesDf$Montant.Depense > 30000, "Haute", "Basse")
head(ventesDf, 5)


#9. Sauvegarde des données: Comment sauvegarderiez-vous le jeu de données modifié dans un fichier CSV appelé "marketing_data_with_loyalty.csv"?
# Sauvegarder le jeu de données modifié dans un fichier CSV
write.csv(ventesDf, "C:/Users/hp/Desktop/marketing_data_with_loyalty.csv", row.names = FALSE)


#10. Visualisation: Utilisez la bibliothèque ggplot2 pour créer un scatter plot montrant la relation entre le nombre de produits achetés et le montant dépensé par chaque client. Quelle commande utiliseriez-vous?
ggplot(data = ventesDf, aes(x = Nombre.de.Produits.Achetes, y = Montant.Depense..Franc.CFA.)) +
  geom_point() +
  labs(x = "Nombre de Produits Achetés", y = "Montant Dépensé") +
  ggtitle("Relation entre le nombre de produits achetés et le montant dépensé")


#Bonus: proposition de trois graphiques pertinents

#1. Un diagramme en barres pourrait être utilisé pour représenter le montant dépensé par le top 5 des client qui ont le plus dépensé.

# Trier les clients par montant dépensé en ordre décroissant
top_clients <- head(ventesDf[order(-ventesDf$Montant.Depense..Franc.CFA.),], 5)

# Créer un diagramme en barres
ggplot(data = top_clients, aes(x = Prenom.Nom, y = Montant.Depense..Franc.CFA., fill = Prenom.Nom)) +
  geom_bar(stat = "identity") +
  labs(x = "Nom du Client", y = "Montant Dépensé") +
  ggtitle("Top 5 des Clients Ayant le Plus Dépensé")


#2. Un diagramme en secteurs pourrait être utilisé pour représenter la répartition des clients en fonction de leur "Loyauté"

# Compter le nombre de clients "Haute" et "Basse"
loyaute_counts <- table(ventesDf$Loyaute)

ggplot(data = NULL, aes(x = "", y = loyaute_counts, fill = names(loyaute_counts))) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y") +
  labs(fill = "Loyauté") +
  ggtitle("Répartition des Clients par Loyauté")

#3. Diagramme en barres représentant le montant dépensé par chaque catégorie de client
ggplot(data = ventesDf, aes(x = Loyaute, y = Montant.Depense..Franc.CFA., fill = Loyaute)) +
  geom_bar(stat = "identity") +
  labs(x = "Catégorie de Client", y = "Montant Dépensé") +
  ggtitle("Montant Dépensé par Catégorie de Client")








