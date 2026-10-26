; ====================================================================
; Students Register Application v1.0
; Written in x86 MASM Assembly with native Windows API
; ====================================================================

.686
.model flat, stdcall
option casemap :none

includelib gdi32.lib
includelib msvcrt.lib
includelib ucrt.lib
includelib legacy_stdio_definitions.lib
includelib user32.lib
includelib kernel32.lib

include extern.asm
include data.asm
include write.asm

RECT struct
    left   dd 0
    top    dd 0
    right  dd 0
    bottom dd 0
RECT ends

student struct
    name1    db 20 dup(?)
    surname db 32 dup(?)
    age     dd 0
    rating  dd 0
    ID_num  dd 0
student ends

.data
    studenti student <>
    rc RECT <0, 0, 0, 0>

WndProc proto :DWORD, :DWORD, :DWORD, :DWORD

.code
main proc
    ; --- Window Class Setup and Template Architecture ---
    push 0
    call GetModuleHandleA
    mov [hInstance], eax
    mov [wc_hInstance], eax

    push 32512                          
    push 0
    call LoadCursorA
    mov [wc_hCursor], eax

    push offset wc_cbSize
    call RegisterClassExA
    cmp eax, 0
    je end_program                      

    ; --- Host Main Window Creation ---
    push 0                              
    push [hInstance]                    
    push 0                              
    push 0                              
    push 600                            
    push 800                            
    push 100                            
    push 100                            
    push 10CF0000h                      
    push offset szWinTitle              
    push offset szClassName             
    push 0                              
    call CreateWindowExA
    mov [hMainWnd], eax
    cmp eax, 0
    je end_program

    ; --- Core Message Loop Process ---
msg_loop:
    push 0
    push 0
    push 0
    push offset msg_hwnd
    call GetMessageA
    
    cmp eax, 0                          
    je end_program

    lea eax, [msg_hwnd]
    push eax
    call TranslateMessage
    
    push offset msg_hwnd
    call DispatchMessageA               
    jmp msg_loop

end_program:
    push 0
    call ExitProcess
main endp

; --- Window Procedure Callback Route ---
WndProc proc hwnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
    mov eax, [uMsg]

    cmp eax, 0001h
    je create_window_elements 
    cmp eax, 0002h                      
    je window_destroy
    cmp eax, 0014h
    je window_background_processor
    cmp eax, 0111h
    je element_commands 

default_routing:
    push [lParam]
    push [wParam]
    push [uMsg]
    push [hwnd]
    call DefWindowProcA
    ret

element_commands:
    mov eax,[wParam]
    and eax, 0ffffh

    cmp eax, 1007
    je search_trigger
    cmp eax, 1006
    je registration_trigger

window_background_processor:
    lea eax,[rc]
    push eax
    push dword ptr[hwnd]
    call GetClientRect

    push 16
    call GetSysColorBrush
    mov dword ptr[hbrush],eax
    push dword ptr[hbrush]
    
    lea eax, [rc]
    push eax
    push [wParam]
    call FillRect
    mov eax,1
    ret

