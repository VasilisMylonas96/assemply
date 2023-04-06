#basilhs mylwnas 2777
# Find longest word in a string
#   in MIPS assembly using MARS
# for MYΥ-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
   
	la         $a0, string		# The address of the string
        addu       $v1, $zero, $a0	# The address of longest word	
	lbu	   $s7,0($a0)	        #s7 xrisimopihte gia na dw ean o protos xaraktiras einai 0 opote na termatisei to programma
	beq        $s7,$zero exit	#elenxos ean einai 0 o protos xaraktiras kai bgainw apeuthias
	addi 	   $s6, $zero, ' '	#Periexei to keno xaraktira 
loop:	
	lbu	   $a1,0($a0)		#a1 tha xrisimopihte gia na elenxo ean o xaraktiras kathe fora einai keno h oxi
	beq	   $a1,$s6 Label		#elenxos gia to ean einai keno Label alazei kai tin dieuthinsi tou v1 oste na exw tin arxi tis leksis kathe fora sto v1
	beq	   $t1,$zero else	#ean einai iso to t1 me to 0 (tin proti fora einai ) tha paw sto else 
	beq	   $a1,$zero else3	#elenxw ean to a1 einai 0 oste na kserw ean einai to telos tis leksis kai kanw to s5 0 mesa sto else3 oste na min mpei ksana sto else gt paramenei 0 opote den tha mporesei na sinexisei to programma auti h entoli einai xrisimi stin periptwsi pou exw diabasei kai tin teleutea leksi etsi katafernw na sigrinw tin teleuta mou leksi me tin pro teleutea
	beq	   $s5,$zero else
else3:	
	beq	   $a2,$a3 else2	#tha ginei elenxos me to a3 ean einai isa gia na apothikeuso thn dieuthinsi kai to megethos tis deuteris leksis, tin proti fora pou stin ousia tha exw mia leksi an sigrinw den tha ginei kati tin deyteri fora ean einai ises tha krataw megethos kai dieuthinsi tis deuteris leksis
	slt 	   $s0,$a3,$a2		#sigkrisi gia to mia apo tis 2 lekseis einai megaluteri ean a2>a3 tote s0=1 
	bne	   $s0,$zero else2	#ean s0=1 tote  pame sto else2 ean oxi tote den xreiazete na alaksei kati sta a3 kai t3 opou einai gia tin megaluteri leksi kai apla midenizw a2 kai t1 oste na sinexisw to psaksimoko
	addu  	   $a2,$zero,$zero	#midenismos a2
	addu       $t1,$zero,$zero	#midenismos t1
	beq        $a1,$zero exitloop	#ean to a1 einai 0 tote bgainw 
	j else				#epeidh se auto to simeio exw diabasei stin ousia ton proto xaraktira tis 3 leksis tha paw sto else oste na sinexisei to programma tin diadikasia kai na sigrinei kai tin 3 leksi gia auto kai midenisa ta a2 kai t1
Label:	
	addiu	   $s5,$zero,1				#katastasi opou exw brei keno
	addi	   $a0,$a0,1		#proxaraw ton a0 kata 1 kathe fora 
	addu       $v1, $zero, $a0	#afou einai keno tha prepei na alaksei kai h thieuthinsi mexris otou tha dixnei se dieuthinsi xaraktira oxi kenou to v1 to xrisimopoiw gia na kathorisw tin dieuthinsi tis megaliteris leksis ousiastika h thieuthinsi tis megaluteris leksis uparxei sto t3 prin tin liksi tou programatos to v1 tha periexei telikos tin dieuthinsi tis megaluteris leksis
	j loop				
Label1:					#katastasi sinexomenon xaraktirwn
	addi	   $a0,$a0,1		#edw apla xreiazete na proxorisw ston epomeno xaraktira gia auto den exei kai alagi stin dieuthinsi v1 
	j loop
else:	
	addiu	   $s5,$zero,0
	addi	   $a2,$a2, 1		#auksisi megethous parousas leksis 
	addu       $t1, $zero, $v1	#dieuthinsi parousas leksis (edw tha ekxorite sinexos h dieuthinsi tis leksis sto t1 alla den brika tropo na ginete mia fora oste na einai pio grigoro to programma
	j Label1
else2:
	add	$a3,$zero,$a2		# a2 einai to megethos tis megaluteris leksis meta apo tin sugkrisi pou prohgithike opote to a3 twra periexei to megethos tis megaluteris leksis
	addu	$t3,$zero,$t1		#t2 periexei tin dieuthinsi tis megaluteris leksis  meta apo tin sugkrisi pou prohgithike opote twra to t3 tha tin periexei
	addu  	$a2,$zero,$zero		#midenismos a2
	addu    $t1,$zero,$zero		#midenismos t1
	j else	    
        ########################################################################
        #  Write your code here
        # NOTE: Don't print out the results! Automatic testing will get the final
        #  value of $v1 and check if it is correct
        ########################################################################
exitloop:
	addu       $v1, $zero, $t3      
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
string: .asciiz "small  equal long atTheEnd"
