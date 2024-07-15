// Load values to memory at address 0x10000000

MOVZ X0, #0x1000, LSL #16

MOVZ X2, #4
STUR X2, [X0, #0]       // Store values at memory
MOVZ X3, #5
STUR X3, [X0, #8]
MOVZ X4, #6
STUR X4, [X0, #16]
MOVZ X5, #7
STUR X5, [X0, #24]
MOVZ X6, #2
STUR X6, [X0, #32]
MOVZ X7, #77
STUR X7, [X0, #40]
MOVZ X8, #32
STUR X8, [X0, #48]
MOVZ X9, #78
STUR X9, [X0, #56]
MOVZ X10, #89
STUR X10, [X0, #64]
MOVZ X11, #1
STUR X11, [X0, #72]

// Start bubble sort in ascending order
MOVZ X13, #9             // Initialize outer loop counter

l1:                       // Outer loop
    MOV X1, X0           // Set X1 to base address
    MOV X14, X13         // Set inner loop counter

l2:                       // Inner loop
    LDUR X2, [X1]        // Load element into X2
    LDUR X3, [X1, #8]    // Load the next element into X3
    CMP X2, X3           // Compare elements
    B.LE SKIP            // Skip if in correct order

    STUR X3, [X1]        // Swap if out of order
    STUR X2, [X1, #8]

SKIP:
    ADDI X1, X1, #8      // Move to the next pair
    SUBI X14, X14, #1    // Decrement inner loop counter
    CBNZ X14, l2         // Repeat inner loop if not done

    SUBI X13, X13, #1    // Decrement outer loop counter
    CBNZ X13, l1         // Repeat outer loop if not done

// Copy sorted values to 0x20000000
MOVZ X1, #0x2000, LSL #16 // Load destination base address
MOVZ X0, #0x1000, LSL #16 // Reload source base address
MOVZ X13, #10             // Initialize copy loop counter

copy_loop_asc:
    LDUR X2, [X0]        // Load value from source memory
    STUR X2, [X1]        // Store value to destination memory
    ADDI X0, X0, #8      // Move to next source address
    ADDI X1, X1, #8      // Move to next destination address
    SUBI X13, X13, #1    // Decrement loop counter
    CBNZ X13, copy_loop_asc // Repeat copy loop if not done

// Start bubble sort in descending order
MOVZ X13, #9             // Initialize outer loop counter

l3:                       // Outer loop
    MOV X1, X0           // Set X1 to base address
    MOV X14, X13         // Set inner loop counter

l4:                       // Inner loop
    LDUR X2, [X1]        // Load element into X2
    LDUR X3, [X1, #8]    // Load the next element into X3
    CMP X2, X3           // Compare elements
    B.GE SKIP_DESC       // Skip if in correct order

    STUR X3, [X1]        // Swap if out of order
    STUR X2, [X1, #8]

SKIP_DESC:
    ADDI X1, X1, #8      // Move to the next pair
    SUBI X14, X14, #1    // Decrement inner loop counter
    CBNZ X14, l4         // Repeat inner loop if not done

    SUBI X13, X13, #1    // Decrement outer loop counter
    CBNZ X13, l3         // Repeat outer loop if not done

// Copy sorted values to 0x30000000
MOVZ X3, #0x3000, LSL #16 // Load destination base address
MOVZ X0, #0x1000, LSL #16 // Reload source base address
MOVZ X13, #10             // Initialize copy loop counter

copy_loop_desc:
    LDUR X2, [X0]        // Load value from source memory
    STUR X2, [X3]        // Store value to destination memory
    ADDI X0, X0, #8      // Move to next source address
    ADDI X3, X3, #8      // Move to next destination address
    SUBI X13, X13, #1    // Decrement loop counter
    CBNZ X13, copy_loop_desc // Repeat copy loop if not done

END:
    B END                // Infinite loop to end the program
