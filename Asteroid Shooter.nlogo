globals [hs bonus score]
patches-own [raincolor]
turtles-own [ammo lives solid]
breed [superasteroid]

to begin-mission
  ifelse any? turtles with [shape = "spaceship"]
  [interaction tick] [carefully [total-score] [reset-ticks total-score] 
    set-hs stop]
  if not any? turtles with [shape = "spaceship"][losescreen]
  if ticks = 2000 [set-hs user-message (word "You Saved The World!  Click Halt and try and beat your high score!")]
end

to losescreen
  ask turtles [set shape "face sad"]
  user-message (word "Please create another spaceship and try again!")
end



to winscreen
  user-message (word "Congratulations!  You saved the world!")
end

to total-score
  set score score
end

to set-hs
  if score > hs [set hs score] 
end

to interaction
  make-it-rain
  damage-ship
  destroy-ship
  damage-rain
  self-destruct

  reload-revive
end
  

to make-it-rain
  start-rain
  let-it-rain
  ifelse ticks <= 100 [wait .08] [
  ifelse ticks <= 300 [wait .06] [
  ifelse ticks <= 550 [wait .04] [
  ifelse ticks <= 1100 [wait .035] [
  ifelse ticks <= 2150 [wait .03] [
  ifelse ticks <= 3200 [wait .025] [
  ifelse ticks <= 4200 [wait .02] [wait .015]]]]]]]
end

to start-rain
  create-turtles 1 [setxy random-xcor max-pycor 
    set shape "asteroid" 
    set color grey
    set heading 180
    set size random 4
    set solid 3]
end
to let-it-rain
  ask turtles with [shape = "asteroid"] [fd 1]
  ask turtles with [shape = "asteroid"] 
  [if pycor = min-pycor [die]]
end

to damage-ship
  ask turtles with [shape = "spaceship"] [
    if any? turtles-here with [shape = "asteroid"]
    [ask turtles-here with [shape = "asteroid"] [die]
      set lives lives - 1]]
end

to destroy-ship
  ask turtles with [shape = "spaceship"]
  [if lives <= 0 [die]]
end

to self-destruct
  ask turtles with [shape = "asteroid"]
  [if solid <= 2 [set color orange]]
  ask turtles with [shape = "asteroid"]
  [if solid <= 1 [set color red]]
  ask turtles with [shape = "asteroid"]
  [if solid <= 0 [set score (score + 100)die]]
end



to damage-rain
  ask turtles with [shape = "line half"] 
  [repeat 10 [fd .1 
   
   if any? turtles-here with [shape = "asteroid"]
    [ask turtles-here with [shape = "asteroid"] [set solid solid - 1] 
      die]
    
    if (ycor >= (max-pycor - 1)) [die]]]
end


to create-ship
  clear-patches
  clear-turtles
  clear-drawing
  reset-ticks
  set score 0
  create-turtles 1 [set shape "spaceship" 
    setxy 3 min-pycor + 1 
    set heading 0
    set size 2
    set color grey
    set lives 17
    set ammo 50]
  user-message (word "Save The World!")
end
  



to reload-revive
  ask turtles with [shape = "spaceship"] [if (remainder ticks 7) = 0 
    [set ammo ammo + 1]]
  
  ask turtles with [shape = "spaceship"] [if (remainder ticks 1000) = 0 
    [set lives lives + 1]]
end

to shoot-bullet1
  if any? turtles with [shape = "spaceship"]
  [ask turtle 0 [
    if ammo != 0 [
      hatch 1 
      [setxy xcor (ycor + 1) 
        set heading 0 
        set shape "line half" 
        set color white
        set size 2]
      set ammo ammo - 1
      ]]]
end

to moveleft
  carefully [ask turtle 0
  [ifelse xcor = min-pxcor [] [set xcor xcor - 1]]] [stop]
end

to moveright
  carefully [ask turtle 0
  [ifelse xcor = max-pxcor [] [set xcor xcor + 1]]] [stop]
end

to up
  carefully [ask turtle 0
  [ifelse ycor = max-pycor [] [fd 1]]][stop]
end

to down
  carefully [ask turtle 0
  [ifelse ycor = min-pycor + 1[] [bk 1]]][stop]
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
28
104
133
137
NIL
begin-mission
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
33
73
127
106
NIL
create-ship
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
72
428
129
473
lives
[lives] of turtle 0
17
1
11

BUTTON
51
248
155
281
NIL
shoot-bullet1
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
142
427
199
472
Ammo
[ammo] of turtle 0
17
1
11

MONITOR
5
430
62
475
Score
score
17
1
11

MONITOR
2
380
74
425
High Score
hs
17
1
11

BUTTON
71
283
134
316
NIL
UP
NIL
1
T
OBSERVER
NIL
W
NIL
NIL
1

