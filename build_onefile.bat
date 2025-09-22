@echo off
echo ======================================
echo    NOPPANALYS - ONE FILE BUILD SCRIPT
echo ======================================

echo.
echo 1. Skapar ren build-miljö...
if exist .build_venv (
    rmdir /s /q .build_venv
)
python -m venv .build_venv

echo.
echo 2. Aktiverar build-miljö...
call .build_venv\Scripts\activate.bat

echo.
echo 3. Installerar minimala beroenden...
.build_venv\Scripts\pip.exe install -r requirements_minimal.txt

if errorlevel 1 (
    echo FELMEDDELANDE: Kunde inte installera beroenden!
    pause
    exit /b 1
)

echo.
echo 4. Bygger single-file executable...
.build_venv\Scripts\pyinstaller.exe noppanalys_onefile.spec --clean --noconfirm

if errorlevel 1 (
    echo FELMEDDELANDE: PyInstaller misslyckades!
    pause
    exit /b 1
)

echo.
echo 5. Rensa upp build-miljö...
call .build_venv\Scripts\deactivate.bat
rmdir /s /q .build_venv

echo.
echo ======================================
echo    ONE-FILE BYGGE KLART!
echo ======================================
echo.
echo Single executable finns i: dist\Noppanalys.exe
echo.
echo Detta är en enda fil som innehåller allt!
echo Första körningen kan ta lite längre tid då filer extraheras temporärt.
echo.
echo Filstorlek bör vara omkring 300MB i en enda fil.
echo.
pause