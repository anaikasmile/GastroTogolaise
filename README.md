# Description du pojet
Cette plateforme web est une application de publication de recettes de cuisine. Elle a our objectif de réunir tous les amoureux et passionnées de cuisine togolaise et africaines. L'objectif est donc de faire la promotion de l'art cuilinaire togolais en publiant des recettes répertoriées par localité et de faire la promotion des produits togolais.

# Versions
Version de l'app: 1.0
Langage: Django 1.10.7
Database: Postgres SQL
Python: 3.6

#Prérequis:
Installer Python 3.6
Installer VirtualEnv =>Creer un environnement virtuel
Installer Django 1.10

#Installation
- Cloner le projet sur Github
- Creer votre base de données Postgres avec le nom d'utilisateur et le mot de passe définis dans le settings
- Executer la commande pip freeze >> requirements.txt pour installer toutes les app.
- Executer python manage.py  makemigrations
python manage.py migrate
python manage.py createsuperuser 
-Se connecter à l'interface admin de django
-Activer le compte du superadmin => Email => verified(a coché)
- Lui attribuer le role de staff member et contributeur => User => is_contributeur , is_staff

#Aborescence du projet
#les apps
Gastronomie
Recipe: 
Blog:
Restaurant
Userprofile


#Troubleshooting
1) Verification du compte avant de logger
- Apres la création du compte superadmin python manage.py createsuperuser username
- Se connecter a l'interface admin 
- Aller dans Accounts
- Creer un compte lié au superadmin
- Cocher les 2 champs Verified and Primary

2) Facebook Account social 
- Aller dans social application
- Provider: Facebook
- Name: Facebook
- Client Id: Your_client_id
- Secret ID: Your_secret_ID

3) thumbnail KVSTORE

- makemigrations thumbnail
- migrate thumbnail

