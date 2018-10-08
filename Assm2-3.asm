###############################################################################
# Title: Assign02P3                   Author: Tyler Cummings
# Class: CS 2318-260, Spring 2018     Submitted: 03/26/2018
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################
##include <iostream>
#using namespace std;
#int a1[12], 	
#a2[12],	
#a3[12],	
#a4[12];	
#char reply;	
#int used1,
#used2,
#used3,
#used4,
#minInt,
#intNum,
#i,
#oneInt;
#int* hopPtr;
#int* hopPtr1;
#int* hopPtr2;
#int* hopPtr3;
#int* hopPtr4;
#int* endPtr;
#int* endPtr1;
#int* endPtr2;
#int* probePtr;

			.data
a1:			.space 48
a2:			.space 48
a3:			.space 48
a4:			.space 48
begA1Str:  		.asciiz "beginning a1: "
cpaA1Str:  		.asciiz "chkPointA a1: "
proA1Str:  		.asciiz "processed a1: "
comA2Str:  		.asciiz "          a2: "
comA3Str:  		.asciiz "          a3: "
comA4Str:  		.asciiz "          a4: "
einStr:  		.asciiz "Enter integer #"
moStr:     		.asciiz "Max of "
ieStr:     		.asciiz " ints entered..."
eaiStr:    		.asciiz "End adding ints? (y or Y = yes, others = no) "
dacStr:    		.asciiz "Do another case? (n or N = no, others = yes) "
dlStr:     		.asciiz "================================"
byeStr:    		.asciiz "bye..."

			.text
			.globl main
main:
################################################ 
# Register usage: 
################# 
# $a0: short-lived holder 3
# $a1: used1 
# $a2: used2 
# $a3: used3 
# $v1: used4 
# $t0: short-lived holder 1
# $t1: hopPtr1 
# $t2: hopPtr2 
# $t3: hopPtr3 or hopPtr
# $t4: hopPtr4 or endPtr
# $t5: intNum or probePtr 
# $t6: minInt or reply
# $t7: oneInt 
# $t8: endPtr2 
# $t9: endPtr1
# $v0: short-lived holder 2
################################################
begdw1:     #//DW1
#        		intNum = 0;
			li $t5, 0
#        		used1 = 0;
			li $a1, 0
#        		used2 = 0;
			li $a2, 0
#        		hopPtr1 = a1;
			la $t1, a1	#array1
#        		hopPtr2 = a2;
			la $t2, a2	#array2 
#        		cout << eaiStr;
			li $v0, 4
			la $a0, eaiStr		
			syscall
#        		cin >> reply;
			li $v0, 12
			syscall
			move $t6, $v0
#               	cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#        		goto w1test;		
			j w1test
begw1:
#            		++intNum;
			addi $t5, $t5, 1
#            		cout << einStr;
			li $v0, 4
			la $a0, einStr
			syscall
#            		cout << intNum;
			li $v0, 1
			move $a0, $t5
			syscall
#            		cout << ':' << ' ';
			li $v0, 11
			li $a0, ':'
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
#            		cin >> oneInt;
			li $v0, 5
			syscall
			move $t7, $v0            
#            		if ( (intNum & 1) == 0 ) goto else1;	 //I1x
begI1:			andi $t0, $t5, 1
			beqz $t0, else1
#                	*hopPtr1 = oneInt;
			sw $t7, 0($t1)
#                	++hopPtr1;
			addi $t1, $t1, 4
#                	++used1;
			addi $a1, $a1, 1
#                	goto endI1;
			j endI1
else1:
#                	*hopPtr2 = oneInt;
			sw $t7, 0($t2)
#                	++hopPtr2;
			addi $t2, $t2, 4
#                	++used2;
			addi $a2, $a2, 1
endI1:            
#            		if (intNum != 12) goto else2;	 //I2x
begI2:			li $a0, 12
			bne $t5, $a0, else2
#               	cout << moStr;
			li $v0, 4
			la $a0, moStr
			syscall
#                	cout << 12;
			li $v0, 1
			li $a0, 12
			syscall
#                	cout << ieStr;
			li $v0, 4
			la $a0, ieStr
			syscall
