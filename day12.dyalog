 day12←{
     input←↑'-'(≠⊆⊢)¨⊃⎕NGET ⍵ 1
     u←∪,input
     lowercase←{~∨/⎕A∊⍵}¨u
     z←(≢u)(≢u)⍴0
     adj←⊃∨/{z[⊂u⍳⍵]←1 ⋄ z[⊂u⍳⊖⍵]←1 ⋄ z}¨↓input
     start end←u⍳'start' 'end'
     p1←{
         ⍵=0:0
         ⍵=end:1
         visited←lowercase×(1@⍵)⍺
         +/visited∘∇¨(⍸⍵⌷adj)~(⍸visited)
     }
     part1←(lowercase×0)p1 start
     p2←{
         ⍵=0:0
         ⍵=end:1
         visited←lowercase×1(+@⍵)⍺
         (+/visited≥2)>2:0

         +/visited∘∇¨⍸(⍵⌷adj)×(visited<2)
     }
     part2←(1@start⊢0×lowercase)p2 start

     part1 part2
 }
