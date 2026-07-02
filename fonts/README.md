# Fonts

Fonts for PDF generation. The repo bundles freely redistributable fonts and provides download scripts for others.

## Bundled Fonts

| Directory | Font | License | Use |
|-----------|------|---------|-----|
| `fonts/times/` | Times New Roman (4 variants) | MS-EULA | Question papers, answers |
| `fonts/dejavu/` | DejaVu Sans/Serif/Mono (22 variants) | SIL OFL | Fallback serif, sans, mono |
| `fonts/caskaydia/` | CaskaydiaCove Nerd Font Mono (4 variants) | MIT | Monospace code in PDFs |
| `fonts/termes-math/` | TeX Gyre Termes Math | GFL | Serif math font (Times-compatible) |
| `fonts/noto-sans-devanagari/` | Noto Sans Devanagari (2 variants) | SIL OFL | Hindi/Marathi/Sanskrit body text |
| `fonts/noto-serif-devanagari/` | Noto Serif Devanagari (2 variants) | SIL OFL | Hindi/Marathi/Sanskrit headings |
| `fonts/shobhika/` | Shobhika by IIT Bombay (2 variants) | SIL OFL | Sanskrit/Marathi academia, 1100+ conjuncts |
| `fonts/mukta/` | Mukta by Ek Type (2 variants) | SIL OFL | Multi-script Indian (Deva+Gujr+Guru+Taml) |
| `fonts/opendyslexic/` | OpenDyslexic (3 variants) | SIL OFL | Dyslexia-friendly exam papers |
| `fonts/klee/` | Klee by Fontworks (3 variants) | SIL OFL | Pencil handwriting for sample answers |
| `fonts/patrick-hand/` | Patrick Hand | SIL OFL | Friendly handwriting for notes |
| `fonts/chilanka/` | Chilanka by SMC | SIL OFL | Malayalam handwriting |
| `fonts/STIXTwoMath-Regular.ttf` | STIX Two Math | SIL OFL | Math font |
| `fonts/caveat/` | Caveat | SIL OFL | Notebook renderer (run `npm run fonts:install`) |

## Font Family Names

When using these fonts in CSS `font-family`:

| Dir | CSS `font-family` |
|-----|-------------------|
| times | `'TNR'` |
| dejavu | `'DejaVu Sans'`, `'DejaVu Serif'`, `'DejaVu Sans Mono'` |
| caskaydia | `'Cask NFM'` |
| termes-math | `'TeX Gyre Termes Math'` |
| STIXTwoMath | `'STIX Two Math'` |
| noto-sans-devanagari | `'Noto Sans Devanagari'` |
| noto-serif-devanagari | `'Noto Serif Devanagari'` |
| shobhika | `'Shobhika'` |
| mukta | `'Mukta'` |
| opendyslexic | `'OpenDyslexic3'` |
| klee | `'Klee'` |
| patrick-hand | `'Patrick Hand'` |
| chilanka | `'Chilanka'` |

## Font Resolution Order

Scripts search subdirectories of `fonts/` in this order:
1. `fonts/times/` — Times New Roman (primary body font)
2. `fonts/dejavu/` — DejaVu (generic fallback serif/sans/mono)
3. `fonts/caskaydia/` — CaskaydiaCove (monospace code)
4. `fonts/termes-math/` + `STIXTwoMath-Regular.ttf` — math symbols
5. `fonts/noto-sans-devanagari/` + `fonts/noto-serif-devanagari/` — Devanagari scripts
6. `fonts/shobhika/` — Sanskrit/Marathi
7. `fonts/mukta/` — multi-script Indian
8. `fonts/opendyslexic/` — accessibility
9. `fonts/klee/` + `fonts/patrick-hand/` — handwriting/sample answers
10. `fonts/chilanka/` — Malayalam
11. System fonts: Linux `/usr/share/fonts/`, macOS `/Library/Fonts`, Windows `C:\Windows\Fonts`

## Install Missing Fonts

```bash
# Download free fonts (Caveat, Noto)
bash scripts/download-fonts.sh

# Or via npm
npm run fonts:install
```

For **Cambria / Cambria Math** (math rendering), install system fonts:
- **macOS / Windows**: Pre-installed
- **Linux**: `sudo apt install fonts-cambria` or use `fonts/termes-math/` fallback
