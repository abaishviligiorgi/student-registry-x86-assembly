# Student Registration System in x86 Assembly

A desktop application for registering students and searching through a local database, built using **x86 Assembly (MASM)** and the native **Windows API (Win32)**.

## Features
- **Data Entry & Validation:** Graphical input fields for Name, Surname, Age, and Rating.
- **Local Database Persistence:** Saves and reads student records dynamically using a file-based storage stream (`history.txt`).
- **Real-time Filter & Search:** Allows searching records by name or surname with instant UI feedback in a secondary ListBox.
- **Custom UI Rendering:** Implements native Win32 controls (EDIT, BUTTON, STATIC, LISTBOX) wrapped with custom background brush handlers.

## Architecture
- `main.asm` — Implements the main window architecture, system message router, component creation, and operational click triggers.
- `data.asm` — Holds global system templates, UI text buffers, component handles, and data communication structures.
- `write.asm` — Handles memory stream allocations (`malloc`/`free`) and low-level file I/O operations (`fopen`, `fwrite`, `fread`, `fseek`).
- `extern.asm` — Declares external system bindings and graphical kernel procedures.

## How to Run
1. Open `StudentRegister.sln` in **Visual Studio 2022** (or newer).
2. Set the build configuration platform to **x86** (Win32).
3. Ensure `history.txt` is present in the same root directory as the source code executable.
4. Press **F5** or click **Local Windows Debugger** to compile and run.

## Controls
- Fill in the student fields and click **Register Student** to save to the database.
- Use the lower search inputs and click **Search** to filter registered items.
- Click `X` or press close to safely exit the application and release system resources.