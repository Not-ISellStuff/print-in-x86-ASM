section .data
    m db "nigga", 0
    ML equ $ - m    

section .text
    global _start

    extern WriteConsoleA
    extern GetStdHandle
    extern ExitProcess

_start:
    push -11                  
    call GetStdHandle  
    mov ebx, eax             

    push 0                     
    push ML        
    push m              
    push ebx                   
    call WriteConsoleA       

    push 0                     
    call ExitProcess         

section .idata
    import WriteConsoleA kernel32.dll
    import GetStdHandle kernel32.dll
    import ExitProcess kernel32.dll
