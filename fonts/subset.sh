#!/usr/bin/env sh
# Rebuilds the subset webfonts inlined in public/index.html.
# Sources: Google Fonts repo (github.com/google/fonts), both under the SIL OFL 1.1 (see OFL-*.txt).
# Codepoints = every character that appears in the page (ASCII printable plus the symbols listed below).
set -e
U='U+0020-007E,U+00AD,U+00B0,U+00B1,U+00B2,U+00B7,U+00BD,U+00D7,U+00DC,U+00F6,U+00FC,U+0394,U+03A3,U+03B3,U+03BB,U+03C6,U+1D62,U+2013,U+2014,U+2019,U+207F,U+2190,U+2191,U+2192,U+2193,U+2202,U+2208,U+2212,U+221A,U+221E,U+222B,U+2248,U+22A5'
curl -sSL -o Archivo.ttf 'https://raw.githubusercontent.com/google/fonts/main/ofl/archivo/Archivo%5Bwdth%2Cwght%5D.ttf'
for w in Regular Medium SemiBold; do curl -sSL -o IBMPlexMono-$w.ttf "https://raw.githubusercontent.com/google/fonts/main/ofl/ibmplexmono/IBMPlexMono-$w.ttf"; done
python3 -m fontTools.subset Archivo.ttf --unicodes="$U" --flavor=woff2 --layout-features='*' --no-hinting --desubroutinize --output-file=Archivo-subset.woff2
for w in Regular Medium SemiBold; do python3 -m fontTools.subset IBMPlexMono-$w.ttf --unicodes="$U" --flavor=woff2 --layout-features='*' --no-hinting --output-file=IBMPlexMono-$w-subset.woff2; done
for f in *.woff2; do echo "$f: $(base64 -i "$f" | wc -c) bytes base64"; done
