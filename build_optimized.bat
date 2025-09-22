@echo off
echo ======================================
echo    NOPPANALYS - OPTIMIZED BUILD SCRIPT
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
echo 4. Bygger optimerad standalone executable...
echo Försöker först med optimerad konfiguration...
.build_venv\Scripts\pyinstaller.exe noppanalys.spec --clean --noconfirm

if errorlevel 1 (
    echo.
    echo Optimerad build misslyckades, försöker med säker konfiguration...
    .build_venv\Scripts\pyinstaller.exe noppanalys_safe.spec --clean --noconfirm

    if errorlevel 1 (
        echo FELMEDDELANDE: Båda PyInstaller-konfigurationerna misslyckades!
        pause
        exit /b 1
    )
)

echo.
echo 5. Rensa upp build-miljö...
call .build_venv\Scripts\deactivate.bat
rmdir /s /q .build_venv

echo.
echo ======================================
echo    OPTIMERAT BYGGE KLART!
echo ======================================
echo.
echo Executable finns i: dist\Noppanalys.exe
echo.
echo Filstorlek ska nu vara mycket mindre!
echo.
pause