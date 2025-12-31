; ISR stubs - these are called when interrupts fire

; Macro to create ISR stub without error code
%macro ISR_NOERRCODE 1
global isr%1
isr%1:
    cli                  ; Disable interrupts
    push byte 0          ; Push dummy error code
    push byte %1         ; Push interrupt number
    jmp isr_common_stub  ; Jump to common handler
%endmacro

; Macro to create ISR stub with error code (CPU pushes it)
%macro ISR_ERRCODE 1
global isr%1
isr%1:
    cli                  ; Disable interrupts
    push byte %1         ; Push interrupt number
    jmp isr_common_stub  ; Jump to common handler
%endmacro

; Create ISR stubs for exceptions 0-31
ISR_NOERRCODE 0   ; Divide by zero
ISR_NOERRCODE 1   ; Debug
ISR_NOERRCODE 2   ; Non-maskable interrupt
ISR_NOERRCODE 3   ; Breakpoint
ISR_NOERRCODE 4   ; Overflow
ISR_NOERRCODE 5   ; Bound range exceeded
ISR_NOERRCODE 6   ; Invalid opcode
ISR_NOERRCODE 7   ; Device not available
ISR_ERRCODE   8   ; Double fault (has error code)
ISR_NOERRCODE 9   ; Coprocessor segment overrun
ISR_ERRCODE   10  ; Invalid TSS (has error code)
ISR_ERRCODE   11  ; Segment not present (has error code)
ISR_ERRCODE   12  ; Stack segment fault (has error code)
ISR_ERRCODE   13  ; General protection fault (has error code)
ISR_ERRCODE   14  ; Page fault (has error code)
ISR_NOERRCODE 15  ; Reserved
ISR_NOERRCODE 16  ; x87 floating point exception
ISR_ERRCODE   17  ; Alignment check (has error code)
ISR_NOERRCODE 18  ; Machine check
ISR_NOERRCODE 19  ; SIMD floating point exception
ISR_NOERRCODE 20  ; Virtualization exception
ISR_NOERRCODE 21  ; Reserved
ISR_NOERRCODE 22  ; Reserved
ISR_NOERRCODE 23  ; Reserved
ISR_NOERRCODE 24  ; Reserved
ISR_NOERRCODE 25  ; Reserved
ISR_NOERRCODE 26  ; Reserved
ISR_NOERRCODE 27  ; Reserved
ISR_NOERRCODE 28  ; Reserved
ISR_NOERRCODE 29  ; Reserved
ISR_ERRCODE   30  ; Security exception (has error code)
ISR_NOERRCODE 31  ; Reserved

; Common ISR stub - saves state and calls C handler
extern isr_handler    ; C function we'll create

isr_common_stub:
    pusha              ; Push all general purpose registers
    
    mov ax, ds
    push eax           ; Save data segment
    
    mov ax, 0x08       ; Load kernel data segment
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    call isr_handler   ; Call C handler
    
    pop eax            ; Restore data segment
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    popa               ; Pop all general purpose registers
    add esp, 8         ; Clean up error code and ISR number
    sti                ; Re-enable interrupts
    iret               ; Return from interrupt
