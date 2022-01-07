 day1←{
     input←(⍎⍤1)↑⊃⎕NGET ⍵ 1
     part1←{+/(2-/⍵)<0}
     (part1 input), ({part1 3+/⍵}input)
 }

 ⍝ day1 'day1.txt'