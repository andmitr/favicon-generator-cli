# Favicon Generator CLI

A Node.js CLI tool that generates a full set of favicons from PNG and SVG source images. Outputs optimized icons in 
multiple sizes and formats (ICO, Apple Touch Icon, Android Chrome, etc.) ready for cross-browser use.

[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square&logo=opensource)](LICENSE) 

[![npm version](https://img.shields.io/npm/v/favicon-generator-cli?style=flat-square&logo=npm)](https://www.npmjs.com/package/favicon-generator-cli)
[![npm downloads](https://img.shields.io/npm/dm/favicon-generator-cli?style=flat-square&logo=npm&color=blue)](https://www.npmjs.com/package/favicon-generator-cli)

[![Docker](https://img.shields.io/badge/ghcr.io-container-blue?style=flat-square&logo=docker)](https://github.com/andmitr/favicon-generator-cli/pkgs/container/favicon-generator-cli)

## Table of Contents

- [Features](#features)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Usage](#usage)
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

## Dependencies

- [Node.js](https://nodejs.org/) v24 LTS (tested and recommended version, specified in `.nvmrc`)
- Docker (if you choose to run the tool via container)
- npm packages (installed automatically with the tool):
  - imagemin 
  - imagemin-pngquant
  - sharp
  - svgo
  - png2icons
  
## Installation

### From npm

```bash
sudo npm install -g favicon-generator-cli
```

### From GitHub

```bash
sudo npm install -g git+https://github.com/andmitr/favicon-generator-cli.git
```

### From Docker Registry (GitHub Container Registry)

```bash
docker pull ghcr.io/andmitr/favicon-generator-cli:latest
```

To use a shorter image name locally, create a tag:

```shell
docker tag ghcr.io/andmitr/favicon-generator-cli:latest favgen
```

### Uninstall

```bash
sudo npm uninstall -g favicon-generator-cli
```

### Troubleshooting: libvips conflict

If you have libvips installed system-wide, sharp installation may fail. Use SHARP_IGNORE_GLOBAL_LIBVIPS=1 to bypass it:

```bash
# From npm
sudo SHARP_IGNORE_GLOBAL_LIBVIPS=1 npm install -g favicon-generator-cli

# From GitHub
sudo SHARP_IGNORE_GLOBAL_LIBVIPS=1 npm install -g git+https://github.com/andmitr/favicon-generator-cli.git

# Run without installation
SHARP_IGNORE_GLOBAL_LIBVIPS=1 npx --package=favicon-generator-cli favgen
```

## Usage

```bash
favgen [--png <path>] [--svg <path>] [--dist <output-dir>]
```

### Docker 

```bash
docker run --rm -v "$PWD:/app" ghcr.io/andmitr/favicon-generator-cli:latest [--png <path>] [--svg <path>] [--dist <output-dir>]
```

If you created the local favgen image tag:

```shell
docker run --rm -v "$PWD:/app" favgen [--png <path>] [--svg <path>] [--dist <output-dir>]
```

#### Shortcuts (Alias)

To avoid typing the long Docker command every time, add this alias to your ~/.bashrc or ~/.zshrc:

```shell
alias favgend='docker run --rm -v "$PWD:/app" ghcr.io/andmitr/favicon-generator-cli:latest'
```

Then you can use it just like the native command:

```shell
favgend --help
favgend --dist favicons
```

### Run without installation

```bash
npx --package=favicon-generator-cli favgen [--png <path>] [--svg <path>] [--dist <output-dir>]
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

## License

MIT Licensed. See [LICENSE](LICENSE) for details.
