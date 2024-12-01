Parse ← ↯∞_2∵⋕regex"\\d+"

Half₁ ← /+⌵≡/-⍜⍉≡⍆Parse
Half₂ ← /+×/+⊸⊞=⊙♭°⊂⍉Parse

Half₂⟜Half₁ &fras"../day1.txt"
