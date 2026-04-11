# 🚀 Fastfetch Configuration Suite

A curated collection of **250+ aesthetic assets** and **14 custom presets** to make your terminal Fetch look premium, vibrant, and personalized. 

Featuring interactive installation scripts for **macOS, Linux, and Windows**, and a massive library of high-quality anime/gaming "stickers" as logos.

---

## 🎨 Features
- **250+ High-Quality Logos**: A massive variety of stickers from anime, gaming, and tech culture.
- **14 Predefined Layouts**: From minimal text-only fetches to rich, image-heavy dashboards.
- **OS Logo Support**: Don't want a custom image? Our scripts support switching to your Operating System's default logo with one click.
- **Cross-Platform**: Full support for macOS, Linux, and Windows.

---

## 🛠 Prerequisites: Install Fastfetch

Before using these configs, you must have `fastfetch` installed on your system.

### **macOS**
Install via [Homebrew](https://brew.sh/):
```bash
brew install fastfetch
```

### **Linux**
Use your distribution's package manager:
- **Arch Linux**: `sudo pacman -S fastfetch`
- **Fedora**: `sudo dnf install fastfetch`
- **Ubuntu/Debian**: `sudo apt install fastfetch`
- **NixOS**: `nix-shell -p fastfetch`

### **Windows**
Install via [Scoop](https://scoop.sh/) or [Chocolatey](https://chocolatey.org/):
- **Scoop**: `scoop install fastfetch`
- **Chocolatey**: `choco install fastfetch`

---

## 🚀 Quick Installation (Recommended)

I have provided interactive scripts that let you preview and select your favorite layout and logo in seconds.

### **macOS / Linux / WSL**
1. Clone this repository:
   ```bash
   git clone https://github.com/Maheswara660/fastfetch.git
   cd fastfetch
   ```
2. Run the installer:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

### **Windows (PowerShell)**
1. Clone the repository and enter the folder.
2. Run the installer:
   ```powershell
   .\install.ps1
   ```

---

## 📖 Manual Installation

If you prefer to set things up manually, follow these steps:

### **Unix-like (macOS / Linux / WSL)**
1. Create the configuration directory:
   ```bash
   mkdir -p ~/.config/fastfetch/image
   ```
2. Choose a preset from the `presets/` folder and copy it:
   ```bash
   cp presets/01.jsonc ~/.config/fastfetch/config.jsonc
   ```
3. Choose an image from the `images/` folder and copy it:
   ```bash
   cp images/001.png ~/.config/fastfetch/image/image.png
   ```

### **Windows**
1. Open PowerShell and create the configuration folder:
   ```powershell
   mkdir "$env:APPDATA\fastfetch\image"
   ```
2. Copy your chosen preset:
   ```powershell
   copy-item presets\01.jsonc "$env:APPDATA\fastfetch\config.jsonc"
   ```
3. Copy your chosen logo:
   ```powershell
   copy-item images\001.png "$env:APPDATA\fastfetch\image\image.png"
   ```

---

## 🤝 Contributing
Feel free to fork this project, add your own presets or images, and submit a Pull Request!

## 📜 License
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.