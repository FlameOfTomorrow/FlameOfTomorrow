.thumb
.align

.equ gActionData,0x203A958
.equ gActiveUnit,0x3004E50

.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

push {r4,r14}
ldr r4,=gActionData
mov r0,#0x12
strb r0,[r4,#0x11]
ldr r0,=gActiveUnit
ldr r0,[r0]
ldrb r1,[r0,#0xB]
strb r1,[r4,#0xC]
mov r1,#0x1E
bl DecrementUnlockItemDurability
strb r0,[r4,#0x12]
mov r0,#0x17
pop {r4}
pop {r1}
bx r1

.ltorg
.align


.equ GetUnitItemSlot,0x801702D

DecrementUnlockItemDurability:
push {r4-r6,r14}
mov r4,r0
mov r5,r1
mov r6,#0
ldr r0,[r4]
ldr r1,[r4,#4]
ldr r0,[r0,#0x28]
ldr r1,[r1,#0x28]
orr r0,r1
mov r1,#0x8
and r0,r1
cmp r0,#0
beq SkipFirstGetItemSlot
mov r0,r4
mov r1,#0x6B
blh GetUnitItemSlot,r3
cmp r0,#0
bge GoBack

SkipFirstGetItemSlot:
cmp r5,#0x1E
beq AltGetItemSlot1
cmp r5,#0x21
bne AltGetItemSlot2
mov r0,r4
mov r1,#0x69
blh GetUnitItemSlot,r3
cmp r0,#0
bge GoBack
mov r0,r4
mov r1,#0x79
blh GetUnitItemSlot,r3
b GoBack

AltGetItemSlot1:
mov r6,#0x6A
AltGetItemSlot2:
mov r0,r4
mov r1,r6
blh GetUnitItemSlot,r3
GoBack:
pop {r4-r6}
pop {r1}
bx r1


