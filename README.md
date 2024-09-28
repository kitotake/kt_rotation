# Prop Manager for FiveM

## Description
Ce script FiveM permet de gérer l'apparition, la suppression et la rotation d'un prop spécifié. Les utilisateurs peuvent interagir avec le prop via la touche **E** pour le faire tourner autour de l'axe pitch entre 1 et -100 degrés. Le script inclut également des commandes pour placer et supprimer le prop dans une zone définie.

## Fonctionnalités
- **Placer un prop** : Utilise la commande `/placeprop` pour faire apparaître le prop à proximité du joueur.
- **Supprimer des props** : Utilise la commande `/deleteprop` pour supprimer tous les props dans une zone définie.
- **Rotation du prop** : Appuie sur **E** pour faire tourner le prop autour de l'axe pitch. La rotation oscillera entre 1 et -100 degrés.
  
## Installation
1. Téléchargez le script et placez-le dans le dossier `resources` de votre serveur FiveM.
2. Créez un dossier pour le script, par exemple `prop_manager`.
3. Placez les fichiers `client.lua`, `config.lua`, et `fxmanifest.lua` dans ce dossier.
4. Ajoutez `start prop_manager` à votre fichier `server.cfg`.

## Configuration
- **`config.lua`** : Modifiez ce fichier pour définir le nom du prop et d'autres paramètres par défaut, comme la rotation initiale.

### Exemple de `config.lua`

