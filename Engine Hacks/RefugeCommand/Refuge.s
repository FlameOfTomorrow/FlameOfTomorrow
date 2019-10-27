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
.equ AreAllegiancesAllied,0x8024D8D
.equ AddTarget,0x804F8BD
.equ gActionData,0x203A958
.equ GetUnit,0x8019431
.equ TryRemoveUnitFromBallista,0x8037A6D
.equ GetSomeFacingDirection,0x801DBD5
.equ Make6CKOIDO,0x801DC7D
.equ UnitRescue,0x801834D
.equ HideUnitSMS,0x802810D



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
ldr r0,=gActionData
mov r1,#0x20
strb r1,[r0,#0x11]
ldr r0,=gActiveUnit
ldr r0,[r0]
bl MakeRefugeTargetList

@so we can pick on up it in a bit, let's set a bit in RAM
mov r0,#1
ldr r1,=RefugeFlagLoc
strb r0,[r1]

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

push {r4-r5,r14}
mov r4,r1
mov r5,r0
mov r0,r4
blh prGotoAidGetter,r3
push {r0}
mov r0,r5
blh prGotoConGetter,r3
mov r2,r0
pop {r0}

mov r1,#0
cmp r0,r2
blt ReturnFromCanRefugeFunc @rescue has this as blt
mov r1,#1
ReturnFromCanRefugeFunc:
mov r0,r1
pop {r4-r5}
pop {r1}
bx r1

.ltorg
.align






.global ActionRefuge
.type ActionRefuge, %function
ActionRefuge:

push {r4-r7,r14}
mov r6,r0
ldr r5,=gActionData
ldrb r0,[r5,#0xC]
blh GetUnit,r3
mov r4,r0
ldrb r0,[r5,#0xD]
blh GetUnit,r3
mov r5,r0
blh TryRemoveUnitFromBallista,r3
mov r0,#0x10
ldsb r0,[r5,r0]
mov r1,#0x11
ldsb r1,[r5,r1]
mov r2,#0x10
ldsb r2,[r4,r2]
mov r3,#0x11
ldsb r3,[r4,r3]
blh GetSomeFacingDirection,r7
mov r1,r0
mov r0,r4
mov r2,#0
mov r3,r6
blh Make6CKOIDO,r7
mov r0,r5
mov r1,r4
blh UnitRescue,r7
mov r0,r4
blh HideUnitSMS,r7




mov r0,#0
pop {r4-r7}
pop {r1}
bx r1

.ltorg
.align


.equ RefugeFlagLoc,0x2040000 @this is where the unit buffer goes, which should be empty (or at least be done with whatever *is* there)

.global RefugeSelection_OnSelect
.type RefugeSelection_OnSelect, %function
RefugeSelection_OnSelect:

ldr r2,=gActionData
ldrb r0,[r1,#2]

strb r0,[r2,#0xD]

ldrb r0,[r2,#0x11]
cmp r0,#0x20
bne ThisIsRescue
b StoreAction

ThisIsRescue:
mov r0,#9

StoreAction:
strb r0,[r2,#0x11]

mov r0,#0x17
pop {r1}
bx r1

.ltorg
.align



.global PostActionRescueCorrection
.type PostActionRescueCorrection, %function
PostActionRescueCorrection:

@we need to check to see if they have a rescuer but don't have proper status bits, then to set them if so (this will happen with refuge)

@RefugeFlagLoc is 1 if we were just refuged

push {r4,r14}
mov r4,r0
ldr r0,=RefugeFlagLoc
ldrb r1,[r0]
cmp r1,#1
bne AllIsNormal @if true, all is fine

@otherwise, we're in post-refuge mode
@so we gotta set some bits!

@first, let's clear the Refuge flag
mov r1,#0
strb r1,[r0]

@bits time! gotta hide that unit!

ldrb r0,[r4,#0xC]
mov r1,#0x23
orr r0,r1
strb r0,[r4,#0xC]

@ok! now we go back!


AllIsNormal:
pop {r4}
pop {r0}
bx r0



.equ Text_Clear,0x8003DC9
.equ String_GetFromIndex,0x800A241
.equ Text_InsertNumberOr2Dashes,0x80044A5
.equ Text_InsertString,0x8004481


@hook @ 34AA4 with r0 and do a "should we get aid or con" check (rescue is aid)

.global RescueDisplayAidCheck
.type RescueDisplayAidCheck, %function
RescueDisplayAidCheck:
push {r6}
mov r5,r1
blh Text_Clear,r6
ldr r6,=RefugeFlagLoc
ldrb r6,[r6]
cmp r6,#1
beq DisplayConInstead
ldr r0,=#0x4F8
b PostDisplayCondition
DisplayConInstead:
ldr r0,=#0x4F7
PostDisplayCondition:
blh String_GetFromIndex,r6
mov r3,r0
mov r0,r4
mov r1,#0
mov r2,#3
blh Text_InsertString,r6

ldr r6,=RefugeFlagLoc
ldrb r6,[r6]
cmp r6,#1
beq GetConInstead
blh prGotoAidGetter,r6
b PostGetterCondition
GetConInstead:
blh prGotoConGetter,r6
PostGetterCondition:
mov r3,r0
mov r0,r4
mov r1,#0x38
mov r2,#2
blh Text_InsertNumberOr2Dashes,r6
pop {r6}
pop {r4-r5}
pop {r0}
bx r0

.ltorg
.align


@8 bytes to hook at 34A60 for another one (rescue is con)

.global RescueDisplayConCheck
.type RescueDisplayConCheck, %function
RescueDisplayConCheck:
push {r6}
mov r4,r1
blh Text_Clear,r6

@check which word to display
ldr r0,=RefugeFlagLoc
ldrb r6,[r6]
cmp r6,#1
beq DisplayAidInstead
ldr r0,=#0x4F7
b AfterDisplayCondition
DisplayAidInstead:
ldr r0,=#0x4F8
AfterDisplayCondition:
blh String_GetFromIndex,r6
mov r3,r0
mov r0,r4
mov r1,#0
mov r2,#3
blh Text_InsertString,r6

mov r0,r4

@check which stat to get
ldr r6,=RefugeFlagLoc
ldrb r6,[r6]
cmp r6,#1
beq GetAidInstead
blh prGotoConGetter,r6
b AfterGetterCondition
GetAidInstead:
blh prGotoAidGetter,r6
AfterGetterCondition:
mov r3,r0
mov r0,r5
mov r1,#0x38
mov r2,#2
blh Text_InsertNumberOr2Dashes,r6
pop {r6}
pop {r4-r5}
pop {r0}
bx r0

.ltorg
.align
