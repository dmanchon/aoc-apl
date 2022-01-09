 day6←{
     ⎕IO←0
     seed←⍎¨','(≠⊆⊢)∊⊃⎕NGET ⍵ 1
     day←{(((⍵>0)/⍵)-1),(2×+/⍵=0)⍴6 8}
     part1←≢(day⍣80)seed

     ⍝ Inspired by https://www.youtube.com/watch?v=pVKw95YbIT4
     counts←{+⌿(⍵∘.=(⍳9))}
     six←0 0 0 0 0 0 1 0 0
     day←{(1⊖⍵)+(six×⍵[0])}
     part2←+/(day⍣256)(counts seed)

     part1,(15 0⍕part2)
 }
