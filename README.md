# Writting stuff to the console in x86-ASM
How to write a string to the console in x86 Asm via the windows api

trying to learn x86 asm atm

# Functions Used

```if you have worked with the windows api there you are prolly familiar with these 3 functions```

```WriteConsoleA, GetStdHandle, and ExitProcess```

# Code


The data section stores variables the variable m is a string ("n*gga")
ML is the length of the variable m
```
section .data
    m db "nigga", 0
    ML equ $ - m
```

Here is the code that actual writes stuff to the console

```
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
```

Full Code

```
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
```
