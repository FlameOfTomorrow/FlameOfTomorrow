.thumb
.align

.equ gActiveUnit,0x3004E50
.equ CheckIfHasChestItem,0x8018A9D
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

push {r4,r14}
ldr r4,=gActiveUnit
ldr r2,[r4]
ldr r0,[r2,#0xC]
mov r1,#0x40
and r0,r1
cmp r0,#0
bne RetUnusable

mov r0,r2
mov r1,#0x21
blh CheckIfHasChestItem,r3
cmp r0,#0
bge HasInventorySpace

RetUnusable:
mov r0,#3
b GoBack

.ltorg

HasInventorySpace:
ldr r0,[r4]
bl CanUseChestKey
lsl r0,r0,#0x18
mov r1,#3
cmp r0,#0
beq SetReturnValue
mov r1,#1
SetReturnValue:
mov r0,r1

GoBack:
pop {r4}
pop {r1}
bx r1


.ltorg
.align


.equ gMapTerrain,0x202E4DC

@gdi this is buried 3 functions deep

CanUseChestKey:

push {r14}
mov r3,#0x11
ldsb r3,[r0,r3]
ldr r1,=gMapTerrain
ldr r2,[r1]
lsl r1,r3,#2
add r1,r1,r2
mov r2,#0x10
ldsb r2,[r0,r2]
ldr r0,[r1]
add r0,r0,r2
ldrb r0,[r0]
cmp r0,#0x21
bne ReturnFalse
mov r0,r2
mov r1,r3
bl IsThereClosedChestAt
lsl r0,r0,#0x18
cmp r0,#0
beq 29130 //29124
mov r0,r1
b ReturnFromFunc

.ltorg

ReturnFalse:
mov r0,#0

ReturnFromFunc:
pop {r1}
bx r1

.ltorg
.align

@aaand the place where we need to change something

IsThereClosedChestAt:

push {r14}
lsl r0,r0,#0x18
asr r0,r0,#0x18
lsl r1,r1,#0x18
asr r1,r1,#0x18

blh GetLocationEventCommandAt,r2

ldr r1,AntiThiefChestID
cmp r0,r1
beq ReturnTrue
mov r0,#0
b Return

ReturnTrue:
mov r0,r1

Return:
pop {r1}
bx r1

.ltorg
.align

AntiThiefChestID:
@WORD AntiThiefChestID

