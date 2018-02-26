entry:
  b start

start:
  mov r0, #18 
  msr CPSR_fc, r0 ;Disable IRQ
  ldr sp, [pc, #44] 
  mov r0, #31
