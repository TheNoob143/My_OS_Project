#include "../include/isr.h"
#include <stdint.h>

extern void terminal_writestring(const char*);

void isr_handler(void)
{
	terminal_writestring("Interrupt received!\n");
}
