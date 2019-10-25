.thumb
.align
.macro blh to, reg
    ldr \reg, =\to
    mov lr, \reg
    .short 0xF800
.endm
.equ gActiveUnit,0x3004E50
.equ GetTargetListSize,0x804FD28
.equ gTargetArraySize,0x203E0EC
.equ gUnitSubject,0x2033F3C
.equ gMapRange,0x202E4E4
.equ ForEachAdjacentUnit,0x8024F70
.equ ClearMapWith,0x80197E4

.equ AreAllegiancesEqual,0x8024DA5
.equ AddTarget,0x804F8BD

TryAddUnitToRefugeTargetList:
push {r4-r5,r14}
mov r4,r0
ldr r5,=gUnitSubject
ldr r0,[r5]
ldrb r0,[r0,#0xB]
lsl r0,r0,#0x18
asr r0,r0,#0x18
mov r1,#0xB
ldsb r1,[r4,r1]
blh AreAllegiancesEqual,r2
lsl r0,r0,#0x18
cmp r0,#0
beq GoBack1
ldr r2,[r5]
ldr r0,[r2,#4]
ldrb r0,[r0,#4]
cmp r0,#0x51
beq GoBack1
ldr r0,[r4,#4]
ldrb r0,[r0,#4]
cmp r0,#0x51
beq GoBack1
mov r0,r4
add r0,#0x30
ldrb r1,[r0]
mov r0,#0xF
and r0,r1
cmp r0,#4
beq GoBack1
ldr r0,[r4,#0xC]
mov r1,#0x30
and r0,r1
cmp r0,#0
bne GoBack1
mov r0,r2
mov r1,r4
bl CanUnitRefuge
lsl r0,r0,#0x18
cmp r0,#0
beq GoBack1
mov r0,#0x10
ldsb r0,[r4,r0]
mov r2,#0xB
ldsb r2,[r4,r2]
mov r3,#0
blh AddTarget,r4
GoBack1:
pop {r4-r5}
pop {r0}
bx r0

.ltorg
.align

.equ GetUnitAid,0x80189B9

CanUnitRefuge:
push {r4-r5,r14}
mov r4,r1 @r4=target char struct
ldr r0,=gUnitSubject
ldr r5,[r0] @r5=user char struct
mov r0,r4
blh GetUnitAid,r1
mov r2,r0

ldr r0,[r5]
ldrb r0,[r0,#0x13]
ldr r1,[r5,#4]
ldrb r1,[r1,#0x11]
add r0,r1
ldrb r1,[r5,#0x1A]
add r0,r1

cmp r2,r0

blt RetFalse
b RetTrue


RetFalse:
mov r0,#0
b GoBack2

RetTrue:
mov r0,#1

GoBack2:
pop {r4-r5}
pop {r1}
bx r1

.ltorg
.align

