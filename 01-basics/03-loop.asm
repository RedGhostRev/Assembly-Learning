DATA SEGMENT
    MSG DB 'Hello World!$'
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE

START:
    MOV AX, DATA
    MOV DS, AX

    MOV CX, 1

L:  ; 输出字符串
    MOV AH, 9H
    MOV DX, OFFSET MSG
    INT 21H

    ; 输出计数器
    MOV AH, 2H
    MOV DL, CL
    ADD DL, '0'
    INT 21H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    ; 自增
    INC CX
    CMP CX, 6
    JNE L

    ; 循环外
    MOV AX, 4C00H
    INT 21H

CODE ENDS
END START