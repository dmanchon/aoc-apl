 day9←{
     ⎕IO←0
     input←⍎¨↑⊃⎕NGET ⍵ 1
     low←{⍵[⊂1 1]≥((9⍴⍳2)/,⍵)}
     part1←+/+/(0=+/¨low¨(10+({⊂⍵}⌺3 3)(input-10)))×(input+1)


     ids←{(⍴⍵)⍴⍳×/(⍴⍵)} ⍝ A matrix with initial groups, each non wall has an incremental id
     padding←{⍉⍺,(⍉(⍺,⍵,⍺)),⍺} ⍝ Add an external wall (-1s)
     mask←{(1⊖⍵)+(¯1⊖⍵)+(⍉1⊖⍉⍵)+(⍉¯1⊖⍉⍵)} ⍝ Expand
     solve←{
         ⍺←∪(,⍵)~¯1 ⍝All groups (monadic call)
         (≢⍺)=0:⍵ ⍝ No more groups to merge
         b←(⊃⍺)=⍵ ⍝ Get first group
         m←0≠mask b ⍝ Expand first group

         merge←(,m×⍵)~¯1 0(0⊃⍺) ⍝ Non wall adjacent to the group
         updated←(⊃⍺)@{⍵∊merge}⍵ ⍝ Merge adjacent groups

         1=(∨/∨/updated≠⍵):(⍺~merge)∇ updated ⍝ Keep merging
         (1↓(⍺~merge))∇ updated ⍝ Next group
     }

     basins←¯1 padding(((ids input)+1)×(input≠9))-1 ⍝ Initial groups + external wall
     final←solve basins
     freqs←{(≢⍵)⍺}⌸(,final)~¯1
     part2←×/{⊃⍵}¨3↑↓freqs[⍒freqs;]

     part1 part2
 }
