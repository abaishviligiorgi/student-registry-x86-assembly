.code
write proc
    lea eax, byte ptr[ID_write]
    push eax
    lea eax, byte ptr[file]
    push eax
    call open
    add esp,8
    mov dword ptr[hfile],eax

    push dword ptr[hfile]
    push 1
    push 64
    lea eax,[studenti]
    push eax
    call fwrite
    add esp,16

    push dword ptr[hfile]
    call close
    add esp,4
    ret
write endp

read1 proc
    lea eax,byte ptr[ID_read]
    push eax
    lea eax, byte ptr[file]
    push eax
    call open
    add esp,8
    mov dword ptr[hfile],eax

    push 2
    push -4
    push dword ptr[hfile]
    call fseek
    add esp,12

    push dword ptr[hfile]
    push 1
    push 4
    lea eax, dword ptr [ID_number1]
    push eax
    call fread
    add esp,16

    push dword ptr[hfile]
    call close
    add esp,4
    ret
read1 endp

read2 proc
    cmp dword ptr[ID_number], 0
    je reader_init 

    push dword ptr[ID_number]
    call free
    add esp,4
    mov dword ptr[ID_number],0

reader_init:
    lea eax,byte ptr[ID_read]
    push eax
    lea eax, byte ptr[file]
    push eax
    call open
    add esp,8
    mov dword ptr[hfile],eax

    push 2
    push 0
    push dword ptr[hfile]
    call fseek
    add esp,12

    push dword ptr[hfile]
    call ftell
    add esp,4
    mov dword ptr[ID_address],eax

    xor edx,edx
    mov ebx,64
    div ebx
    mov dword ptr[counter],eax

    cmp eax,0
    je reader_exit

    push dword ptr[ID_address]
    call malloc
    add esp,4
    mov dword ptr[ID_number],eax

    push 0
    push 0
    push dword ptr[hfile]
    call fseek
    add esp,12

    push dword ptr[hfile]
    push dword ptr[counter]
    push 64
    push dword ptr [ID_number]
    call fread
    add esp,16

reader_exit:
    push dword ptr[hfile]
    call close
    add esp,4
    ret
read2 endp

cleane_list proc
    push 0
    push 0
    push 0184h
    push [hListBoxSrch]
    call SendMessageA
    ret
cleane_list endp