#               	cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#                	reply = 'y';		
			li $t6, 'y'
#                	goto endI2;
			j endI2
else2:
#                	cout << eaiStr;
			li $v0, 4
			la $a0, eaiStr
			syscall
#                	cin >> reply;
			li $v0, 12
			syscall
			move $t6, $v0
#			cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
endI2:     
endW1:
w1test:
#			if (reply != 'y' && reply != 'Y') goto begw1;	 //W1x
			li $t0, 'y'		
			beq $t6, $t0, xitw1
			li $t0, 'Y'
			bne $t6, $t0, begw1
xitw1:
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall        
#        		cout << begA1Str;
			li $v0, 4
			la $a0, begA1Str
			syscall
#        		hopPtr = a1;
			la $t3, a1
#        		endPtr = a1 + used1;
			sll $t4, $a1, 2
			add $t4, $t4, $t3       
#        		goto w2test;
			j w2test
begw2:
#            		cout << *hopPtr << ' ' << ' '; 
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#            		++hopPtr;
			addi $t3, $t3, 4
endW2:
w2test: 
    			#if (hopPtr < endPtr) goto begw2;	 //W2x
    			blt $t3, $t4, begw2        
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall   
#        		cout << comA2Str;
			li $v0, 4
			la $a0, comA2Str
			syscall
#        		hopPtr = a2;
			la $t3, a2
#        		endPtr = a2 + used2;		
			sll $t4, $a2, 2
			add $t4, $t4, $t3
#        		goto w3test
			j w3test        
begw3:
#       		cout << *hopPtr << ' ' << ' '; 
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#          		++hopPtr;
			addi $t3, $t3, 4
endW3:
w3test: 
#			if (hopPtr < endPtr) goto begw3;       //W3x
    			blt $t3, $t4, begw3        
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall        
#        		if (!(used1 > 0) && !(used2 > 0)) goto else3;        //I3x
			bgtz $a1, begI3
			blez $a2, else3
begI3:
#            		hopPtr1 = a1;
			la $t1, a1
#            		hopPtr2 = a2;
			la $t2, a2
#            		hopPtr3 = a3;
			la $t3, a3
#            		hopPtr4 = a4;
			la $t4, a4
#            		endPtr1 = a1 + used1;
			sll $t9, $a1, 2
			add $t9, $t9, $t1
#            		endPtr2 = a2 + used2;
			sll $t8, $a2, 2
			add $t8, $t8, $t2
#            		used3 = 0;
			li $a3, 0
#            		used4 = 0;
			li $v1, 0
#            		if (used1 <= 0) goto else4;                 //I4x
begI4:			blez $a1, else4
#               	minInt = *hopPtr1;
			lw $t6, 0($t1)
#                	goto endi4;
			j endi4        
else4:
#                	minInt = *hopPtr2;
			lw $t6, 0($t2)
endi4:
#            		goto w4test;
			j w4test
begw4:
#                	goto w5test;
			j w5test            
begw5:
#                    	oneInt = *hopPtr1;
			lw $t7, 0($t1)
#                    	if (oneInt >= minInt) goto endI5;	 //I5x
begI5:			bge $t7, $t6, endI5
#                       minInt = oneInt;
			move $t6, $t7
endI5:         
#                    	if ( (oneInt & 1) == 0 ) goto endI6;	 //I6x
			andi $t0, $t7, 1
			beqz $t0, brkI6
#                    	*hopPtr3 = oneInt;
			sw $t7, 0($t3)		#this might be wrong...
#                    	++used3;
			addi $a3, $a3, 1
#                    	++hopPtr1;
			addi $t1, $t1, 4
#                    	++hopPtr3;
			addi $t3, $t3, 4
endW5:
w5test: 
#			if (hopPtr1 < endPtr1) goto begw5; //W5x
            		blt $t1, $t9, begw5
brkI6:
#                	goto w6test;
			j w6test
begw6:
#                    	oneInt = *hopPtr2;
			lw $t7, 0($t2)
#                    	if (oneInt >= minInt) goto endI7;	 //I7x
			bge $t7, $t6, endI7
#                       minInt = oneInt;
			move $t6, $t7
