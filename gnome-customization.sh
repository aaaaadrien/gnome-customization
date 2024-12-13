#!/bin/bash

# Tester si root
if [[ $(id -u) -eq "0" ]]
then
	echo -e "\033[31mATTENTION\033[0m Si vous lancez ce script en root, cela personnalisera la session GNOME de root !"
	echo "Poursuite du script dans 10 secondes..."
	sleep 10
fi

echo "Configuration générale de GNOME"
echo " - Boutons de fenêtre"
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
echo " - Suramplification"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
echo " - Détacher les popups des fenêtres"
gsettings set org.gnome.mutter attach-modal-dialogs false
echo " - Affichage du calendrier dans le panneau supérieur"
gsettings set org.gnome.desktop.calendar show-weekdate true
echo " - Modification du format de la date et heure"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-format 12h
#echo " - Localisation du pointeur via CTRL"
#gsettings set org.gnome.desktop.interface locate-pointer true #BUG de FOCUS avec GIMP
echo " - Paramétrage Touch Pad"
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method "areas"
echo " - Désactivation des sons système"
gsettings set org.gnome.desktop.wm.preferences audible-bell false
echo " - Activation du mode nuit"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
echo " - Epuration des fichiers temporaires et de la corbeille de plus de 30 jours"
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true
gsettings set org.gnome.desktop.privacy old-files-age "30"

echo "Confidentialité de GNOME"
echo " - Désactivation de l'envoi des rapports"
gsettings set org.gnome.desktop.privacy report-technical-problems false
echo " - Désactivation des statistiques des logiciels"
gsettings set org.gnome.desktop.privacy send-software-usage-stats false

echo "Personnalisation de GNOME"
echo " - Application du thème sombre"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'

echo "Configuration Nautilus"
echo " - Désactivation de l ouverture du dossier lorsqu un élément est glissé dedans"
gsettings set org.gnome.nautilus.preferences open-folder-on-dnd-hover false
echo " - Activation du double clic"
gsettings set org.gnome.nautilus.preferences click-policy 'double'
echo " - Modification de l ordre de tri"
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true

echo "Configuration de GNOME Logiciels"
echo " - Désactivation du téléchargement automatique des mises à jour"
gsettings set org.gnome.software download-updates false
echo " - Activation de l'affichage des logiciels propriétaires"
gsettings set org.gnome.software show-only-free-apps false
#echo " - Autorisation de la mise à niveau vers des versions BETA"
#gsettings set org.gnome.software show-upgrade-prerelease false

echo "Configuration de GNOME Text Editor"
gsettings set org.gnome.TextEditor highlight-current-line false
gsettings set org.gnome.TextEditor restore-session false
gsettings set org.gnome.TextEditor show-line-numbers true

echo "Configuration de GNOME Web"
gsettings set org.gnome.Epiphany ask-for-default false
gsettings set org.gnome.Epiphany homepage-url 'about:blank'
gsettings set org.gnome.Epiphany start-in-incognito-mode true

echo "Configuration de Ptyxis"
gsettings set org.gnome.Ptyxis use-system-font false
gsettings set org.gnome.Ptyxis font-name 'Monospace 14'
gsettings set org.gnome.Ptyxis restore-session false

echo "Application des fonts Red Hat"
if rpm -q redhat-mono-fonts &> /dev/null
then
	gsettings set org.gnome.Ptyxis font-name 'Red Hat Mono Regular 14' 
fi

if rpm -q redhat-text-fonts &> /dev/null
then
	gsettings set org.gnome.desktop.interface font-name 'Red Hat Text Regular 11'
	gsettings set org.gnome.desktop.interface font-name 'Red Hat Text Regular 11'
	gsettings set org.gnome.desktop.interface monospace-font-name 'Red Hat Mono Regular 10'
fi

echo "Personnalisation de Dash-to-dock"
echo " - Activation de l'extension"
gnome-extensions enable dash-to-dock@micxgx.gmail.com
echo " - Placement en bas, fixé et masquage intelligent"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide-in-fullscreen true 
echo " - Correction du bug de la double lettre"
gsettings set org.gnome.shell.extensions.dash-to-dock disable-overview-on-startup true

echo "Activation de Appindicator"
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com

echo "Personnalisation terminée."
