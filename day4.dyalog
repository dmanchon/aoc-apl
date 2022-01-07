 day4←{

     input←⊃⎕NGET ⍵ 1
     nums←⍎¨','(≠⊆⊢)⊃1↑input
     boards←1⊂[1]{((≢⍵)÷5)5 5⍴⍵}↑{⍎¨(0≠≢¨⍵)⌿⍵}1↓input

     wins←nums∘{⊃⍸({∨/,5=(+/⍵),(+/[2]⍵)}¨⍵∘∊¨,\⍺)}¨boards
     i⍙winner←wins⍳(⌊/wins)
     winner←↑boards[i⍙winner]
     score⍙winner←(wins[i⍙winner]⊃nums)×(+/+/winner×~(winner∊wins[i⍙winner]↑nums))
     i⍙loser←wins⍳(⌈/wins)
     loser←↑boards[i⍙loser]
     score⍙loser←(wins[i⍙loser]⊃nums)×(+/+/loser×~(loser∊wins[i⍙loser]↑nums))
     score⍙winner score⍙loser
 }

 ⍝ day4 'day4.txt'