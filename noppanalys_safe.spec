# -*- mode: python ; coding: utf-8 -*-
# Safe Windows build configuration - no strip, no UPX

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
        'jaraco.text',
        'jaraco.functools',
        'jaraco.context',
        'importlib_metadata',
        'more_itertools',
    ],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[
        'torch',
        'tensorflow',
        'transformers',
        'accelerate',
        'datasets',
        'huggingface_hub',
        'tokenizers',
        'torchvision',
        'torchaudio',
        'pandas',
        'pyarrow',
        'aiohttp',
        'dill',
        'fsspec',
        'requests',
        'urllib3',
        'certifi',
        'charset-normalizer',
        'idna',
        'aiosignal',
        'frozenlist',
        'attrs',
        'regex',
        'pyyaml',
        'filelock',
        'tqdm',
        'psutil',
        'pip'
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
    strip=False,  # Disabled for Windows compatibility
    upx=False,    # Disabled to avoid compression issues
    console=False,  # GUI-applikation, ingen konsol
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=None,  # Kan läggas till senare om ikon finns
)

coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,  # Disabled for Windows compatibility
    upx=False,    # Disabled to avoid compression issues
    upx_exclude=[],
    name='Noppanalys'
)