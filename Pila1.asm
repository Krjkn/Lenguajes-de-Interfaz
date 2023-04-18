.model small
.stack
.data
    ; Reservar espacio para la pila
    pila dw 100 dup(?)
    msg db 'Pila Vacia,','$'
    num1 db 1
.code
main proc
    ; Establecer el puntero de la pila en el registro SP
    mov ax, @data
    mov ds, ax
    mov ss, ax
    mov sp, offset pila

    ; A?adir datos a la pila en ascii
    mov ax, 74
    push ax
    mov ax, 65
    push ax
    mov ax, 90
    push ax
    mov ax, 77
    push ax
    mov ax, 73
    push ax
    mov ax, 78
    push ax
    ; Imprimir los elementos de la pila
    mov bx, sp
    cmp bx, pila
    jz fin
    
    ciclo:
        pop ax
        ; Imprimir el valor de ax en la pantalla
        mov ah, 2h
        mov dl, al
        int 21h
        ; Agregar un espacio despues de cada caracter
        mov dl, '-'
        int 21h
        ; Verificar si la pila estsa vacia
        cmp sp,pila
        jnz ciclo
    fin:
    ; Salir del programa
    .exit
main endp
end main