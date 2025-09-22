# Noppanalys Application

This is the standalone Noppanalys application moved to its own directory with all required dependencies.

## Directory Structure

```
noppanalys_app/
├── src/
│   ├── noppanalys_gui.py    # Main application file
│   └── assets/
│       ├── EU_logga.png     # EU logo
│       └── wargon_logo.png  # Wargön logo
├── build_output/
│   ├── build/               # PyInstaller build artifacts
│   └── dist/                # Built executable
├── requirements.txt         # Python dependencies
├── noppanalys.spec         # PyInstaller configuration
├── build.bat               # Windows build script
└── README.md               # This file
```

## Building the Application

### Option 1: Minimal Build (Recommended - ~300MB)
1. Make sure you have Python and pip installed
2. Run the minimal build script:
   ```bash
   cd noppanalys_app
   build_minimal.bat
   ```
   This creates a clean virtual environment with only required dependencies, resulting in a much smaller executable (~300MB instead of 2GB).

### Option 1b: Single File Build (Recommended - ~300MB in one file)
1. Make sure you have Python and pip installed
2. Run the single file build script:
   ```bash
   cd noppanalys_app
   build_onefile.bat
   ```
   This creates a single executable file that contains everything. First startup may be slightly slower as files are extracted temporarily.

### Option 2: Using Existing Environment
1. Make sure you have Python and pip installed
2. Create and activate a virtual environment in the parent directory:
   ```bash
   cd ..
   python -m venv .venv
   .venv\Scripts\activate
   ```
3. Run the build script:
   ```bash
   cd noppanalys_app
   build.bat
   ```
   **Warning**: This may result in a very large executable if your .venv contains many packages.

## Running the Application

### From Source
```bash
cd src
python noppanalys_gui.py
```

### Built Executable
```bash
cd build_output\dist\Noppanalys
Noppanalys.exe
```

## Dependencies

The application requires the following Python packages:

### Minimal Dependencies (requirements_minimal.txt - Recommended):
- numpy >= 1.21.0
- opencv-python >= 4.5.0
- matplotlib >= 3.5.0
- scipy >= 1.7.0
- scikit-image >= 0.18.0
- Pillow >= 8.0.0
- scikit-learn >= 1.0.0
- PyWavelets >= 1.1.0
- pyinstaller >= 4.5.0

### All Dependencies (requirements.txt):
Includes additional packages that may not be needed for basic functionality but are present in the original environment.

## Optimization Notes

The original build was 2GB because it included many unnecessary packages like:
- torch, tensorflow (deep learning frameworks)
- transformers, accelerate, datasets (Hugging Face libraries)
- pandas, pyarrow (data processing)
- aiohttp, requests (web libraries)

The optimized build excludes these and results in a much smaller executable.