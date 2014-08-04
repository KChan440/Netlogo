breed [main]
breed [angel]
breed [Zelda]
breed [bullets]
breed [pokeballs]
breed [mario]
breed [darkMain]
breed [darkballs]
breed [sonic]
breed [ghost]
globals [cutscene1?]
main-own [hp]
zelda-own [hp]
darkmain-own [hp]
sonic-own [hp]

to intro
  ca
  create-main 1 [hide-turtle
    setxy -15 -5
    set size 3
    set shape "ash"
    set heading 90
    set hp 100]
  ask main [set cutscene1? false]
  ask patch -5 0 [set plabel "There"] wait .5
  ask patch -3 0 [set plabel "was"] wait .5
  ask patch -1 0 [set plabel "once"] wait 1
  ask patch -5 0 [set plabel ""] 
  ask patch -3 0 [set plabel ""] 
  ask patch -1 0 [set plabel ""] 
   ask patch -5 0 [set plabel "A young"] wait .5
  ask patch -2 0 [set plabel "boy..."] wait 2
  ask patch -2 -2 [set plabel "named"] wait .5
  ask patch 2 -2 [set plabel "Naramuk"] wait 3
  ask patches with [plabel != ""][set plabel ""]
  ask patch 0 0 [set plabel "This is the story..."] wait 1
  ask patch 0 0 [set plabel ""]
  ask patch 0 0 [set plabel "of Naramuk"]
  start
end

to fakestart
  create-main 1 [
    setxy -15 -5
    set size 3
    set shape "ash"
    set heading 90
    set hp 100]
  ask main [set cutscene1? false]
end

to start
  ask patches with [pycor = -16][set pcolor green] wait .2
  ask patches with [pycor = -15][set pcolor green] wait .2
  ask patches with [pycor = -14][set pcolor green] wait .2
  ask patches with [pycor = -13][set pcolor green] wait .2
  ask patches with [pycor = -12][set pcolor green] wait .2
  ask patches with [pycor = -11][set pcolor green] wait .2
  ask patches with [pycor = -10][set pcolor green] wait .2
  ask patches with [pycor = -9][set pcolor green] wait .2
  ask patches with [pycor = -8][set pcolor green] wait .2
  ask patches with [pycor = -7][set pcolor green] wait .2
  ask patches with [pycor = -6][set pcolor green]
  ask patch 0 0 [set plabel "CLICK CHAPTER1 walk forward (f)"] wait 3
  ask patch 0 0 [set plabel ""] 
  ask main [show-turtle]
end

to Chapter1
  ask main [if xcor = -3 [set cutscene1? true ask patch 5 0 [set plabel 
        "UNCLICK CHAPTER1 THEN Click Cutscene1"]]]
end

to Chapter2
  ask main [if xcor = 13 [set cutscene1? true ask patch 5 0 [set plabel 
        "UNCLICK CHAPTER2 THEN Click Cutscene2"]]]
end

To Cutscene2
  if cutscene1? = true
  [ask patch 5 0 [set plabel ""]
    create-zelda 1 [set shape "link"
      setxy -15 -4
      set size 3
      set heading 90
      set hp 100] wait 1
  ask patch -4 -2 [set plabel "What do you seek young traveler?"] wait 2
  ask patch -4 -2 [set plabel ""]
  ask patch 11 -3 [set plabel "The Golden Apple"] wait 2
  ask patch 11 -3 [set plabel ""] 
  ask patch -4 -2 [set plabel "...Are you....Naramuk?"] wait 2
  ask patch -4 -2 [set plabel ""]
  ask patch 11 -3 [set plabel "Yes..."] wait 1
  ask patch 11 -3 [set plabel "......"] wait 4 
  ask patch -4 -2 [set plabel "IGAHHHHHH, DIE EVIL FIEND!"] wait 2
  ask patch -4 -2 [set plabel ""]
  ask patch 11 -3 [set plabel "What...what did I...?"] wait 2]
  ask patches with [plabel != ""][set plabel ""]
  user-message (word "Your first battle!  Get hype!  Now, you are battling Link from the Legend of Zelda series.  Both of you have an hp of 100 and if you die you will have to reset...not so fun.  Please press Zeldago so that the battle can begin!  Good Luck!")  
end

to Zeldago
  set cutscene1? false
  ask zelda 
[set heading 90
  if random 10000 = 1
 [hatch-bullets 1]
 fd .00001
  ask bullets 
  [set shape "arrow"
    set color blue
    set label ""
    set heading 90]
  ask bullets [fd .001]]
ask bullets [if any? turtles in-radius 3 with 
  [shape = "ashblockleft" or shape = "ashblockright"]
  [die]]
ask turtles with [shape = "pokeball"][fd .001]
ask bullets [if any? main in-radius 2 [ask main [set hp (hp - 10)] die]]
ask pokeballs [if any? bullets in-radius 2 [ask bullets in-radius 2 [die] die]]
ask zelda [if hp = 0 [die]]
ask main [if hp = 0 [die]]
ask pokeballs [if any? zelda in-radius 3 [ask zelda [set hp (hp - 10)] die]]
if count pokeballs > 2  [ask pokeballs [die]]
ask pokeballs [if abs pxcor = 16 [die]]
ask bullets [if abs pxcor = 16 [die]]
if not any? zelda [set cutscene1? true ask patch 0 0 [set plabel "Unclick Zeldago then click cutscene 3"]]
end

to cutscene3
  ask patches with [plabel != ""][set plabel ""]
  ask patch -4 -2 [set plabel "Kill...."] wait 3
  ask patch -4 -2 [set plabel "Sonic......"]
  create-turtles 1 [set shape "ghost"
    setxy -15 -5
    set heading 0
    set size 3
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
    fd 1 rt 90 fd .5 wait .1 lt 90
   die ]
  ask patch -4 -2 [set plabel "Chapter3...keep moving"] wait 3
  ask patch -4 -2 [set plabel ""]
  set cutscene1? false
end

to shoot
  ask main
  [
    hatch-pokeballs 1 [set shape "pokeball"
      ]]
  ask main [if shape = "ashblockleft" [set shape "mainLeft"]]
  ask main [if shape = "ashblockright" [set shape "ash"]]
  
end
    
to blockleft
  ask main
  [set shape "ashblockleft"]
end

to blockright
  ask main
  [set shape "ashblockright"]
end

to cutscene1
  if cutscene1? = true
  
  [ask patches with [plabel = "UNCLICK CHAPTER1 THEN Click Cutscene1"][set plabel ""]
    create-angel 1 [set shape "angel"
    set size 3
    setxy 0 16]
  ask angel [set heading 180 
    repeat 1700000 [fd .00001]] wait 1
  ask patch 0 3 [set plabel "Hello Naramuk"] wait 2
  ask patch 0 3 [set plabel "In your current form"] wait 2
  ask patch 0 3 [set plabel "you are unable to defeat "] wait 2
  ask patch 0 3 [set plabel "Sonic the Hedgehog"] wait 2
  ask patch 0 3 [set plabel "However, if you retrieve"] wait 2
  ask patch 0 3 [set plabel "the golden apple"] wait 2
  ask patch 0 3 [set plabel "from Mario the plumber"] wait 2
  ask patch 0 3 [set plabel "you will have the strength"] wait 2
  ask patch 0 3 [set plabel "to kill Sonic and"] wait 2
  ask patch 0 3 [set plabel "Save the world"]] wait 1
  ask patch 0 3 [set plabel ""] wait 1
  set cutscene1? false
  ask angel [die]
  ask patch 0 3 [set plabel "CLICK CHAPTER 2 walk forward"] wait 3
  ask patch 0 3 [set plabel ""]
end

to chapter3
  ask main [if xcor = -14 [set cutscene1? true ask patch -3 -2 [set plabel
        "Unclick Chapter3 and click cutscene4"]]]
 end 

to cutscene4
  ask patches with [plabel != ""][set plabel ""]
  ask main [set hp 100]
  create-mario 1 [set shape "mariowithapple"
    setxy 10 -5
    set heading -90
    set size 3]
  create-darkMain 1 [set shape "darkash"
    setxy 6 -5
    set heading -90
    set size 3
    set hp 150]
  ask patch 13 -3 [set plabel "NAMARUK!  Help me!  You must defeat your evil counterpart!"] wait 3
  ask patch 13 -3 [set plabel ""]
  user-message (word "Oh no!  It's your evil counterpart!  This is probably why Link attacked you, because of something this version of you did!  And it looks like Mario is in trouble.  It's a battle between two of the same...who will win?  Click Evilgo")
end
  
to Evilgo
  set cutscene1? false
  ask darkMain 
[set heading -90
  if random 8000 = 1
 [hatch-darkballs 1]
 fd .00001
  ask darkballs 
  [set shape "evilpokeball"
    set color black
    set label ""
    set heading -90]
  ask darkballs [fd .001]]
ask darkballs [if any? turtles in-radius 3 with 
  [shape = "ashblockleft" or shape = "ashblockright"]
  [die]]
ask turtles with [shape = "pokeball"][fd .001]
ask darkballs [if any? main in-radius 2 [ask main [set hp (hp - 10)] die]]
ask pokeballs [if any? darkballs in-radius 2 [ask darkballs in-radius 2 [die] die]]
ask darkMain [if hp = 0 [die]]
ask main [if hp = 0 [die]]
ask pokeballs [if any? darkMain in-radius 3 [ask darkMain [set hp (hp - 10)] die]]
if count pokeballs > 3  [ask pokeballs [die]]
ask pokeballs [if abs pxcor = 16 [die]]
ask darkballs [if abs pxcor = 16 [die]]
if not any? darkMain [set cutscene1? true ask patch 5 0 [set plabel "Unclick Evilgo then walk forward.  Click Chapter 4"]]
end

to Chapter4
  set cutscene1? false
  ask patch 5 0 [set plabel ""]
  ask main [if xcor = 7 [set cutscene1? true ask patch 6 0 [set plabel "Unclick Chapter 4 Cutscene5"]]]
end

to cutscene5
  ask patches [set plabel ""]
  ask patch 13 -1 [set plabel "ohmy!  I am truly indepted to you! ohoho.  Please accept my golden apple!"] wait 4
  ask mario [set shape "mario"] wait 1
  user-message (word "Congratulations!  You have obtained the golden apple.  You must now go into the next area and face Sonic the Hedgehog!  Please Click Chapter5 and move on!  You're almost done!") 
end

to Chapter5
set cutscene1? false
  ask patch 13 -1  [set plabel ""]
  ask mario [die]
  ask main [if xcor = -14 [set cutscene1? true ask patch 6 0 [set plabel "Unclick Chapter 5 Cutscene6"]]]
end

to cutscene6
  create-sonic 1 [set shape "sonic"
    setxy 10 -4
    set heading -90
    set size 3
    set hp 500]
  user-message (word "This is it!  Sonic has an ice shield which grants him a large amount of HP.  Defeat him and you win the game!  Good Luck!  Please Click Final Battle!")
end

to FinalBattle
  set cutscene1? false
  ask sonic 
[set heading -90
  if random 5000 = 1
 [hatch-ghost 1]
 fd .00001
  ask ghost 
  [set shape "ghost"
    set color black
    set label ""
    set heading -90
    set size 2]
  ask ghost [fd .001]]
ask ghost [if any? turtles in-radius 3 with 
  [shape = "ashblockleft" or shape = "ashblockright"]
  [die]]
ask turtles with [shape = "pokeball"][fd .001]
ask ghost [if any? main in-radius 2 [ask main [set hp (hp - 10)] die]]
ask pokeballs [if any? ghost in-radius 2 [ask ghost in-radius 2 [die] die]]
ask sonic [if hp = 0 [die]]
ask main [if hp = 0 [die]]
ask pokeballs [if any? sonic in-radius 3 [ask sonic [set hp (hp - 10)] die]]
if count pokeballs > 3  [ask pokeballs [die]]
ask pokeballs [if abs pxcor = 16 [die]]
ask ghost [if abs pxcor = 16 [die]]
if not any? sonic [ca winscreen]
end
  
to winscreen
  create-main 1 [set shape "ash"
    setxy 0 0
    set size 15] wait 4
  create-mario 5 [set shape "mario"
    setxy random-xcor random-ycor
    set size 3] wait 1
  create-darkMain 5 [set shape "darkash"
    setxy random-xcor random-ycor
    set size 3] wait 1
  create-zelda 5 [set shape "link"
    setxy random-xcor random-ycor
    set size 3] wait 1
  create-ghost 5 [set shape "ghost"
    setxy random-xcor random-ycor
    set size 3] wait 1
  create-angel 5 [set shape "angel"
    setxy random-xcor random-ycor
    set size 3] wait 1
  ask patches with [remainder (abs pxcor) 5 = 1][set plabel "YOU WIN!"]
  winscreen
  if count mario > 5 [ask mario [die]]
  if count darkMain > 5 [ask darkMain [die]]
  if count zelda > 5 [ask zelda [die]]
  if count angel > 5 [ask angel [die]]
  
end
  
to moveright
  if cutscene1? = false
  [ask main [set shape "ash" set heading 90 fd .5]]
  if cutscene1? = true
  [ask main [fd 0]]
end

