# chadwm (Initial look)

<img src="https://github.com/siduck76/chadwm/blob/main/screenshots/initial_look.png">
<img src="https://github.com/siduck76/chadwm/blob/main/screenshots/col_layout.png">

<img src="https://github.com/siduck76/chadwm/blob/main/screenshots/occ_act_tags.png">
(empty workspaces have their color greyed out)

- NOTE: This is vanilla dwm bar (status2d patch for setting colors) not dwmblocks or polybar. 

# Requirements

- xsetroot package ( status2d uses this to add colors on dwmbar)
- xmenu (for layoutmenu)
- JetbrainsMono Nerd Font (or any nerd font) and Material design icon font

# Setup 

- Put the .dwm folder in ~/
- chmod +x all scripts in .dwm folder
- Put layoutmen.sh in your PATH 
- copy the stuff from fonts folder to your ~/.local/share/fonts ( this is for material design icon font )
- cd into chadwm and sudo make install
- autostart file must be adjusted for your liking!
- start dwm with exec ~/.dwm/autostart (NOT EXEC DWM) cuz autostart already runs dwm at the last , or change your dwm.desktop ( should be in /usr/share/xsessions folder ) replace the exec value from dwm to ~/.dwm/autostart.

# Credits 

- Thanks a lot to [eProTaLT83](https://www.reddit.com/user/eProTaLT83) ( he has modified many dwm bar patches like barpadding,statuspadding, systray to work properly with status2d) and as implemented most of my ideas and created patches for them!
- @fitrh helped with [colorful tag patch](https://github.com/fitrh/dwm/issues/1)

# Patches

- barpadding 
- bottomstack
- cfacts
- dragmfact 
- dragcfact (took from bakkeby's build)
- fibonacii
- gaplessgrid
- horizgrid
- layoutmenu 
- movestack 
- vanity gaps
- colorful tags
- statuspadding 
- status2d
- tatami 
- underline tags
- notitle
