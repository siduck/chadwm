## Windows Keys                                     
key               | Do         | Value
----------------- | ---------- | ------
 win + b          | togglebar  |   0   
 win + ctrl + w   | tabmode    |  -1
 win + j          | focusstack |  +1
 win + k          | focusstack |  -1
 win + i          | incnmaster |  +1
 win + d          | incnmaster |  -1 
 win + h          | setmfact   |  -0.05
 win + l          | setmfact   |  +0.05
 win + shift + h  | setcfact   |  +0.25
 win + shift + l  | setcfact   |  -0.25
 win + shift + o  | setcfact   |   0.00
 win + shift + j  | movestack  |  +1 
 win + shift + k  | movestack  |  -1 
 win + Return     | zoom       |   0
 win + Tab        | view       |   0
 
##  Overall gaps
key             | Do         | Value
--------------- | ---------- | ------
 win + ctrl + i | incrgaps   |  +1 
 win + ctrl + d | incrgaps   |  -1 

## Inner gaps
key                     | Do         | Value
----------------------- | ---------- | ------
 win + shift + i        | incrigaps  |   +1 
 win + ctrl + shift + i | incrigaps  |   -1 

## Outer gaps
key                     | Do         | Value
----------------------- | ---------- | ------
 win + ctrl + o         | incrogaps  |   +1 
 win + ctrl + shift + o | incrogaps  |   -1 
 win + ctrl + 6         | incrihgaps |   +1 
 win + ctrl + shift + 6 | incrihgaps |   -1 
 win + ctrl + 7         | incrivgaps |   +1 
 win + ctrl + shift + 7 | incrivgaps |   -1 
 win + ctrl + 8         | incrohgaps |   +1 
 win + ctrl + shift + 8 | incrohgaps |   -1 
 win + ctrl + 9         | incrovgaps |   +1 
 win + ctrl + shift + 9 | incrovgaps |   -1 
 win + ctrl + t         | togglegaps |    0
 win + ctrl + shift + d | defaultgaps|    0

## General Keys
key                    | Do             | Value
---------------------- | -------------- | ------
 win + q               |  killclient    | 0
 win + t               |  setlayout     | layouts[0]
 win + shift + f       |  setlayout     | layouts[1]
 win + m               |  setlayout     | layouts[2]
 win + ctrl + g        |  setlayout     | layouts[10]
 win + ctrl + shift + t|  setlayout     | layouts[13]
 win + space           |  setlayout     | 0
 win + ctrl + comma    |  cyclelayout   |-1 
 win + ctrl + period   |  cyclelayout   |+1 
 win + shift + space   |  togglefloating| 0
 win + f               |  togglefullscr | 0
 win + 0               |  view          |~0 
 win + shift + 0       |  tag           |~0 
 win + comma           |  focusmon      |-1 
 win + period          |  focusmon      |+1 
 win + shift + comma   |  tagmon        |-1 
 win + shift + period  |  tagmon        |+1 
 win + shift + minus   |  setborderpx   |-1 
 win + shift + p 	   |  setborderpx   |+1 
 win + shift + w       |  setborderpx   |default_border 
 win + ctrl + q        |  quit          |0 
 win + shift + r       |  quit          |1 
 win + e               |  hidewin       |0
 win + shift + e       |  restorewin    |0

## button definitions
 click         | event mask |  button    |  function     | argument
-------------- | ---------- | ---------- | ------------- | -------------  
 ClkLtSymbol   |   0        |  Button1   | setlayout     | 0
 ClkLtSymbol   |   0        |  Button3   | setlayout     | layouts[2]
 ClkWinTitle   |   0        |  Button2   | zoom          | 0
 ClkStatusText |   0        |  Button2   | spawn         | termcmd 
 ClkClientWin  |   win +    |  Button1   | moveorplace   | 0
 ClkClientWin  |   win +    |  Button2   | togglefloating| 0
 ClkClientWin  |   win +    |  Button3   | resizemouse   | 0
 ClkClientWin  |  ctrl +    |  Button1   | dragmfact     | 0
 ClkClientWin  |  ctrl +    |  Button3   | dragcfact     | 0
 ClkTagBar     |  0         |  Button1   | view          | 0
 ClkTagBar     |  0         |  Button3   | toggleview    | 0
 ClkTagBar     |  win +     |  Button1   | tag           | 0
 ClkTagBar     |  win +     |  Button3   | toggletag     | 0
 ClkTabBar     |  0         |  Button1   | focuswin      | 0
 ClkTabBar     |  0         |  Button1   | focuswin      | 0
 ClkTabPrev    |  0         |  Button1   | movestack     |-1 
 ClkTabNext    |  0         |  Button1   | movestack     |+1 
 ClkTabClose   |  0         |  Button1   | killclient    | 0
