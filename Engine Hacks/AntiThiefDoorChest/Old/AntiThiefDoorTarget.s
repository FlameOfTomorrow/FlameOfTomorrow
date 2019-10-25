.thumb
.align

.equ gMapTerrain,0x202E4DC
.equ AddTarget,0x804F8BD

.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

TryAddClosedDoorToTargetList:

push {r4-r6,r14}
mov r4,r0
mov r5,r1
ldr r0,=gMapTerrain
ldr r1,[r0]
lsl r0,r5,#2
add r0,r0,r1
ldr r0,[r0]
add r0,r4
ldrb r0,[r0]
cmp r0,#0x1E
bne Return
mov r0,r4
mov r1,r5
bl IsThereClosedDoorAt
lsl r0,r0,#0x18
cmp r0,#0
beq Return
mov r0,r4
mov r1,r5
mov r2,#0x1E
mov r3,#0
blh AddTarget,r6

Return:
pop {r4-r6}
pop {r0}
bx r0

.ltorg
.align

.equ GetLocationEventCommandAt,0x8084079

IsThereClosedDoorAt:

push {r14}
blh GetLocationEventCommandAt,r3
ldr r1,AntiThiefDoorID
cmp r0,r1
beq RetTrue
mov r0,#0
b Ret

RetTrue:
mov r0,#1

Ret:
pop {r1}
bx r1

.ltorg
.align

AntiThiefDoorID:
@WORD AntiThiefDoorID



