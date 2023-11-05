# Define an array of package names
$displayoptions = @(
    "Browsers",
    "communication tools",
    "Dev-Tools",
    "Game Launchers",
    "Microsoft tools",
    "Multi-media tools",
    "Utilities",
    "My Config"
    "Misc"
)

$packages = @{
    "browserpackages" = @{
        "All Packages" = @(
            "LibreWolf.Librewolf",
            "Brave.Brave",
            "Google.Chrome",
            "Mozilla.Firefox"
        )
        "LibreWolf"    = "LibreWolf.Librewolf"
        "Brave"        = "Brave.Brave"
        "Chrome"       = "Google.Chrome"
        "Firefox"      = "Mozilla.Firefox"
    }

    "communicationpackages" = @{
        "All Packages" = @(
            "Discord.Discord",
            "Telegram.TelegramDesktop",
            "WhatsApp.WhatsApp",
            "Microsoft.Teams"
        )
        "Discord"      = "Discord.Discord"
        "Telegram"     = "Telegram.TelegramDesktop"
        "WhatsApp"     = "WhatsApp.WhatsApp"
        "Teams"        = "Microsoft.Teams"
    }

    "devpackages" = @{
        "All Packages" = @(
            "Git.Git",
            "Microsoft.VisualStudioCode",
            "GitHub.GitHubDesktop",
            "Postman.Postman",
            "Python.Python.3.11",
            "Oracle.JDK.19",
            "OpenJS.NodeJS"
        )
        "Git"                        = "Git.Git"
        "Microsoft VisualStudioCode" = "Microsoft.VisualStudioCode"
        "GitHub"                     = "GitHub.GitHubDesktop"
        "Postman"                    = "Postman.Postman"
        "Python.3.11"                = "Python.Python.3.11"
        "Oracle JDK 19"              = "Oracle.JDK.19"
        "NodeJS"                     = "OpenJS.NodeJS"
        "SublimeHQ"                  = "SublimeHQ.SublimeText.4"
        "Docker"                     = "Docker.DockerDesktop"
    }

    "gamepackages" = @{
        "All Packages" = @(
            "EpicGames.EpicGamesLauncher",
            "Valve.Steam",
            "GOG.Galaxy",
            "RiotGames.Valorant.AP"
        )
        "EpicGames"    = "EpicGames.EpicGamesLauncher"
        "Steam"        = "Valve.Steam"
        "GOG Galaxy"   = "GOG.Galaxy"
        "RiotGames"    = "RiotGames.Valorant.AP"
    }

    "microsoftpackages" = @{
        "All Packages" = @(
            "Microsoft.VCRedist.2015+.x64",
            "Microsoft.DotNet.SDK.7",
            "Microsoft.PowerShell",
            "Microsoft.OneDrive"
        )
        "Microsoft VCRedist 2015 x64" = "Microsoft.VCRedist.2015+.x64"
        "Microsoft DotNet SDK 7"      = "Microsoft.DotNet.SDK.7"
        "Microsoft PowerShell"        = "Microsoft.PowerShell"
        "Microsoft OneDrive"          = "Microsoft.OneDrive"
    }

    "multimediapackages" = @{
        "All Packages" = @(
            "Spotify.Spotify",
            "Shabinder.SpotiFlyer",
            "VideoLAN.VLC"
        )
        "Spotify"      = "Spotify.Spotify"
        "Spotiflyer"   = "Shabinder.SpotiFlyer"
        "VLC"          = "VideoLAN.VLC"
    }

    "ultilitypackages"  = @{
        "All Packages"  = @(
            "7zip.7zip",
            "Surfshark.Surfshark",
            "qBittorrent.qBittorrent",
            "TechPowerUp.NVCleanstall",
            "CPUID.CPU-Z",
            "AnyDeskSoftwareGmbH.AnyDesk",
            "Guru3D.Afterburner",
            "Bitwarden.Bitwarden",
            "PrestonN.FreeTube"  
        )
        "seven-zip"       = "7zip.7zip"
        "Surfshark"       = "Surfshark.Surfshark"
        "qBittorrent"     = "qBittorrent.qBittorrent"
        "NVClean"         = "TechPowerUp.NVCleanstall"
        "CPU-Z"           = "CPUID.CPU-Z"
        "AnyDesk"         = "AnyDeskSoftwareGmbH.AnyDesk"
        "MSI Afterburner" = "Guru3D.Afterburner"
        "Bitwarden"       = "Bitwarden.Bitwarden"
        "FreeTube"        = "PrestonN.FreeTube"
    }

    "myconfigpackages" = @{
        "All Packages" = @(
            "LibreWolf.Librewolf",
            "Microsoft.VisualStudioCode",
            "Discord.Discord",
            "EpicGames.EpicGamesLauncher",
            "Valve.Steam",
            "Microsoft.VCRedist.2015+.x64",
            "7zip.7zip",
            "Surfshark.Surfshark",
            "qBittorrent.qBittorrent",
            "VideoLAN.VLC",
            "TechPowerUp.NVCleanstall",
            "Guru3D.Afterburner"
        )
        "LibreWolf"                    = "LibreWolf.Librewolf"
        "Microsoft Visual Studio Code" = "Microsoft.VisualStudioCode"
        "Discord"                      = "Discord.Discord"
        "EpicGames"                    = "EpicGames.EpicGamesLauncher"
        "Steam"                        = "Valve.Steam"
        "Microsoft VCRedist 2015+ x64" = "Microsoft.VCRedist.2015+.x64"
        "seven-zip "                   = "7zip.7zip"
        "Surfshark"                    = "Surfshark.Surfshark"
        "qBittorrent"                  = "qBittorrent.qBittorrent"
        "VLC"                          = "VideoLAN.VLC"
        "NVClean"                      = "TechPowerUp.NVCleanstall"
        "MSI Afterburner"              = "Guru3D.Afterburner"
    }
    "Misc" = @{
        "Custom search"                 = "Customsearch"
        "Change Installation Directory" = "ChangeInstallationDirectory"
    }


}
#GlobalVariable's
$selection = "temp"
$print_line = "--------------------------------------------------------------------------------------------------"

