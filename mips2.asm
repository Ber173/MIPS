.data
nhap1: .asciiz "Nhap so thu nhat : "
nhap2: .asciiz "Nhap so thu hai : "
Tong: .asciiz "\nTong cua 2 so la "
Hieu: .asciiz "\nHieu cua 2 so la "
Tich: .asciiz "\nTich cua 2 so la "
Thuong: .asciiz "\nThuong cua hai so la " 

.text
.global main
main: 

# Nhap so thu nhat
li $v0, 4
la $a0, nhap1
syscall

li $v0, 5
syscall
move $t0, $v0

# Nhap so thu hai

li $v0, 4
la $a0, nhap2
syscall

li $v0, 5
syscall
move $t1, $v0

#  In cac gia tri

# Tong
li $v0, 4
la $a0, Tong
syscall

add $a0, $t0, $t1

li $v0, 1
syscall

# Hieu
li $v0, 4
la $a0, Hieu
syscall

sub $a0, $t0, $t1

li $v0, 1
syscall

# Tich
li $v0, 4
la $a0, Tich
syscall

mul $a0, $t0, $t1

li $v0, 1
syscall

# Thuong
li $v0, 4
la $a0, Thuong
syscall

div $t0, $t1
mflo $a0

li $v0, 1
syscall


#ket thuc chuong trinh
li $v0, 10
syscall
