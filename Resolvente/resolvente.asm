;%include "io.inc"
extern printf

section .data

    format1 db "El valor de X1 es: %.2f", 10,13,0
    format2 db "El valor de X2 es: %.2f", 10,13,0
    a dq 0.0
    b dq 0.0
    c dq 0.0
    
    dos dq 2.0
    unon dq -1.0
    cuatron dq -4.0

    dividendo dq 0.0
    raiz dq 0.0
    result dq 0.0
    result1 dq 0.0
    result2 dq 0.0
    

section .text
global CMAIN
CMAIN:
    push ebp        
    mov ebp, esp
    
    FLD dword[ebp+8]
    FSTP qword[a]
    FLD dword[ebp+12]
    FSTP qword[b]
    FLD dword[ebp+16]
    FSTP qword[c]
        
    ;calculo dividendo
    FLD qword[a]
    FLD qword[dos]
    FMUL
    FSTP qword[dividendo]
    
    ;raiz
    FLD qword[b]
    FLD qword[b]
    FMUL

    FLD qword[a]
    FLD qword[c]
    FMUL
    FLD qword[cuatron]
    FMUL
    FADD
    FSQRT
    FSTP qword[raiz]
    
    ;parte positiva
    FLD qword[unon]
    FLD qword[b]
    FMUL
    FLD qword[raiz]
    FADD
    FLD qword[dividendo]
    FDIV
    FSTP qword[result1];guardo x1
    
    ;parte negativa
    FLD qword[unon]
    FLD qword[b]
    FMUL        
    
    FLD qword[unon]
    FLD qword[raiz]
    FMUL    

    FADD
    FLD qword[dividendo]
    FDIV
    FSTP qword[result2];guardo x2
    
    ;imprimo las raíces
    push dword[result1+4]
    push dword[result1]
    push format1
    call printf
    add esp, 12
    
    push dword[result2+4]
    push dword[result2]
    push format2
    call printf
    add esp, 12
    
    mov esp, ebp
    pop ebp
    ret