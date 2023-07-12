# chadwm

<img src="https://github.com/siduck/chadwm/blob/screenshots/screenshots/initial_look.png">

- [wallpaper](https://github.com/siduck/chadwm/blob/screenshots/screenshots/chad.png)

# Requirements (Clean install)

- git
- xorg-xinit
- xorg-server
- xorg-xbacklight
- xorg-xsetroot
- libxft
- imlib2
- libxinerama
- picom
- feh
- acpi
- rofi
- ttf-hack-nerd
- [st](https://github.com/borsched/st)

# Install

```
git clone https://github.com/borsched/chadwm --depth 1  ~/.config/chadwm
cd ~/.config/chadwm/
mv eww ~/.config
cd chadwm
sudo make install
```

# Run chadwm

I prefer zsh, so I add it to my .zshrc after installing zsh and changing my user's shell.
```shell
exec startx ~/.config/chadwm/scripts/run.sh
```

# Change themes

- Bar  : in bar.sh (line 9) and config.def.h (line 35)
- eww  : in eww.scss (line 1)
- rofi : in config.rasi (line 15)

# Eww

- First, make sure you have copied the eww directory to your config:

```
cp -r ~/.config/chadwm/eww ~/.config/
```

- To launch the eww widget, you need the following command:

```
eww open eww
```
(Note: I use only alsa on my system so audio scripts on widget are alsa related, modify them to support pulseaudio)

- It could be a good idea to add these lines to your autostart file, located at ~/.config/chadwm/scripts/run.sh

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
