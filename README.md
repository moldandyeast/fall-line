# Falllinie

An endless snowboard descent down a procedural mountain, drawn like a two-ink Swiss print, with a soundtrack written live in WebAudio. Tricks fill the meter, the meter is boost, a full meter unlocks über tricks. By RM.

Live: https://fall-line.moldandyeast.com

After [SSX](https://en.wikipedia.org/wiki/SSX_(2000_video_game)), [SSX Tricky](https://en.wikipedia.org/wiki/SSX_Tricky) and [SSX 3](https://en.wikipedia.org/wiki/SSX_3): adrenaline meter as boost, übers gated on a full meter, letters earned per über, combos that reward variety and punish repeats.

More at https://content.moldandyeast.com · follow [@nilsedison](https://twitter.com/nilsedison) on Twitter · [source on GitHub](https://github.com/moldandyeast/fall-line).

## Structure

- `public/index.html` — the whole piece: one WebGL 2 canvas, no build step, no third-party requests. The two webfonts (Archivo, IBM Plex Mono) are subset to the characters the page uses and inlined as base64, so the file runs offline when saved to disk.
- `fonts/` — the font licences (SIL OFL 1.1) and `subset.sh`, which rebuilds the subset woff2 files from the Google Fonts repo.
- `wrangler.jsonc` — Cloudflare Worker serving `public/` as static assets on the custom domain. No server code.

## Controls

← → carve, in the air spin · ↑ ↓ tuck and brake, in the air flip · Space hold to crouch, release to jump · U I J K grabs · Shift boost, with a full meter Shift + grab is an über · M music · Esc pause · N design notes · C colour scheme. Gamepad and touch work too.

## Run locally

```sh
npm install
npm run dev
```

## Deploy

Deploys are manual, there is no CI. Uses your existing `wrangler login` session.

```sh
npm run deploy
```
