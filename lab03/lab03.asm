#mylwnas vasilhs 2777
# Calculate the population count of an array
#Β for MYΞ¥-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 

main:
        # These are for providing input and testing, don't change in your
        #  final submission
        li    $v0, -1   # non-zero v0 to catch code dependent on zeroed regs

        li    $a0, 0xa5ca3695
        jal   popc
        addu  $s0, $v0, $zero   # Move the result to s0 for tester to check

        li    $a0, 0x0
        jal   popc
        addu  $s1, $v0, $zero   # Move the result to s1 for tester to check

        # Try it with an array
        la    $a0, array
        li    $a1, 4
        jal   sum_popc
        addu  $s2, $v0, $zero   # Move the result to s2 for tester to check

        # Try it with 1 item 
        la    $a0, array
        addi  $a0, $a0, 12
        li    $a1, 1
        jal   sum_popc
        addu  $s3, $v0, $zero   # Move the result to s3 for tester to check

        # ----- Try with 0
        la    $a0, array
        li    $a1, 0
        jal   sum_popc
        addu  $s4, $v0, $zero   # Move the result to s4 for tester to check


        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.

 
        ########################################################################
        #  Write your code here. Leave main as is.
        ########################################################################

popc:	
	add	$t9,$zero,$a0	#ekxoro to a0 mesa sto t9 gt den prepei na piraksw to a0
	add	$t3,$zero,$zero # metraei asous    			
popc1:
	andi	$t1,$t9,1	#elenxos bit pros bit gia to ean einai 1  h 0 
	bne 	$t1,$zero,sum	#ean einai 1 pigeno stin sum gia auksisi kata 1 
con:	srl 	$t9,$t9,1	# deksia olisthisi oste na elensko to epomeno bit gia to  ean einai 1 h 0
	beq	$t9,$zero,TheEnd#elenxos gia to ean to t9 einai 0 bgainw 
	j popc1
sum:	addi	$t3,$t3,1	#auksisi kata 1
	j con


TheEnd:
	add	$v0,$zero,$t3	#ekxorisi tou t3 pou periexei tous asous sto v0
	add	$t1,$zero,$zero	#midenismos t1 
        jr	$ra		


sum_popc:
	add	$v1,$zero,$zero	#midenismos v1
	add	$s6,$zero,$zero	#midenismos s6
	bne	$a1,$zero,else	#elenxos ean to a1 den einai miden 
	add 	$v0,$zero,$t6	#ean to a1 einai miden tote epistrefw 0 
	jr	$ra		

else:
	addi	$sp, $sp, -8	#anigam 2 theseon
	sw	$ra, 4($sp)	#sonw to ra
	addi	$a1, $a1, -1	#miosi a1 kata 1
	add	$t6,$zero,$a1	#ekxoro to a1 sto t6 gia na min to piraksw kata thn olisthisi
	sll 	$t7,$t6,2	#auto einai t7=t6*4 dld stin ousia t7=a1*4
	add	$a0,$a0,$t7	#auksisi pianka kata t7 thesis
	add	$s5,$a0,$zero	#krataw tin dieuthinsi tou a0 sto s5
	lw 	$v1,0($a0)	#diabasma kai ekxorisi timis sto v1
	addu	$a0,$v1,$zero	#ekxoro tin timi pou diabasa sto a0 ksana oste na mou treksei sosta h popc
	jal 	popc
	sub	$a0,$s5,$t7	#epanafora ths arxikis timis tou a0 
	sw	$v0, 0($sp)	#sono to v0 pou mou irhte apo tin popc
	jal 	sum_popc	# kalo ksana tin sum popc mexxri9 to a1 na ginei 0 
	lw	$v0, 0($sp)	#diabasma v0 apo tin mnimi
	add	$t1,$t1,$v0	#prosthesi olon ton v0 apo tin mnimi
	lw	$ra, 4($sp)	#diabasma ra apo mnimi
	addi	$sp, $sp, 8	#klisimo theseon
	add	$v0,$zero,$t1	#ekxorisi sto v0 to t1 auto mas xrisimeuei stin teleutea fora giati epistrefo to sosto v0 kata tin diarkeia tou programmatos den uparxei problima gt prin kanw tin prosthesi me to t1 exw diabasei tin sosti timi 
        jr	$ra

        ###############################################################################
        # Data input.
        ###############################################################################
       .data
array: .word 0xa5ca3691, 0x5a3695ca, 0x36a9ca55, 0xc55a36a9
