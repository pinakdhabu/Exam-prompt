# Fonts

Fonts for PDF generation. The repo bundles freely redistributable fonts and provides download scripts for others.

## ⚠️ Legal Disclaimer for Contributors

> **All fonts in this repository MUST be freely redistributable under open-source licenses (SIL OFL, MIT, GFL, GUST Font License).**
>
> **DO NOT** add proprietary or commercial fonts (e.g., Times New Roman, Arial, Helvetica, Cambria, Calibri, Adobe fonts, commercial Google Fonts) to this repository.
>
> **Why:** This repo is distributed to users worldwide via GitHub. Including proprietary fonts exposes both the project and its users to copyright infringement liability.
>
> **What we do instead:** TeX Gyre Termes (GFL) replaces Times New Roman. DejaVu replaces Arial/Helvetica. Noto fonts (SIL OFL) cover 25+ world scripts. If a user's system has licensed versions of proprietary fonts, the renderer prefers system fonts automatically.
>
> **If you need a new font:** Check it has a SIL OFL, MIT, or GFL license **before** adding it. When in doubt, ask in a GitHub issue first.
>
> **Users:** You are responsible for ensuring your usage of any font complies with its license.

## Script Coverage

| Script | Languages | Fonts |
|--------|-----------|-------|
| **Latin** | English, French, German, Spanish, Portuguese, Italian, Dutch, Swedish, Norwegian, Danish, Finnish, Polish, Czech, Hungarian, Romanian, Vietnamese, Indonesian, Malay, Turkish, Swahili, Tagalog, and 200+ more | TeX Gyre Termes, DejaVu Sans/Serif/Mono, CaskaydiaCove |
| **Devanagari** | Hindi, Marathi, Sanskrit, Nepali, Konkani, Bhojpuri | Noto Sans/Serif Devanagari, Shobhika, Mukta |
| **Bengali** | Bengali, Assamese, Maithili | Noto Sans Bengali |
| **Gujarati** | Gujarati | Noto Sans Gujarati, Mukta |
| **Gurmukhi** | Punjabi (India) | Noto Sans Gurmukhi, Mukta |
| **Tamil** | Tamil (India, Sri Lanka, Singapore, Malaysia) | Noto Sans Tamil |
| **Telugu** | Telugu | Noto Sans Telugu |
| **Kannada** | Kannada | Noto Sans Kannada |
| **Malayalam** | Malayalam | Noto Sans Malayalam, Chilanka (handwriting) |
| **Odia** | Odia | Noto Sans Oriya |
| **Sinhala** | Sinhala (Sri Lanka) | Noto Sans Sinhala |
| **Arabic** | Arabic, Urdu, Persian, Pashto, Sindhi, Kurdish, Uyghur, Balochi | Noto Naskh Arabic |
| **Hebrew** | Hebrew, Yiddish, Ladino | Noto Sans Hebrew |
| **Thai** | Thai | Noto Sans Thai |
| **Lao** | Lao | Noto Sans Lao |
| **Khmer** | Khmer (Cambodia) | Noto Sans Khmer |
| **Myanmar** | Burmese, Karen, Mon, Shan | Noto Sans Myanmar |
| **CJK (Han)** | Chinese (Simplified, Traditional), Japanese, Korean | Noto Sans CJK SC/TC/JP/KR/HK |
| **Armenian** | Armenian | Noto Sans Armenian |
| **Georgian** | Georgian | Noto Sans Georgian |
| **Ethiopic** | Amharic, Tigrinya, Oromo, Somali, Ge'ez | Noto Sans Ethiopic |
| **Greek** | Greek (Ancient + Modern) | DejaVu Serif/Sans, TeX Gyre Termes |
| **Cyrillic** | Russian, Ukrainian, Bulgarian, Serbian, Belarusian, Kazakh, Mongolian, and 50+ more | DejaVu Serif/Sans, TeX Gyre Termes |

## Bundled Fonts