BUTTON
71
316
134
349
NIL
Down
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
9
315
72
348
Left
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
133
315
196
348
Right
moveright
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 30 135 60 120 120 105 240 195 240 180 120 165 60 150 30
Polygon -16777216 true false 105 240 135 225 150 225 165 225 195 240
Polygon -2674135 true false 135 225 105 255 135 240 150 300 165 240 195 255 165 225 135 225

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

asteroid
true
0
Polygon -7500403 true true 148 239 88 224 103 194 103 179 103 164 103 149 103 149 118 134 118 134 133 119 163 119 178 119 193 134 208 149 193 179 193 194 193 209 193 224 178 239 148 239
Circle -16777216 true false 128 143 14
Circle -16777216 true false 130 177 14
Circle -16777216 true false 168 143 14
Circle -16777216 true false 158 208 14
Circle -16777216 true false 117 207 14

astronaut
false
0
Polygon -7500403 true true 90 45 210 45 210 195 90 195 90 45
Circle -1 true false 110 5 80
Polygon -1 true false 105 90 120 195 105 285 120 300 135 300 150 225 165 300 180 300 195 285 180 195 195 90
Rectangle -1 true false 127 79 172 94
Polygon -1 true false 195 90 240 195 225 210 165 105
Polygon -1 true false 105 90 60 195 75 210 135 105
Polygon -16777216 true false 135 120 120 120
Polygon -16777216 true false 135 126 129 129 127 134 129 140 133 144 138 145 145 142 146 136 146 133 142 128 137 126
Polygon -16777216 true false 166 150 172 153 174 158 172 164 168 168 163 169 156 166 155 160 155 157 158 151 164 150
Polygon -16777216 true false 134 150 128 153 126 158 128 164 132 168 137 169 144 166 145 160 145 157 141 153 136 150
Polygon -16777216 true false 165 124 171 127 173 132 171 138 167 142 162 143 155 140 154 134 154 131 158 127 163 124
Polygon -2674135 true false 185 226 179 230 171 234 162 237 152 238 156 241 170 238 180 233 185 228
Polygon -2674135 true false 115 226 121 230 129 234 138 237 148 238 144 241 130 238 120 233 115 228
Polygon -16777216 true false 123 29 130 26 141 22 154 22 166 24 174 28 180 37 181 48 177 59 170 67 156 70 143 71 134 68 125 63 120 56 117 46 118 38 125 29
Rectangle -2674135 false false 129 97 169 114
Line -2674135 false 133 110 135 100
Line -2674135 false 136 101 138 109
Line -2674135 false 139 110 142 99
Line -2674135 false 143 111 145 101
Line -2674135 false 146 100 149 111
Line -2674135 false 143 107 150 107
Line -2674135 false 152 111 158 110
Line -2674135 false 158 110 152 103
Line -2674135 false 151 102 157 101
Line -2674135 false 162 100 165 111
Line -2674135 false 159 106 167 106
Line -2674135 false 159 111 161 101

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

dot
false
0
Circle -7500403 true true 90 90 120

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

spaceship
true
15
Polygon -7500403 true false 150 30 135 45 120 90 120 135 45 210 30 225 105 210 90 210 105 210 120 195 150 180 180 195 195 210 180 210 195 210 270 225 255 210 180 135 180 90 165 45
Polygon -2674135 true false 135 180 90 240 135 210 150 300 165 210 210 240 165 180 135 180
Polygon -7500403 true false 150 30 135 60 165 60 150 30
Polygon -16777216 false false 150 45 135 75 165 75 150 45
Polygon -7500403 true false 135 45 105 45
Polygon -7500403 true false 120 105 90 105 120 90
Polygon -7500403 true false 180 90 210 105 180 105
Polygon -1 true true 150 30 135 45 120 90 90 105 120 105 120 135 30 225 105 210 120 195 150 180 180 195 195 210 270 225 180 135 180 105 210 105 180 90 165 45 150 30
Polygon -16777216 true false 150 45 135 75 165 75 150 45

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

superasteroid
true
0
Polygon -7500403 true true 163 291 133 291 103 276 103 276 88 276 88 261 73 246 58 246 58 231 43 216 43 201 43 201 43 171 43 156 28 156 13 141 13 126 28 111 28 96 43 81 58 66 58 51 73 36 88 36 103 36 118 36 148 21 163 21 208 36 208 36 223 51 223 51 238 66 253 81 253 111 253 111 253 126 268 126 268 141 268 171 268 171 268 201 253 216 253 216 238 231 238 246 238 261 223 261 208 276 193 276 178 291 163 306 148 306 163 291
Circle -16777216 true false 72 93 14
Circle -16777216 true false 119 84 14
Circle -16777216 true false 223 168 14
Circle -16777216 true false 87 147 14
Circle -16777216 true false 161 147 14
Circle -16777216 true false 138 217 14
Circle -16777216 true false 157 78 14

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
