@echo off
echo ======================================
echo    NOPPANALYS - MINIMAL BUILD SCRIPT
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
echo 4. Bygger med minimal konfiguration...
.build_venv\Scripts\pyinstaller.exe noppanalys_minimal.spec --clean --noconfirm

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
echo    MINIMALT BYGGE KLART!
echo ======================================
echo.
echo Executable finns i: dist\Noppanalys.exe
echo.
echo Detta bygge utesluter endast de tyngsta paketen (torch, tensorflow, etc.)
echo för att undvika PyInstaller-konflikter.
echo.
pause