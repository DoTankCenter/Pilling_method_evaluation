# -*- mode: python ; coding: utf-8 -*-
# Minimal exclusion build - only exclude the heaviest packages

block_cipher = None

a = Analysis(
    ['src/noppanalys_gui.py'],
    pathex=[],
    binaries=[],
    datas=[
        ('src/assets/EU_logga.png', '.'),      # Inkludera EU-logotyp
        ('src/assets/wargon_logo.png', '.'),   # Inkludera Wargön-logotyp
    ],
    hiddenimports=[
        'PIL._tkinter_finder',
        'pkg_resources.py2_warn',
        'sklearn.utils._cython_blas',
        'sklearn.neighbors.typedefs',
        'sklearn.neighbors.quad_tree',
        'sklearn.tree._utils',
        'pywt._extensions._cwt',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[
        # Only exclude the heaviest packages that cause 2GB bloat
        'torch',
        'tensorflow',
        'transformers',
        'accelerate',
        'datasets',
        'huggingface_hub',
        'torchvision',
        'torchaudio',
    ],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='Noppanalys',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=False,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=None,
)

coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=False,
    upx_exclude=[],
    name='Noppanalys'
)