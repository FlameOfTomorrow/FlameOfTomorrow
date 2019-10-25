.thumb
.align

.equ GetLocationEventCommandAt,0x8084078
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm


@hooks at 831F4
@r0 = x coord
@r1 = y coord

blh GetLocationEventCommandAt,r3

cmp r0,#0x12
beq RetTrue
cmp r0,#0x13
beq RetTrue
mov r0,#0
b GoBack
RetTrue:
mov r0,#1
GoBack:
pop {r1}
bx r1

