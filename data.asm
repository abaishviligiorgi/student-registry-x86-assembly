.data
    ; --- Windows Predefined Element Classes ---
    Klas_Static     db "STATIC", 0     
    Klas_Edit       db "EDIT", 0         
    Klas_Button     db "BUTTON", 0       
    Klas_Listbox    db "LISTBOX", 0      

    ; --- Interface Label Texts ---
    lbl_name        db "Name:", 0
    lbl_surname     db "Surname:", 0
    lbl_age         db "Age:", 0
    lbl_rating      db "Rating:", 0
    lbl_search_name db "Name:", 0
    lbl_search_surname db "Surname:", 0
    Txt_Button      db "Register Student", 0
    search          db "Search:", 0

    ; --- Window Class Registration Strings ---
    szClassName     db "MySimpleWinClass", 0
    szWinTitle      db "Students Register v1.0", 0

    ; --- Application and Window Handles ---
    hInstance       dd 0
    hMainWnd        dd 0

    ; --- Windows Message Loop Structure ---
    msg_hwnd        dd 0
    msg_message     dd 0
    msg_wParam      dd 0
    msg_lParam      dd 0
    msg_time        dd 0
    msg_pt_x        dd 0
    msg_pt_y        dd 0

    ; --- Window Class Structure (WNDCLASSEXA) ---
    wc_cbSize        dd 48
    wc_style         dd 3               
    wc_lpfnWndProc   dd offset WndProc  
    wc_cbClsExtra    dd 0
    wc_cbWndExtra    dd 0
    wc_hInstance     dd 0
    wc_hIcon         dd 0
    wc_hCursor       dd 0
    wc_hbrBackground dd 16               
    wc_lpszMenuName  dd 0
    wc_lpszClassName dd offset szClassName
    wc_hIconSm       dd 0

    hbrush          dd 0

    ; --- Element Subwindow Handles ---
    hEditName       dd 0
    hEditSurname    dd 0
    hEditAge        dd 0
    hEditRating     dd 0
    hListBoxStd     dd 0
    hListBoxSrch    dd 0
    hButtonReg      dd 0
    hEditSearchName dd 0
    hEditSearchSur  dd 0
    hButtonSearch   dd 0

    ; --- String and Data Buffers ---
    age_buff        db 10 dup(?)
    rating_buff     db 10 dup(?)
    file            db "history.txt", 0
    ID_file         db "ID_file.txt", 0
    txt_not_found   db "Student not found!", 0
    txt_title       db "Attention", 0
    
    ; --- File I/O Parameters ---
    ID_write        db "ab", 0
    ID_read         db "rb", 0
    ID_address      dd 0
    ID_number       dd 0
    ID_number1      dd 0
    hfile           dd 0
    writer          db "a", 0
    write_form      db "Name: %s %s | Age: %d | Rating: %d | ID: %d", 10, 13, 0
    buffer          db 64 dup(?)
    counter         dd 0
    
    ; --- Dynamic Search and String Variables ---
    temp_buffer     db 52 dup(?)
    temp_buffer1    db 20 dup(?)
    temp_buffer2    db 32 dup(?)
    name_flag       dd 0
    surname_flag    dd 0
    name_length     dd 0
    surname_length  dd 0

    align 4
    ps              db 64 dup(0)