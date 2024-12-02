Parse ← ∵⋕regex"\\d+"
Resize   ← ↯[∞ 2]
GetInput ← Resize Parse
Half₁    ← /+⌵≡/-⍜⍉≡⍆GetInput
Half₂    ← /+×/+⊸⊞=⊙♭°⊂⍉GetInput

Half₂⟜Half₁ &fras"../day1.txt"
