# Fastfetch Configuration Installer for Windows

# Colors (ANSI)
$E = [char]27
$C1 = "$E[1;34m" # Blue
$C2 = "$E[1;36m" # Cyan
$C3 = "$E[1;32m" # Green
$NC = "$E[0m"    # No Color

Clear-Host

# Stylized ASCII Header (Clear Tilted Block style)
Write-Host "${C1}      ___  _   ___ _____ ___ ___ _____ ___ _  _ ${NC}"
Write-Host "${C1}     | __|/_\ / __|_   _| __| __|_   _/ __| || |${NC}"
Write-Host "${C2}    | _|/ _ \\__ \ | | | _|| _|  | || (__| __ |${NC}"
Write-Host "${C2}   |_|/_/ \_\___/ |_| |_| |___| |_| \___|_||_|${NC}"
Write-Host "${C3}    ___ ___  _  _ ___ ___ ___     ___ _  _ ___ _____ _   _    _    ${NC}"
Write-Host "${C3}   / __/ _ \| \| | __|_ _/ __|   |_ _| \| / __|_   _/_\ | |  | |   ${NC}"
Write-Host "${C2}  | (_| (_) | \`\` | _| | | (_ |    | || \`\` \__ \ | |/ _ \| |__| |__ ${NC}"
Write-Host "${C1}   \___\___/|_|\_|_| |___\___|   |___|_|\_|___/ |_/_/ \_\____|____|${NC}"
Write-Host ""
Write-Host "${C2}>>> Fastfetch Configuration Installer (Windows) <<<${NC}"
Write-Host ""

# Configuration Paths
$ConfigDir = "$env:APPDATA\fastfetch"
$ImageDir = "$ConfigDir\image"
$PresetsDir = ".\presets"
$ImagesDir = ".\images"

# 1. Select Preset
Write-Host "${C3}[Step 1] Select a Preset (01-14):${NC}"
Get-ChildItem -Path $PresetsDir -Name | Out-Host
$PresetNum = Read-Host "Enter preset number (e.g., 01)"

$SelectedPreset = "$PresetsDir\$PresetNum.jsonc"

if (-not (Test-Path $SelectedPreset)) {
    Write-Host "${C1}Error: Preset $PresetNum not found!${NC}" -ForegroundColor Red
    exit
}

# 2. Select Logo
Write-Host ""
Write-Host "${C3}[Step 2] Select Logo Option:${NC}"
Write-Host "1) Choose a Custom Image (001-250)"
Write-Host "2) Use Operating System Default Logo"
$LogoOpt = Read-Host "Selection (1 or 2)"

# Execution
if (-not (Test-Path $ConfigDir)) { New-Item -ItemType Directory -Path $ConfigDir -Force }
if (-not (Test-Path $ImageDir)) { New-Item -ItemType Directory -Path $ImageDir -Force }

Copy-Item -Path $SelectedPreset -Destination "$ConfigDir\config.jsonc" -Force

if ($LogoOpt -eq "1") {
    $ImageNum = Read-Host "Enter image number (e.g., 001)"
    $SelectedImage = "$ImagesDir\$ImageNum.png"
    
    if (-not (Test-Path $SelectedImage)) {
        Write-Host "${C1}Error: Image $ImageNum not found!${NC}" -ForegroundColor Red
        exit
    }
    
    Copy-Item -Path $SelectedImage -Destination "$ImageDir\image.png" -Force
    # Standardize path in config for Windows
    (Get-Content "$ConfigDir\config.jsonc") -replace '"source": ".*"', "`"source`": `"$($ImageDir.Replace('\','/'))/image.png`"" | Set-Content "$ConfigDir\config.jsonc"
    Write-Host "${C2}Successfully installed preset $PresetNum with image $ImageNum.${NC}"
} else {
    # Use OS Default
    (Get-Content "$ConfigDir\config.jsonc") -replace '"source": ".*"', '"source": ""' | Set-Content "$ConfigDir\config.jsonc"
    Write-Host "${C2}Successfully installed preset $PresetNum with Operating System default logo.${NC}"
}

Write-Host ""
Write-Host "${C3}Run 'fastfetch' to see your new setup!${NC}"
Write-Host ""
