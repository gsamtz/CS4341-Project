# CS4341-Project
If you're running iverilog then you can compile and run the program with the following commands.

For Windows
-Go to the following link, and get iverilog-v11-20201123-x64_setup.exe [18.1MB] https://bleyer.org/icarus/
-Run the executable file that you just downloaded.
-Make sure to select the check box for adding PATH variable.

Do the following on terminal.

### To compile the program:
iverilog -o part1_test part1_test.v


### To run the executable:
vvp part1_test