to moveleft
  if cutscene1? = false
  [ask main [set shape "mainLeft"
      set heading -90 fd .5]]
  if cutscene1? = true
  [ask main [fd 0]]
end
  
@#$#@#$#@
GRAPHICS-WINDOW
210
10
649
470
16
16
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
47
277
102
310
NIL
intro\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
132
406
195
439
right
moveright
NIL
1
T
OBSERVER
NIL
F
NIL
NIL
1

BUTTON
64
406
127
439
left
moveleft
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

BUTTON
7
10
79
43
Chapter1
Chapter1
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
78
10
166
43
NIL
cutscene1
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
6
44
80
77
Chapter2
Chapter2
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
79
43
167
76
NIL
cutscene2
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
6
76
81
109
NIL
Zeldago
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
63
369
128
402
blockL
blockleft
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
130
369
187
402
blockR
blockright
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

BUTTON
88
332
154
365
shoot 
shoot
NIL
1
T
OBSERVER
NIL
L
NIL
NIL
1

MONITOR
1
364
62
409
zelda
[hp] of zelda
17
1
11

MONITOR
63
456
120
501
main
[hp] of main
17
1
11

BUTTON
81
77
169
110
NIL
cutscene3
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
8
142
72
175
NIL
Evilgo
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
5
108
88
141
NIL
Chapter3
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
88
109
176
142
NIL
cutscene4
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
0
455
63
500
darkmain
[hp] of darkmain
17
1
11

BUTTON
72
141
155
174
NIL
Chapter4
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
3
174
91
207
NIL
cutscene5
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
92
175
175
208
NIL
Chapter5
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
7
207
97
240
NIL
Cutscene6
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
98
210
187
243
NIL
FinalBattle
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
-1
409
63
454
sonic
[hp] of sonic
17
1
11

@#$#@#$#@
## WHAT IS IT?
A short RPG

## HOW IT WORKS
Follow the guidlines to tell yourself the story of Namaruk!

@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

angel
false
0
Rectangle -1 true false 15 165 30 180
Rectangle -1 true false 15 150 30 165
Rectangle -1 true false 30 165 45 180
Rectangle -1 true false 30 150 45 165
Rectangle -1 true false 90 120 105 135
Rectangle -1 true false 75 105 90 120
Rectangle -1 true false 75 120 90 135
Rectangle -1 true false 45 105 60 120
Rectangle -1 true false 45 120 60 135
Rectangle -1 true false 75 135 90 150
Rectangle -1 true false 45 135 60 150
Rectangle -1 true false 60 150 75 165
Rectangle -1 true false 90 165 105 180
Rectangle -1 true false 75 165 90 180
Rectangle -1 true false 60 165 75 180
Rectangle -1 true false 45 165 60 180
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 75 180 90 195
Rectangle -1 true false 60 180 75 195
Rectangle -1 true false 45 180 60 195
Rectangle -1 true false 30 180 45 195
Rectangle -13345367 true false 240 195 255 210
Rectangle -13345367 true false 240 180 255 195
Rectangle -13345367 true false 225 195 240 210
Rectangle -13345367 true false 210 195 225 210
Rectangle -13345367 true false 255 165 270 180
Rectangle -13345367 true false 240 165 255 180
Rectangle -13345367 true false 225 180 240 195
Rectangle -13345367 true false 210 180 225 195
Rectangle -13345367 true false 60 45 75 60
Rectangle -13345367 true false 75 45 90 60
Rectangle -13345367 true false 60 60 75 75
Rectangle -13345367 true false 75 60 90 75
Rectangle -13345367 true false 90 45 105 60
Rectangle -13345367 true false 105 45 120 60
Rectangle -13345367 true false 120 45 135 60
Rectangle -13345367 true false 90 60 105 75
Rectangle -13345367 true false 90 75 105 90
Rectangle -13345367 true false 105 60 120 75
Rectangle -13345367 true false 105 75 120 90
Rectangle -13345367 true false 135 45 150 60
Rectangle -13345367 true false 120 60 135 75
Rectangle -13345367 true false 135 60 150 75
Rectangle -13345367 true false 120 75 135 90
Rectangle -13345367 true false 135 75 150 90
Rectangle -13345367 true false 120 90 135 105
Rectangle -13345367 true false 135 90 150 105
Rectangle -13345367 true false 135 105 150 120
Rectangle -13345367 true false 120 30 135 45
Rectangle -13345367 true false 105 30 120 45
Rectangle -13345367 true false 90 30 105 45
Rectangle -13345367 true false 75 30 90 45
Rectangle -13345367 true false 60 30 75 45
Rectangle -13345367 true false 45 45 60 60
Rectangle -13345367 true false 45 60 60 75
Rectangle -13345367 true false 105 150 180 240
Rectangle -13345367 true false 105 150 120 165
Rectangle -13345367 true false 120 135 135 150
Rectangle -13345367 true false 105 135 120 150
Rectangle -13345367 true false 105 120 120 135
Rectangle -13345367 true false 90 135 105 150
Rectangle -13345367 true false 90 150 105 165
Rectangle -13345367 true false 75 150 90 165
Rectangle -13345367 true false 60 135 75 150
Rectangle -13345367 true false 60 120 75 135
Rectangle -13345367 true false 60 105 75 120
Rectangle -13345367 true false 45 90 60 105
Rectangle -13345367 true false 60 90 75 105
Rectangle -13345367 true false 75 90 90 105
Rectangle -13345367 true false 90 105 105 120
Rectangle -13345367 true false 105 105 120 120
Rectangle -13345367 true false 120 120 135 135
Rectangle -13345367 true false 135 135 150 150
Rectangle -13345367 true false 150 135 165 150
Rectangle -13345367 true false 165 150 180 165
Rectangle -13345367 true false 180 150 195 165
Rectangle -13345367 true false 180 165 195 180
Rectangle -13345367 true false 180 180 195 195
Rectangle -13345367 true false 180 195 195 210
Rectangle -13345367 true false 180 225 195 240
Rectangle -13345367 true false 180 210 195 225
Rectangle -13345367 true false 180 240 195 255
Rectangle -13345367 true false 165 240 180 255
Rectangle -13345367 true false 150 240 165 255
Rectangle -13345367 true false 135 240 150 255
Rectangle -13345367 true false 120 225 135 240
Rectangle -13345367 true false 105 225 120 240
Rectangle -13345367 true false 90 210 105 225
Rectangle -13345367 true false 90 195 105 210
Rectangle -1184463 true false 45 30 60 45
Rectangle -1184463 true false 135 30 150 45
Rectangle -1184463 true false 150 45 165 60
Rectangle -1184463 true false 150 60 165 75
Rectangle -1184463 true false 150 75 165 90
Rectangle -1184463 true false 150 90 165 105
Rectangle -1184463 true false 150 105 165 120
Rectangle -1184463 true false 150 120 165 135
Rectangle -1184463 true false 135 120 150 135
Rectangle -1184463 true false 120 105 135 120
Rectangle -1184463 true false 105 90 120 105
Rectangle -1184463 true false 90 90 105 105
Rectangle -1184463 true false 75 75 90 90
Rectangle -1184463 true false 60 75 75 90
Rectangle -1184463 true false 45 75 60 90
Rectangle -1 true false 60 135 75 150
Rectangle -1 true false 285 180 300 195
Rectangle -1 true false 285 165 300 180
Rectangle -1 true false 270 165 285 180
Rectangle -1 true false 270 180 285 195
Rectangle -1 true false 285 210 300 225
Rectangle -1 true false 285 225 300 240
Rectangle -1 true false 270 210 285 225
Rectangle -1 true false 270 225 285 240
Rectangle -1184463 true false 225 135 240 150
Rectangle -1184463 true false 240 135 255 150
Rectangle -1184463 true false 240 120 255 135
Rectangle -1184463 true false 240 105 255 120
Rectangle -1184463 true false 255 90 270 105
Rectangle -1184463 true false 255 105 270 120
Rectangle -1184463 true false 255 60 270 75
Rectangle -1184463 true false 225 150 240 165
Rectangle -1 true false 210 150 225 165
Rectangle -1184463 true false 210 165 225 180
Rectangle -1184463 true false 225 165 240 180
Rectangle -1184463 true false 240 150 255 165
Rectangle -1184463 true false 255 135 270 150
Rectangle -1184463 true false 255 120 270 135
Rectangle -1184463 true false 270 105 285 120
Rectangle -1184463 true false 270 90 285 105
Rectangle -1184463 true false 270 75 285 90
Rectangle -1184463 true false 270 60 285 75
Rectangle -1184463 true false 240 60 255 75
Rectangle -1184463 true false 255 45 270 60
Rectangle -1184463 true false 240 75 255 90
Rectangle -1184463 true false 225 90 240 105
Rectangle -1184463 true false 210 105 225 120
Rectangle -1184463 true false 195 120 210 135
Rectangle -1184463 true false 195 135 210 150
Rectangle -1 true false 195 150 210 165
Rectangle -1 true false 195 165 210 180
Rectangle -1 true false 195 180 210 195
Rectangle -1 true false 195 195 210 210
Rectangle -1 true false 195 210 210 225
Rectangle -1 true false 195 225 210 240
Rectangle -1 true false 195 240 210 255
Rectangle -955883 true false 255 75 270 90
Rectangle -955883 true false 240 90 255 105
Rectangle -955883 true false 225 120 240 135
Rectangle -955883 true false 225 105 240 120
Rectangle -955883 true false 210 150 225 165
Rectangle -955883 true false 210 120 225 135
Rectangle -955883 true false 210 135 225 150
Rectangle -13345367 true false 255 225 270 240
Rectangle -13345367 true false 255 240 270 255
Rectangle -13345367 true false 240 240 255 255
Rectangle -13345367 true false 240 225 255 240
Rectangle -13345367 true false 225 240 240 255
Rectangle -13345367 true false 210 240 225 255
Rectangle -13345367 true false 210 225 225 240
Rectangle -13345367 true false 225 225 240 240
Rectangle -13345367 true false 255 210 270 225
Rectangle -13345367 true false 240 210 255 225
Rectangle -13345367 true false 225 210 240 225
Rectangle -13345367 true false 210 210 225 225
Rectangle -13345367 true false 255 195 270 210
Rectangle -13345367 true false 255 180 270 195

arrow
false
0
Rectangle -6459832 true false 30 135 210 150
Polygon -7500403 true true 199 108 257 144 197 183 196 107

