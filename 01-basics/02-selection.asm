DATA SEGMENT
    msg DB 'Please enter a number between 0 and 9: $'
    less DB 0DH, 0AH, 'The number is less than 5.$'
    equal DB 0DH, 0AH, 'The number is equal to 5.$'
    larger DB 0DH, 0AH, 'The number is larger than 5.$'
    num DB ?
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AH, 9
    MOV DX, OFFSET msg
    INT 21H

    MOV AH, 1
    INT 21H
    MOV num, AL

    CMP num, '5'
    MOV AH, 9

    JB LESS_THAN
    JE EQUAL_
    JA LARGER_THAN

LESS_THAN:
    MOV DX, OFFSET less
    JMP END_IF

EQUAL_:
    MOV DX, OFFSET equal
    JMP END_IF

LARGER_THAN:
    MOV DX, OFFSET larger
    JMP END_IF

END_IF:
    INT 21H
    MOV AX, 4C00H
    INT 21H

CODE ENDS
END START