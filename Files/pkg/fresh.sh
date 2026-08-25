#!/usr/bin/bash
#
# MS 2026
# Fresh user install
# takes username as arg

if [ "$#" != "1" ]; then 
	>&2 echo "Pass the Username of the home directory you wish to create."
	exit 1
fi 

mkdir -p bin desktop Downloads Documents Pictures/Wallpapers Projects
#chown -R $1 /home/$1

cd /home/$1/Downloads
git clone https://github.com/MickSedlack/dotfiles
cd dotfiles
if test -d .config; then
	echo "Moving .config"
	mv .config /home/$1/
fi
cd Files
for file in *; do
    if test -f "$file"; then
        echo "Processing file: $file"
	mv $file /home/$1/.$file
    elif test -d "$file"; then
	echo "Processed folder: $file"
	mv $file /home/$1/Desktop/
    fi
done

curl -O --output-dir /home/$1/Pictures/Wallpapers https://i.imgur.com/Q1tMclC.jpeg

cd /home/$1
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -s

echo "YAY COMPLETED"
echo "pacman -S --needed - < whatever.txt"
 


