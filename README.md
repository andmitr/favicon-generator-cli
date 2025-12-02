# CLI Favicon Generator

`fn_generate_favicons` is a powerful and efficient Node.js-based command-line interface utility designed to streamline the process of creating a comprehensive set of favicons for your web projects. Simply provide your source PNG and SVG images, and this tool will generate optimized favicons in various sizes and formats, ensuring your website looks crisp and professional across all devices and browsers.

## Features

-   **Comprehensive Favicon Set:** Generates all essential favicon formats:
    -   `favicon.ico` (multi-size, from 16px up to 256px, derived from PNG)
    -   `favicon.svg` (optimized from source SVG)
    -   `favicon-16x16.png`
    -   `favicon-32x32.png`
    -   `favicon-48x48.png`
    -   `apple-touch-icon.png` (180x180)
    -   `icon-192.png` (for Android manifest)
    -   `icon-512.png` (for Android manifest)
-   **Dual Source Input:** Accepts both PNG and SVG files as source material for maximum flexibility and quality. Defaults to `./favicon_src.png` and `./favicon_src.svg`.
-   **Advanced Image Optimization:** Leverages industry-standard libraries:
    -   `sharp` for robust PNG resizing.
    -   `imagemin` with `imagemin-pngquant` for efficient PNG compression.
    -   `svgo` for thorough SVG optimization.
    -   `png2icons` for standards-compliant ICO file generation.
-   **Customizable Output:** Specify your preferred output directory (defaults to creating a temporary directory like `favicons_xxxx` in the current working directory if not specified).
-   **User-Friendly CLI:** Simple and intuitive command-line arguments with a built-in help option (`--help` or `-h`).
-   **Error Handling:** Provides feedback on common issues like missing source files or image processing failures.
-   **Cross-Platform:** Built with Node.js, ensuring compatibility across various operating systems where Node.js is installed.

**Note on PWA Maskable Icons:** This generator does not currently create a dedicated 512x512 maskable icon specifically designed for PWA "safe-zone" compatibility. You will need to create this manually. A helpful tool for this is [maskable.app](https://maskable.app/editor). Ensure your PWA manifest correctly references your maskable icon alongside other icons.

## Prerequisites

-   [Node.js](https://nodejs.org/) (version 14.x or higher is recommended, as the script uses ES modules).
-   The script requires the following Node.js packages to be installed and accessible in your environment. If you're using this script as part of a Node.js project, you would typically install these as development dependencies:
    ```bash
    npm install --save-dev imagemin imagemin-pngquant sharp svgo png2icons
    # or
    yarn add --dev imagemin imagemin-pngquant sharp svgo png2icons
    ```
    If you intend to use the script globally or outside a Node.js project structure, ensure these packages are globally installed or otherwise resolvable by Node.js.

## Getting Started & Installation

1.  Download or copy the script content and save it as `fn_generate_favicons` (or `fn_generate_favicons.js`).
2.  Make it Executable:
    ```bash
    chmod +x /path/to/your/script/fn_generate_favicons
    ```
3. To make the script accessible from any directory by simply typing its name, move it to a directory that is part of your system's `PATH` environment variable.
 For user-specific executables, consider placing the script in a directory that is part of your `PATH` environment variable. Common locations include `~/.local/bin` or `~/bin`. If you choose a directory, ensure it exists and is added to your `PATH`. This is typically done by adding a line like `export PATH="$HOME/your-chosen-bin-directory:$PATH"` to your shell's configuration file (e.g., `~/.bashrc`, `~/.zshrc`). After modifying the configuration file, you'll need to source it (e.g., `source ~/.bashrc`) or open a new terminal session for the changes to take effect.
    ```bash
    cp /path/to/your/script/fn_generate_favicons ~/.local/bin/
    ```
    Other common locations (which might require root/sudo privileges) include `/usr/local/bin`.

    Once installed in a directory within your `PATH`, you can run the script by simply typing `fn_generate_favicons` in your terminal.
 
4. Ensure you have your `favicon_src.png` and `favicon_src.svg` source files ready. By default, the script looks for these in the current directory from which it's run, but you can specify other paths using the `--png` and `--svg` arguments.

## Usage

Run the script from your terminal. The command structure depends on how you installed it:

*   If run from the directory containing the script:
    ```bash
    ./fn_generate_favicons [--png <path>] [--svg <path>] [--dist <output-dir>]
    ```
*   If the script is in your PATH:
    ```bash
    fn_generate_favicons [--png <path>] [--svg <path>] [--dist <output-dir>]
    ```

### Arguments

-   `--png or -p <path>`: Path to the source PNG image.
    Defaults to `./favicon_src.png` if not specified.
-   `--svg or -s <path>`: Path to the source SVG image.
    Defaults to `./favicon_src.svg` if not specified.
-   `--dist or -d <output-dir>`: The directory where the generated favicon files will be saved.
    If not specified, a temporary directory named `favicons_xxxx` (where `xxxx` is a random string) will be created in the current working directory.
-   `--help or -h`: Displays a help message detailing usage, arguments, and the list of generated favicons, then exits.

### Example

Generate favicons from `./myicon.png` and `./myicon.svg`, and save them to the `./favs` directory:
```bash
  fn_generate_favicons --png ./myicon.png --svg ./myicon.svg --dist ./favs
```

If your source files are named `favicon_src.png` and `favicon_src.svg` in the current directory, and you want to output to `icons`:
```bash
    fn_generate_favicons --dist icons
```

## How to Use in HTML

Once generated, you would typically include these favicons in the `<head>` section of your HTML files:

```html
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.svg" sizes="any" type="image/svg+xml">
<link rel="icon" href="/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="icon" href="/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/favicon-48x48.png" sizes="48x48" type="image/png">
<link rel="apple-touch-icon" href="/apple-touch-icon.png" type="image/png">
<link rel="manifest" href="/manifest.webmanifest"> <!-- /manifest.webmanifest would reference icon-192.png and icon-512.png -->
```
## License

MIT Licensed — See [LICENSE](LICENSE.txt) for details.
