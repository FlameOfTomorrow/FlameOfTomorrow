.thumb
.align
.macro blh to, reg
    ldr \reg, =\to
    mov lr, \reg
    .short 0xF800
.endm

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


.equ gUnitSubject,0x2033F3C
.equ gMapRange,0x202E4E4
.equ ClearMapWith,0x80197E4
.equ ForEachAdjacentUnit,0x8024F70

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
ldr r2,=#0x8025345
mov r0,r4
mov r1,r5
blh ForEachAdjacentUnit,r3
pop {r4-r5}
pop {r0}
bx r0

.ltorg
.align

.equ gActiveUnit,0x3004E50
.equ gSelect_Rescue,0x859D478
.equ StartTargetSelection,0x804FA3C


