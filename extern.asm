extern printf: proc					
extern scanf: proc					
extern gets:proc					
extern fopen: proc					
open equ fopen
extern fclose: proc					
extern fwrite: proc					
extern fread: proc					
extern remove: proc					
extern strlen: proc					
extern rename: proc					
extern fseek: proc					
extern ftell: proc					
extern GetDC@4:proc                 
extern SetPixel@16:proc             
extern ReleaseDC@8:proc             
extern MoveToEx@16:proc
extern LineTo@12:proc
extern ShowWindow@8:near
extern GetModuleHandleA@4:near
GetModuleHandleA equ GetModuleHandleA@4
extern RegisterClassExA@4:near
RegisterClassExA equ RegisterClassExA@4
extern CreateWindowExA@48:near
CreateWindowExA equ CreateWindowExA@48
extern UpdateWindow@4:near
UpdateWindow equ UpdateWindow@4
extern GetMessageA@16:near
GetMessageA equ GetMessageA@16
extern DispatchMessageA@4:near
DispatchMessageA equ DispatchMessageA@4
extern DefWindowProcA@16:near
DefWindowProcA equ DefWindowProcA@16
extern PostQuitMessage@4:near
PostQuitMessage equ PostQuitMessage@4
extern ExitProcess@4:near
ExitProcess equ ExitProcess@4
extern LoadCursorA@8: proc
LoadCursorA equ LoadCursorA@8
extern CreateSolidBrush@4: proc
extern CreatePen@12: proc
extern SelectObject@8: proc
extern Rectangle@20: proc
extern CreateSolidBrush@4: proc
extern Ellipse@20: proc
extern TextOutA@20: proc
extern CreateFontA@56: proc
extern SetGraphicsMode@8: proc
GM_ADVANCED    equ 2
extern SendMessageA@16: proc
SendMessageA equ SendMessageA@16
WM_SETFONT  equ 40h
extern GetStockObject@4: proc
DEFAULT_GUI_FONT equ 20
extern SetBkMode@8: proc
extern TextOutW@20: proc
extern SetTextColor@8: proc
extern SetBkColor@8: proc
extern InvalidateRect@12: proc
extern BeginPaint@8: proc
extern EndPaint@8: proc
extern DeleteObject@4: proc
extern SetWorldTransform@8: proc
extern DefWindowProcA@16: proc
extern PostQuitMessage@4: proc
DefWindowProcA equ DefWindowProcA@16
PostQuitMessage equ PostQuitMessage@4
extern GetWindowTextA@12:proc
getwindowtext  equ GetWindowTextA@12
extern BeginPaint@8: proc
BeginPaint equ BeginPaint@8
extern EndPaint@8: proc
EndPaint equ EndPaint@8
extern TextOutA@20: proc
TextOutA equ TextOutA@20
extern atoi: proc
extern TranslateMessage@4: proc
TranslateMessage equ TranslateMessage@4
extern fclose: proc
close equ fclose 
extern fprintf: proc
extern malloc: proc
extern free: proc
extern GetClientRect@8:proc
GetClientRect equ GetClientRect@8
extern GetSysColorBrush@4: proc
GetSysColorBrush equ GetSysColorBrush@4
extern FillRect@12:proc
FillRect equ FillRect@12
extern wsprintfA:proc
extern GetDlgItemTextA@16: proc
GetDlgItemTextA equ GetDlgItemTextA@16
extern  MessageBoxA@16: proc
MessageBox equ MessageBoxA@16
extern lstrcmpA@8: proc