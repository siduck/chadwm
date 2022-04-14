# chadwm (Initial look)

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/initial_look.png">
<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/col_layout.png">

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/occ_act_tags.png">
(empty workspaces have their color greyed out)

- NOTE: This is vanilla dwm bar (status2d patch for setting colors) not dwmblocks or polybar. 
<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/chadwm.png">
- The small widget over the top right is an eww widget and thats old! Ive improved the eww widget 
<img src='https://i.redd.it/t1pvmqlq3oc81.png'>
(catppuccin theme)
<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/gruvchad.png">
(gruvbox material dark)

# Tag preview (while hovering tag icon)

https://user-images.githubusercontent.com/59060246/128050994-17f46934-6604-4430-bece-f60b0700b6be.mp4

# Requirements

- dash (shell)
- imlib2 
- xsetroot package ( status2d uses this to add colors on dwmbar)
- JetbrainsMono Nerd Font (or any nerd font) and Material design icon font

# Setup 

```
git clone https://github.com/siduck/chadwm --depth 1
mv chadwm ~/.config
cd ~/.config/chadwm/chadwm
sudo make install
```
- copy the stuff from fonts folder to your ~/.local/share/fonts 
- autostart script in the scripts dir is just an example one so it must be adjusted for your liking!

# Run chadwm

Run the autostart file from .xinitrc

(.xinitrc file)
```
#!/bin/sh

exec ~/.config/chadwm/scripts/./autostart
```
OR

Create a desktop entry 

```
touch /usr/share/xsessions/chadwm.desktop  
```

```
[Desktop Entry]
Name=chadwm
Comment=dwm made beautiful 
Exec= ~/.config/chadwm/scripts/./autostart 
Type=Application 
```

- [wallpaper](https://github.com/siduck/chadwm/blob/screenshots/screenshots/chad.png)

# Recompile 

- You need to recompile dwm after every change you make in its src code 

```
cd ~/.config/chadwm/chadwm
rm config.h
sudo make install
```

# Change themes 

- Bar  : in bar.sh and config.def.h
- eww  : in eww.scss
- rofi : in config.rasi 

# Credits 

- HUGE THANKS to [eProTaLT83](https://www.reddit.com/user/eProTaLT83). I wanted certain features in dwm like tabbar in monocle , tagpreview etc and he implemented my ideas and created patches for me! I cant even count the number of times he has helped me :v 
- @fitrh helped with [colorful tag patch](https://github.com/fitrh/dwm/issues/1)
- [6gk](https://github.com/6gk/fet.sh), eww's pure posix fetch functions taken from here
- [mafetch](https://github.com/fikriomar16/mafetch), modified version of this was used as fetch in the screenshots

# Patches

- barpadding 
- bottomstack
- cfacts
- dragmfact 
- dragcfact (took from [bakkeby's build](https://github.com/bakkeby/dwm-flexipatch))
- fibonacii
- gaplessgrid
- horizgrid
- movestack 
- vanity gaps
- colorful tags
- statuspadding 
- status2d
- underline tags
- notitle
