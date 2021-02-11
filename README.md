# MIPS Linked List
This project implements linked list in MIPS assembly language. Some functions and their descriptions can be found below.

I've used Mars MIPS simulator in order to run the project. It can be downloaded from [here](https://courses.missouristate.edu/KenVollmar/MARS/download.htm "Mars MIPS Simulator Download").

## General Implemented Functions in Linked List
**Insert_n:** Inserts an element to the linked list as the nth element (n > 1): the pointer to the linked list is passed in $a0, and the integer value of the new element to be inserted is given in $a1. The register $a2 contains the value of n. The first element is in position 1, the second element in position 2, etc. If there is no nth element it is inserted to the end of the linked list. This utility will request space in memory from the system with syscall 9 and use it to create a new element, then insert the new element correctly into the linked list.  The pointer to the head of the linked list should be the same as it was before the call. If the original linked list is empty no insertion is done. Return value in $v0= 0 if successful if the insertion is done, -1 otherwise.

**AddNodes:**  Adds the contents (value part) of the node, whose position is given as a parameter, with the value of the next consecutive node and delete the consecutive one. For example, for the linked list <1, 5, 7, 3, 17> if the node position is given as 2, after using the utility the linked list becomes <1, 12, 3, 17>. Return value in $v0 =0 if operation is successful, -1 otherwise. Why -1: the indicated node number may not exist, etc.

**SwapNodes:** Swaps two consecutive nodes. Note that this is not swapping values, it is swapping nodes. The node number of the initial node is given as the input of the utility. Return value in $v0 =0 if successful if the insertion is done, -1 otherwise.

**Count**CommonValues: Finds the number of common values in two sorted linked lists. For example, for the lists <1, 3, 4, 8, 9> and <0, 3, 5, 9, 17, 19> it returns 2, since the common values are 3 and 9. 

**Delete_n:** Deletes an element from the linked list at position n: the pointer to the linked list is passed in $a0, and the position of the element to be deleted is given in $a1. If there is no nth character it must delete the LAST element of the linked list. Return value in $v0 =0 if successful, -1 if not (this happens if the linked list is empty).  In either case, the return value in $v1 contains the pointer to the head of the linked list.

**FindSumInRange:** Finds the summation of the linked list elements within a value range by writing a recursive program. For example, if the value range is [5, 10] for the following linked list <1, 7, 5, 2, 10, 2> this utility returns 22.
