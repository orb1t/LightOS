	.global fiq_handler_asm
	.global fiq_handler
	.global __identify_and_clear_source
	.global run_next_process

fiq_handler_asm:
	SUB     lr, lr, #4                ; Use SRS to save LR_irq and SPSP_irq
    MOV		r4,lr
    ;SRSFD   sp!, #0x13                ;   on to the SVC mode stack

    CPS     #0x13                     ; Switch to SVC mode
    ;PUSH    {r0-r3, r12}              ; Store AAPCS regs on to SVC stack

    ;MOV     r1, sp
    ;AND     r1, r1, #4                ; Ensure 8-byte stack alignment
    ;SUB     sp, sp, r1                ; adjust stack as necessary
    ;PUSH    {r1, lr}                  ; Store adjustment and LR_svc

	MOV		r0,#0
    BL      __identify_and_clear_source ; Clear IRQ source

	MOV		r0,r4
    BL      run_next_process             ; Branch to 2nd level handler

    ;POP     {r1, lr}                  ; Restore LR_svc
    ;ADD     sp, sp, r1                ; Un-adjust stack

    ;POP     {r0-r3, r12}              ; Restore AAPCS registers

    ;RFEFD   sp!                       ; Return from the SVC mode stack