create_window_elements:
    ; --- Subwindow Controls Setup: Forms and Labels ---
    push 0
    push [hInstance]
    push 1001                           
    push [hwnd]                         
    push 30                             
    push 200                           
    push 60                             
    push 110                             
    push 50800000h                      
    push 0                              
    push offset Klas_Edit               
    push 0                              
    call CreateWindowExA
    mov [hEditName], eax        
    
    push 0
    push [hInstance]
    push 2001                           
    push [hwnd]
    push 20                             
    push 70                             
    push 65                             
    push 40                              
    push 50800000h                      
    push offset lbl_name              
    push offset Klas_Static             
    push 0
    call CreateWindowExA

    push 0                              
    push [hInstance]                    
    push 1002                           
    push [hwnd]                         
    push 30                             
    push 200                            
    push 100                            
    push 110                             
    push 50800000h                      
    push 0                              
    push offset Klas_Edit               
    push 0                              
    call CreateWindowExA                
    mov [hEditSurname], eax              

    push 0
    push [hInstance]
    push 2002                           
    push [hwnd]
    push 20
    push 70                             
    push 105                             
    push 40                              
    push 50800000h
    push offset lbl_surname               
    push offset Klas_Static
    push 0
    call CreateWindowExA

    push 0                              
    push [hInstance]                    
    push 1003                           
    push [hwnd]                         
    push 30                             
    push 200                            
    push 140                           
    push 110                             
    push 50800000h                      
    push 0                              
    push offset Klas_Edit               
    push 0                              
    call CreateWindowExA                
    mov [hEditAge], eax              

    push 0
    push [hInstance]
    push 2003                           
    push [hwnd]
    push 20
    push 70
    push 145                            
    push 40                              
    push 50800000h
    push offset lbl_age               
    push offset Klas_Static
    push 0
    call CreateWindowExA

    push 0                              
    push [hInstance]                    
    push 1004                           
    push [hwnd]                         
    push 30                             
    push 200                            
    push 180                             
    push 110                             
    push 50800000h                      
    push 0                              
    push offset Klas_Edit               
    push 0                              
    call CreateWindowExA                
    mov [hEditRating], eax              

    push 0
    push [hInstance]
    push 2004                           
    push [hwnd]
    push 20
    push 70
    push 185                            
    push 40                              
    push 50800000h
    push offset lbl_rating            
    push offset Klas_Static
    push 0
    call CreateWindowExA

    push 0                              
    push [hInstance]                    
    push 1009                           
    push [hwnd]                         
    push 30                             
    push 200                            
    push 300                             
    push 110                             
    push 50800000h                      
    push 0                              
    push offset Klas_Edit               
    push 0                              
    call CreateWindowExA                
    mov [hEditSearchName], eax              

    push 0
    push [hInstance]
    push 2009                           
    push [hwnd]
    push 20
    push 70
    push 305                            
    push 40                              
    push 50800000h
    push offset lbl_search_name        
    push offset Klas_Static
    push 0
    call CreateWindowExA

    push 0                              
    push [hInstance]                    
    push 1010                           
    push [hwnd]                         
    push 30                             
    push 200                            
    push 340                             
    push 110                             
    push 50800000h                      
    push 0                              
    push offset Klas_Edit               
    push 0                              
    call CreateWindowExA                
    mov [hEditSearchSur], eax              

    push 0
    push [hInstance]
    push 2010                           
    push [hwnd]
    push 20
    push 70
    push 345                            
    push 40                              
    push 50800000h
    push offset lbl_search_surname        
    push offset Klas_Static
    push 0
    call CreateWindowExA

    ; --- ListBox View Elements Placement ---
    push 0                              
    push [hInstance]                    
    push 1005                           
    push [hwnd]                         
    push 250                            
    push 420                            
    push 20                             
    push 320                            
    push 50B00001h                      
    push 0                              
    push offset Klas_Listbox            
    push 0                              
    call CreateWindowExA                
    mov [hListBoxStd], eax              
    
    push 0                              
    push [hInstance]                    
    push 1008                           
    push [hwnd]                         
    push 250                            
    push 420                            
    push 300                             
    push 320                            
    push 50B00001h                      
    push 0                              
    push offset Klas_Listbox            
    push 0                              
    call CreateWindowExA                
    mov [hListBoxSrch], eax              

    ; --- System Execution Button Placements ---
    push 0                              
    push [hInstance]                    
    push 1006                           
    push [hwnd]                         
    push 40                             
    push 200                            
    push 220                            
    push 110                            
    push 50000001h                      
    push offset Txt_Button              
    push offset Klas_Button             
    push 0                              
    call CreateWindowExA                
    mov [hButtonReg], eax               

    push 0                              
    push [hInstance]                    
    push 1007                           
    push [hwnd]                         
    push 40                             
    push 200                            
    push 385                            
    push 110                            
    push 50000001h                      
    push offset search                  
    push offset Klas_Button             
    push 0                              
    call CreateWindowExA                
    mov [hButtonSearch], eax            

    ; --- Data Population Initialization Routing ---
    push 10
    lea eax,[rating_buff]
    push eax
    push [hEditRating]
    call getwindowtext

    lea eax,[rating_buff]
    push eax
    call atoi
    add esp,4
    mov [studenti.rating],eax

    call read1
    mov eax, dword ptr[ID_number1]
    inc eax
    mov dword ptr[studenti.ID_num],eax

    push 0
    push 0
    push 0184h
    push [hListBoxStd]
    call SendMessageA

    call read2
    mov ecx, dword ptr[counter]
    cmp ecx,0
    je list_empty 

    mov esi, dword ptr[ID_number]

render_loop:
    push ecx
    mov edi,esi
    add edi,20

    push dword ptr [esi+60]
    push dword ptr [esi+56]   
    push dword ptr [esi+52]
    lea eax, [edi]
    push eax
    lea eax, [esi]
    push eax
    lea eax, byte ptr[write_form]
    push eax
    lea eax, byte ptr[buffer]
    push eax
    call wsprintfA
    add esp,28

    lea eax, byte ptr[buffer]
    push eax
    push 0
    push 0180h
    push [hListBoxStd]
    call SendMessageA

    pop ecx
    add esi,64
    dec ecx
    jnz render_loop

list_empty:
    mov eax, 0                          
    ret                                 