endI7:
#                    	if ( (oneInt & 1) != 0 ) goto endI8;	 //I8x
			andi $t0, $t7, 1
			bnez $t0, brkI8
#                    	*hopPtr4 = oneInt;
			sw $t7, 0($t4)		
#                    	++used4;
			addi $v1, $v1, 1
#                    	++hopPtr2;
			addi $t2, $t2, 4
#                    	++hopPtr4;
			addi $t4, $t4, 4
endW6:
w6test: 
                	#if (hopPtr2 < endPtr2) goto begw6;	 //W6x
                	blt $t2, $t8, begw6
brkI8:
#                	if (!(hopPtr1 < endPtr1) || !(hopPtr2 < endPtr2)) goto endI9;	 //I9x
begI9:			bge $t1, $t9, endI9
			bge $t2, $t8, endI9
#                    	*hopPtr3 = *hopPtr2;
			lw $t0, 0($t2)
			sw $t0, 0($t3)
#                    	*hopPtr4 = *hopPtr1;
			lw $t0, 0($t1)
			sw $t0, 0($t4)
#                    	++used3;
			addi $a3, $a3, 1
#                    	++used4;
			addi $v1, $v1, 1
#                    	++hopPtr1;
			addi $t1, $t1, 4
#                    	++hopPtr2;
			addi $t2, $t2, 4
#                    	++hopPtr3;
			addi $t3, $t3, 4
#                    	++hopPtr4;
			addi $t4, $t4, 4
endI9:
endW4:
w4test: 
#			if (hopPtr1 < endPtr1 && hopPtr2 < endPtr2) goto begw4;	 //W4x
        		bge $t1, $t9, xitW4
        		blt $t2, $t8, begw4
xitW4:        		
#            		goto w7test;
			j w7test
begw7:
#                	oneInt = *hopPtr1;
			lw $t7, 0($t1)
#                	if (oneInt >= minInt) goto endI10;	 //I10x
			bge $t7, $t6, endI10
#                    	minInt = oneInt;
			move $t6, $t7
endI10:
#                	if ( (oneInt & 1) == 0 ) goto elseI11;	 //I11x
begI11:			andi $t0, $t7, 1
			beqz $t0, elseI11
#                    	*hopPtr3 = oneInt;
			sw $t7, 0($t3)
#                    	++used3;
			addi $a3, $a3, 1
#                    	++hopPtr3;
			addi $t3, $t3, 4
#                    	goto endI11;
			j endI11
elseI11:
#                    	*hopPtr4 = oneInt;
			sw $t7, 0($t4)
#                    	++used4;
			addi $v1, $v1, 1
#                    	++hopPtr4;
			addi $t4, $t4, 4
endI11:
#                	++hopPtr1;
			addi $t1, $t1, 4
endW7:
w7test: 
#			if (hopPtr1 < endPtr1) goto begw7;	 //W7x
        		blt $t1, $t9, begw7
#            		goto w8test;
			j w8test
begw8:
#                	oneInt = *hopPtr2;
			lw $t7, 0($t2)
#                	if (oneInt >= minInt) goto endI12;	 //I12x
begI12:			bge $t7, $t6, endI12
#                    	minInt = oneInt;
			move $t6, $t7
endI12:
#                	if ( (oneInt & 1) == 0 ) goto elseI13;	 //I13x
begI13:			andi $t0, $t7, 1
			beqz $t0, elseI13
#                    	*hopPtr3 = oneInt;
			sw $t7, 0($t3)
#                    	++used3;
			addi $a3, $a3, 1
#                    	++hopPtr3;
			addi $t3, $t3, 4
#                    	goto endI13;
			j endI13
elseI13:
#                    	*hopPtr4 = oneInt;
			sw $t7, 0($t4)
#                    	++used4;
			addi $v1, $v1, 1
#                    	++hopPtr4;
			addi $t4, $t4, 4
endI13:
#                	++hopPtr2;
			addi $t2, $t2, 4
endW8:
w8test: 
#			if (hopPtr2 < endPtr2) goto begw8;	 //W8x
        		blt $t2, $t8, begw8
#        		goto endi3;
			j endi3
else3:
#            		used3 = 0;
			li $a3, 0
