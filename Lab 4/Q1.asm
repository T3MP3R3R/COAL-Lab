.386
.model flat, stdcall
option casemap:none

include windows.inc
include user32.inc
include kernel32.inc
includelib user32.lib
includelib kernel32.lib

WinMain proto :DWORD,:DWORD,:DWORD,:DWORD

.data
    ClassName db "SimpleWinClass",0
    AppName   db "KeyRush Window",0

.code
start:
    invoke GetModuleHandle, NULL
    invoke WinMain, eax, NULL, NULL, SW_SHOWDEFAULT
    invoke ExitProcess, eax

WinMain proc hInst:HINSTANCE,hPrevInst:HINSTANCE,CmdLine:LPSTR,CmdShow:DWORD
    LOCAL wc:WNDCLASSEX
    LOCAL msg:MSG
    LOCAL hwnd:HWND

    mov wc.cbSize, SIZEOF WNDCLASSEX
    mov wc.style, CS_HREDRAW or CS_VREDRAW
    mov wc.lpfnWndProc, offset WndProc
    mov wc.cbClsExtra,0
    mov wc.cbWndExtra,0
    push hInst
    pop wc.hInstance
    mov wc.hbrBackground,COLOR_WINDOW+1
    mov wc.lpszMenuName,0
    mov wc.lpszClassName, offset ClassName
    invoke LoadIcon,0,IDI_APPLICATION
    mov wc.hIcon,eax
    mov wc.hIconSm,eax
    invoke LoadCursor,0,IDC_ARROW
    mov wc.hCursor,eax
    invoke RegisterClassEx, addr wc

    invoke CreateWindowEx,0,addr ClassName,addr AppName,\
           WS_OVERLAPPEDWINDOW,CW_USEDEFAULT,CW_USEDEFAULT,\
           500,400,NULL,NULL,hInst,NULL
    mov hwnd,eax

    invoke ShowWindow, hwnd, SW_SHOWNORMAL
    invoke UpdateWindow, hwnd

    .while TRUE
        invoke GetMessage, addr msg,NULL,0,0
        .break .if (!eax)
        invoke TranslateMessage, addr msg
        invoke DispatchMessage, addr msg
    .endw

    mov eax,msg.wParam
    ret
WinMain endp

WndProc proc hwnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
    .if uMsg==WM_DESTROY
        invoke PostQuitMessage,0
    .else
        invoke DefWindowProc, hwnd,uMsg,wParam,lParam
        ret
    .endif
    xor eax,eax
    ret
WndProc endp

end start