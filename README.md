# chadwm

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/initial_look.png">

- [wallpaper](https://github.com/siduck/chadwm/blob/screenshots/screenshots/chad.png)

# Installation
This is meant to be installed alongside my [dotfiles](https://github.com/borsched/voidrice-laptop), which includes necessary scripts.

# Change themes

- Bar  : in bar.sh (line 9) and config.def.h (line 35)
- eww  : in eww.scss (line 1)
- rofi : in config.rasi (line 15)

# Credits

- HUGE THANKS to [eProTaLT83](https://www.reddit.com/user/eProTaLT83). I wanted certain features in dwm like tabbar in monocle, tagpreview etc and he implemented my ideas and created patches for me! I can't even count the number of times he has helped me :v
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
- winicon
- [preserveonrestart](https://github.com/PhyTech-R0/dwm-phyOS/blob/master/patches/dwm-6.3-patches/dwm-preserveonrestart-6.3.diff). This patch doesnt let all windows mix up into tag 1 after restarting dwm.
- shiftview
