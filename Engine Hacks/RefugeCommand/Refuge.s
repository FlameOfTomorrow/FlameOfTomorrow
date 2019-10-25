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
.equ gActiveUnit,0x3004E50
.equ GetTargetListSize,0x804FD28
.equ gTargetArraySize,0x203E0EC
.equ gUnitSubject,0x2033F3C
.equ gMapRange,0x202E4E4
.equ ForEachAdjacentUnit,0x8024F70
.equ ClearMapWith,0x80197E4
.equ AreAllegiancesEqual,0x8024DA5
.equ AddTarget,0x804F8BD
.equ GetUnitAid,0x80189B9
.equ gSelect_Rescue,0x0859d478 
.equ StartTargetSelection,0x804fa3c



.global RefugeUsability
.type RefugeUsability, %function
RefugeUsability:
push {r14}
@rescue checks
ldr r0,=gActiveUnit
ldr r2,[r0]
ldr r1,[r2,#0xC]
mov r0,#0x40
and r0,r1
cmp r0,#0
bne ReturnFalse
mov r0,#0x81
lsl r0,r0,#4
and r1,r0
cmp r1,#0
bne ReturnFalse
@is there anyone that can be refuged to check
mov r0,r2
bl MakeRefugeTargetList
ldr r0,=gTargetArraySize
ldr r0,[r0]
cmp r0,#0
beq ReturnFalse
mov r0,#1
b GoBack
ldr r6,=0x2A004002
lsl r0,r0,#0xC

ReturnFalse:
mov r0,#3

GoBack:
pop {r1}
bx r1

.ltorg
.align






.global RefugeEffect
.type RefugeEffect, %function
RefugeEffect:
push {r14}
ldr r0,=gActiveUnit
ldr r0,[r0]
bl MakeRefugeTargetList
ldr r0,=gSelect_Rescue
blh StartTargetSelection,r1
mov r0,#7
pop {r1}
bx r1

.ltorg
.align


.global MakeRefugeTargetList
.type MakeRefugeTargetList, %function
MakeRefugeTargetList:
push {r4-r5,r14}
mov r4,#0x10
ldsb r4,[r0,r4]
mov r5,#0x11
ldsb r5,[r0,r5]
ldr r1,=gUnitSubject
str r0,[r1]
ldr r0,=gMapRange
ldr r0,[r0]
mov r1,#0
blh ClearMapWith,r2
ldr r2,=TryAddUnitToRefugeTargetList
mov r1,#0x1
orr r2,r1
mov r0,r4
mov r1,r5
blh ForEachAdjacentUnit,r3
pop {r4-r5}
pop {r0}
bx r0

.ltorg
.align


.equ AreAllegiancesAllied,0x8024D8D
.equ AddTarget,0x804F8BD

.global TryAddUnitToRefugeTargetList
.type TryAddUnitToRefugeTargetList, %function
TryAddUnitToRefugeTargetList:

push {r4-r5,r14}
mov r4,r0
ldr r5,=gUnitSubject
ldr r0,[r5]
ldrb r0,[r0,#0xB]
mov r1,#0xB
ldsb r1,[r4,r1]
blh AreAllegiancesAllied,r3
cmp r0,#0
beq ReturnFromFunc
ldr r2,[r5]
ldr r0,[r2,#4]
ldrb r0,[r0,#4]
cmp r0,#0x51
beq ReturnFromFunc
ldr r0,[r4,#4]
ldrb r0,[r0,#4]
cmp r0,#0x51
beq ReturnFromFunc
mov r0,r4
add r0,#0x30
ldrb r1,[r0]
mov r0,#0xF
and r0,r1
cmp r0,#4
beq ReturnFromFunc
ldr r0,[r4,#0xC]
mov r1,#0x30
and r0,r1
cmp r0,#0
bne ReturnFromFunc
mov r0,r2
mov r1,r4
bl CanUnitRefuge @the thing we have to mimic
lsl r0,r0,#0x18
cmp r0,#0
beq ReturnFromFunc
mov r0,#0x10
ldsb r0,[r4,r0]
mov r1,#0x11
ldsb r1,[r4,r1]
mov r2,#0xB
ldsb r2,[r4,r2]
mov r3,#0
blh AddTarget,r4
ReturnFromFunc:
pop {r4-r5}
pop {r0}
bx r0

.ltorg
.align


.global CanUnitRefuge
.type CanUnitRefuge, %function
CanUnitRefuge:

push {r4,r14}
mov r4,r1
blh GetUnitAid,r3
ldr r1,[r4,#4]
mov r2,#0x11
ldsb r2,[r1,r2]
ldr r1,[r4]
ldrb r1,[r1,#0x13]
add r2,r1
mov r1,#0x1A
ldsb r1,[r4,r1]
add r2,r1
mov r1,#0
cmp r0,r2
bgt ReturnFromCanRefugeFunc @rescue has this as blt
mov r1,#1
ReturnFromCanRefugeFunc:
mov r0,r1
pop {r4}
pop {r1}
bx r1

.ltorg
.align

