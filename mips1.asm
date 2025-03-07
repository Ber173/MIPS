.data 
prompt: .asciiz "Nhap ky tu: "
prev: .asciiz "\nKy tu truoc: "
next: .asciiz "\nKy tu sau: "
digit: .asciiz "\nLoai: So"
lower: .asciiz "\nLoai: Chu thuong"
upper: .asciiz "\nLoai: Chu hoa"
invalid_type: .asciiz "\nInvalid type"

.text
.global main

main:
li $v0, 4	# xuat ra chuoi prompt
la $a0, prompt
syscall


li $v0, 12	# nhap chuoi ki tu vao v0
syscall
move $t0, $v0

##################################
check_digit1:
li $t1, 57
blt $t0, $t1, check_digit2
j check_lower1

check_digit2:
li $t1, 48
bgt $t0, $t1, cout

check_lower1:
li $t1, 122
blt $t1, $t0, check_lower2

check_lower2:
li $t1, 97
blt $t1, $t0, cout

check_upper1:
li $t1, 90
blt $t1, $t0, check_upper2

check_upper2:
li $t1, 65
blt $t1, $t0, cout

invalid:
li $v0, 4
la $a0, invalid_type
syscall
j the_end
##################################

cout:
li $v0, 4 	# xuat ra chuoi prev
la $a0, prev
syscall

li $v0, 11	# in kí tự trước kí tự đã nhập
move $a0, $t0
addi $a0, $a0, -1
syscall

li $v0, 4 	# xuat ra chuoi next
la $a0, next
syscall

li $v0, 11
move $a0, $t0
addi $a0, $a0, 1
syscall 

check_digit:
li $t1, 48
blt $t0, $t1, check_lower

li $t1, 57
bgt $t0, $t1, check_lower

li $v0, 4
la $a0, digit
syscall

j the_end
 
check_lower:
li $t1, 97
blt $t1, $t0, check_upper

li $t1, 122
blt $t1, $t0, check_upper

li $v0, 4
la $a0, upper
syscall
j the_end

check_upper:
li $t1, 65
blt $t1, $t0, invalid1

li $t1, 90
blt $t1, $t0, invalid1

li $v0, 4
la $a0, lower
syscall

j the_end

invalid1:
li $v0, 4
la $a0, invalid_type
syscall


the_end:
li $v0, 10 	# ket thuc chuong trinh
syscall