#            		used4 = 0;
			li $v1, 0
endi3:
#        		cout << comA3Str;
			li $v0, 4
			la $a0, comA3Str
			syscall
#        		hopPtr = a3;
			la $t3, a3
#        		endPtr = a3 + used3;
			sll $t4, $a3, 2
			add $t4, $t4, $t3
#        		goto w9test;
			j w9test
begw9:
#            		cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#            		++hopPtr;
			addi $t3, $t3, 4
endW9:
w9test: 
#			if (hopPtr < endPtr) goto begw9;	 //W9x
    			blt $t3, $t4, begw9
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall        
#        		cout << comA4Str;
			li $v0, 4
			la $a0, comA4Str
			syscall
#      	  		hopPtr = a4;
			la $t3, a4
#        		endPtr = a4 + used4;
			sll $t4, $v1, 2
			add $t4, $t4, $t3
#        		goto w10test;
			j w10test
begw10:
#            		cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#            		++hopPtr;
			addi $t3, $t3, 4
endW10:
w10test: 
#			if (hopPtr < endPtr) goto begw10;	 //W10x
    			blt $t3, $t4, begw10
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#        		if (!(used1 > 0) && !(used2 > 0)) goto endi14;	 //I14x
			bgtz $a1, begI14
			blez $a2, endi14
begI14:		
#            		used1 = 0;
			li $a1, 0
#            		used2 = 0;
			li $a2, 0
#            		hopPtr = a3;
			la $t3, a3
#            		endPtr = a3 + used3;
			sll $t4, $a3, 2
			add $t4, $t4, $t3
#            		goto w11test;
			j w11test
begw11:
#                	oneInt = *hopPtr;
			lw $t7, 0($t3)
#                
#                	probePtr = a1 + used1;
			la $t5, a1
			sll $t0, $a1, 2
			add $t5, $t5, $t0
#                	goto f1test;
			j f1test
begf1:                      #//F1x
#                    	if ( *(probePtr - 1) <= oneInt ) goto endi15;	 //I15x
			lw $t0, -4($t5)
			ble $t0, $t7, brkI15
#                    	*probePtr = *(probePtr - 1);
			lw $t0, -4($t5)
			sw $t0, 0($t5)
#                    	--probePtr;
			addi $t5, $t5, -4
endF1:
f1test: 
#			if (probePtr > a1) goto begf1;
			la $t0, a1
			bgt $t5, $t0, begf1
brkI15:
#                	*probePtr = *hopPtr;
			lw $t0, 0($t3)
			sw $t0, 0($t5)
#                	++used1;
			addi $a1, $a1, 1
#                	++hopPtr;
			addi $t3, $t3, 4
endW11:
w11test: 
#			if (hopPtr < endPtr) goto begw11;	 //W11x
        		blt $t3, $t4, begw11
#            		hopPtr = a4;
			la $t3, a4
#            		endPtr = a4 + used4;
			sll $t4, $v1, 2
			add $t4, $t4, $t3
#            		goto w12test;
			j w12test
begw12:
#                	oneInt = *hopPtr;
			lw $t7, 0($t3)
#                	probePtr = a2 + used2;
			la $t5, a2
			sll $t0, $a2, 2
			add $t5, $t5, $t0
#                	goto f2test;
			j f2test
begf2:
#                    	if ( *(probePtr - 1) <= oneInt ) goto endi16;	 //I16x
			lw $t0, -4($t5)
			ble $t0, $t7, brkI16
#                    	*probePtr = *(probePtr - 1);
                	lw $t0, -4($t5)
                	sw $t0, 0($t5)
#                    	--probePtr;
			addi $t5, $t5, -4
endF2:
f2test: 
#			if (probePtr > a2) goto begf2;      //F2x
			la $t0, a2
			bgt $t5, $t0, begf2
brkI16:
#                	*probePtr = *hopPtr;
			lw $t0, 0($t3)
			sw $t0, 0($t5)
#                	++used2;
			addi $a2, $a2, 1
#                	++hopPtr;
			addi $t3, $t3, 4
endW12:
w12test: 
#			if (hopPtr < endPtr) goto begw12;	 //W12x
        		blt $t3, $t4, begw12
