pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
#include main.lua
#include aliens.lua
#include player.lua
#include lasers.lua
#include input.lua
#include debug.lua
__gfx__
00000000000000077000000000000007700000000000700000070000000070000007000000000077770000000000007777000000000000000000000000000000
00000000000000777700000000000077770000000000070000700000007007000070070000077777777770000007777777777000000007777770000000000000
00700700000007777770000000000777777000000000777777770000007077777777070000777777777777000077777777777700000777777777700000000000
00077000000077077077000000007707707700000007707777077000007770777707770000777007700777000077700770077700007777777777770000000000
00077000000077777777000000007777777700000077777777777700007777777777770000777777777777000077777777777700077077077077077000000000
00700700000000700700000000000707707000000070777777770700000777777777700000007770077700000000077007700000777777777777777700000000
00000000000007077070000000007000000700000070700000070700000070000007000000077007700770000000770770770000007770077007770000000000
00000000000070700707000000000700007000000000077007700000000700000000700000007700007700000077000000007700000700000000700000000000
0000000bb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000bbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bbbbbbbbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000770000700007007000070007777000077770000077000000000000000000bbbbbbbbbb00000000000000000000000000000000000000000000000
0077770000777700007007000070070007777770077777700077770000000000000000bbbbbbbbbbbb0000000000000000000000000000000000000000000000
077777700777777007777770777777777707707777077077077777700000000000000bbbbbbbbbbbbbb000000000000000000000000000000000000000000000
77077077770770777707707777077077777777777777777777777777000000000000bbbbbbbbbbbbbbbb00000000000000000000000000000000000000000000
7777777777777777777777777777777777700777777007777070070700000000000bbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000
070770700070070077777777077777700707707007077070777777770000000000bbbbbbbbbbbbbbbbbbbb000000000000000000000000000000000000000000
70000007070770707000000707000070700000077700007707777770000000000bbbbbbbbbbbbbbbbbbbbbb00000000000000000000000000000000000000000
0700007070700707077007707000000707700770700000070070070000000000bbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
0000000000077000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
0000000000077000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
000bb00000077000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
000bb00000077000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
0bbbbbb000077000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000
bbbbbbbb00077000000000000000000000000000000000000000000000000000bbbbbbbbbbb00bbbbbbbbbbb0000000000000000000000000000000000000000
bbbbbbbb00077000000000000000000000000000000000000000000000000000bbbbbbbbbb0000bbbbbbbbbb0000000000000000000000000000000000000000
0000000000077000000000000000000000000000000000000000000000000000bbbbbbbbb000000bbbbbbbbb0000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0025002500250025002500250025000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0022002200220022002200220022000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000f0500e0500e0500e0500e0500f0500e05000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00020000344502c450234501c45018450134500f4500a450084500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000200002b6501765017650166501465013650136501365013650146501565015650166501765018650196501a6501c6501f6501e6501a6501765013650096500765006650056500365000650006000060000600
