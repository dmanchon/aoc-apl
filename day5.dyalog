 day5←{
     ⎕IO←0
     coords←{⍎¨(~⍵∊',->')⊆⍵}¨⊃⎕NGET ⍵ 1
     hor_or_vert←{x1 y1 x2 y2←⍵ ⋄ ∨/0=(x1-x2)(y1-y2)}
     expand←{
         pad←{d←(≢⍺)-(≢⍵) ⋄ d>0:⍵,d⍴(¯1↑⍵) ⋄ ⍵}
         to←{⍺=⍵:⍺ ⋄ ⍺+(×⍵-⍺)×⍳1+|⍺-⍵}
         x1 y1 x2 y2←,⍵
         dx←x1 to x2
         dy←y1 to y2

         ↓(dy pad dx),[0.5](dx pad dy)
     }

     ⍝ Part1: only horizontal or vertical
     points←{((≢⍵)÷2)2⍴⍵}∊expand¨(hor_or_vert¨coords)/coords
     size←1+⌈/⌈/points
     board←size size⍴0


     part1←+/+⌿(⍉board{
         (≢⍵)=0:⍺
         p←2⍴,1↑⍵
         b←⍺
         b[⊂p]←b[⊂p]+1
         b ∇ 1↓⍵
     }points)>1

     ⍝ Part2: also diagonal lines
     points←{((≢⍵)÷2)2⍴⍵}∊expand¨coords

     size←1+⌈/⌈/points
     board←size size⍴0
     part2←+/+⌿⍉(board{
         (≢⍵)=0:⍺
         p←2⍴,1↑⍵
         b←⍺
         b[⊂p]←b[⊂p]+1
         b ∇ 1↓⍵
     }points)>1
     part1,part2
 }
