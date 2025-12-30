# OS Development Checklist

## Phase 0: Environment Setup
- [x] Install required packages (base-devel, nasm, qemu-full, grub, xorriso, mtools)
- [x] Test QEMU works by booting any ISO
- [x] Create your project directory structure
- [x] Set up a git repository (highly recommended for tracking progress)

## Phase 1: First Boot - "Hello World"
- [x] Create boot.asm with multiboot header
- [ ] Write assembly entry point that sets up stack
- [x] Create kernel.c with kernel_main function
- [ ] Implement direct VGA text mode writing (address 0xB8000)
- [x] Write linker script (linker.ld) for 1MB memory layout
- [x] Create GRUB config file (grub.cfg)
- [ ] Write Makefile to automate build process
- [x] Build and create bootable ISO
- [x] Boot in QEMU and see text appear

## Phase 2: Screen Output Functions
- [ ] Write function to print single character
- [ ] Write function to print strings
- [ ] Implement newline/carriage return
- [ ] Add scrolling when reaching bottom of screen
- [ ] Implement clearing the screen
- [ ] Add color support for text

## Phase 3: Interrupt Handling
- [ ] Learn about IDT (Interrupt Descriptor Table)
- [ ] Write IDT setup code
- [ ] Create interrupt handler stubs in assembly
- [ ] Set up basic exception handlers (divide by zero, page fault, etc.)
- [ ] Test that exceptions work

## Phase 4: Keyboard Input
- [ ] Set up keyboard interrupt (IRQ1)
- [ ] Write keyboard interrupt handler
- [ ] Implement scancode to ASCII translation
- [ ] Create keyboard buffer
- [ ] Make a simple echo program (type and see characters)
- [ ] Handle special keys (backspace, enter, shift)

## Phase 5: Memory Management - Physical
- [ ] Understand physical memory layout
- [ ] Parse multiboot memory map
- [ ] Implement physical page allocator
- [ ] Create bitmap or stack for free pages
- [ ] Test allocating and freeing pages

## Phase 6: Memory Management - Virtual
- [ ] Understand paging and page tables
- [ ] Set up page directory and page tables
- [ ] Enable paging
- [ ] Implement kernel heap allocator (malloc/free)
- [ ] Test memory allocation

## Phase 7: Basic System Calls
- [ ] Design your system call interface
- [ ] Implement system call interrupt (typically int 0x80)
- [ ] Create handler to dispatch system calls
- [ ] Implement basic syscalls: write, read, exit
- [ ] Test syscalls from kernel mode

## Phase 8: User Mode
- [ ] Understand ring 0 vs ring 3
- [ ] Set up TSS (Task State Segment)
- [ ] Create user mode segments in GDT
- [ ] Write code to switch to user mode
- [ ] Test that user mode works and syscalls can return to kernel

## Phase 9: Process/Program Loading
- [ ] Design simple executable format (or use ELF)
- [ ] Implement program loader
- [ ] Create process control block structure
- [ ] Load program into memory
- [ ] Jump to program entry point
- [ ] Run first user program successfully

## Phase 10: File System - Storage Foundation
- [ ] Choose file system approach (ramdisk to start, then real FS)
- [ ] Implement ramdisk driver if starting simple
- [ ] OR implement ATA/IDE disk driver for hard drive
- [ ] Implement basic read/write to disk
- [ ] Test reading and writing sectors

## Phase 11: File System - Implementation
- [ ] Design file system structure (or implement FAT/ext2/custom)
- [ ] Implement file system driver
- [ ] Create functions: open, close, read, write
- [ ] Implement directory operations
- [ ] Test creating, writing, reading files

## Phase 12: Basic Shell
- [ ] Design shell command structure
- [ ] Implement command parser
- [ ] Create command execution loop
- [ ] Implement built-in commands (echo, clear, help)
- [ ] Add ability to launch programs
- [ ] Handle command arguments

## Phase 13: Core Utilities
- [ ] Write ls (list files)
- [ ] Write cat (display file contents)
- [ ] Write cp (copy files)
- [ ] Write rm (delete files)
- [ ] Write mkdir (create directory)
- [ ] Write other utilities as needed

## Phase 14: Text Editor
- [ ] Design editor interface (modal like vi or modeless like nano)
- [ ] Implement cursor movement
- [ ] Handle text buffer in memory
- [ ] Implement insert/delete characters
- [ ] Add file save functionality
- [ ] Add file load functionality
- [ ] Handle scrolling for large files

## Phase 15: Polish and Testing
- [ ] Test everything thoroughly in QEMU
- [ ] Fix all known bugs
- [ ] Add error handling everywhere
- [ ] Write documentation for your OS
- [ ] Create installation instructions

## Phase 16: Real Hardware
- [ ] Create bootable USB with your OS
- [ ] Test boot on real PC
- [ ] Debug hardware-specific issues
- [ ] Install to hard drive on PC
- [ ] Celebrate!

## Optional Advanced Features
- [ ] Multi-tasking/scheduler
- [ ] Multiple processes running simultaneously
- [ ] Networking stack
- [ ] Graphics mode (VBE/framebuffer)
- [ ] GUI/window system
- [ ] Port GCC to your OS (compile programs on your OS)
- [ ] USB support
- [ ] Audio driver
- [ ] More file systems

## Ongoing Tasks Throughout
- [ ] Document your code
- [ ] Comment complex sections
- [ ] Keep build process organized
- [ ] Test each feature before moving on
- [ ] Don't skip steps - each builds on the last

---

**Note:** Start with Phase 0 and work sequentially. Each phase builds on the previous ones. Expect Phase 1 to take the longest as you learn the toolchain and boot process.
