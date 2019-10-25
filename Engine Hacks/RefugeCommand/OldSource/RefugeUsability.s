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


.equ gUnitSubject,0x2033F3C
.equ gMapRange,0x202E4E4
.equ ForEachAdjacentUnit,0x8024F70
.equ ClearMapWith,0x80197E4

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
ldr r2,RefugeTargetList
mov r0,r4
mov r1,r5
blh ForEachAdjacentUnit,r3
pop {r4-r5}
pop {r0}
bx r0

.ltorg
.align

RefugeTargetList:
@POIN RefugeTargetList
