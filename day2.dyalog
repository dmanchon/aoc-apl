moves←⍎⍤1⊢↑⊃⎕NGET’/day2.txt’ 1

{×/+/⍉⍵} moves

{
        depth←2⊃(+\⍉⍵[;1])+.×⍵
        horiz←+/⍵[;2]
        depth×horiz
} moves