#InstallPackagesFunction
Function InstallPackages {
    if ($selectedoption -le $neededpackage.count) {
        $confirmedoption = $allpackages[$selectedoption - 1 ]
        switch ($confirmedoption) {
            
            #All packages
            "All Packages" {
                foreach ($packs in $neededpackage[$confirmedoption]) {
                    winget install $packs --silent
                    Write-Host $print_line 
                } 
            }

            # CustomSearch
            "Custom search" {     
                $GetSoftname = $(Write-Host "Please, Enter the Software name: " -ForegroundColor Green -NoNewLine; Read-Host) + $(Write-Host "")
                winget search  $GetSoftname 
                $GetSoftId = $(Write-Host "") + $(Write-Host "Please, Enter the Software ID: " -ForegroundColor Green -NoNewLine; Read-Host) + $(Write-Host "")
                winget install $GetSoftId  --silent
                Write-Host $print_line 
            }

            # ChangeInstallationDirectory
            "Change Installation Directory" {  
                $GetSoftDirectory = $(Write-Host "Please, specify the preferred directory to install your software: " -ForegroundColor Green -NoNewLine; Read-Host) + $(Write-Host "")
                Set-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" -Name "ProgramFilesDir" -Value "$GetSoftDirectory"
                $(Write-Host "Your Installation Diretory is changed to " -ForegroundColor Magenta -NoNewLine) + $(Write-Host "$GetSoftDirectory" -ForegroundColor Green ) 
            }
        
            # default
            Default {
                winget install $neededpackage[$confirmedoption] --silent
                Write-Host $print_line
            }
        }
    }
    DisplayPackages
}

#DisplayPackagesFunction       
Function DisplayPackages {
    $packagearray = @(
        "browserpackages",
        "communicationpackages",
        "devpackages",
        "gamepackages",
        "microsoftpackages",
        "multimediapackages",
        "ultilitypackages",
        "myconfigpackages"
        "Misc"
    )
    # Display package options
    $(Write-Host "`n") + $(Write-Host "             こんにちは, Welcome to DEFALT's Windows Package Installer" -ForegroundColor Magenta) + $(Write-Host "`n")
    for ($i = 0; $i -lt $displayoptions.Length; $i++) {
        Write-Host ("{0}. {1}" -f ($i + 1), ($displayoptions[$i]) ) -ForegroundColor Yellow
    }
    Write-Host ("{0}. Exit" -f ($displayoptions.Length + 1)) -ForegroundColor Yellow
    # Get user input
    $temp = $(Write-Host "") + $(Write-Host "Enter the option number: " -ForegroundColor Green -NoNewLine; Read-Host) + $(Write-Host "")
    $selection = [int]$temp
    if ($selection -eq ($displayoptions.Length + 1)) {
        $(Write-Host "Exiting さようなら......." -ForegroundColor Magenta -NoNewLine; ) + $(Write-Host "`n")
        #Exit the program
        Start-Sleep -s 3
        Exit 
    }
    $selecteduseroption = $packagearray[$selection - 1]
    $neededpackage = $packages[$selecteduseroption]
    [string[]] $allpackages = $neededpackage.keys | Sort-Object
    $key_count = 0
    foreach ($keys in $allpackages) { 
        Write-Host ("{0}. {1}" -f ($key_count + 1), $keys) -ForegroundColor Yellow
        $key_count++
    }
    Write-Host ("{0}. Go Back" -f ($neededpackage.count + 1)) -ForegroundColor CYAN
    $Select_temp = $(Write-Host "") + $(Write-Host "Select your Package option: " -ForegroundColor Green -NoNewLine; Read-Host) + $(Write-Host "")
    $selectedoption = [int]$Select_temp
    if ($selectedoption -eq $neededpackage.count + 1) {
        $(Write-Host "`n") + $(Write-Host "Reverting to menu..." -ForegroundColor Cyan) 
        DisplayPackages 
    }
    #Function call
    InstallPackages   
}
# Call the DisplayPackages function
DisplayPackages
