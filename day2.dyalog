 day2←{
         down←{⍵ 0}
         up←{-⍵ 0}
         forward←{0 ⍵}
         moves←⍎⍤1⊢↑⊃⎕NGET ⍵ 1
         part2←{
                 depth←2⊃(+\⍉⍵[;1])+.×⍵
                 horiz←+/⍵[;2]
                 depth×horiz
         }
         ({×/+/⍉⍵}moves),(part2 moves)
 }

 ⍝ day2 'day2.txt'
