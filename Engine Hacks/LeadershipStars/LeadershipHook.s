.thumb

push 	{r4, lr}
ldr		r3, [r1,#4]			@opposing unit class number
cmp		r3, #0 				@if it's 0 this isn't actually combat
beq		End					@and thus we don't want to do anything

ldr		r2, ApplyLeadershipBonus
mov		lr, r2
.short	0xf800 				@bl to lr

End:
pop 	{r4}
pop 	{r0}
bx		r0

.align
.ltorg
ApplyLeadershipBonus:
@POIN ApplyLeadershipBonus
