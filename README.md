Bubble Sort Implementation in ARM Assembly (LEGV8 Simulator)
This project implements the Bubble Sort algorithm using ARM Assembly language, specifically designed for the LEGV8 simulator. The program sorts an array of integers in both ascending and descending order, storing the results in separate memory locations.

Overview
The algorithm begins by initializing an array with predefined values in memory. It then performs the Bubble Sort operation through nested loops, comparing adjacent elements and swapping them as necessary. The sorted results are copied to designated memory addresses for both ascending and descending orders.

Memory Addresses
Input Array Base Address: 0x10000000
Ascending Sorted Array Address: 0x20000000
Descending Sorted Array Address: 0x30000000
Algorithm Steps
Initialization: Load the initial values into memory.
Sorting (Ascending): Implement the Bubble Sort algorithm to arrange the elements in ascending order.
Copying (Ascending): Store the sorted values in the specified memory address.
Sorting (Descending): Apply the Bubble Sort algorithm again to sort the elements in descending order.
Copying (Descending): Save the sorted values in the corresponding memory location.
Notes
Ensure proper alignment of memory addresses for 64-bit operations when running the code on the LEGV8 simulator.
