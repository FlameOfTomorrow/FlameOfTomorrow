.thumb
.align

.equ BG2Buffer, 0x02023CA8
.equ FillBgMap, 0x08001221
.equ EnableBgSyncByIndex, 0x08001FBD
.equ UnitDecreaseItemUse, 0x08018995

.macro blh to, reg=r3
    ldr \reg, =\to
    mov lr, \reg
    .short 0xF800
.endm

@FillBgMap(BG2Buffer, 0);
@EnableBgSyncByIndex(0);
@EnableBgSyncByIndex(1);
@EnableBgSyncByIndex(2);

.global PrepScrollUsageEffect
.type PrepScrollUsageEffect, %function
PrepScrollUsageEffect:

@push {r4-r7,r14}

@r4 = unit pointer
@r6 = item used
@r7 = item slot

mov r0,r4 @r0 = char
ldr r1,=AdeptIDLink
ldrb r1,[r1] @r1 = skill ID

@now learn the skill specified in item uses

blh SkillAdder+1

mov r0,r4
mov r1,r7

blh UnitDecreaseItemUse

ldr r0,=SkillScrollMessageReturnLink
ldrh r0,[r0]

pop {r4-r7}
pop {r1}
bx r1

.ltorg
.align

