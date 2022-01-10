 day8←{
     ⎕IO←0
     input←⊃⎕NGET ⍵ 1
     get←{(⍺=(≢¨⍵))/⍵}
     decode←{
         in←⊃⍵
         out←1⊃⍵

         ⍝ Figure out the digits
         one←2 get in
         seven←3 get in
         four←4 get in
         eight←7 get in
         candidates←6 get in
         six←(,1=≢¨(one∘.∩candidates))/candidates
         candidates←candidates~six
         zero←(,3=≢¨four∘.∩candidates)/candidates
         nine←candidates~zero
         candidates←5 get in
         three←(,2=≢¨one∘.∩candidates)/candidates
         candidates←candidates~three
         two←(,2=≢¨four∘.∩candidates)/candidates
         five←candidates~two

         ⍝ Decode the numbers
         dict←zero,one,two,three,four,five,six,seven,eight,nine
         +/1000 100 10 1×{(⍵∘{∧/(⍵∊⍺),(⍺∊⍵)}¨dict)⍳1}¨out
     }

     part1←+/(∊≢¨¨' '(≠⊆⊢)¨1∘⊃¨'|'(≠⊆⊢)¨input)∊2 3 4
     part2←+/{decode ⍵}¨' '(≠⊆⊢)¨¨'|'(≠⊆⊢)¨input
     part1,part2

 }