#            		cout << cpaA1Str;
			li $v0, 4
			la $a0, cpaA1Str
			syscall
#            		hopPtr = a1;
			la $t3, a1
#            		endPtr = a1 + used1;
			sll $t4, $a1, 2
			add $t4, $t4, $t3
#            		goto w13test;
			j w13test
begw13:
#                	cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#                	++hopPtr;
			addi $t3, $t3, 4
endW13:
w13test: 
#        		if (hopPtr < endPtr) goto begw13;	 //W13x
        		blt $t3, $t4, begw13
#            		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#            		cout << comA2Str;
			li $v0, 4
			la $a0, comA2Str
			syscall
#            		hopPtr = a2;
			la $t3, a2
#            		endPtr = a2 + used2;
			sll $t4, $a2, 2
			add $t4, $t4, $t3
#            		goto w14test;
			j w14test
begw14:
#                	cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#                	++hopPtr;
			addi $t3, $t3, 4
endW14:
w14test: 
#			if (hopPtr < endPtr) goto begw14;	 //W14x
        		blt $t3, $t4, begw14
#            		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#            		cout << comA3Str;
			li $v0, 4
			la $a0, comA3Str
			syscall
#            		hopPtr = a3;
			la $t3, a3
#            		endPtr = a3 + used3;
			sll $t4, $a3, 2
			add $t4, $t4, $t3
#            		goto w15test;
			j w15test
begw15:
#                	cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#                	++hopPtr;
			addi $t3, $t3, 4
endW15:
w15test: 
#			if (hopPtr < endPtr) goto begw15;	 //W15x
        		blt $t3, $t4, begw15
#            		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#            		cout << comA4Str;
			li $v0, 4
			la $a0, comA4Str
			syscall
#            		hopPtr = a4;
			la $t3, a4
#            		endPtr = a4 + used4;
			sll $t4, $v1, 2
			add $t4, $t4, $t3
#            		goto w16test;
			j w16test
begw16:
#                	cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#                	++hopPtr;
			addi $t3, $t3, 4
endW16:
w16test: 
#			if (hopPtr < endPtr) goto begw16;	 //W16x
        		blt $t3, $t4, begw16
#            		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#            		used3 = 0;
			li $a3, 0
#            		used4 = 0;
			li $v1, 0
#            		if ( (minInt & 1) == 0)	goto else17; //I17x
			andi $t0, $t6, 1
			beqz $t0, else17
#                	hopPtr = a3;
			la $t3, a3
#               	used3 = used1 + used2;
			add $a3, $a3, $a1
			add $a3, $a3, $a2
#                	goto endi17;
			j endi17
else17:
#                	hopPtr = a4;
			la $t3, a4
#                	used4 = used1 + used2;
			add $v1, $v1, $a1
			add $v1, $v1, $a2
endi17:
#            		hopPtr1 = a1;
			la $t1, a1
#            		hopPtr2 = a2;
			la $t2, a2
#            		endPtr1 = a1 + used1;
			sll $t9, $a1, 2
			add $t9, $t9, $t1
#            		endPtr2 = a2 + used2;
			sll $t8, $a2, 2
			add $t8, $t8, $t2
#            		goto w17test;
			j w17test
begw17:
#                	if (*hopPtr1 >= *hopPtr2) goto else18;	 //I18x
begI18:			lw $t0, 0($t1)
			lw $a0, 0($t2)
			bge $t0, $a0, elseI18
#                    	*hopPtr = *hopPtr1;
			lw $t0, 0($t1)
			sw $t0, 0($t3)
#                    	++hopPtr1;
			addi $t1, $t1, 4
#                    	goto endi18;
			j endi18
elseI18:
#                    	*hopPtr = *hopPtr2;
			lw $t0, 0($t2)
			sw $t0, 0($t3)
#                    	++hopPtr2;
			addi $t2, $t2, 4
endi18:
#                	++hopPtr;
			addi $t3, $t3, 4
endI17:
w17test: 
#			if (hopPtr1 < endPtr1 && hopPtr2 < endPtr2) goto begw17;//W17x
        		bge $t1, $t9, w18test
        		bge $t2, $t8, w18test
			j begw17
