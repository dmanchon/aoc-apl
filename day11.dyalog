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

     f←{
         flashes iteration←⍺
         iteration=0:flashes
         iteration←iteration-1

         updated←step(⍵+1)
         flashes←flashes+(+/+/(updated=0))
         (flashes iteration)∇ updated
     }

     (0 100)f input
 }