ash
false
0
Rectangle -16777216 true false 255 45 270 60
Rectangle -16777216 true false 135 135 150 150
Rectangle -16777216 true false 105 45 120 60
Rectangle -16777216 true false 105 30 120 45
Rectangle -16777216 true false 120 15 135 30
Rectangle -16777216 true false 135 0 150 15
Rectangle -16777216 true false 150 0 165 15
Rectangle -16777216 true false 165 0 180 15
Rectangle -16777216 true false 180 0 195 15
Rectangle -16777216 true false 195 0 210 15
Rectangle -16777216 true false 210 0 225 15
Rectangle -16777216 true false 225 15 240 30
Rectangle -16777216 true false 240 30 255 45
Rectangle -16777216 true false 240 45 255 60
Rectangle -16777216 true false 150 135 165 150
Rectangle -16777216 true false 150 150 165 165
Rectangle -16777216 true false 270 60 285 75
Rectangle -16777216 true false 165 150 180 165
Rectangle -16777216 true false 180 150 195 165
Rectangle -16777216 true false 195 150 210 165
Rectangle -16777216 true false 210 150 225 165
Rectangle -16777216 true false 225 135 240 150
Rectangle -16777216 true false 240 120 255 135
Rectangle -16777216 true false 240 105 255 120
Rectangle -16777216 true false 240 90 255 105
Rectangle -16777216 true false 240 75 255 90
Rectangle -16777216 true false 255 75 270 90
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 150 75 165 90
Rectangle -16777216 true false 135 75 150 90
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 90 75 105 90
Rectangle -16777216 true false 90 60 105 75
Rectangle -16777216 true false 120 60 135 75
Rectangle -16777216 true false 105 60 120 75
Rectangle -16777216 true false 150 195 165 210
Rectangle -16777216 true false 210 105 225 120
Rectangle -16777216 true false 210 90 225 105
Rectangle -16777216 true false 165 105 180 120
Rectangle -16777216 true false 165 90 180 105
Rectangle -16777216 true false 150 90 165 105
Rectangle -16777216 true false 135 90 150 105
Rectangle -16777216 true false 90 90 105 105
Rectangle -16777216 true false 105 90 120 105
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 105 105 120 120
Rectangle -16777216 true false 120 105 135 120
Rectangle -16777216 true false 120 120 135 135
Rectangle -16777216 true false 135 195 150 210
Rectangle -16777216 true false 135 180 150 195
Rectangle -16777216 true false 135 165 150 180
Rectangle -16777216 true false 180 180 195 195
Rectangle -16777216 true false 195 180 210 195
Rectangle -16777216 true false 180 165 195 180
Rectangle -16777216 true false 195 165 210 180
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 150 225 165 240
Rectangle -16777216 true false 165 225 180 240
Rectangle -16777216 true false 180 225 195 240
Rectangle -16777216 true false 195 225 210 240
Rectangle -16777216 true false 210 210 225 225
Rectangle -16777216 true false 210 195 225 210
Rectangle -16777216 true false 165 195 180 210
Rectangle -16777216 true false 120 195 135 210
Rectangle -16777216 true false 105 135 120 150
Rectangle -16777216 true false 105 150 120 165
Rectangle -16777216 true false 105 165 120 180
Rectangle -16777216 true false 105 180 120 195
Rectangle -13791810 true false 120 180 135 195
Rectangle -13791810 true false 120 135 135 150
Rectangle -13791810 true false 135 150 150 165
Rectangle -13791810 true false 120 150 135 165
Rectangle -13791810 true false 120 165 135 180
Rectangle -2674135 true false 210 15 225 30
Rectangle -2674135 true false 225 75 240 90
Rectangle -2674135 true false 210 75 225 90
Rectangle -2674135 true false 195 75 210 90
Rectangle -2674135 true false 195 60 210 75
Rectangle -2674135 true false 180 60 195 75
Rectangle -2674135 true false 165 60 180 75
Rectangle -2674135 true false 150 60 165 75
Rectangle -2674135 true false 135 60 150 75
Rectangle -2674135 true false 210 45 225 60
Rectangle -2674135 true false 195 45 210 60
Rectangle -2674135 true false 180 45 195 60
Rectangle -2674135 true false 165 45 180 60
Rectangle -2674135 true false 150 45 165 60
Rectangle -2674135 true false 135 45 150 60
Rectangle -2674135 true false 120 45 135 60
Rectangle -2674135 true false 225 30 240 45
Rectangle -2674135 true false 210 30 225 45
Rectangle -2674135 true false 195 30 210 45
Rectangle -2674135 true false 180 30 195 45
Rectangle -2674135 true false 165 30 180 45
Rectangle -2674135 true false 150 30 165 45
Rectangle -2674135 true false 135 30 150 45
Rectangle -2674135 true false 120 30 135 45
Rectangle -2674135 true false 135 15 150 30
Rectangle -2674135 true false 150 15 165 30
Rectangle -2674135 true false 165 15 180 30
Rectangle -2674135 true false 180 15 195 30
Rectangle -2674135 true false 195 15 210 30
Rectangle -1 true false 150 180 165 195
Rectangle -1 true false 165 135 180 150
Rectangle -1 true false 180 135 195 150
Rectangle -1 true false 195 135 210 150
Rectangle -1 true false 210 135 225 150
Rectangle -1 true false 180 120 195 135
Rectangle -1 true false 180 105 195 120
Rectangle -1 true false 180 90 195 105
Rectangle -1 true false 195 90 210 105
Rectangle -1 true false 195 105 210 120
Rectangle -1 true false 195 120 210 135
Rectangle -1 true false 210 120 225 135
Rectangle -1 true false 225 120 240 135
Rectangle -1 true false 225 105 240 120
Rectangle -1 true false 165 180 180 195
Rectangle -1 true false 150 165 165 180
Rectangle -1 true false 165 165 180 180
Rectangle -1 true false 225 45 240 60
Rectangle -1 true false 210 60 225 75
Rectangle -1 true false 225 60 240 75
Rectangle -1 true false 240 60 255 75
Rectangle -1 true false 255 60 270 75
Rectangle -1 true false 135 105 150 120
Rectangle -1 true false 150 105 165 120
Rectangle -1 true false 135 120 150 135
Rectangle -1 true false 150 120 165 135
Rectangle -1 true false 225 90 240 105
Rectangle -1 true false 195 195 210 210
Rectangle -1 true false 195 210 210 225
Rectangle -1 true false 180 210 195 225
Rectangle -1 true false 165 210 180 225
Rectangle -1 true false 150 210 165 225
Rectangle -1 true false 165 120 180 135
Rectangle -1 true false 180 195 195 210

ashblockleft
false
0
Rectangle -16777216 true false 30 45 45 60
Rectangle -16777216 true false 150 135 165 150
Rectangle -16777216 true false 180 45 195 60
Rectangle -16777216 true false 180 30 195 45
Rectangle -16777216 true false 165 15 180 30
Rectangle -16777216 true false 150 0 165 15
Rectangle -16777216 true false 135 0 150 15
Rectangle -16777216 true false 120 0 135 15
Rectangle -16777216 true false 105 0 120 15
Rectangle -16777216 true false 90 0 105 15
Rectangle -16777216 true false 75 0 90 15
Rectangle -16777216 true false 60 15 75 30
Rectangle -16777216 true false 45 30 60 45
Rectangle -16777216 true false 45 45 60 60
Rectangle -16777216 true false 135 135 150 150
Rectangle -16777216 true false 135 150 150 165
Rectangle -16777216 true false 15 60 30 75
Rectangle -16777216 true false 120 150 135 165
Rectangle -16777216 true false 105 150 120 165
Rectangle -16777216 true false 90 150 105 165
Rectangle -16777216 true false 75 150 90 165
Rectangle -16777216 true false 60 135 75 150
Rectangle -16777216 true false 45 120 60 135
Rectangle -16777216 true false 45 105 60 120
Rectangle -16777216 true false 45 90 60 105
Rectangle -16777216 true false 45 75 60 90
Rectangle -16777216 true false 30 75 45 90
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 135 75 150 90
Rectangle -16777216 true false 150 75 165 90
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 195 75 210 90
Rectangle -16777216 true false 195 60 210 75
Rectangle -16777216 true false 165 60 180 75
Rectangle -16777216 true false 180 60 195 75
Rectangle -16777216 true false 135 195 150 210
Rectangle -16777216 true false 75 105 90 120
Rectangle -16777216 true false 75 90 90 105
Rectangle -16777216 true false 120 105 135 120
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 135 90 150 105
Rectangle -16777216 true false 150 90 165 105
Rectangle -16777216 true false 195 90 210 105
Rectangle -16777216 true false 180 90 195 105
Rectangle -16777216 true false 165 90 180 105
Rectangle -16777216 true false 180 105 195 120
Rectangle -16777216 true false 165 105 180 120
Rectangle -16777216 true false 165 120 180 135
Rectangle -16777216 true false 150 195 165 210
Rectangle -16777216 true false 150 180 165 195
Rectangle -16777216 true false 150 165 165 180
Rectangle -16777216 true false 105 180 120 195
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 105 165 120 180
Rectangle -16777216 true false 90 165 105 180
Rectangle -16777216 true false 150 210 165 225
Rectangle -16777216 true false 135 225 150 240
Rectangle -16777216 true false 120 225 135 240
Rectangle -16777216 true false 105 225 120 240
Rectangle -16777216 true false 90 225 105 240
Rectangle -16777216 true false 75 210 90 225
Rectangle -16777216 true false 75 195 90 210
Rectangle -16777216 true false 120 195 135 210
Rectangle -16777216 true false 165 195 180 210
Rectangle -16777216 true false 180 135 195 150
Rectangle -16777216 true false 180 150 195 165
Rectangle -16777216 true false 180 165 195 180
Rectangle -16777216 true false 180 180 195 195
Rectangle -13791810 true false 165 180 180 195
Rectangle -13791810 true false 165 135 180 150
Rectangle -13791810 true false 150 150 165 165
Rectangle -13791810 true false 165 150 180 165
Rectangle -13791810 true false 165 165 180 180
Rectangle -2674135 true false 75 15 90 30
Rectangle -2674135 true false 60 75 75 90
Rectangle -2674135 true false 75 75 90 90
Rectangle -2674135 true false 90 75 105 90
Rectangle -2674135 true false 90 60 105 75
Rectangle -2674135 true false 105 60 120 75
Rectangle -2674135 true false 120 60 135 75
Rectangle -2674135 true false 135 60 150 75
Rectangle -2674135 true false 150 60 165 75
Rectangle -2674135 true false 75 45 90 60
Rectangle -2674135 true false 90 45 105 60
Rectangle -2674135 true false 105 45 120 60
Rectangle -2674135 true false 120 45 135 60
Rectangle -2674135 true false 135 45 150 60
Rectangle -2674135 true false 150 45 165 60
Rectangle -2674135 true false 165 45 180 60
Rectangle -2674135 true false 60 30 75 45
Rectangle -2674135 true false 75 30 90 45
Rectangle -2674135 true false 90 30 105 45
Rectangle -2674135 true false 105 30 120 45
Rectangle -2674135 true false 120 30 135 45
Rectangle -2674135 true false 135 30 150 45
Rectangle -2674135 true false 150 30 165 45
Rectangle -2674135 true false 165 30 180 45
Rectangle -2674135 true false 150 15 165 30
Rectangle -2674135 true false 135 15 150 30
Rectangle -2674135 true false 120 15 135 30
Rectangle -2674135 true false 105 15 120 30
Rectangle -2674135 true false 90 15 105 30
Rectangle -1 true false 135 180 150 195
Rectangle -1 true false 120 135 135 150
Rectangle -1 true false 105 135 120 150
Rectangle -1 true false 90 135 105 150
Rectangle -1 true false 75 135 90 150
Rectangle -1 true false 105 120 120 135
Rectangle -1 true false 105 105 120 120
Rectangle -1 true false 105 90 120 105
Rectangle -1 true false 90 90 105 105
Rectangle -1 true false 90 105 105 120
Rectangle -1 true false 90 120 105 135
Rectangle -1 true false 75 120 90 135
Rectangle -1 true false 60 120 75 135
Rectangle -1 true false 60 105 75 120
Rectangle -1 true false 120 180 135 195
Rectangle -1 true false 135 165 150 180
Rectangle -1 true false 120 165 135 180
Rectangle -1 true false 60 45 75 60
Rectangle -1 true false 75 60 90 75
Rectangle -1 true false 60 60 75 75
Rectangle -1 true false 45 60 60 75
Rectangle -1 true false 30 60 45 75
Rectangle -1 true false 150 105 165 120
Rectangle -1 true false 135 105 150 120
Rectangle -1 true false 150 120 165 135
Rectangle -1 true false 135 120 150 135
Rectangle -1 true false 60 90 75 105
Rectangle -1 true false 90 195 105 210
Rectangle -1 true false 90 210 105 225
Rectangle -1 true false 105 210 120 225
Rectangle -1 true false 120 210 135 225
Rectangle -1 true false 135 210 150 225
Rectangle -1 true false 120 120 135 135
Rectangle -1 true false 105 195 120 210
Rectangle -13791810 true false 0 0 15 240