begw18:
#                	*hopPtr = *hopPtr1;
			lw $t0, 0($t1)
			sw $t0, 0($t3)
#                	++hopPtr1;
			addi $t1, $t1, 4
#                	++hopPtr;
			addi $t3, $t3, 4
endW18:
w18test: 
#			if (hopPtr1 < endPtr1) goto begw18;	 //W18x
        		blt $t1, $t9, begw18
#            		goto w19test;
			j w19test
begw19:
#                	*hopPtr = *hopPtr2;
			lw $t0, 0($t2)
			sw $t0, 0($t3)
#                	++hopPtr2;
			addi $t2, $t2, 4
#                	++hopPtr;
			addi $t3, $t3, 4
endW19:
w19test: 
#			if (hopPtr2 < endPtr2)	 goto begw19; //W19x
        		blt $t2, $t8, begw19
endi14:
#        		cout << proA1Str;
			li $v0, 4
			la $a0, proA1Str
			syscall
#        		hopPtr = a1;
			la $t3, a1
#        		endPtr = a1 + used1;
			sll $t4, $a1, 2
			add $t4, $t4, $t3
#        		goto w20test;
			j w20test
begw20:
#            		cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#            		++hopPtr;
			addi $t3, $t3, 4
endW20:
w20test: 
#			if (hopPtr < endPtr) goto begw20;	 //W20x
    			blt $t3, $t4, begw20
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#        		cout << comA2Str;
			li $v0, 4
			la $a0, comA2Str
			syscall
#        		hopPtr = a2;
			la $t3, a2
#        		endPtr = a2 + used2;
			sll $t4, $a2, 2
			add $t4, $t4, $t3
#        		goto w21test;
			j w21test
begw21:
#            		cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#            		++hopPtr;
			addi $t3, $t3, 4
endW21:			
w21test: 
#			if (hopPtr < endPtr) goto begw21;	 //W21x
    			blt $t3, $t4, begw21
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#        		cout << comA3Str;
			li $v0, 4
			la $a0, comA3Str
			syscall
#        		hopPtr = a3;
			la $t3, a3
#        		endPtr = a3 + used3;
			sll $t4, $a3, 2
			add $t4, $t4, $t3
#        		goto w22test;
			j w22test
begw22:
#            		cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#            		++hopPtr;
			addi $t3, $t3, 4
endW22:
w22test: 
#			if (hopPtr < endPtr) goto begw22;	 //W22x
    			blt $t3, $t4, begw22
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
#        		cout << comA4Str;
			li $v0, 4
			la $a0, comA4Str
			syscall
#        		hopPtr = a4;
			la $t3, a4
#        		endPtr = a4 + used4;
			sll $t4, $v1, 2
			add $t4, $t4, $t3
#        		goto w23test;
			j w23test
begw23:
#            		cout << *hopPtr << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t3)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
#            		++hopPtr;
			addi $t3, $t3, 4
endW23:
w23test: 
#			if (hopPtr < endPtr) goto begw23;	 //W23x
    			blt $t3, $t4, begw23
#        		cout << endl;
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
			syscall
#        		cout << dacStr;
			li $v0, 4
			la $a0, dacStr
			syscall
#        		cin >> reply;
			li $v0, 12
			syscall
			move $t6, $v0
#        		cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall
endDW1:
dw1test: 
#			if (reply != 'n' && reply != 'N') goto begdw1;
			li $t0, 'n'
			beq $t6, $t0, xitdw1
			li $t0, 'N'
			bne $t6, $t0, begdw1
xitdw1:
#    			cout << dlStr;
			li $v0, 4
			la $a0, dlStr
			syscall
#    			cout << '\n';
			li $v0, 11
			li $a0, '\n'
			syscall
#    			cout << byeStr;
			li $v0, 4
			la $a0, byeStr
			syscall
#    			cout << '\n';
			li $v0, 11
			li $a0, '\n'
			syscall
#    			cout << dlStr;
			li $v0, 4
			la $a0, dlStr
			syscall
#    			cout << '\n';
			li $v0, 11
			li $a0, '\n'
			syscall
#    			return 0;
			li $v0, 10
        		syscall
