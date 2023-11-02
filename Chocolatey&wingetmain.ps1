#Chocolatey Software 
$choco_packages = @{

    "Vlc" = "vlc"
    "Discord" = "discord"
    "EGS" = "epicgameslauncher"
    "Steam" = "steam"
    "QBittorrent" = "qbittorrent"
    "Stremio" = "stremio"
    "Microsoft Visual C++" = "vcredist140"
    "Spotify" = "spotify"
    "7-Zip" = "7zip"
}
#Chocolatey Browser
$browserpackages = @{
    "Brave" = "brave"
    "LibreWolf" = "librewolf"
    "Google Chrome" = "googlechrome"
}
#Winget Software 
$winget_packages = @{
   "Vlc" = "VideoLAN.VLC"
   "Discord" = "Discord.Discord"
   "EGS" = "EpicGames.EpicGamesLauncher"
   "Steam" =  "Valve.Steam"
   "QBittorrent" = "qBittorrent.qBittorrent"
   "Stremio" = "Stremio.Stremio"
   "Microsoft Visual C++" =  "Microsoft.VCRedist.2015+.x64"
   "7zip" = "7zip.7zip"
    "Surfshark" = "Surfshark.Surfshark"
    "Spotify" =  "Spotify.Spotify"
}

function InstallSoftware {   #Chocolatey Function Installing Softwares
    $nextcontinue = $true
    while ($nextcontinue) {
        Write-Host "Select software to install:" -ForegroundColor Green
        Write-Host "1. Install all software" -ForegroundColor Blue

        $i = 2
        $choco_packages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}"-f $i, $_.Key) -ForegroundColor Blue
            $i++
        }

        Write-Host -NoNewline -ForegroundColor Blue "Select (1 for all, 2 for Vlc..., or 'q' to quit): "
        $choice = Read-Host 

        if ($choice -eq 'q') {
            $nextcontinue = $false
            break
        }

        if ($choice -eq 1) {
            foreach ($package in $choco_packages.Values) {
                Write-Host "Installing $package..." -ForegroundColor Yellow
                Invoke-Expression "choco install $package -y"
            }
        } elseif ($choice -ge 2) {
            $selectedAlias = ($choco_packages.Keys | Select-Object -Index ($choice - 2))
            $selectedPackage = $choco_packages[$selectedAlias]
            Write-Host "Installing $selectedAlias..." -ForegroundColor Yellow
            if ($selectedPackage) {
                Invoke-Expression "choco install $selectedPackage -y -q"
            }
        } else {
            Write-Host "Invalid choice" -ForegroundColor DarkRed
        }
    }
}

function InstallBrowser{   #Chocolatey Function Installing Browser
    $browsercontinue = $true
    while ($browsercontinue){
        Write-Host "Select Browser to install" -ForegroundColor Green

        $i = 1
        $browserpackages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key) -ForegroundColor Blue
            $i++
        }
    
        Write-Host -NoNewline -ForegroundColor Blue "Select (1 for Brave..., or 'q' to quit): "
        $choice = Read-Host
        if ($choice -eq 'q') {
            $browsercontinue = $false
            break
        }
        if ($choice -ge 1) {
            $selectedPackage = ($browserpackages.Keys | Select-Object -Index ($choice - 1))
            $selected_appended_package = $browserpackages[$selectedPackage]
            Write-Host "Installing $selectedPackage..." -ForegroundColor Yellow
            if ($selected_appended_package) {
                Invoke-Expression "choco install $selected_appended_package -y -q"
        } else {
            Write-Host "Invalid choice. Please select a valid option." -ForegroundColor DarkRed
        }
    }
}
}


function Uninstallsoftware{   #Chocolatey Function Uninstalling Softwares
    $uninstallsoftware = $true
    while ($uninstallsoftware){
        Write-Host "Select Software to Uninstall" -ForegroundColor Green

        $i = 1
        $choco_packages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key) -ForegroundColor Blue
            $i++
        }
        Write-Host -NoNewline -ForegroundColor Blue "Select (1 for Steam..., or 'q' to quit): "
        $choice = Read-Host

        if ($choice -eq 'q') {
            $uninstallsoftware = $false
            break
        }

        if ($choice -ge 1) {
            $selectedAlias = ($choco_packages.Keys | Select-Object -Index ($choice - 1))
            $selectedPackage = $choco_packages[$selectedAlias]
            Write-Host "Installing $selectedAlias..." -ForegroundColor Yellow
            if ($selectedPackage) {
                Invoke-Expression "choco uninstall $selectedPackage -y"
            }else {
            Write-Host "Bug"
        }
        }else{
            Write-Host "Invalid choice. Please select a valid option." -ForegroundColor DarkRed
        }

    }

}

