
        .data

table:  .word 0:0x20
        .globl main

        .text
main:   
        la   $a0, table
        addi $t0, $zero, -1
        addi $t1, $a0,   0x20
loop:
        beq  $a0, $t1,  endLoop
        sw   $t0, 0($a0)
        addi $a0, $a0, 4
        j    loop
endLoop:
        li   $t0, 0
