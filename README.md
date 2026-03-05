# Favicon Generator CLI

A Node.js CLI tool that generates a full set of favicons from PNG and SVG source images. Outputs optimized icons in 
multiple sizes and formats (ICO, Apple Touch Icon, Android Chrome, etc.) ready for cross-browser use.

[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square&logo=opensource)](LICENSE)

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Sponsorship](#sponsorship)
- [License](#license)

## Features

- **Generated files:**
  - `favicon.ico` (multi-size: 16px, 32px, 48px, 256px from PNG)
  - `favicon.svg` (optimized from source SVG)
  - `favicon-16x16.png`
  - `favicon-32x32.png`
  - `favicon-48x48.png`
  - `apple-touch-icon.png` (180×180px)
  - `icon-192.png` and `icon-512.png` (for Android/PWA manifest)
- **PNG and SVG input:** Accepts both formats as source material. Defaults
  to `./favicon_src.png` and `./favicon_src.svg`.
- **Image optimization:** Uses `sharp` for PNG resizing,
  `imagemin` + `imagemin-pngquant` for PNG compression, `svgo` for SVG
  optimization, and `png2icons` for ICO generation.
- **Custom output directory:** Specify an output path with `--dist`, or let
  the tool create a `favicons_xxxx` directory in the current working directory.
- **CLI arguments:** Simple command-line interface with `--help` for usage
  details.
- **Error handling:** Reports missing source files and image processing
  failures.

> **Note:** This tool does not generate a 512×512 maskable icon for PWA
> safe-zone compliance. This must be created separately using a tool
> like [maskable.app](https://maskable.app/editor). Make sure your PWA
> manifest references the maskable icon alongside other icons.

## Prerequisites

- [Node.js](https://nodejs.org/) v18 or higher (the script uses ES modules)
- npm packages:
  - imagemin 
  - imagemin-pngquant
  - sharp
  - svgo
  - png2icons
  
## Installation

1. **Install dependencies:**
   ```bash
   npm install -g imagemin imagemin-pngquant sharp svgo png2icons
   ```

2. **Clone the repository and copy the script to a directory in your `PATH` variable for global access
   (e.g. `~/.local/bin/`), rename the script if needed (e.g. to `favgen`):**
   ```bash
   git clone https://github.com/andmitr/favicon-generator-cli.git
   cp ./favicon-generator-cli/fn_generate_favicons ~/.local/bin/favgen
   ```   

   or **download only the script:**
   ```bash
   curl -o ./favgen https://github.com/andmitr/favicon-generator-cli/blob/master/fn_generate_favicons
   ```

3. **Make the script executable:**
   ```bash
   chmod +x ~/.local/bin/favgen
   ```

## Usage

```bash
favgen [--png <path>] [--svg <path>] [--dist <output-dir>]
```

### Arguments

| Argument | Alias | Default           | Description                          |
|----------|-------|-------------------|--------------------------------------|
| --png    | -p    | ./favicon_src.png | Path to the source PNG image         |
| --svg    | -s    | ./favicon_src.svg | Path to the source SVG image         |
| --dist   | -d    | ./favicons_xxxx   | Output directory for generated files |
| --help   | -h    | —                 | Show help message and exit           |

### Examples
```bash
# Custom source files and output directory
favgen --png ./myicon.png --svg ./myicon.svg --dist ./favs

# Default source files, custom output directory
favgen --dist icons
```

### HTML Usage

Add the generated favicons to the `<head>` of your HTML:
```html
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.svg" sizes="any" type="image/svg+xml">
<link rel="icon" href="/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="icon" href="/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/favicon-48x48.png" sizes="48x48" type="image/png">
<link rel="apple-touch-icon" href="/apple-touch-icon.png" type="image/png">
<link rel="manifest" href="/manifest.webmanifest">
```
Reference `icon-192.png` and `icon-512.png` in your `manifest.webmanifest`.

## Sponsorship

[![Boosty](https://img.shields.io/badge/Boosty-F15F2C?style=for-the-badge&logo=boosty&logoColor=white)![Support](https://img.shields.io/badge/Support%20me-grey?style=for-the-badge)](https://boosty.to/andmitr/donate)

![Bitcoin](https://img.shields.io/badge/Bitcoin-F7931A?style=flat&logo=bitcoin&logoColor=white&logoSize=auto)

```
1CCnwAvJYEoDVGM7vsBg2Q99cF9EHtBVaY
```

![Tether](https://img.shields.io/badge/Tether%20(USDT%20ETH)-168363?style=flat&logo=tether&logoColor=white&logoSize=auto)

```
0x54f0ccc6b2987de454f69f2814fc9202bcfb74fe
```

## License

MIT Licensed. See [LICENSE](LICENSE) for details.