ashblockright
false
0
Rectangle -16777216 true false 255 45 270 60
Rectangle -16777216 true false 135 135 150 150
Rectangle -16777216 true false 105 45 120 60
Rectangle -16777216 true false 105 30 120 45
Rectangle -16777216 true false 120 15 135 30
Rectangle -16777216 true false 135 0 150 15
Rectangle -16777216 true false 150 0 165 15
Rectangle -16777216 true false 165 0 180 15
Rectangle -16777216 true false 180 0 195 15
Rectangle -16777216 true false 195 0 210 15
Rectangle -16777216 true false 210 0 225 15
Rectangle -16777216 true false 225 15 240 30
Rectangle -16777216 true false 240 30 255 45
Rectangle -16777216 true false 240 45 255 60
Rectangle -16777216 true false 150 135 165 150
Rectangle -16777216 true false 150 150 165 165
Rectangle -16777216 true false 270 60 285 75
Rectangle -16777216 true false 165 150 180 165
Rectangle -16777216 true false 180 150 195 165
Rectangle -16777216 true false 195 150 210 165
Rectangle -16777216 true false 210 150 225 165
Rectangle -16777216 true false 225 135 240 150
Rectangle -16777216 true false 240 120 255 135
Rectangle -16777216 true false 240 105 255 120
Rectangle -16777216 true false 240 90 255 105
Rectangle -16777216 true false 240 75 255 90
Rectangle -16777216 true false 255 75 270 90
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 150 75 165 90
Rectangle -16777216 true false 135 75 150 90
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 90 75 105 90
Rectangle -16777216 true false 90 60 105 75
Rectangle -16777216 true false 120 60 135 75
Rectangle -16777216 true false 105 60 120 75
Rectangle -16777216 true false 150 195 165 210
Rectangle -16777216 true false 210 105 225 120
Rectangle -16777216 true false 210 90 225 105
Rectangle -16777216 true false 165 105 180 120
Rectangle -16777216 true false 165 90 180 105
Rectangle -16777216 true false 150 90 165 105
Rectangle -16777216 true false 135 90 150 105
Rectangle -16777216 true false 90 90 105 105
Rectangle -16777216 true false 105 90 120 105
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 105 105 120 120
Rectangle -16777216 true false 120 105 135 120
Rectangle -16777216 true false 120 120 135 135
Rectangle -16777216 true false 135 195 150 210
Rectangle -16777216 true false 135 180 150 195
Rectangle -16777216 true false 135 165 150 180
Rectangle -16777216 true false 180 180 195 195
Rectangle -16777216 true false 195 180 210 195
Rectangle -16777216 true false 180 165 195 180
Rectangle -16777216 true false 195 165 210 180
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 150 225 165 240
Rectangle -16777216 true false 165 225 180 240
Rectangle -16777216 true false 180 225 195 240
Rectangle -16777216 true false 195 225 210 240
Rectangle -16777216 true false 210 210 225 225
Rectangle -16777216 true false 210 195 225 210
Rectangle -16777216 true false 165 195 180 210
Rectangle -16777216 true false 120 195 135 210
Rectangle -16777216 true false 105 135 120 150
Rectangle -16777216 true false 105 150 120 165
Rectangle -16777216 true false 105 165 120 180
Rectangle -16777216 true false 105 180 120 195
Rectangle -13791810 true false 120 180 135 195
Rectangle -13791810 true false 120 135 135 150
Rectangle -13791810 true false 135 150 150 165
Rectangle -13791810 true false 120 150 135 165
Rectangle -13791810 true false 120 165 135 180
Rectangle -2674135 true false 210 15 225 30
Rectangle -2674135 true false 225 75 240 90
Rectangle -2674135 true false 210 75 225 90
Rectangle -2674135 true false 195 75 210 90
Rectangle -2674135 true false 195 60 210 75
Rectangle -2674135 true false 180 60 195 75
Rectangle -2674135 true false 165 60 180 75
Rectangle -2674135 true false 150 60 165 75
Rectangle -2674135 true false 135 60 150 75
Rectangle -2674135 true false 210 45 225 60
Rectangle -2674135 true false 195 45 210 60
Rectangle -2674135 true false 180 45 195 60
Rectangle -2674135 true false 165 45 180 60
Rectangle -2674135 true false 150 45 165 60
Rectangle -2674135 true false 135 45 150 60
Rectangle -2674135 true false 120 45 135 60
Rectangle -2674135 true false 225 30 240 45
Rectangle -2674135 true false 210 30 225 45
Rectangle -2674135 true false 195 30 210 45
Rectangle -2674135 true false 180 30 195 45
Rectangle -2674135 true false 165 30 180 45
Rectangle -2674135 true false 150 30 165 45
Rectangle -2674135 true false 135 30 150 45
Rectangle -2674135 true false 120 30 135 45
Rectangle -2674135 true false 135 15 150 30
Rectangle -2674135 true false 150 15 165 30
Rectangle -2674135 true false 165 15 180 30
Rectangle -2674135 true false 180 15 195 30
Rectangle -2674135 true false 195 15 210 30
Rectangle -1 true false 150 180 165 195
Rectangle -1 true false 165 135 180 150
Rectangle -1 true false 180 135 195 150
Rectangle -1 true false 195 135 210 150
Rectangle -1 true false 210 135 225 150
Rectangle -1 true false 180 120 195 135
Rectangle -1 true false 180 105 195 120
Rectangle -1 true false 180 90 195 105
Rectangle -1 true false 195 90 210 105
Rectangle -1 true false 195 105 210 120
Rectangle -1 true false 195 120 210 135
Rectangle -1 true false 210 120 225 135
Rectangle -1 true false 225 120 240 135
Rectangle -1 true false 225 105 240 120
Rectangle -1 true false 165 180 180 195
Rectangle -1 true false 150 165 165 180
Rectangle -1 true false 165 165 180 180
Rectangle -1 true false 225 45 240 60
Rectangle -1 true false 210 60 225 75
Rectangle -1 true false 225 60 240 75
Rectangle -1 true false 240 60 255 75
Rectangle -1 true false 255 60 270 75
Rectangle -1 true false 135 105 150 120
Rectangle -1 true false 150 105 165 120
Rectangle -1 true false 135 120 150 135
Rectangle -1 true false 150 120 165 135
Rectangle -1 true false 225 90 240 105
Rectangle -1 true false 195 195 210 210
Rectangle -1 true false 195 210 210 225
Rectangle -1 true false 180 210 195 225
Rectangle -1 true false 165 210 180 225
Rectangle -1 true false 150 210 165 225
Rectangle -1 true false 165 120 180 135
Rectangle -1 true false 180 195 195 210
Rectangle -13791810 true false 285 0 315 240

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

darkash
false
0
Rectangle -16777216 true false 30 45 45 60
Rectangle -16777216 true false 150 135 165 150
Rectangle -16777216 true false 180 45 195 60
Rectangle -16777216 true false 180 30 195 45
Rectangle -16777216 true false 165 15 180 30
Rectangle -16777216 true false 150 0 165 15
Rectangle -16777216 true false 135 0 150 15
Rectangle -16777216 true false 120 0 135 15
Rectangle -16777216 true false 105 0 120 15
Rectangle -16777216 true false 90 0 105 15
Rectangle -16777216 true false 75 0 90 15
Rectangle -16777216 true false 60 15 75 30
Rectangle -16777216 true false 45 30 60 45
Rectangle -16777216 true false 45 45 60 60
Rectangle -16777216 true false 135 135 150 150
Rectangle -16777216 true false 135 150 150 165
Rectangle -16777216 true false 15 60 30 75
Rectangle -16777216 true false 120 150 135 165
Rectangle -16777216 true false 105 150 120 165
Rectangle -16777216 true false 90 150 105 165
Rectangle -16777216 true false 75 150 90 165
Rectangle -16777216 true false 60 135 75 150
Rectangle -16777216 true false 45 120 60 135
Rectangle -16777216 true false 45 105 60 120
Rectangle -16777216 true false 45 90 60 105
Rectangle -16777216 true false 45 75 60 90
Rectangle -16777216 true false 30 75 45 90
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 135 75 150 90
Rectangle -16777216 true false 150 75 165 90
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 195 75 210 90
Rectangle -16777216 true false 195 60 210 75
Rectangle -16777216 true false 165 60 180 75
Rectangle -16777216 true false 180 60 195 75
Rectangle -16777216 true false 135 195 150 210
Rectangle -2674135 true false 75 105 90 120
Rectangle -16777216 true false 75 90 90 105
Rectangle -2674135 true false 120 105 135 120
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 135 90 150 105
Rectangle -16777216 true false 150 90 165 105
Rectangle -16777216 true false 195 90 210 105
Rectangle -16777216 true false 180 90 195 105
Rectangle -16777216 true false 165 90 180 105
Rectangle -16777216 true false 180 105 195 120
Rectangle -16777216 true false 165 105 180 120
Rectangle -16777216 true false 165 120 180 135
Rectangle -16777216 true false 150 195 165 210
Rectangle -16777216 true false 150 180 165 195
Rectangle -16777216 true false 150 165 165 180
Rectangle -16777216 true false 105 180 120 195
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 105 165 120 180
Rectangle -16777216 true false 90 165 105 180
Rectangle -16777216 true false 150 210 165 225
Rectangle -16777216 true false 135 225 150 240
Rectangle -16777216 true false 120 225 135 240
Rectangle -16777216 true false 105 225 120 240
Rectangle -16777216 true false 90 225 105 240
Rectangle -16777216 true false 75 210 90 225
Rectangle -16777216 true false 75 195 90 210
Rectangle -16777216 true false 120 195 135 210
Rectangle -16777216 true false 165 195 180 210
Rectangle -16777216 true false 180 135 195 150
Rectangle -16777216 true false 180 150 195 165
Rectangle -16777216 true false 180 165 195 180
Rectangle -16777216 true false 180 180 195 195
Rectangle -13791810 true false 165 180 180 195
Rectangle -13791810 true false 165 135 180 150
Rectangle -13791810 true false 150 150 165 165
Rectangle -13791810 true false 165 150 180 165
Rectangle -13791810 true false 165 165 180 180
Rectangle -2674135 true false 75 15 90 30
Rectangle -2674135 true false 60 75 75 90
Rectangle -2674135 true false 75 75 90 90
Rectangle -2674135 true false 90 75 105 90
Rectangle -2674135 true false 90 60 105 75
Rectangle -2674135 true false 105 60 120 75
Rectangle -2674135 true false 120 60 135 75
Rectangle -2674135 true false 135 60 150 75
Rectangle -2674135 true false 150 60 165 75
Rectangle -2674135 true false 75 45 90 60
Rectangle -2674135 true false 90 45 105 60
Rectangle -2674135 true false 105 45 120 60
Rectangle -2674135 true false 120 45 135 60
Rectangle -2674135 true false 135 45 150 60
Rectangle -2674135 true false 150 45 165 60
Rectangle -2674135 true false 165 45 180 60
Rectangle -2674135 true false 60 30 75 45
Rectangle -2674135 true false 75 30 90 45
Rectangle -2674135 true false 90 30 105 45
Rectangle -2674135 true false 105 30 120 45
Rectangle -2674135 true false 120 30 135 45
Rectangle -2674135 true false 135 30 150 45
Rectangle -2674135 true false 150 30 165 45
Rectangle -2674135 true false 165 30 180 45
Rectangle -2674135 true false 150 15 165 30
Rectangle -2674135 true false 135 15 150 30
Rectangle -2674135 true false 120 15 135 30
Rectangle -2674135 true false 105 15 120 30
Rectangle -2674135 true false 90 15 105 30
Rectangle -16777216 true false 135 180 150 195
Rectangle -16777216 true false 120 135 135 150
Rectangle -16777216 true false 105 135 120 150
Rectangle -16777216 true false 90 135 105 150
Rectangle -16777216 true false 75 135 90 150
Rectangle -16777216 true false 105 120 120 135
Rectangle -16777216 true false 105 105 120 120
Rectangle -16777216 true false 105 90 120 105
Rectangle -16777216 true false 90 90 105 105
Rectangle -16777216 true false 90 105 105 120
Rectangle -16777216 true false 90 120 105 135
Rectangle -16777216 true false 75 120 90 135
Rectangle -16777216 true false 60 120 75 135
Rectangle -16777216 true false 60 105 75 120
Rectangle -16777216 true false 120 180 135 195
Rectangle -16777216 true false 135 165 150 180
Rectangle -16777216 true false 120 165 135 180
Rectangle -1 true false 60 45 75 60
Rectangle -1 true false 75 60 90 75
Rectangle -1 true false 60 60 75 75
Rectangle -1 true false 45 60 60 75
Rectangle -1 true false 30 60 45 75
Rectangle -16777216 true false 150 105 165 120
Rectangle -16777216 true false 135 105 150 120
Rectangle -16777216 true false 150 120 165 135
Rectangle -16777216 true false 135 120 150 135
Rectangle -16777216 true false 60 90 75 105
Rectangle -16777216 true false 90 195 105 210
Rectangle -16777216 true false 90 210 105 225
Rectangle -16777216 true false 105 210 120 225
Rectangle -16777216 true false 120 210 135 225
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 120 120 135 135
Rectangle -16777216 true false 105 195 120 210

dot
false
0
Circle -7500403 true true 90 90 120

evilpokeball
true
0
Rectangle -16777216 true false 75 150 90 165
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 150 195 165 210
Rectangle -16777216 true false 75 165 90 180
Rectangle -16777216 true false 75 135 90 150
Rectangle -16777216 true false 75 180 90 195
Rectangle -16777216 true false 210 180 225 195
Rectangle -16777216 true false 195 180 210 195
Rectangle -16777216 true false 180 180 195 195
Rectangle -16777216 true false 180 165 195 180
Rectangle -16777216 true false 165 150 180 165
Rectangle -16777216 true false 150 150 165 165
Rectangle -16777216 true false 135 165 150 180
Rectangle -16777216 true false 135 180 150 195
Rectangle -16777216 true false 120 180 135 195
Rectangle -16777216 true false 105 180 120 195
Rectangle -16777216 true false 225 165 240 180
Rectangle -16777216 true false 240 180 255 195
Rectangle -16777216 true false 240 165 255 180
Rectangle -16777216 true false 240 150 255 165
Rectangle -16777216 true false 240 135 255 150
Rectangle -16777216 true false 225 120 240 135
Rectangle -16777216 true false 225 105 240 120
Rectangle -16777216 true false 210 90 225 105
Rectangle -16777216 true false 195 90 210 105
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 150 75 165 90
Rectangle -16777216 true false 135 75 150 90
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 105 90 120 105
Rectangle -16777216 true false 90 105 105 120
Rectangle -16777216 true false 90 120 105 135
Rectangle -16777216 true false 225 195 240 210
Rectangle -16777216 true false 225 210 240 225
Rectangle -16777216 true false 210 225 225 240
Rectangle -16777216 true false 195 225 210 240
Rectangle -16777216 true false 180 240 195 255
Rectangle -16777216 true false 165 240 180 255
Rectangle -16777216 true false 150 240 165 255
Rectangle -16777216 true false 135 240 150 255
Rectangle -16777216 true false 120 225 135 240
Rectangle -16777216 true false 105 225 120 240
Rectangle -16777216 true false 90 210 105 225
Rectangle -16777216 true false 90 195 105 210
Rectangle -16777216 true false 165 195 180 210
Rectangle -1 true false 135 135 150 150
Rectangle -1 true false 135 105 150 120
Rectangle -1 true false 120 120 135 135
Rectangle -1 true false 150 120 165 135
Rectangle -1 true false 135 120 150 135
Rectangle -2674135 true false 180 135 240 165
Rectangle -2674135 true false 195 105 225 180
Rectangle -2674135 true false 165 105 225 135
Rectangle -2674135 true false 90 135 135 165
Rectangle -2674135 true false 165 90 180 105
Rectangle -2674135 true false 105 150 135 180
Rectangle -2674135 true false 150 90 165 105
Rectangle -2674135 true false 150 105 165 120
Rectangle -2674135 true false 135 90 150 105
Rectangle -2674135 true false 120 105 135 120
Rectangle -2674135 true false 105 105 120 120
Rectangle -2674135 true false 105 120 120 135
Rectangle -2674135 true false 165 135 180 150
Rectangle -2674135 true false 150 135 165 150
Rectangle -2674135 true false 135 150 150 165
Rectangle -2674135 true false 180 90 195 105
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 225 180 240 195
Rectangle -16777216 true false 135 210 195 240
Rectangle -16777216 true false 120 195 135 210
Rectangle -1 true false 105 210 120 225
Rectangle -16777216 true false 105 210 120 225
Rectangle -16777216 true false 135 195 150 210
Rectangle -16777216 true false 120 210 135 225
Rectangle -16777216 true false 105 195 120 210
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 180 195 225 225
Rectangle -16777216 true false 90 165 105 180
Rectangle -2674135 true false 150 165 180 195

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

