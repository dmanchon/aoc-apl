 day12←{
     input←↑'-'(≠⊆⊢)¨⊃⎕NGET ⍵ 1
     u←∪,input
     lowercase←{~∨/⎕A∊⍵}¨u
     z←(≢u)(≢u)⍴0
     adj←⊃∨/{z[⊂u⍳⍵]←1 ⋄ z[⊂u⍳⊖⍵]←1 ⋄ z}¨↓input
     start end←u⍳'start' 'end'
     f←{
         ⍵=0:0
         ⍵=end:1
         visited←lowercase×(1@⍵)⍺
         +/visited∘∇¨(⍸⍵⌷adj)~(⍸visited)
     }
     part1←(lowercase×0)f start
     part1
 }
