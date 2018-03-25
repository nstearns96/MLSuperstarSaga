ENTRY:
  B START

START:
	MOV	R0, #0x12
	MSR	CPSR_FC, R0 	; Enter IRQ mode
	LDR	SP, [PC, #0x2C] ; Load 0x03007FA0 into SP_irq
	MOV	R0, #0x1F
	MSR	CPSR_FC, R0 	; Enter privileged user mode
	LDR	SP, [PC, #0x1C] ; Load 0x03007D00 into SP
	LDR	R1, [PC, #0x24] ; point r1 to IRQ handler (0x03007FFC)
	ADD	R0, PC, #0x28 	; Load 0x0800010C into r0
	STR	R0, [R1]	; Write 0x080010c to r1 (IRQ handler)
	LDR	R1, [PC, #0x1C]	; Load 0x08017A01 to r1
	MOV	LR, PC 	
	BX	R1		; Jump to r1 in thumb mode
	B	#0x192
	//	//	//
	DCD 	#0x03007A00, #0x03007D00, #0x03007FA0, #0xE2459EA3, #0x03007FFC, #0x08017A01 
	//	//	//
