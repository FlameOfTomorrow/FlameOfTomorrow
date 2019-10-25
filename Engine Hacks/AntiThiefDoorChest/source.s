.thumb
.align

.equ GetLocationEventCommandAt,0x8084079

.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm


push {r4-r6,r14}

asr r4,r0,#0x18
mov r5,r1

@r4=x coord
@r5=y coord

@first we check it against our thing

ldr r1,=#0x202BCF0 @chapter data struct
ldrb r0,[r1,#0xE] @r0=chapter ID
ldrb r2,[r1,#0xF] @r2=current phase
cmp r2,#0x80
bne ContinueFunction
mov r1,#4
mul r0,r1
ldr r1,ThiefDenyListTable
add r1,r0
ldr r6,[r1] @r6=coordinate deny list

@now we do a loop
LoopStart:
ldrb r0,[r6]
cmp r0,#0xFF
beq ContinueFunction
cmp r0,r4
beq CheckYCoord
b LoopRestart

CheckYCoord:
ldrb r0,[r6,#1]
cmp r0,r5
beq RetFalse

LoopRestart:
add r6,#2
b LoopStart


@if we are here, our coord pairs do not match
ContinueFunction:
mov r0,r4
mov r1,r5
blh GetLocationEventCommandAt,r3
cmp r0,#0x12
bne RetFalse
mov r0,#1
b GoBack

RetFalse:
mov r0,#0

GoBack:
pop {r4-r6}
pop {r1}
pop {r1}
bx r1

.ltorg
.align

ThiefDenyListTable:
@POIN ThiefDenyListTable
