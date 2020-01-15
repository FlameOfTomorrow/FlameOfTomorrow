//to be included outside BL Range
#include "gbafe.h"
#pragma long_calls
extern void (*ScrollUse[0xFF])(Unit* unit, Proc* parent, u8 itemID, u8 slot);
void PrepItemEffectWrapper(Proc* parent);
void CallPrepUseEffect(Unit* unit, Proc* parent, u8 itemID, u8 slot);
static const ProcCode PrepItemUsedProc[];

extern void NewFadeIn();
extern void FadeInExists();
extern void NewFadeOut();
extern void FadeOutExists();
#define BG2Buffer 0x02023CA8


const ProcCode NewPrepScreenItemsProc[] = {
  PROC_SET_NAME("PrepItems"),
  PROC_SLEEP(0),
  PROC_LABEL(0),
  PROC_CALL_ROUTINE(0x809c4d8+1),
  PROC_CALL_ROUTINE(0x809c4e4+1),
  PROC_CALL_ROUTINE_ARG(NewFadeIn, 0x10),
  PROC_WHILE_ROUTINE(FadeInExists),
  PROC_LABEL(1),
  PROC_LOOP_ROUTINE(0x809c820+1),
  PROC_LABEL(2),
  PROC_CALL_ROUTINE(0x809c9f4+1),
  PROC_LOOP_ROUTINE(0x809ca14+1),
  PROC_GOTO(1),
  PROC_LABEL(3),
  PROC_CALL_ROUTINE(0x809cb38+1), //actually using an item - we want to replace this later
  //if statbooster
  PROC_NEW_CHILD_BLOCKING(0x8a191a4),
  PROC_GOTO(1),
  //if juna fruit
  PROC_LABEL(4),
  PROC_NEW_CHILD_BLOCKING(0x8a191c4),
  PROC_GOTO(1),
  //if promo item
  PROC_LABEL(5),
  PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x10),
  PROC_WHILE_ROUTINE(FadeOutExists),
  PROC_CALL_ROUTINE(0x8013d68+1),
  PROC_LOOP_ROUTINE(0x8014068+1),
  PROC_CALL_ROUTINE(0x80cc990+1),
  PROC_SLEEP(8),
  PROC_CALL_ROUTINE(0x809cc9c+1),
  PROC_SLEEP(0x1e),
  PROC_CALL_ROUTINE(0x809cc60+1),
  PROC_CALL_ROUTINE(0x809c4e4+1),
  PROC_CALL_ROUTINE_ARG(NewFadeIn, 0x10),
  PROC_WHILE_ROUTINE(FadeInExists),
  PROC_WHILE_ROUTINE(0x8002a6c+1),
  PROC_GOTO(1),

  //if new item
  PROC_LABEL(8),
      PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x10),
      PROC_WHILE_ROUTINE(FadeOutExists),

      PROC_CALL_ROUTINE(0x809c940+1), //does this kill the face?
      // PROC_CALL_ROUTINE(PrepItemEffectWrapper),
      // PROC_SLEEP(0x10),
  PROC_NEW_CHILD_BLOCKING(PrepItemUsedProc),
      PROC_CALL_ROUTINE(0x809c4d8+1),
      PROC_CALL_ROUTINE(0x809c4e4+1),
      PROC_CALL_ROUTINE_ARG(NewFadeIn, 0x10),
      PROC_WHILE_ROUTINE(FadeInExists),
  PROC_GOTO(1),

  PROC_LABEL(6),
  PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x10),
  PROC_WHILE_ROUTINE(FadeOutExists),
  PROC_LABEL(7),
  PROC_CALL_ROUTINE(0x809c940+1),
  PROC_END
};

static const ProcCode PrepItemUsedProc[] = {
  PROC_SET_DESTRUCTOR(0x809d1c0+1), //the juna fruit one lol
  PROC_CALL_ROUTINE_ARG(NewFadeIn, 8),
  PROC_WHILE_ROUTINE(FadeInExists),
  PROC_SLEEP(8),
  PROC_CALL_ROUTINE(PrepItemEffectWrapper),
  PROC_SLEEP(0x10),
  PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x10),
  PROC_WHILE_ROUTINE(FadeOutExists),
  // PROC_CALL_ROUTINE(DrawPopup),
  PROC_END
};

void PrepItemEffectWrapper(Proc* parent){

  //set up bg graphics
  ClearBG0BG1();

  FillBgMap(BG2Buffer, 0);
  EnableBgSyncByIndex(0);
  EnableBgSyncByIndex(1);
  EnableBgSyncByIndex(2);
  FillBgMap(0x6010000, 0); //clear oam tilemap
  CpuSet(0x859ED70, (0x020228A8 + 16 * 0x20), 0x20); //ui palette

  Proc* grandparent = parent->parent;
  Unit** tmp = (Unit**) (grandparent + 1);
  Unit* unit = *tmp; //byte 0x2c of the grandparent
  u8 slot = *(u8*) ((int) tmp + 4);
  u8 itemID = unit->items[slot];
  CallPrepUseEffect(unit, parent, itemID, slot);
    //decrease uses
  ValidateUnitItem(unit, slot);
};

void CallPrepUseEffect(Unit* unit, Proc* parent, u8 itemID, u8 slot){

  //heck it, writing in asm
  asm("push {r4-r7,r14}\n\
  mov r4,r0\n\
  mov r5,r1\n\
  mov r6,r2\n\
  mov r7,r3\n\
  ldr r0,=PrepItemEffectTable\n\
  mov r1,r6\n\
  lsl r1,r1,#4\n\
  ldr r0,[r0,r1]\n\
  mov r14,r0\n\
  mov r0,r4\n\
  mov r1,r5\n\
  mov r2,r6\n\
  mov r3,r7\n\
  .short 0xF800\n\
  pop {r4-r7}\n\
  pop {r0}\n\
  bx r0");

};