; --- Registration Click Handling Workflow ---
registration_trigger:
    push 20
    lea eax, [studenti.name1]
    push eax
    push [hEditName]
    call getwindowtext

    push 32
    lea eax,[studenti.surname]
    push eax
    push [hEditSurname]
    call getwindowtext

    push 10
    lea eax,[age_buff]
    push eax
    push [hEditAge]
    call getwindowtext

    lea eax,[age_buff]
    push eax
    call atoi
    add esp,4
    mov [studenti.age],eax

    push 10
    lea eax,[rating_buff]
    push eax
    push [hEditRating]
    call getwindowtext

    lea eax,[rating_buff]
    push eax
    call atoi
    add esp,4
    mov [studenti.rating],eax

    call read1
    mov eax, dword ptr[ID_number1]
    inc eax
    mov dword ptr[studenti.ID_num],eax

    push 20
    lea eax,[temp_buffer]
    push eax
    push 1001
    push dword ptr[hwnd]
    call GetDlgItemTextA
    cmp eax,0
    jne process_write

    push 32
    lea eax,[temp_buffer]
    push eax
    push 1002
    push dword ptr[hwnd]
    call GetDlgItemTextA
    cmp eax,0
    jne process_write

    push 4
    lea eax,[temp_buffer]
    push eax
    push 1003
    push dword ptr[hwnd]
    call GetDlgItemTextA
    cmp eax,0
    jne process_write

    push 4
    lea eax,[temp_buffer]
    push eax
    push 1004
    push dword ptr[hwnd]
    call GetDlgItemTextA
    cmp eax,0
    je final_exit

process_write:
    call write

    push 0
    push 0
    push 0184h
    push [hListBoxStd]
    call SendMessageA

    call read2
    mov ecx, dword ptr[counter]
    cmp ecx,0
    je final_exit 

    mov esi, dword ptr[ID_number]

write_render_loop:
    push ecx
    mov edi,esi
    add edi,20

    push dword ptr [esi+60]
    push dword ptr [esi+56]   
    push dword ptr [esi+52]
    lea eax, [edi]
    push eax
    lea eax, [esi]
    push eax
    lea eax, byte ptr[write_form]
    push eax
    lea eax, byte ptr[buffer]
    push eax
    call wsprintfA
    add esp,28

    lea eax, byte ptr[buffer]
    push eax
    push 0
    push 0180h
    push [hListBoxStd]
    call SendMessageA

    pop ecx
    add esi,64
    dec ecx
    jnz write_render_loop
    jmp final_exit

; --- Database Searching Filter Workflow ---
search_trigger: 
    push 0
    push 0
    push 0184h
    push [hListBoxSrch]
    call SendMessageA
    
    push 20
    lea eax,[temp_buffer1]
    push eax
    push 1009
    push dword ptr[hwnd]
    call GetDlgItemTextA
    mov dword ptr[name_length], eax

    push 32
    lea eax,[temp_buffer2]
    push eax
    push 1010
    push dword ptr[hwnd]
    call GetDlgItemTextA
    mov dword ptr[surname_length],eax

    mov eax,dword ptr[name_length]
    add eax,dword ptr[surname_length]
    cmp eax,0
    je throw_not_found    
    
    call read2
    mov ecx,dword ptr[counter]
    cmp ecx,0
    je throw_not_found

    xor ebx,ebx
    mov esi,dword ptr[ID_number]
    
internal_search_loop:
    push ecx
    push esi
    cmp dword ptr[name_length],0
    je match_surname
   
    push esi
    lea eax, [temp_buffer1]
    push eax
    call lstrcmpA@8
    cmp eax, 0
    jne skip_entry

match_surname:
    cmp dword ptr[surname_length],0
    je print_match_results

    mov edi,esi
    add edi,20
    push edi
    lea eax,[temp_buffer2]
    push eax
    call lstrcmpA@8
    cmp eax,0
    jne skip_entry

print_match_results:
    inc ebx
    mov esi,[esp]
    mov edi,esi
    add edi,20

    push dword ptr [esi+60]
    push dword ptr [esi+56]   
    push dword ptr [esi+52]
    lea eax, [edi]
    push eax
    lea eax, [esi]
    push eax
    lea eax, byte ptr[write_form]
    push eax
    lea eax, byte ptr[buffer]
    push eax
    call wsprintfA
    add esp,28

    lea eax, byte ptr[buffer]
    push eax
    push 0
    push 0180h
    push [hListBoxSrch]
    call SendMessageA

skip_entry:
    pop esi
    pop ecx
    add esi, 64
    dec ecx
    jnz internal_search_loop

    cmp ebx,0
    je throw_not_found
    jmp final_exit

throw_not_found:
    push 040h
    lea eax,byte ptr[txt_title]
    push eax
    lea eax, byte ptr[txt_not_found]
    push eax
    push dword ptr[hwnd]
    call MessageBox 

final_exit:
    mov eax,0
    ret

window_destroy:
    push 0
    call PostQuitMessage
    mov eax, 0
    ret
WndProc endp
end main