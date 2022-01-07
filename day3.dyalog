 part1←{
         input←{⍵='1'}¨↑⊃⎕NGET ⍵ 1
         len←≢input
         digits←{⍵≥len÷2}¨(+/⍉input)
         (2⊥digits)×(2⊥~digits)
 }

 part2←{
         input←{⍵='1'}¨↑⊃⎕NGET ⍵ 1
         a←1{
                 (≢⍵)=1:,⍵
                 (⍺+1)∇⍉((((+/⍵[;⍺])≥(≢⍵)÷2)=⍵[;⍺])/⍉⍵)
         }input
         b←1{
                 (≢⍵)=1:,⍵
                 (⍺+1)∇⍉((((+/⍵[;⍺])<(≢⍵)÷2)=⍵[;⍺])/⍉⍵)
         }input
         2⊥a×2⊥b
 }

 part1 'day3.txt', part2 'day3.txt'