ghost
false
0
Rectangle -1 true false 135 75 195 165
Rectangle -7500403 true true 165 255 195 270
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 195 240 210 255
Rectangle -7500403 true true 210 240 225 255
Rectangle -7500403 true true 225 240 240 255
Rectangle -7500403 true true 240 225 255 240
Rectangle -7500403 true true 240 210 255 225
Rectangle -7500403 true true 255 150 270 165
Rectangle -7500403 true true 255 165 270 180
Rectangle -7500403 true true 255 180 270 195
Rectangle -7500403 true true 255 195 270 210
Rectangle -7500403 true true 255 135 270 150
Rectangle -7500403 true true 240 120 255 135
Rectangle -7500403 true true 240 105 255 120
Rectangle -7500403 true true 225 90 240 105
Rectangle -7500403 true true 210 75 225 90
Rectangle -7500403 true true 195 75 210 90
Rectangle -7500403 true true 180 60 195 75
Rectangle -7500403 true true 165 60 180 75
Rectangle -7500403 true true 150 60 165 75
Rectangle -7500403 true true 135 60 150 75
Rectangle -7500403 true true 120 75 135 90
Rectangle -7500403 true true 105 75 120 90
Rectangle -7500403 true true 90 90 105 105
Rectangle -7500403 true true 75 105 90 120
Rectangle -7500403 true true 60 120 75 135
Rectangle -7500403 true true 45 135 60 150
Rectangle -7500403 true true 45 150 60 165
Rectangle -7500403 true true 45 180 60 195
Rectangle -7500403 true true 45 195 60 210
Rectangle -7500403 true true 45 210 60 225
Rectangle -7500403 true true 60 225 75 240
Rectangle -7500403 true true 75 240 90 255
Rectangle -7500403 true true 90 240 105 255
Rectangle -7500403 true true 105 255 120 270
Rectangle -7500403 true true 120 255 135 270
Rectangle -7500403 true true 135 255 150 270
Rectangle -7500403 true true 150 255 165 270
Rectangle -16777216 true false 270 195 285 210
Rectangle -16777216 true false 270 180 285 195
Rectangle -16777216 true false 270 165 285 180
Rectangle -16777216 true false 270 150 285 165
Rectangle -16777216 true false 270 135 285 150
Rectangle -16777216 true false 255 120 270 135
Rectangle -16777216 true false 255 105 270 120
Rectangle -16777216 true false 240 90 255 105
Rectangle -16777216 true false 225 75 240 90
Rectangle -16777216 true false 210 60 225 75
Rectangle -16777216 true false 195 60 210 75
Rectangle -16777216 true false 180 45 195 60
Rectangle -16777216 true false 165 45 180 60
Rectangle -16777216 true false 150 45 165 60
Rectangle -16777216 true false 135 45 150 60
Rectangle -16777216 true false 120 60 135 75
Rectangle -16777216 true false 105 60 120 75
Rectangle -16777216 true false 90 75 105 90
Rectangle -16777216 true false 75 90 90 105
Rectangle -16777216 true false 60 105 75 120
Rectangle -16777216 true false 45 120 60 135
Rectangle -16777216 true false 30 135 45 150
Rectangle -16777216 true false 30 150 45 165
Rectangle -16777216 true false 45 165 60 180
Rectangle -16777216 true false 30 180 45 195
Rectangle -16777216 true false 30 195 45 210
Rectangle -16777216 true false 30 210 45 225
Rectangle -16777216 true false 45 225 60 240
Rectangle -16777216 true false 60 240 75 255
Rectangle -16777216 true false 75 255 90 270
Rectangle -16777216 true false 90 255 105 270
Rectangle -16777216 true false 105 270 120 285
Rectangle -16777216 true false 120 270 135 285
Rectangle -16777216 true false 135 270 150 285
Rectangle -16777216 true false 150 270 165 285
Rectangle -16777216 true false 165 270 180 285
Rectangle -16777216 true false 180 270 195 285
Rectangle -16777216 true false 225 150 240 165
Rectangle -16777216 true false 195 150 210 165
Rectangle -16777216 true false 195 120 210 135
Rectangle -16777216 true false 225 135 240 150
Rectangle -16777216 true false 195 135 210 150
Rectangle -16777216 true false 225 120 240 135
Rectangle -16777216 true false 210 255 225 270
Rectangle -16777216 true false 195 255 210 270
Rectangle -16777216 true false 225 255 240 270
Rectangle -16777216 true false 240 240 255 255
Rectangle -16777216 true false 255 225 270 240
Rectangle -16777216 true false 255 210 270 225
Rectangle -2674135 true false 195 225 210 240
Rectangle -2674135 true false 180 210 195 225
Rectangle -2674135 true false 165 210 180 225
Rectangle -2674135 true false 165 225 180 240
Rectangle -16777216 true false 120 150 135 165
Rectangle -16777216 true false 105 135 120 150
Rectangle -16777216 true false 90 135 105 150
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 75 165 90 180
Rectangle -16777216 true false 75 150 90 165
Rectangle -16777216 true false 75 135 90 150
Rectangle -2674135 true false 195 225 210 240
Rectangle -2674135 true false 195 225 210 240
Rectangle -2674135 true false 195 225 210 240
Rectangle -2674135 true false 195 225 210 240
Rectangle -2674135 true false 180 195 195 210
Rectangle -2674135 true false 180 180 195 195
Rectangle -2674135 true false 180 165 195 180
Rectangle -2674135 true false 195 180 210 195
Rectangle -2674135 true false 195 195 210 210
Rectangle -2674135 true false 210 195 225 210
Rectangle -2674135 true false 210 180 225 195
Rectangle -2674135 true false 210 165 225 180
Rectangle -2674135 true false 225 195 240 210
Rectangle -2674135 true false 225 180 240 195
Rectangle -2674135 true false 240 165 255 180
Rectangle -2674135 true false 240 180 255 195
Rectangle -2674135 true false 240 195 255 210
Rectangle -2674135 true false 225 225 240 240
Rectangle -2674135 true false 225 210 240 225
Rectangle -2674135 true false 210 210 225 225
Rectangle -2674135 true false 195 210 210 225
Rectangle -1 true false 75 195 165 240
Rectangle -1 true false 105 165 165 255
Rectangle -1 true false 210 105 225 120
Rectangle -1 true false 195 105 210 120
Rectangle -1 true false 210 90 225 105
Rectangle -1 true false 195 90 210 105
Rectangle -1 true false 120 90 135 105
Rectangle -1 true false 105 90 120 105
Rectangle -1 true false 120 135 135 150
Rectangle -1 true false 120 120 135 135
Rectangle -1 true false 120 105 135 120
Rectangle -1 true false 105 105 120 120
Rectangle -1 true false 90 105 105 120
Rectangle -1 true false 105 120 120 135
Rectangle -1 true false 90 120 105 135
Rectangle -1 true false 75 120 90 135
Rectangle -1 true false 60 135 75 150
Rectangle -1 true false 60 150 75 165
Rectangle -1 true false 60 165 75 180
Rectangle -1 true false 75 180 90 195
Rectangle -1 true false 60 180 75 195
Rectangle -1 true false 60 195 75 210
Rectangle -1 true false 60 210 75 225
Rectangle -1 true false 105 150 120 165
Rectangle -1 true false 90 150 105 165
Rectangle -1 true false 90 165 105 180
Rectangle -1 true false 165 195 180 210
Rectangle -1 true false 165 180 180 195
Rectangle -1 true false 165 165 180 180
Rectangle -1 true false 240 150 255 165
Rectangle -1 true false 240 135 255 150
Rectangle -1 true false 195 165 210 180
Rectangle -1 true false 225 165 240 180
Rectangle -1 true false 210 150 225 165
Rectangle -1 true false 210 135 225 150
Rectangle -1 true false 210 120 225 135
Rectangle -1 true false 225 105 240 120
Rectangle -1 true false 180 225 195 240
Rectangle -1 true false 180 240 195 255
Rectangle -1 true false 165 240 180 255
Rectangle -1 true false 210 225 225 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

