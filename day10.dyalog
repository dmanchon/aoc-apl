 day10←{
     input←↑⊃⎕NGET ⍵ 1
     f←{
         ⍺←⍬
         (≢⍵)=0:0

         a←1↑⍵
         b←1↑⍺

         ⍝ Errors
         (a=')')∧(b≠'('):3
         (a=']')∧(b≠'['):57
         (a='}')∧(b≠'{'):1197
         (a='>')∧(b≠'<'):25137

         ⍝ Correct close
         a∊'])}>}':(1↓⍺)∇(1↓⍵)
         ⍝ Open
         (a,⍺)∇(1↓⍵)
     }
     points←f¨↓input
     part1←+/points

     incomplete←(~×points)/↓input
     f←{
         ⍺←⍬
         (≢⍵)=0:⍺

         a←1↑⍵
         ⍝ Close
         a∊'])}>}':(1↓⍺)∇(1↓⍵)
         ⍝ Open
         (a,⍺)∇(1↓⍵)
     }
     sum←{(≢⍵)=0:0 ⋄ (1↑⍵)+5×(∇ 1↓⍵)}
     map←{(⍵='(')+(2×⍵='[')+(3×⍵='{')+(4×⍵='<')}
     scores←{sum⊖⍵}¨map¨f¨incomplete
     part2←↑scores[(⌈((≢scores)÷2))⌷⍋scores]

     part1 part2
 }
