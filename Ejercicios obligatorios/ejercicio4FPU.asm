%include "io.inc"
extern _printf

section .data

    format db "El resultado es : %f", 10,13,0
    array dq 35.1, 11.3, 41.6, 12.3, 31.4, 23.4
    longitud equ $-array
    result dq 0.0


section .text
global CMAIN
CMAIN:
    mov ebp, esp            ;for correct debugging

    mov eax, 8              ;mis saltos son de 8
    FLD qword[array]        ;cargo el primer número del vector
S:  FLD qword[array+eax]    ;cargo el siguiente puntero   
    FADD                    ;sumo
    add eax, 8              ;sumo 8 a los saltos
    cmp eax, longitud       ;comparo con longitud del vector
    jbe S                   ;si es menor o igual sigo cargando datos
    
    FST qword[result]       ;guardo resultado
    
    push dword[result+4]    ;imprimo
    push dword[result]
    push format
    call printf    
    add esp, 12    
            
    xor eax, eax
    ret