link
false
0
Rectangle -13840069 true false 45 120 60 135
Rectangle -13840069 true false 75 105 90 120
Rectangle -13840069 true false 75 90 90 105
Rectangle -13840069 true false 60 90 75 105
Rectangle -13840069 true false 60 105 75 120
Rectangle -13840069 true false 45 105 60 120
Rectangle -13840069 true false 120 75 135 90
Rectangle -13840069 true false 105 75 120 90
Rectangle -13840069 true false 90 75 105 90
Rectangle -13840069 true false 90 90 105 105
Rectangle -13840069 true false 90 120 105 135
Rectangle -13840069 true false 90 105 105 120
Rectangle -13840069 true false 75 135 90 150
Rectangle -13840069 true false 75 120 90 135
Rectangle -13840069 true false 165 60 180 75
Rectangle -13840069 true false 150 75 165 90
Rectangle -13840069 true false 150 60 165 75
Rectangle -13840069 true false 135 60 150 75
Rectangle -13840069 true false 135 75 150 90
Rectangle -13840069 true false 120 90 135 105
Rectangle -13840069 true false 120 60 135 75
Rectangle -13840069 true false 135 90 150 105
Rectangle -955883 true false 105 90 120 105
Rectangle -2064490 true false 165 135 180 150
Rectangle -2064490 true false 165 150 180 165
Rectangle -2064490 true false 150 150 165 165
Rectangle -2064490 true false 135 150 150 165
Rectangle -2064490 true false 135 135 150 150
Rectangle -2064490 true false 135 121 150 136
Rectangle -2064490 true false 120 135 135 150
Rectangle -2064490 true false 120 120 135 135
Rectangle -2064490 true false 120 106 135 121
Rectangle -2064490 true false 105 120 120 135
Rectangle -2064490 true false 105 105 120 120
Rectangle -2064490 true false 105 90 120 105
Rectangle -2064490 true false 180 135 195 150
Rectangle -2064490 true false 195 150 210 165
Rectangle -2064490 true false 180 150 195 165
Rectangle -2064490 true false 210 150 225 165
Rectangle -2064490 true false 240 135 255 150
Rectangle -2064490 true false 225 135 240 150
Rectangle -2064490 true false 210 135 225 150
Rectangle -2064490 true false 210 120 225 135
Rectangle -2064490 true false 180 120 195 135
Rectangle -2064490 true false 165 120 180 135
Rectangle -13840069 true false 195 120 210 135
Rectangle -6459832 true false 165 75 180 90
Rectangle -6459832 true false 210 105 225 120
Rectangle -6459832 true false 195 105 210 120
Rectangle -6459832 true false 180 105 195 120
Rectangle -6459832 true false 165 105 180 120
Rectangle -6459832 true false 150 135 165 150
Rectangle -6459832 true false 150 120 165 135
Rectangle -6459832 true false 150 105 165 120
Rectangle -6459832 true false 135 105 150 120
Rectangle -6459832 true false 225 90 240 105
Rectangle -6459832 true false 210 90 225 105
Rectangle -6459832 true false 195 90 210 105
Rectangle -6459832 true false 195 90 210 105
Rectangle -6459832 true false 180 90 195 105
Rectangle -6459832 true false 150 90 165 105
Rectangle -6459832 true false 165 90 180 105
Rectangle -6459832 true false 210 75 225 90
Rectangle -6459832 true false 195 75 210 90
Rectangle -6459832 true false 180 75 195 90
Rectangle -6459832 true false 120 150 135 165
Rectangle -6459832 true false 105 150 120 165
Rectangle -6459832 true false 90 150 105 165
Rectangle -6459832 true false 105 135 120 150
Rectangle -6459832 true false 90 135 105 150
Rectangle -2064490 true false 180 165 195 180
Rectangle -2064490 true false 195 165 210 180
Rectangle -2064490 true false 210 165 225 180
Rectangle -2064490 true false 165 165 180 180
Rectangle -13840069 true false 120 240 135 255
Rectangle -13840069 true false 105 180 120 195
Rectangle -13840069 true false 180 180 195 195
Rectangle -13840069 true false 165 180 180 195
Rectangle -13840069 true false 135 180 150 195
Rectangle -13840069 true false 150 180 165 195
Rectangle -13840069 true false 120 180 135 195
Rectangle -13840069 true false 105 195 120 210
Rectangle -13840069 true false 90 180 105 195
Rectangle -13840069 true false 90 180 105 195
Rectangle -13840069 true false 105 165 120 180
Rectangle -13840069 true false 120 165 135 180
Rectangle -13840069 true false 135 165 150 180
Rectangle -13840069 true false 150 165 165 180
Rectangle -13840069 true false 165 195 180 210
Rectangle -13840069 true false 150 225 165 240
Rectangle -13840069 true false 180 225 195 240
Rectangle -13840069 true false 165 225 180 240
Rectangle -13840069 true false 195 210 210 225
Rectangle -13840069 true false 180 210 195 225
Rectangle -13840069 true false 165 210 180 225
Rectangle -13840069 true false 195 195 210 210
Rectangle -13840069 true false 180 195 195 210
Rectangle -13840069 true false 195 255 210 270
Rectangle -13840069 true false 180 255 195 270
Rectangle -13840069 true false 165 255 180 270
Rectangle -13840069 true false 150 255 165 270
Rectangle -13840069 true false 135 255 150 270
Rectangle -13840069 true false 135 240 150 255
Rectangle -13840069 true false 75 240 90 255
Rectangle -13840069 true false 75 255 90 270
Rectangle -13840069 true false 90 255 105 270
Rectangle -13840069 true false 90 255 105 270
Rectangle -13840069 true false 105 255 120 270
Rectangle -13840069 true false 120 255 135 270
Rectangle -6459832 true false 105 285 120 300
Rectangle -2064490 true false 150 195 165 210
Rectangle -955883 true false 120 300 135 315
Rectangle -2064490 true false 120 225 135 240
Rectangle -2064490 true false 120 210 135 225
Rectangle -2064490 true false 120 195 135 210
Rectangle -2064490 true false 135 225 150 240
Rectangle -2064490 true false 135 210 150 225
Rectangle -2064490 true false 135 195 150 210
Rectangle -2064490 true false 150 210 165 225
Rectangle -6459832 true false 75 225 90 240
Rectangle -6459832 true false 90 195 105 210
Rectangle -6459832 true false 90 210 105 225
Rectangle -6459832 true false 90 225 105 240
Rectangle -6459832 true false 90 240 105 255
Rectangle -6459832 true false 105 240 120 255
Rectangle -6459832 true false 105 225 120 240
Rectangle -6459832 true false 60 225 75 240
Rectangle -6459832 true false 60 210 75 225
Rectangle -6459832 true false 60 195 75 210
Rectangle -6459832 true false 75 180 90 195
Rectangle -6459832 true false 75 195 90 210
Rectangle -6459832 true false 75 210 90 225
Rectangle -6459832 true false 120 285 135 300
Rectangle -6459832 true false 135 285 150 300
Rectangle -6459832 true false 135 270 150 285
Rectangle -6459832 true false 165 285 180 300
Rectangle -6459832 true false 150 270 165 285
Rectangle -6459832 true false 150 285 165 300
Rectangle -6459832 true false 120 270 135 285
Rectangle -6459832 true false 105 270 120 285
Rectangle -6459832 true false 105 210 120 225
Rectangle -6459832 true false 225 180 240 195
Rectangle -6459832 true false 210 180 225 195
Rectangle -6459832 true false 195 180 210 195
Rectangle -6459832 true false 225 195 240 210
Rectangle -6459832 true false 210 195 225 210
Rectangle -6459832 true false 225 210 240 225
Rectangle -6459832 true false 210 210 225 225
Rectangle -6459832 true false 195 225 210 240
Rectangle -6459832 true false 195 240 210 255
Rectangle -6459832 true false 180 240 195 255
Rectangle -6459832 true false 165 240 180 255
Rectangle -6459832 true false 150 240 165 255
Rectangle -955883 true false 240 195 255 210
Rectangle -955883 true false 240 180 255 195
Rectangle -13345367 true false 255 195 270 210
Rectangle -13345367 true false 255 210 270 225
Rectangle -13345367 true false 255 180 270 195
Rectangle -13345367 true false 240 165 255 180
Rectangle -13345367 true false 270 165 285 180
Rectangle -13345367 true false 255 165 270 180
Rectangle -7500403 true true 255 150 270 165
Rectangle -7500403 true true 255 135 270 150
Rectangle -7500403 true true 255 120 270 135
Rectangle -7500403 true true 255 105 270 120
Rectangle -7500403 true true 255 90 270 105
Polygon -7500403 true true 255 91 263 77 270 90

mainleft
false
0
Rectangle -16777216 true false 30 45 45 60
Rectangle -16777216 true false 150 135 165 150
Rectangle -16777216 true false 180 45 195 60
Rectangle -16777216 true false 180 30 195 45
Rectangle -16777216 true false 165 15 180 30
Rectangle -16777216 true false 150 0 165 15
Rectangle -16777216 true false 135 0 150 15
Rectangle -16777216 true false 120 0 135 15
Rectangle -16777216 true false 105 0 120 15
Rectangle -16777216 true false 90 0 105 15
Rectangle -16777216 true false 75 0 90 15
Rectangle -16777216 true false 60 15 75 30
Rectangle -16777216 true false 45 30 60 45
Rectangle -16777216 true false 45 45 60 60
Rectangle -16777216 true false 135 135 150 150
Rectangle -16777216 true false 135 150 150 165
Rectangle -16777216 true false 15 60 30 75
Rectangle -16777216 true false 120 150 135 165
Rectangle -16777216 true false 105 150 120 165
Rectangle -16777216 true false 90 150 105 165
Rectangle -16777216 true false 75 150 90 165
Rectangle -16777216 true false 60 135 75 150
Rectangle -16777216 true false 45 120 60 135
Rectangle -16777216 true false 45 105 60 120
Rectangle -16777216 true false 45 90 60 105
Rectangle -16777216 true false 45 75 60 90
Rectangle -16777216 true false 30 75 45 90
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 135 75 150 90
Rectangle -16777216 true false 150 75 165 90
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 195 75 210 90
Rectangle -16777216 true false 195 60 210 75
Rectangle -16777216 true false 165 60 180 75
Rectangle -16777216 true false 180 60 195 75
Rectangle -16777216 true false 135 195 150 210
Rectangle -16777216 true false 75 105 90 120
Rectangle -16777216 true false 75 90 90 105
Rectangle -16777216 true false 120 105 135 120
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 135 90 150 105
Rectangle -16777216 true false 150 90 165 105
Rectangle -16777216 true false 195 90 210 105
Rectangle -16777216 true false 180 90 195 105
Rectangle -16777216 true false 165 90 180 105
Rectangle -16777216 true false 180 105 195 120
Rectangle -16777216 true false 165 105 180 120
Rectangle -16777216 true false 165 120 180 135
Rectangle -16777216 true false 150 195 165 210
Rectangle -16777216 true false 150 180 165 195
Rectangle -16777216 true false 150 165 165 180
Rectangle -16777216 true false 105 180 120 195
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 105 165 120 180
Rectangle -16777216 true false 90 165 105 180
Rectangle -16777216 true false 150 210 165 225
Rectangle -16777216 true false 135 225 150 240
Rectangle -16777216 true false 120 225 135 240
Rectangle -16777216 true false 105 225 120 240
Rectangle -16777216 true false 90 225 105 240
Rectangle -16777216 true false 75 210 90 225
Rectangle -16777216 true false 75 195 90 210
Rectangle -16777216 true false 120 195 135 210
Rectangle -16777216 true false 165 195 180 210
Rectangle -16777216 true false 180 135 195 150
Rectangle -16777216 true false 180 150 195 165
Rectangle -16777216 true false 180 165 195 180
Rectangle -16777216 true false 180 180 195 195
Rectangle -13791810 true false 165 180 180 195
Rectangle -13791810 true false 165 135 180 150
Rectangle -13791810 true false 150 150 165 165
Rectangle -13791810 true false 165 150 180 165
Rectangle -13791810 true false 165 165 180 180
Rectangle -2674135 true false 75 15 90 30
Rectangle -2674135 true false 60 75 75 90
Rectangle -2674135 true false 75 75 90 90
Rectangle -2674135 true false 90 75 105 90
Rectangle -2674135 true false 90 60 105 75
Rectangle -2674135 true false 105 60 120 75
Rectangle -2674135 true false 120 60 135 75
Rectangle -2674135 true false 135 60 150 75
Rectangle -2674135 true false 150 60 165 75
Rectangle -2674135 true false 75 45 90 60
Rectangle -2674135 true false 90 45 105 60
Rectangle -2674135 true false 105 45 120 60
Rectangle -2674135 true false 120 45 135 60
Rectangle -2674135 true false 135 45 150 60
Rectangle -2674135 true false 150 45 165 60
Rectangle -2674135 true false 165 45 180 60
Rectangle -2674135 true false 60 30 75 45
Rectangle -2674135 true false 75 30 90 45
Rectangle -2674135 true false 90 30 105 45
Rectangle -2674135 true false 105 30 120 45
Rectangle -2674135 true false 120 30 135 45
Rectangle -2674135 true false 135 30 150 45
Rectangle -2674135 true false 150 30 165 45
Rectangle -2674135 true false 165 30 180 45
Rectangle -2674135 true false 150 15 165 30
Rectangle -2674135 true false 135 15 150 30
Rectangle -2674135 true false 120 15 135 30
Rectangle -2674135 true false 105 15 120 30
Rectangle -2674135 true false 90 15 105 30
Rectangle -1 true false 135 180 150 195
Rectangle -1 true false 120 135 135 150
Rectangle -1 true false 105 135 120 150
Rectangle -1 true false 90 135 105 150
Rectangle -1 true false 75 135 90 150
Rectangle -1 true false 105 120 120 135
Rectangle -1 true false 105 105 120 120
Rectangle -1 true false 105 90 120 105
Rectangle -1 true false 90 90 105 105
Rectangle -1 true false 90 105 105 120
Rectangle -1 true false 90 120 105 135
Rectangle -1 true false 75 120 90 135
Rectangle -1 true false 60 120 75 135
Rectangle -1 true false 60 105 75 120
Rectangle -1 true false 120 180 135 195
Rectangle -1 true false 135 165 150 180
Rectangle -1 true false 120 165 135 180
Rectangle -1 true false 60 45 75 60
Rectangle -1 true false 75 60 90 75
Rectangle -1 true false 60 60 75 75
Rectangle -1 true false 45 60 60 75
Rectangle -1 true false 30 60 45 75
Rectangle -1 true false 150 105 165 120
Rectangle -1 true false 135 105 150 120
Rectangle -1 true false 150 120 165 135
Rectangle -1 true false 135 120 150 135
Rectangle -1 true false 60 90 75 105
Rectangle -1 true false 90 195 105 210
Rectangle -1 true false 90 210 105 225
Rectangle -1 true false 105 210 120 225
Rectangle -1 true false 120 210 135 225
Rectangle -1 true false 135 210 150 225
Rectangle -1 true false 120 120 135 135
Rectangle -1 true false 105 195 120 210

