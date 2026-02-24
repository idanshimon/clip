# clip

Copy file contents to your clipboard from the terminal.

```
clip <file>
```

Works on **macOS**, **Linux**, and **Windows**.

## Install

### macOS / Linux

```bash
git clone https://github.com/YOUR_USER/clip.git
cd clip
sudo ./install.sh
```

This copies `clip` to `/usr/local/bin`. To install elsewhere:

```bash
./install.sh /custom/prefix
```

Or just add it manually:

```bash
cp clip /somewhere/in/your/PATH/
chmod +x /somewhere/in/your/PATH/clip
```

### Linux prerequisites

Requires `xclip` or `xsel`:

```bash
# Debian/Ubuntu
sudo apt install xclip

# Fedora
sudo dnf install xclip
```

### Windows

Copy `clip.bat` to a folder in your `PATH` (e.g. `C:\Windows` or a custom bin directory).

> **Note:** Windows has a built-in `clip.exe`. This tool's batch script calls `clip.exe` internally, so name the batch file something else (e.g. `clipfile.bat`) if there's a conflict.

## Usage

```
clip <file>          Copy file to clipboard
clip -h, --help      Show help
clip -v, --version   Show version
```

## License

MIT
