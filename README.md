# clip

Copy file contents to your clipboard from the terminal.

```
clip <file>
```

Works on **macOS**, **Linux**, and **Windows**.

## Install

### One-liner (macOS / Linux)

```bash
curl -fsSL https://raw.githubusercontent.com/idanshimon/clip/main/install.sh | sudo bash
```

To install to a custom prefix:

```bash
curl -fsSL https://raw.githubusercontent.com/idanshimon/clip/main/install.sh | sudo bash -s -- /custom/prefix
```

### From source (macOS / Linux)

```bash
git clone https://github.com/idanshimon/clip.git
cd clip
sudo ./install.sh
```

### Linux prerequisites

Requires `xclip` or `xsel`:

```bash
# Debian/Ubuntu
sudo apt install xclip

# Fedora
sudo dnf install xclip
```

### Windows (Batch)

Copy `clip.bat` to a folder in your `PATH` (e.g. `C:\Windows` or a custom bin directory).

> **Note:** Windows has a built-in `clip.exe`. This tool's batch script calls `clip.exe` internally, so name the batch file something else (e.g. `clipfile.bat`) if there's a conflict.

### PowerShell (Cross-platform)

Works on **Windows**, **macOS**, and **Linux** with PowerShell 5.1+ / PowerShell 7+.

```powershell
# Copy clip.ps1 somewhere in your PATH, then:
./clip.ps1 <file>

# Or create an alias in your $PROFILE:
Set-Alias -Name clip -Value "C:\path\to\clip.ps1"
```

## Usage

```
clip <file>          Copy file to clipboard
clip -h, --help      Show help
clip -v, --version   Show version
```

## License

MIT
