.thumb
.align

.equ gActiveUnit,0x3004E50
.equ CheckIfHasItem,0x8018A9D
.equ MakeTargetListForDoorAndBridges,0x8025815
.equ GetTargetListSize,0x804FD29

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
bne ReturnUnusable

mov r0,r2
mov r1,#0x1E
blh CheckIfHasItem,r3
cmp r0,#0
bge DoesHaveItem

ReturnUnusable:
mov r0,#3
b GoBack

.ltorg

DoesHaveItem:
ldr r0,[r4]
mov r1,#0x1E
bl MakeTargetListForDoorAndBridges
blh GetTargetListSize,r3
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

@we have to change a single number buried in the one function that does not call any other functions here and it's terrible

.equ gUnitSubject,0x2033F3C
.equ gMapRange,0x202E4E4
.equ TryAddBridgeToTargetList,0x80257D5

MakeTargetListForDoorAndBridges:

push {r4-r6,r14}
mov r4,r1
mov r5,#0x10
ldsb r5,[r0,r5]
mov r6,#0x11
ldsb r6,[r0,r6]
ldr r1,=gUnitSubject
str r0,[r1]
ldr r0,=gMapRange
ldr r0,[r0]
mov r1,#0
blh ClearMapWith,r3
cmp r4,#0x14
beq SkipClosedDoorCheck
cmp r4,#0x1E
bne ReturnFromFunc
ldr r2,=TryAddClosedDoorToTargetList
mov r0,r5
mov r1,r6
blh ForEachAdjacentPosition,r3
b ReturnFromFunc

.ltorg

SkipClosedDoorCheck:
ldr r2,=TryAddBridgeToTargetList
mov r0,r5
mov r1,r6
blh ForEachAdjacentPostition,r3

ReturnFromFunc:
pop {r4-r6}
pop {r0}
bx r0

.ltorg
.align


.equ gMapTerrain,0x202E4DC

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
beq 83206
mov r0,#0
b 83208

RetTrue:
mov r0,#1

Ret:
pop {r1}
bx r1

.ltorg
.align

AntiThiefDoorID:
@WORD AntiThiefDoorID




