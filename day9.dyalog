 day9←{
     ⎕IO←0
     input←⍎¨↑⊃⎕NGET ⍵ 1
     low←{⍵[⊂1 1]≥((9⍴⍳2)/,⍵)}
     part1←+/+/(0=+/¨low¨(10+({⊂⍵}⌺3 3)(input-10)))×(input+1)

     part1
 }
