#!/bin/bash

# Script to copy every theme including icons and wallpaper to new directories
# then pack it into seperate archives

# creating array for every color
array=( Aqua Blue Brown Deepblue Green Grey MATE Pink Purple Red Yellow )

# setting variable for every color
for color in "${array[@]}"
do
	mkdir -p ../Manual/Yaru-$color/Theme	# creating theme directory
	mkdir -p ../Manual/Yaru-$color/Icons	# creating icons directory
	theme="../Manual/Yaru-$color/Theme"	# setting path variable for themes
	icons="../Manual/Yaru-$color/Icons"	# setting path variable for icons
	root="../Manual/Yaru-$color"		# setting root variable

	cp -R ../Themes/Yaru-$color* $theme	# copy theme
	cp -R ../Icons/Yaru-$color* $icons	# copy icons
	cp -R ../Wallpapers/Yaru-$color* $root	# copy wallpaper
	cp ./dock-indicators.sh $root
	cp -R ./manual-readme.md $root/README.md
	cp -R $theme/Yaru-$color/gtk-3.0/assets $theme/Yaru-$color-dark/gtk-3.0/
	cp -R $theme/Yaru-$color/gtk-3.20/assets $theme/Yaru-$color-dark/gtk-3.20/
	cd $root
	tar -czvf ../Yaru-$color-v2.3.2.tar.gz *	# pack each folder in seperate archives
	cd ../
	rm -rf $root
done

