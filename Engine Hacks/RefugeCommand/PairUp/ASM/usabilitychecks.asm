@Pair Up Usability!
@we can leave the effect just fine
.thumb
.org 0
PairUpCheck:
@228a4 is the original check yeah?
push {r14}
ldr r0,VanillaRescueCheck
mov lr,r0
.short 0xf800
@returned true?
cmp r0,#1
beq False
@bl CantoCheck
@cmp r0,#0
@bne False
mov r0,#1
b End
False:
mov r0,#3
End:
pop {r1}
bx r1

.align
RescueCheck:
push {r14}
ldr r0,VanillaRescueCheck
mov lr,r0
.short 0xf800
@returned true?
cmp r0,#1
bne False2
bl CantoCheck
cmp r0,#0
beq False2
mov r0,#1
b End2
False2:
mov r0,#3
End2:
pop {r1}
bx r1

.align
CantoCheck:
ldr r3,ActiveUnit
ldr r2,[r3]
ldr r1,[r2] @char pointer
ldr r2,[r2,#4] @class pointer
ldr r1,[r1,#0x28] @char ability
ldr r2,[r2,#0x28] @class ability
orr r1,r2
mov r2,#2
and r1,r2
mov r0,r1
@returns 0 if no canto else canto
bx lr

.align
VanillaRescueCheck:
.long 0x80228a4
ActiveUnit:
.long 0x3004e50
