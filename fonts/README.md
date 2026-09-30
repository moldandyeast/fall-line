# Fonts

`public/index.html` inlines two webfonts as base64 woff2 so the page makes no third-party requests:

- **Archivo** (variable, wdth 62–125, wght 100–900) — Copyright 2020 The Archivo Project Authors, SIL Open Font License 1.1. See `OFL-Archivo.txt`.
- **IBM Plex Mono** 400 / 500 / 600 — Copyright 2017 IBM Corp., Reserved Font Name "Plex", SIL Open Font License 1.1. See `OFL-IBM-Plex-Mono.txt`.

Both are subset to the codepoints the page uses (ASCII printable plus the arrows, maths and typographic symbols listed in `subset.sh`). Run `./subset.sh` (needs `python3` with `fonttools` and `brotli`) to rebuild them from the Google Fonts repo.
