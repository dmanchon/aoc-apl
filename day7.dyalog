 day7←{
     input←⍎¨','(≠⊆⊢)∊⊃⎕NGET ⍵ 1
     fuels←+/|(⍳⌈/input)∘.-input
     part1←⌊/fuels

     triangular←{(⍵×(⍵+1))÷2}
     fuels←+/|(⍳⌈/input)∘.{triangular|⍺-⍵}input
     part2←⌊/fuels
     part1,part2
 }
