/* See LICENSE file for copyright and license details. */

#define XF86MonBrightnessDown 0x1008ff03
#define XF86MonBrightnessUp 0x1008ff02

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails,display systray on the 1st monitor,False: display systray on last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int user_bh            = 26;        /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
static const char *fonts[]          = { "JetBrainsMono Nerd Font:style:bold:size=10",
                                	"Material Design Icons-Regular:size=10",
};
static const char dmenufont[]       = "monospace:size=10";

static const char col_gray1[]       = "#2E3440";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#abb2bf";
static const char col_gray4[]       = "#6d8dad";
static const char col_cyann[]       = "#81A1C1";
static const char col_bg2[]         = "#3b414d";

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_bg2,   col_cyann  },
};

/* tagging */
static const char *tags[] = {" ", " ", " ", " ", " "};

static const unsigned int ulinepad	= 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

#include "movestack.c"
#include "tatami.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = {  "st", NULL };
static const char *rofi[] = {"rofi", "-show" , "drun", NULL };
static const char *layoutmenu_cmd = "layoutmenu.sh";
static const char *xi[] = {"xbacklight", "-inc", "7", NULL};
static const char *xd[] = {"xbacklight", "-dec", "7", NULL};

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_c,      spawn,          {.v = rofi } },
	{ MODKEY,                       XK_Return, spawn,   SHCMD("~/.local/bin/./st_settings && st")},
        {MODKEY | ControlMask, XK_u, spawn, SHCMD("maim | xclip -selection clipboard -t image/png")},
        {MODKEY, XK_u, spawn,   SHCMD("maim --select | xclip -selection clipboard -t image/png")},
        {0, XF86MonBrightnessDown, spawn, {.v = xd}},
        {0, XF86MonBrightnessUp, spawn, {.v = xi}},
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
        { MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
       	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
        
        
        // overall gaps
        
        { MODKEY|ControlMask,           XK_i,      incrgaps,       {.i = +1 } }, 
	{ MODKEY|ControlMask,           XK_d,      incrgaps,       {.i = -1 } }, 


// inner gaps
	{ MODKEY|ShiftMask,              XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|ControlMask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },

        // outer gaps
	{ MODKEY|ControlMask,              XK_o,      incrogaps,      {.i = +1 } },
	{ MODKEY|ControlMask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },

	{ MODKEY|ControlMask,              XK_6,      incrihgaps,     {.i = +1 } },
	{ MODKEY|ControlMask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,              XK_7,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ControlMask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,              XK_8,      incrohgaps,     {.i = +1 } },
	{ MODKEY|ControlMask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,              XK_9,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ControlMask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },

	{ MODKEY|ControlMask,           XK_t,      togglegaps,     {0} },
	{ MODKEY|ControlMask|ShiftMask,             XK_d,      defaultgaps,    {0} },


	{ MODKEY,                       XK_q,      killclient,     {0} },
       	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
        { MODKEY|ControlMask,           XK_g,      setlayout,      {.v = &layouts[10]} },
        { MODKEY|ControlMask|ShiftMask, XK_t,      setlayout,      {.v = &layouts[13]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
        { MODKEY|ControlMask,		XK_comma,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
        { MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
        { MODKEY|ShiftMask,             XK_minus, 		setborderpx,    {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_p, 	        	setborderpx,    {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ControlMask,           XK_q,      quit,           {0} },
       	{ MODKEY|ShiftMask,             XK_r,      quit,           {1} }, 

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
        { ClkLtSymbol,          0,              Button3,        layoutmenu,     {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
        { ClkClientWin,         ControlMask,    Button1,        dragmfact,      {0} },
	{ ClkClientWin,         ControlMask,    Button3,        dragcfact,      {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