function WingetInstallSoftware {    #Winget Function Installing Softwares 
    $wingetinstall_software = $true
    while ($wingetinstall_software) {
        Write-Host "Select Software to Install" -ForegroundColor Green
        Write-Host "1. Install all software" -ForegroundColor Blue
        
        $i = 2
        $winget_packages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key) -ForegroundColor Blue
            $i++
        }
        Write-Host -NoNewline -ForegroundColor Blue "Select (1 for all, 2 for Vlc..., or 'q' to quit): "
        $choice = Read-Host 

        if($choice -eq 'q'){
            $wingetinstall_software = $false
            break
        }
        if ($choice -eq 1) {
            foreach ($package in $winget_packages.Values) {
                Write-Host "Installing $package..." -ForegroundColor Yellow
                winget install $package -h
            }
        }
        elseif ($choice -ge 2){
            $selectedAlias = ($winget_packages.Keys | Select-Object -Index ($choice - 2))
            $selectedPackage = $winget_packages[$selectedAlias]
            Write-Host "Installing $selectedAlias..." -ForegroundColor Yellow
            winget install $selectedPackage -h
        }
        else {
            Write-Host "Invalid action. Please select a valid option." -ForegroundColor DarkRed
        }
    }
}

function WingetUninstaller{  #Winget Function Uninstalling Software
    $wingetuninstaller = $true
    while($wingetuninstaller) {
        Write-Host "Select Software to Install" -ForegroundColor Green

        $winget_packages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key) -ForegroundColor Blue
            $i++
        }

        Write-Host -NoNewline -ForegroundColor Blue "Select (1. for Vlc.., or 'q' to quit): "
        $choice = Read-Host

        if($choice -eq 'q'){
            $wingetuninstaller = $false
            break
        }
        if ($choice -ge 1) {
            $selectedAlias = ($winget_packages.Keys | Select-Object -Index ($choice - 1))
            $selectedPackage = $winget_packages[$selectedAlias]
            Write-Host "Installing $selectedAlias..." -ForegroundColor Yellow
            winget uninstall --id $selectedPackage -h
        } else {
            Write-Host "Invalid choice. Please select a valid option." -ForegroundColor DarkRed
        }

    }
}



$chocoInstalled = Test-Path -Path "C:\ProgramData\chocolatey\choco.exe"
$package_manager_access = 0

if (-not $chocoInstalled) {
    Write-Host "Chocolatey is not installed. Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host "Chocolatey installed successfully."
    $chocoInstalled = $true
}

while ($true) {
    Write-Host "Select the Package Manager" -ForegroundColor Green
    Write-Host "1. Chocolatey" -ForegroundColor Blue
    Write-Host "2. Winget" -ForegroundColor Blue
    Write-Host "3. Quit" -ForegroundColor Blue

    Write-Host -NoNewline -ForegroundColor Blue "Select 1 or 2 (3 for Exit):  "
    $package_manager = Read-Host

    if ($package_manager -eq '3') {
        break
    }

    if ($package_manager -eq '1' -and $chocoInstalled) {
        $package_manager_access = 1
    }
    elseif ($package_manager -eq '2') {
        $package_manager_access = 2
    }
    else {
        Write-Host "Invalid option. Please select a valid package manager." -ForegroundColor DarkRed 
        continue
    }

    if ($package_manager_access -eq 1) {
        Write-Host "Chocolatey Package Manager Menu" -ForegroundColor Green
        Write-Host "1. Install Software" -ForegroundColor Blue
        Write-Host "2. Install Browser" -ForegroundColor Blue
        Write-Host "3. Uninstall Software" -ForegroundColor Blue
        Write-Host "4. Quit" -ForegroundColor Blue

        Write-Host -NoNewline -ForegroundColor Blue "Select 1,2 or 3 (4 to Exit): "
        $action = Read-Host 

        switch ($action) {
            '1' { InstallSoftware }
            '2' { InstallBrowser }
            '3' { UninstallSoftware }
            '4' { break }
            default { Write-Host "Invalid action. Please select a valid option." -ForegroundColor DarkRed } 
        }
    }
    elseif ($package_manager_access -eq 2) {
        Write-Host "Winget Package Manager Menu" -ForegroundColor Green
        Write-Host "1. Install Software" -ForegroundColor Blue
        Write-Host "2. Install Browser (Under Development)" -ForegroundColor Blue
        Write-Host "3. Uninstall Software" -ForegroundColor Blue
        Write-Host "4. Quit" -ForegroundColor Blue

        Write-Host -NoNewline -ForegroundColor Blue "Select 1,2 or 3 (4 to Exit): "
        $action = Read-Host

        switch ($action) {
            '1' { WingetInstallSoftware }
            '2' { Write-Host "Under Development" }
            '3' { WingetUninstallSoftware }
            '4' { break }
            default { Write-Host "Invalid action. Please select a valid option." }
        }
    }
}

Write-Host "Thank you for Using. Made with Love :)" -ForegroundColor DarkMagenta
