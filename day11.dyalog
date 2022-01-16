 day11←{
     ⎕IO←1
     input←⍎¨↑⊃⎕NGET ⍵ 1

     expand1←{⍵+(1↓[2]⍵,0)+(0,¯1↓[2]⍵)}
     expand←{⍉expand1⍉expand1 ⍵}

     step←{
         ⍺←⍵×0
         lights←(⍵>9)×~⍺
         (∨/∨/lights)=0:⍵×~⍺
         (lights∨⍺)∇ ⍵+(expand lights)
     }

     p1←{
         flashes iteration←⍺
         iteration=0:flashes
         iteration←iteration-1

         updated←step(⍵+1)
         flashes←flashes+(+/+/(updated=0))
         (flashes iteration)∇ updated
     }
     part1←(0 100)p1 input

     p2←{
         ⍺←0
         (+/+/(⍵≠0))=0:⍺
         (⍺+1)∇ step(⍵+1)
     }

     part2←p2 input

     part1 part2
 }