mario
false
0
Rectangle -2674135 true false 180 45 195 60
Rectangle -2674135 true false 135 45 150 60
Rectangle -2674135 true false 150 45 165 60
Rectangle -2674135 true false 165 45 180 60
Rectangle -2674135 true false 120 45 135 60
Rectangle -2674135 true false 75 60 90 75
Rectangle -2674135 true false 90 60 105 75
Rectangle -2674135 true false 105 60 120 75
Rectangle -2674135 true false 120 60 135 75
Rectangle -2674135 true false 135 60 150 75
Rectangle -2674135 true false 150 60 165 75
Rectangle -2674135 true false 165 60 180 75
Rectangle -2674135 true false 180 60 195 75
Rectangle -2674135 true false 195 60 210 75
Rectangle -6459832 true false 180 75 195 90
Rectangle -6459832 true false 210 105 225 120
Rectangle -6459832 true false 210 90 225 105
Rectangle -6459832 true false 195 120 210 135
Rectangle -6459832 true false 165 105 180 120
Rectangle -6459832 true false 180 105 195 120
Rectangle -6459832 true false 180 90 195 105
Rectangle -6459832 true false 165 75 180 90
Rectangle -6459832 true false 195 75 210 90
Rectangle -16777216 true false 75 120 90 135
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 105 120 120 135
Rectangle -16777216 true false 120 120 135 135
Rectangle -16777216 true false 90 120 105 135
Rectangle -16777216 true false 105 105 120 120
Rectangle -16777216 true false 120 90 135 105
Rectangle -2674135 true false 180 150 195 165
Rectangle -2674135 true false 180 165 195 180
Rectangle -2674135 true false 195 150 210 165
Rectangle -2674135 true false 225 180 240 195
Rectangle -2674135 true false 210 180 225 195
Rectangle -2674135 true false 210 165 225 180
Rectangle -2674135 true false 195 195 210 210
Rectangle -2674135 true false 195 180 210 195
Rectangle -2674135 true false 180 180 195 195
Rectangle -2674135 true false 195 165 210 180
Rectangle -2674135 true false 135 165 150 180
Rectangle -2674135 true false 150 165 165 180
Rectangle -2674135 true false 135 150 150 165
Rectangle -2674135 true false 150 150 165 165
Rectangle -2674135 true false 60 180 75 195
Rectangle -2674135 true false 75 180 90 195
Rectangle -2674135 true false 75 165 90 180
Rectangle -2674135 true false 90 195 105 210
Rectangle -2674135 true false 90 180 105 195
Rectangle -2674135 true false 105 180 120 195
Rectangle -2674135 true false 90 165 105 180
Rectangle -2674135 true false 105 165 120 180
Rectangle -2674135 true false 90 150 105 165
Rectangle -2674135 true false 105 150 120 165
Rectangle -13345367 true false 165 150 180 165
Rectangle -13345367 true false 165 225 180 240
Rectangle -13345367 true false 180 210 195 225
Rectangle -13345367 true false 150 210 165 225
Rectangle -13345367 true false 165 210 180 225
Rectangle -13345367 true false 135 210 150 225
Rectangle -13345367 true false 120 210 135 225
Rectangle -13345367 true false 120 225 135 240
Rectangle -13345367 true false 120 240 135 255
Rectangle -13345367 true false 105 240 120 255
Rectangle -13345367 true false 90 240 105 255
Rectangle -13345367 true false 90 225 105 240
Rectangle -13345367 true false 105 225 120 240
Rectangle -13345367 true false 105 210 120 225
Rectangle -13345367 true false 105 195 120 210
Rectangle -13345367 true false 120 195 135 210
Rectangle -13345367 true false 135 195 150 210
Rectangle -13345367 true false 135 195 150 210
Rectangle -13345367 true false 150 195 165 210
Rectangle -13345367 true false 180 195 195 210
Rectangle -13345367 true false 165 195 180 210
Rectangle -13345367 true false 120 150 135 165
Rectangle -13345367 true false 120 165 135 180
Rectangle -13345367 true false 120 180 135 195
Rectangle -13345367 true false 135 180 150 195
Rectangle -13345367 true false 150 180 165 195
Rectangle -13345367 true false 165 180 180 195
Rectangle -13345367 true false 165 165 180 180
Rectangle -13345367 true false 195 240 210 255
Rectangle -13345367 true false 195 225 210 240
Rectangle -13345367 true false 180 240 195 255
Rectangle -13345367 true false 180 225 195 240
Rectangle -13345367 true false 165 240 180 255
Rectangle -1184463 true false 120 195 135 210
Rectangle -1184463 true false 165 195 180 210
Rectangle -2064490 true false 150 75 165 90
Rectangle -2064490 true false 135 90 150 105
Rectangle -2064490 true false 150 90 165 105
Rectangle -2064490 true false 165 90 180 105
Rectangle -2064490 true false 135 75 150 90
Rectangle -2064490 true false 60 105 75 120
Rectangle -2064490 true false 75 105 90 120
Rectangle -2064490 true false 90 105 105 120
Rectangle -2064490 true false 75 90 90 105
Rectangle -2064490 true false 90 90 105 105
Rectangle -2064490 true false 105 90 120 105
Rectangle -2064490 true false 105 75 120 90
Rectangle -2064490 true false 120 135 135 150
Rectangle -2064490 true false 105 135 120 150
Rectangle -2064490 true false 135 135 150 150
Rectangle -2064490 true false 150 135 165 150
Rectangle -2064490 true false 165 135 180 150
Rectangle -2064490 true false 180 135 195 150
Rectangle -2064490 true false 195 90 210 105
Rectangle -2064490 true false 195 105 210 120
Rectangle -2064490 true false 180 120 195 135
Rectangle -2064490 true false 165 120 180 135
Rectangle -2064490 true false 150 120 165 135
Rectangle -2064490 true false 135 120 150 135
Rectangle -2064490 true false 120 105 135 120
Rectangle -2064490 true false 135 105 150 120
Rectangle -2064490 true false 150 105 165 120
Rectangle -2064490 true false 60 210 75 225
Rectangle -2064490 true false 75 225 90 240
Rectangle -2064490 true false 60 210 75 225
Rectangle -2064490 true false 60 195 75 210
Rectangle -2064490 true false 75 210 90 225
Rectangle -2064490 true false 75 195 90 210
Rectangle -2064490 true false 90 210 105 225
Rectangle -2064490 true false 60 225 75 240
Rectangle -2064490 true false 195 210 210 225
Rectangle -2064490 true false 225 225 240 240
Rectangle -2064490 true false 225 210 240 225
Rectangle -2064490 true false 225 195 240 210
Rectangle -2064490 true false 210 225 225 240
Rectangle -2064490 true false 210 195 225 210
Rectangle -2064490 true false 210 210 225 225

mariowithapple
false
0
Rectangle -2674135 true false 180 45 195 60
Rectangle -2674135 true false 135 45 150 60
Rectangle -2674135 true false 150 45 165 60
Rectangle -2674135 true false 165 45 180 60
Rectangle -2674135 true false 120 45 135 60
Rectangle -2674135 true false 75 60 90 75
Rectangle -2674135 true false 90 60 105 75
Rectangle -2674135 true false 105 60 120 75
Rectangle -2674135 true false 120 60 135 75
Rectangle -2674135 true false 135 60 150 75
Rectangle -2674135 true false 150 60 165 75
Rectangle -2674135 true false 165 60 180 75
Rectangle -2674135 true false 180 60 195 75
Rectangle -2674135 true false 195 60 210 75
Rectangle -6459832 true false 180 75 195 90
Rectangle -6459832 true false 210 105 225 120
Rectangle -6459832 true false 210 90 225 105
Rectangle -6459832 true false 195 120 210 135
Rectangle -6459832 true false 165 105 180 120
Rectangle -6459832 true false 180 105 195 120
Rectangle -6459832 true false 180 90 195 105
Rectangle -6459832 true false 165 75 180 90
Rectangle -6459832 true false 195 75 210 90
Rectangle -16777216 true false 75 120 90 135
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 105 120 120 135
Rectangle -16777216 true false 120 120 135 135
Rectangle -16777216 true false 90 120 105 135
Rectangle -16777216 true false 105 105 120 120
Rectangle -16777216 true false 120 90 135 105
Rectangle -2674135 true false 180 150 195 165
Rectangle -2674135 true false 180 165 195 180
Rectangle -2674135 true false 195 150 210 165
Rectangle -2674135 true false 225 180 240 195
Rectangle -2674135 true false 210 180 225 195
Rectangle -2674135 true false 210 165 225 180
Rectangle -2674135 true false 195 195 210 210
Rectangle -2674135 true false 195 180 210 195
Rectangle -2674135 true false 180 180 195 195
Rectangle -2674135 true false 195 165 210 180
Rectangle -2674135 true false 135 165 150 180
Rectangle -2674135 true false 150 165 165 180
Rectangle -2674135 true false 135 150 150 165
Rectangle -2674135 true false 150 150 165 165
Rectangle -2674135 true false 60 180 75 195
Rectangle -2674135 true false 75 180 90 195
Rectangle -2674135 true false 75 165 90 180
Rectangle -2674135 true false 90 195 105 210
Rectangle -2674135 true false 90 180 105 195
Rectangle -2674135 true false 105 180 120 195
Rectangle -2674135 true false 90 165 105 180
Rectangle -2674135 true false 105 165 120 180
Rectangle -2674135 true false 90 150 105 165
Rectangle -2674135 true false 105 150 120 165
Rectangle -13345367 true false 165 150 180 165
Rectangle -13345367 true false 165 225 180 240
Rectangle -13345367 true false 180 210 195 225
Rectangle -13345367 true false 150 210 165 225
Rectangle -13345367 true false 165 210 180 225
Rectangle -13345367 true false 135 210 150 225
Rectangle -13345367 true false 120 210 135 225
Rectangle -13345367 true false 120 225 135 240
Rectangle -13345367 true false 120 240 135 255
Rectangle -13345367 true false 105 240 120 255
Rectangle -13345367 true false 90 240 105 255
Rectangle -13345367 true false 90 225 105 240
Rectangle -13345367 true false 105 225 120 240
Rectangle -13345367 true false 105 210 120 225
Rectangle -13345367 true false 105 195 120 210
Rectangle -13345367 true false 120 195 135 210
Rectangle -13345367 true false 135 195 150 210
Rectangle -13345367 true false 135 195 150 210
Rectangle -13345367 true false 150 195 165 210
Rectangle -13345367 true false 180 195 195 210
Rectangle -13345367 true false 165 195 180 210
Rectangle -13345367 true false 120 150 135 165
Rectangle -13345367 true false 120 165 135 180
Rectangle -13345367 true false 120 180 135 195
Rectangle -13345367 true false 135 180 150 195
Rectangle -13345367 true false 150 180 165 195
Rectangle -13345367 true false 165 180 180 195
Rectangle -13345367 true false 165 165 180 180
Rectangle -13345367 true false 195 240 210 255
Rectangle -13345367 true false 195 225 210 240
Rectangle -13345367 true false 180 240 195 255
Rectangle -13345367 true false 180 225 195 240
Rectangle -13345367 true false 165 240 180 255
Rectangle -1184463 true false 120 195 135 210
Rectangle -1184463 true false 165 195 180 210
Rectangle -2064490 true false 150 75 165 90
Rectangle -2064490 true false 135 90 150 105
Rectangle -2064490 true false 150 90 165 105
Rectangle -2064490 true false 165 90 180 105
Rectangle -2064490 true false 135 75 150 90
Rectangle -2064490 true false 60 105 75 120
Rectangle -2064490 true false 75 105 90 120
Rectangle -2064490 true false 90 105 105 120
Rectangle -2064490 true false 75 90 90 105
Rectangle -2064490 true false 90 90 105 105
Rectangle -2064490 true false 105 90 120 105
Rectangle -2064490 true false 105 75 120 90
Rectangle -2064490 true false 120 135 135 150
Rectangle -2064490 true false 105 135 120 150
Rectangle -2064490 true false 135 135 150 150
Rectangle -2064490 true false 150 135 165 150
Rectangle -2064490 true false 165 135 180 150
Rectangle -2064490 true false 180 135 195 150
Rectangle -2064490 true false 195 90 210 105
Rectangle -2064490 true false 195 105 210 120
Rectangle -2064490 true false 180 120 195 135
Rectangle -2064490 true false 165 120 180 135
Rectangle -2064490 true false 150 120 165 135
Rectangle -2064490 true false 135 120 150 135
Rectangle -2064490 true false 120 105 135 120
Rectangle -2064490 true false 135 105 150 120
Rectangle -2064490 true false 150 105 165 120
Rectangle -2064490 true false 60 210 75 225
Rectangle -2064490 true false 75 225 90 240
Rectangle -2064490 true false 60 210 75 225
Rectangle -2064490 true false 60 195 75 210
Rectangle -2064490 true false 75 210 90 225
Rectangle -2064490 true false 75 195 90 210
Rectangle -2064490 true false 90 210 105 225
Rectangle -2064490 true false 60 225 75 240
Rectangle -2064490 true false 195 210 210 225
Rectangle -2064490 true false 225 225 240 240
Rectangle -2064490 true false 225 210 240 225
Rectangle -2064490 true false 225 195 240 210
Rectangle -2064490 true false 210 225 225 240
Rectangle -2064490 true false 210 195 225 210
Rectangle -2064490 true false 210 210 225 225
Circle -1184463 true false 135 15 30

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

pokeball
true
0
Rectangle -16777216 true false 75 150 90 165
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 150 195 165 210
Rectangle -16777216 true false 75 165 90 180
Rectangle -16777216 true false 75 135 90 150
Rectangle -16777216 true false 75 180 90 195
Rectangle -16777216 true false 210 180 225 195
Rectangle -16777216 true false 195 180 210 195
Rectangle -16777216 true false 180 180 195 195
Rectangle -16777216 true false 180 165 195 180
Rectangle -16777216 true false 165 150 180 165
Rectangle -16777216 true false 150 150 165 165
Rectangle -16777216 true false 135 165 150 180
Rectangle -16777216 true false 135 180 150 195
Rectangle -16777216 true false 120 180 135 195
Rectangle -16777216 true false 105 180 120 195
Rectangle -16777216 true false 225 165 240 180
Rectangle -16777216 true false 240 180 255 195
Rectangle -16777216 true false 240 165 255 180
Rectangle -16777216 true false 240 150 255 165
Rectangle -16777216 true false 240 135 255 150
Rectangle -16777216 true false 225 120 240 135
Rectangle -16777216 true false 225 105 240 120
Rectangle -16777216 true false 210 90 225 105
Rectangle -16777216 true false 195 90 210 105
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 150 75 165 90
Rectangle -16777216 true false 135 75 150 90
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 105 90 120 105
Rectangle -16777216 true false 90 105 105 120
Rectangle -16777216 true false 90 120 105 135
Rectangle -16777216 true false 225 195 240 210
Rectangle -16777216 true false 225 210 240 225
Rectangle -16777216 true false 210 225 225 240
Rectangle -16777216 true false 195 225 210 240
Rectangle -16777216 true false 180 240 195 255
Rectangle -16777216 true false 165 240 180 255
Rectangle -16777216 true false 150 240 165 255
Rectangle -16777216 true false 135 240 150 255
Rectangle -16777216 true false 120 225 135 240
Rectangle -16777216 true false 105 225 120 240
Rectangle -16777216 true false 90 210 105 225
Rectangle -16777216 true false 90 195 105 210
Rectangle -16777216 true false 165 195 180 210
Rectangle -1 true false 135 135 150 150
Rectangle -1 true false 135 105 150 120
Rectangle -1 true false 120 120 135 135
Rectangle -1 true false 150 120 165 135
Rectangle -1 true false 135 120 150 135
Rectangle -2674135 true false 180 135 240 165
Rectangle -2674135 true false 195 105 225 180
Rectangle -2674135 true false 165 105 225 135
Rectangle -2674135 true false 90 135 135 165
Rectangle -2674135 true false 165 90 180 105
Rectangle -2674135 true false 105 150 135 180
Rectangle -2674135 true false 150 90 165 105
Rectangle -2674135 true false 150 105 165 120
Rectangle -2674135 true false 135 90 150 105
Rectangle -2674135 true false 120 105 135 120
Rectangle -2674135 true false 105 105 120 120
Rectangle -2674135 true false 105 120 120 135
Rectangle -2674135 true false 165 135 180 150
Rectangle -2674135 true false 150 135 165 150
Rectangle -2674135 true false 135 150 150 165
Rectangle -2674135 true false 180 90 195 105
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 225 180 240 195
Rectangle -1 true false 135 210 195 240
Rectangle -1 true false 120 195 135 210
Rectangle -1 true false 105 210 120 225
Rectangle -1 true false 105 210 120 225
Rectangle -1 true false 135 195 150 210
Rectangle -1 true false 120 210 135 225
Rectangle -1 true false 105 195 120 210
Rectangle -1 true false 135 210 150 225
Rectangle -1 true false 180 195 225 225
Rectangle -16777216 true false 90 165 105 180
Rectangle -1 true false 150 165 180 195

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

