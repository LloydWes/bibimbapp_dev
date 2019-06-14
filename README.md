# Bibimpapp

* Brice Jones 
* Sébastien Broin
* Pierre-Yves Rousseau
* Victor Montagné
* Lloyd Westbury

Super site pour apprendre le français !


Sur heroku :

* [Bibimbapp (développement)](https://dev-bibimbapp.herokuapp.com/)
* [Bibimbapp (production)](https://prod-bibimbapp.herokuapp.com/)

## Vidéo de présentation : 
https://vimeo.com/342204480
mot de passe : `thp`


## 📋 Salut !

Notre projet final est un site d'apprentissage du français pour les étrangers.
Le plateforme nécéssite une inscription, à la suite de laquelle l'utilisateur recevra un courriel de bienvenue (ouais on dit courriel).
Par la suite il pourra accéder aux cours et aux quiz, et progresser en fonction de son niveau initial.


## 🔥 Les gems utilisées :

* `font awesome` pour intégrer des icones qui claquent
* `devise` pour les login / signup etc..
* `thredded` pour le forum 
* `administrate` pour le dashboard admin
* `AWS S3`, liée à L'API du même nom : stockage d'images et de fichiers

## 👑 Pour se connecter en admin : 
user : `jean.dupont@yopmail.com`
mot de passe : `password`

## Le forum (gem thredded)

* l'accès se fait en étant déjà connecté
* la consultation du forum est possible pour les visiteurs
* l'administrateur et uniquement lui, peut ajouter des messages boards (sorte de catégories)
* un utilisateur authentifié peut ajouter un topic (sujet) et/ou un post (contenu d'un sujet/message)
* la déconnection du forum est lié à Devise et donc déconnecte du site (retour vers la landing page)
* Le retour vers le site se fait par onglet

[Tuto-démo du forum](https://thredded.org/thredded/)

## Dashboard Administration (gem administrate)

* `jean.dupont@yopmail.com` est administrateur et peut accéder à cette partie
* les users, lessons, levels et quizz (assessments) sont gérables par ce dashboard

