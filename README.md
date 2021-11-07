# chadwm (Initial look)

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/initial_look.png">
<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/col_layout.png">

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/occ_act_tags.png">
(empty workspaces have their color greyed out)

- NOTE: This is vanilla dwm bar (status2d patch for setting colors) not dwmblocks or polybar. 

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/chadwm.png">

# Tag preview (while hovering tag icon)

https://user-images.githubusercontent.com/59060246/128050994-17f46934-6604-4430-bece-f60b0700b6be.mp4

# Requirements

- dash (shell)
- imlib2 
- xsetroot package ( status2d uses this to add colors on dwmbar)
- JetbrainsMono Nerd Font (or any nerd font) and Material design icon font

# Setup 

- Put the .dwm folder in ~/
- chmod +x all scripts in .dwm folder
- copy the stuff from fonts folder to your ~/.local/share/fonts ( this is for material design icon font )
- cd into chadwm and sudo make install
- autostart file is just an example one so it must be adjusted for your liking!

# Run chadwm

- Run the autostart file from .xinitrc or 
- Create a desktop entry 

```
touch /usr/share/xsessions/chadwm.desktop  
```

```
[Desktop Entry]
Name=chadwm
Comment=dwm made beautiful 
Exec= <path to autostart file> 
Type=Application 
```

- [wallpaper](https://github.com/siduck/chadwm/blob/screenshots/screenshots/chad.png)

# Credits 

- HUGE THANKS to [eProTaLT83](https://www.reddit.com/user/eProTaLT83). I wanted certain features in dwm like tabbar in monocle , tagpreview etc and he implemented my ideas and created patches for me! I   cant even count the number of times he has helped me :v 
- @fitrh helped with [colorful tag patch](https://github.com/fitrh/dwm/issues/1)

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
