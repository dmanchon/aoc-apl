 day8←{
     ⎕IO←0
     input←⊃⎕NGET ⍵ 1
     part1←+/(∊≢¨¨' '(≠⊆⊢)¨1∘⊃¨'|'(≠⊆⊢)¨input)∊2 3 4 7
     part1
 }