shield
true
0
Rectangle -7500403 true true 135 75 150 90
Rectangle -7500403 true true 120 75 135 90
Rectangle -7500403 true true 105 90 120 105
Rectangle -7500403 true true 105 105 120 120
Rectangle -7500403 true true 105 120 120 135
Rectangle -7500403 true true 105 135 120 150
Rectangle -7500403 true true 105 150 120 165
Rectangle -7500403 true true 120 165 135 180
Rectangle -7500403 true true 135 165 150 180
Rectangle -7500403 true true 150 150 165 165
Rectangle -7500403 true true 150 135 165 150
Rectangle -13345367 true false 120 90 150 165
Rectangle -7500403 true true 150 120 165 135
Rectangle -7500403 true true 150 105 165 120
Rectangle -7500403 true true 150 90 165 105

sonic
false
0
Rectangle -1 true false 75 225 165 300
Rectangle -1 true false 60 75 150 150
Rectangle -1 true false -300 -15 0 285
Rectangle -13345367 true false 225 15 240 30
Rectangle -13345367 true false 120 15 135 30
Rectangle -13345367 true false 135 15 150 30
Rectangle -13345367 true false 150 15 165 30
Rectangle -13345367 true false 165 15 180 30
Rectangle -13345367 true false 180 15 195 30
Rectangle -13345367 true false 195 15 210 30
Rectangle -13345367 true false 210 15 225 30
Rectangle -13345367 true false 75 15 90 30
Rectangle -13345367 true false 75 45 90 60
Rectangle -13345367 true false 75 30 90 45
Rectangle -13345367 true false 210 30 225 45
Rectangle -13345367 true false 180 30 195 45
Rectangle -13345367 true false 195 45 210 60
Rectangle -13345367 true false 165 150 180 165
Rectangle -13345367 true false 135 135 150 150
Rectangle -16777216 true false 165 30 180 45
Rectangle -16777216 true false 165 60 180 75
Rectangle -16777216 true false 165 45 180 60
Rectangle -16777216 true false 240 15 255 30
Rectangle -16777216 true false 60 45 75 60
Rectangle -16777216 true false 60 30 75 45
Rectangle -16777216 true false 60 15 75 30
Rectangle -16777216 true false 60 0 75 15
Rectangle -16777216 true false 75 0 90 15
Rectangle -16777216 true false 90 15 105 30
Rectangle -16777216 true false 105 15 120 30
Rectangle -16777216 true false 120 0 135 15
Rectangle -16777216 true false 135 0 150 15
Rectangle -16777216 true false 150 0 165 15
Rectangle -16777216 true false 165 0 180 15
Rectangle -16777216 true false 180 0 195 15
Rectangle -16777216 true false 195 0 210 15
Rectangle -16777216 true false 210 0 225 15
Rectangle -16777216 true false 225 0 240 15
Rectangle -16777216 true false 195 60 210 75
Rectangle -16777216 true false 210 45 225 60
Rectangle -16777216 true false 225 30 240 45
Rectangle -16777216 true false 45 60 60 75
Rectangle -2064490 true false 150 30 165 45
Rectangle -2064490 true false 150 60 165 75
Rectangle -2064490 true false 150 45 165 60
Rectangle -13345367 true false 75 60 90 75
Rectangle -13345367 true false 90 60 105 75
Rectangle -13345367 true false 105 60 120 75
Rectangle -13345367 true false 135 60 150 75
Rectangle -13345367 true false 135 75 150 90
Rectangle -13345367 true false 150 75 165 90
Rectangle -13345367 true false 165 90 180 105
Rectangle -13345367 true false 75 120 90 135
Rectangle -13345367 true false 120 30 135 45
Rectangle -13345367 true false 105 45 120 60
Rectangle -13345367 true false 90 45 105 60
Rectangle -13345367 true false 90 30 105 45
Rectangle -13345367 true false 105 30 120 45
Rectangle -13345367 true false 120 45 135 60
Rectangle -13345367 true false 135 30 150 45
Rectangle -13345367 true false 195 30 210 45
Rectangle -16777216 true false 30 135 45 150
Rectangle -13345367 true false 60 60 75 75
Rectangle -16777216 true false 210 120 225 135
Rectangle -16777216 true false 225 120 240 135
Rectangle -16777216 true false 255 120 270 135
Rectangle -16777216 true false 240 120 255 135
Rectangle -16777216 true false 195 120 210 135
Rectangle -16777216 true false 240 105 255 120
Rectangle -16777216 true false 225 90 240 105
Rectangle -16777216 true false 210 75 225 90
Rectangle -1 true false 30 135 45 150
Rectangle -13840069 true false 90 105 105 120
Rectangle -1 true false 90 120 105 135
Rectangle -1 true false 75 135 90 150
Rectangle -1 true false 90 135 105 150
Rectangle -1 true false 105 135 120 150
Rectangle -1 true false 120 150 135 165
Rectangle -1 true false 105 150 120 165
Rectangle -1 true false 90 150 105 165
Rectangle -1 true false 120 165 135 180
Rectangle -1 true false 105 165 120 180
Rectangle -1 true false 90 165 105 180
Rectangle -1 true false 90 180 105 195
Rectangle -1 true false 105 180 120 195
Rectangle -1 true false 90 195 105 210
Rectangle -1 true false 45 150 60 165
Rectangle -13840069 true false 90 135 105 150
Rectangle -1 true false 105 120 120 135
Rectangle -13840069 true false 45 105 60 120
Rectangle -16777216 true false 90 120 105 135
Rectangle -13345367 true false 90 75 105 90
Rectangle -13345367 true false 225 105 240 120
Rectangle -13345367 true false 195 105 210 120
Rectangle -13345367 true false 210 105 225 120
Rectangle -13345367 true false 180 90 195 105
Rectangle -13345367 true false 165 105 180 120
Rectangle -13345367 true false 150 135 165 150
Rectangle -13345367 true false 150 105 165 120
Rectangle -13345367 true false 180 105 195 120
Rectangle -13345367 true false 195 90 210 105
Rectangle -13345367 true false 210 90 225 105
Rectangle -13345367 true false 165 75 180 90
Rectangle -13345367 true false 150 90 165 105
Rectangle -13345367 true false 180 75 195 90
Rectangle -13345367 true false 195 75 210 90
Rectangle -13345367 true false 180 60 195 75
Rectangle -13345367 true false 75 105 90 120
Rectangle -13345367 true false 60 90 75 105
Rectangle -13345367 true false 75 90 90 105
Rectangle -13345367 true false 60 75 75 90
Rectangle -13345367 true false 75 75 90 90
Rectangle -16777216 true false 195 180 210 195
Rectangle -16777216 true false 210 180 225 195
Rectangle -16777216 true false 225 180 240 195
Rectangle -16777216 true false 240 180 255 195
Rectangle -16777216 true false 255 180 270 195
Rectangle -16777216 true false 30 135 45 150
Rectangle -16777216 true false 240 165 255 180
Rectangle -16777216 true false 225 150 240 165
Rectangle -16777216 true false 210 135 225 150
Rectangle -16777216 true false 60 135 75 150
Rectangle -16777216 true false 180 180 195 195
Rectangle -2064490 true false 135 150 150 165
Rectangle -2064490 true false 60 150 75 165
Rectangle -2064490 true false 90 165 105 180
Rectangle -2064490 true false 105 180 120 195
Rectangle -2064490 true false 150 180 165 195
Rectangle -2064490 true false 120 180 135 195
Rectangle -2064490 true false 105 165 120 180
Rectangle -2064490 true false 135 180 150 195
Rectangle -2064490 true false 120 165 135 180
Rectangle -2064490 true false 150 165 165 180
Rectangle -2064490 true false 135 165 150 180
Rectangle -2064490 true false 150 150 165 165
Rectangle -2064490 true false 75 150 90 165
Rectangle -16777216 true false 150 180 165 195
Rectangle -16777216 true false 45 135 60 150
Rectangle -16777216 true false 45 150 60 165
Rectangle -16777216 true false 60 165 75 180
Rectangle -16777216 true false 45 120 60 135
Rectangle -16777216 true false 75 180 90 195
Rectangle -13345367 true false 210 150 225 165
Rectangle -13345367 true false 195 150 210 165
Rectangle -13345367 true false 195 135 210 150
Rectangle -13345367 true false 165 165 180 180
Rectangle -13345367 true false 180 135 195 150
Rectangle -13345367 true false 180 150 195 165
Rectangle -13345367 true false 180 45 195 60
Rectangle -13345367 true false 150 120 165 135
Rectangle -13345367 true false 180 120 195 135
Rectangle -13345367 true false 165 120 180 135
Rectangle -13345367 true false 165 135 180 150
Rectangle -13345367 true false 225 165 240 180
Rectangle -13345367 true false 210 165 225 180
Rectangle -13345367 true false 195 165 210 180
Rectangle -13345367 true false 180 165 195 180
Rectangle -2064490 true false 135 45 150 60
Rectangle -13345367 true false 120 60 135 75
Rectangle -2064490 true false 75 165 90 180
Rectangle -2064490 true false 90 180 105 195
Line -16777216 false 45 105 45 60
Rectangle -16777216 true false 165 180 180 195
Rectangle -16777216 true false 90 195 105 210
Rectangle -16777216 true false 105 195 120 210
Rectangle -16777216 true false 120 195 135 210
Rectangle -16777216 true false 135 195 150 210
Rectangle -13345367 true false 120 210 135 225
Rectangle -13345367 true false 120 225 135 240
Rectangle -16777216 true false 180 285 195 300
Rectangle -16777216 true false 165 255 180 270
Rectangle -16777216 true false 135 225 150 240
Rectangle -16777216 true false 180 270 195 285
Rectangle -16777216 true false 150 225 165 240
Rectangle -16777216 true false 165 240 180 255
Rectangle -16777216 true false 105 210 120 225
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 15 270 30 285
Rectangle -16777216 true false 45 255 60 270
Rectangle -16777216 true false 60 240 75 255
Rectangle -16777216 true false 60 225 75 240
Rectangle -16777216 true false 75 225 90 240
Rectangle -16777216 true false 105 225 120 240
Rectangle -16777216 true false 90 225 105 240
Rectangle -16777216 true false 90 210 105 225
Rectangle -16777216 true false 30 255 45 270
Rectangle -16777216 true false 0 285 15 300
Rectangle -2674135 true false 165 270 180 285
Rectangle -2674135 true false 75 255 90 270
Rectangle -2674135 true false 60 255 75 270
Rectangle -2674135 true false 45 270 60 285
Rectangle -2674135 true false 30 270 45 285
Rectangle -2674135 true false 30 285 45 300
Rectangle -2674135 true false 15 285 30 300
Rectangle -2674135 true false 60 285 75 300
Rectangle -2674135 true false 75 285 90 300
Rectangle -2674135 true false 90 285 105 300
Rectangle -2674135 true false 105 285 120 300
Rectangle -2674135 true false 135 285 150 300
Rectangle -2674135 true false 150 285 165 300
Rectangle -2674135 true false 120 270 135 285
Rectangle -2674135 true false 135 270 150 285
Rectangle -2674135 true false 150 270 165 285
Rectangle -2674135 true false 165 285 180 300
Rectangle -16777216 true false 45 285 60 300
Rectangle -16777216 true false 105 240 120 255
Rectangle -16777216 true false 105 255 120 270
Rectangle -16777216 true false 90 255 105 270
Rectangle -16777216 true false 75 270 90 285
Rectangle -16777216 true false 60 270 75 285

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.3
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
