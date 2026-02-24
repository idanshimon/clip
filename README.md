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
clip <file|folder>          Copy file to clipboard (folder → last modified file)
clip -                      Copy from stdin
<cmd> | clip                Pipe command output to clipboard
```

### Options

| Flag | Description |
|------|-------------|
| `-h`, `--help` | Show help |
| `-v`, `--version` | Show version |
| `-u`, `--update` | Self-update to the latest version |
| `-p`, `--paste` | Paste clipboard contents to stdout |
| `-n`, `--head <N>` | Copy only the first N lines |
| `-t`, `--tail <N>` | Copy only the last N lines |
| `-w`, `--watch` | Watch file and re-copy on changes |
| `--trim` | Strip leading/trailing whitespace |
| `--no-newline` | Strip trailing newline |
| `--prepend <text>` | Prepend text before content |
| `--append <text>` | Append text after content |
| `--ext <.ext>` | Filter folder files by extension |
| `--list` | List folder files by date, pick interactively |
| `--history` | Show recently clipped files |

### Examples

```bash
# Copy a file
clip readme.txt

# Copy last modified file in a folder
clip ./logs

# Copy only .txt files from a folder
clip --ext .txt ./logs

# Pick a file interactively from a folder
clip --list ./docs

# Pipe into clipboard
echo "hello" | clip
cat file.txt | clip

# Copy first 20 lines
clip -n 20 largefile.log

# Copy last 50 lines
clip -t 50 server.log

# Wrap content in a markdown code block
clip --prepend '```js' --append '```' app.js

# Strip whitespace
clip --trim config.yml

# Copy without trailing newline (great for tokens)
clip --no-newline .env

# Paste clipboard to stdout
clip -p

# Paste clipboard into a file
clip -p > output.txt

# Watch a file and re-copy on every change
clip -w app.log

# Self-update
clip -u

# Check recently clipped files
clip --history
```

## License

MIT
