#ifndef IDT_H
#define IDT_H

#include <stdint.h>

struct idt_entry {
 	uint16_t base_low;
	uint16_t selector;
 	uint8_t  always0;
	uint8_t  flags;	
	uint16_t base_high;
}__atrribute__((packed));

struct idt_ptr {
	uint16_t limit;
	uint32_t base;
}__attribute__((packed))

void idt_init(void);

#endif
[joseph@archlaptop include]$ cat isr.h
#ifndef ISR_H
#define ISR_H

#include <stdint.h>

extern void isr0(void);   // Divide by zero
extern void isr1(void);   // Debug
extern void isr2(void);   // Non-maskable interrupt
extern void isr3(void);   // Breakpoint
extern void isr4(void);   // Overflow
extern void isr5(void);   // Bound range exceeded
extern void isr6(void);   // Invalid opcode
extern void isr7(void);   // Device not available
extern void isr8(void);   // Double fault
extern void isr9(void);   // Coprocessor segment overrun
extern void isr10(void);  // Invalid TSS
extern void isr11(void);  // Segment not present
extern void isr12(void);  // Stack segment fault
extern void isr13(void);  // General protection fault
extern void isr14(void);  // Page fault
extern void isr15(void);  // Reserved
extern void isr16(void);  // x87 floating point exception
extern void isr17(void);  // Alignment check
extern void isr18(void);  // Machine check
extern void isr19(void);  // SIMD floating point exception
extern void isr20(void);  // Virtualization exception
extern void isr21(void);  // Reserved
extern void isr22(void);  // Reserved
extern void isr23(void);  // Reserved
extern void isr24(void);  // Reserved
extern void isr25(void);  // Reserved
extern void isr26(void);  // Reserved
extern void isr27(void);  // Reserved
extern void isr28(void);  // Reserved
extern void isr29(void);  // Reserved
extern void isr30(void);  // Security exception
extern void isr31(void);  // Reserved

#endif