| Directory | Font | License | Script Coverage |
|-----------|------|:-------:|-----------------|
| `fonts/termes/` | TeX Gyre Termes (4 variants) | GFL | Latin, Greek, Cyrillic |
| `fonts/dejavu/` | DejaVu Sans/Serif/Mono (22 variants) | SIL OFL | Latin, Greek, Cyrillic, IPA |
| `fonts/caskaydia/` | CaskaydiaCove Nerd Font Mono (4 variants) | MIT | Latin (monospace) |
| `fonts/termes-math/` | TeX Gyre Termes Math | GFL | Math symbols |
| `fonts/noto-sans-devanagari/` | Noto Sans Devanagari (2 variants) | SIL OFL | Devanagari |
| `fonts/noto-serif-devanagari/` | Noto Serif Devanagari (2 variants) | SIL OFL | Devanagari |
| `fonts/shobhika/` | Shobhika by IIT Bombay (2 variants) | SIL OFL | Devanagari (Sanskrit/Marathi) |
| `fonts/mukta/` | Mukta by Ek Type (2 variants) | SIL OFL | Devanagari, Gujarati, Gurmukhi, Tamil |
| `fonts/noto-sans-bengali/` | Noto Sans Bengali (2 variants) | SIL OFL | Bengali, Assamese |
| `fonts/noto-sans-gujarati/` | Noto Sans Gujarati (2 variants) | SIL OFL | Gujarati |
| `fonts/noto-sans-gurmukhi/` | Noto Sans Gurmukhi (2 variants) | SIL OFL | Gurmukhi |
| `fonts/noto-sans-tamil/` | Noto Sans Tamil (2 variants) | SIL OFL | Tamil |
| `fonts/noto-sans-telugu/` | Noto Sans Telugu (2 variants) | SIL OFL | Telugu |
| `fonts/noto-sans-kannada/` | Noto Sans Kannada (2 variants) | SIL OFL | Kannada |
| `fonts/noto-sans-malayalam/` | Noto Sans Malayalam (2 variants) | SIL OFL | Malayalam |
| `fonts/noto-sans-oriya/` | Noto Sans Oriya (2 variants) | SIL OFL | Odia |
| `fonts/noto-sans-sinhala/` | Noto Sans Sinhala (2 variants) | SIL OFL | Sinhala |
| `fonts/noto-sans-arabic/` | Noto Naskh Arabic (2 variants) | SIL OFL | Arabic, Urdu, Persian |
| `fonts/noto-sans-hebrew/` | Noto Sans Hebrew (2 variants) | SIL OFL | Hebrew |
| `fonts/noto-sans-thai/` | Noto Sans Thai (2 variants) | SIL OFL | Thai |
| `fonts/noto-sans-lao/` | Noto Sans Lao (2 variants) | SIL OFL | Lao |
| `fonts/noto-sans-khmer/` | Noto Sans Khmer (2 variants) | SIL OFL | Khmer |
| `fonts/noto-sans-myanmar/` | Noto Sans Myanmar (2 variants) | SIL OFL | Myanmar |
| `fonts/noto-sans-cjk-sc/` | Noto Sans CJK SC (Regular) | SIL OFL | Simplified Chinese |
| `fonts/noto-sans-cjk-tc/` | Noto Sans CJK TC (Regular) | SIL OFL | Traditional Chinese (Taiwan) |
| `fonts/noto-sans-cjk-hk/` | Noto Sans CJK HK (Regular) | SIL OFL | Traditional Chinese (Hong Kong) |
| `fonts/noto-sans-cjk-jp/` | Noto Sans CJK JP (Regular) | SIL OFL | Japanese |
| `fonts/noto-sans-cjk-kr/` | Noto Sans CJK KR (Regular) | SIL OFL | Korean |
| `fonts/noto-sans-armenian/` | Noto Sans Armenian (2 variants) | SIL OFL | Armenian |
| `fonts/noto-sans-georgian/` | Noto Sans Georgian (2 variants) | SIL OFL | Georgian |
| `fonts/noto-sans-ethiopic/` | Noto Sans Ethiopic (2 variants) | SIL OFL | Ethiopic |
| `fonts/opendyslexic/` | OpenDyslexic (3 variants) | SIL OFL | Latin (accessibility) |
| `fonts/klee/` | Klee by Fontworks (3 variants) | SIL OFL | Latin (handwriting) |
| `fonts/patrick-hand/` | Patrick Hand | SIL OFL | Latin (handwriting) |
| `fonts/chilanka/` | Chilanka by SMC | SIL OFL | Malayalam (handwriting) |
| `fonts/STIXTwoMath-Regular.ttf` | STIX Two Math | SIL OFL | Math symbols |
| `fonts/caveat/` | Caveat | SIL OFL | Latin (handwriting, install via `fonts:install`) |

## Font Family Names

| Dir | CSS `font-family` |
|-----|-------------------|
| termes | `'TNR'` (mapped to TeX Gyre Termes) |
| dejavu | `'DejaVu Sans'`, `'DejaVu Serif'`, `'DejaVu Sans Mono'` |
| caskaydia | `'Cask NFM'` |
| termes-math | `'TeX Gyre Termes Math'` |
| STIXTwoMath | `'STIX Two Math'` |
| **All Noto Sans fonts** | `'Noto Sans <Script>'` (e.g., `'Noto Sans Devanagari'`) |
| **All Noto Serif fonts** | `'Noto Serif <Script>'` |
| **CJK** | `'Noto Sans CJK SC'`, `'Noto Sans CJK TC'`, `'Noto Sans CJK JP'`, `'Noto Sans CJK KR'`, `'Noto Sans CJK HK'` |
| shobhika | `'Shobhika'` |
| mukta | `'Mukta'` |
| opendyslexic | `'OpenDyslexic3'` |
| klee | `'Klee'` |
| patrick-hand | `'Patrick Hand'` |
| chilanka | `'Chilanka'` |

## Install Missing Fonts

```bash
# Download all downloadable fonts
bash scripts/download-fonts.sh

# Or via npm
npm run fonts:install
```

For CJK Serif fonts or additional weights:
- Noto Serif CJK: https://github.com/notofonts/noto-cjk/releases
- Google Fonts: https://fonts.google.com/

System font fallback order: Linux `/usr/share/fonts/` → macOS `/Library/Fonts` → Windows `C:\Windows\Fonts`
