@echo off
echo ======================================
echo    NOPPANALYS - BUILD SCRIPT
echo ======================================

echo.
echo 1. Aktiverar .venv miljö...
call ..\.venv\Scripts\activate.bat

echo.
echo 2. Installerar beroenden...
..\.venv\Scripts\pip.exe install -r requirements.txt

if errorlevel 1 (
    echo FELMEDDELANDE: Kunde inte installera beroenden!
    pause
    exit /b 1
)

echo.
echo 3. Bygger standalone executable...
..\.venv\Scripts\pyinstaller.exe noppanalys.spec --clean --noconfirm

if errorlevel 1 (
    echo FELMEDDELANDE: PyInstaller misslyckades!
    pause
    exit /b 1
)

echo.
echo ======================================
echo    BYGGET KLART!
echo ======================================
echo.
echo Executable finns i: dist\Noppanalys.exe
echo.
echo För att testa programmet:
echo cd dist
echo Noppanalys.exe
echo.
pause