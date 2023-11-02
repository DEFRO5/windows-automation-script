# Define an array of package names
$displayoptions = @(
    "Browser",
    "communication",
    "DEV-Tools",
    "Game Launchers",
    "Microsoft tools",
    "Multi-media Tools",
    "Utilities",
    "My Config"
)

$packages = @{
    "browserpackages"       = @{
        "All Packages"       = @(
            "LibreWolf.Librewolf",
            "Brave.Brave",
            "Google.Chrome",
            "Mozilla.Firefox"
        )
        "LibreWolf" = "LibreWolf.Librewolf"
        "Brave"     = "Brave.Brave"
        "Chrome"    = "Google.Chrome"
        "Firefox"   = "Mozilla.Firefox"
    }

    "communicationpackages" = @{
        "All Packages"      = @(
            "Discord.Discord",
            "Telegram.TelegramDesktop",
            "WhatsApp.WhatsApp",
            "Microsoft.Teams"
        )
        "Discord"  = "Discord.Discord"
        "Telegram" = "Telegram.TelegramDesktop"
        "WhatsApp" = "WhatsApp.WhatsApp"
        "Teams"    = "Microsoft.Teams"
    }

    "devpackages"           = @{
        "All Packages"                        = @(
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

    "gamepackages"          = @{
        "All Packages"        = @(
            "EpicGames.EpicGamesLauncher",
            "Valve.Steam",
            "GOG.Galaxy",
            "RiotGames.Valorant.AP"
        )
        "EpicGames"  = "EpicGames.EpicGamesLauncher"
        "Steam"      = "Valve.Steam"
        "GOG Galaxy" = "GOG.Galaxy"
        "RiotGames"  = "RiotGames.Valorant.AP"
    }

    "microsoftpackages"     = @{
        "All Packages"                         = @(
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

    "multimediapackages"    = @{
        "All Packages"        = @(
            "Spotify.Spotify",
            "Shabinder.SpotiFlyer",
            "VideoLAN.VLC"
        )
        "Spotify"    = "Spotify.Spotify"
        "Spotiflyer" = "Shabinder.SpotiFlyer"
        "VLC"        = "VideoLAN.VLC"
    }

    "ultilitypackages"      = @{
        "All Packages"             = @(
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

    "myconfigpackages"      = @{
        "All Packages"                          = @(
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
}
#GlobalVariable
$selection = "temp"
#InstallPackagesFunction
Function InstallPackages {
    $packagearray = @(
        "browserpackages",
        "communicationpackages",
        "devpackages",
        "gamepackages",
        "microsoftpackages",
        "multimediapackages",
        "ultilitypackages",
        "myconfigpackages"
    )
    $selecteduseroption = $packagearray[$selection - 1]
    $neededpackage = $packages[$selecteduseroption]
    [string[]] $allpackages = $neededpackage.keys | Sort-Object
    $key_count = 0
    foreach ($keys in $allpackages) { 
        Write-Host ("{0}. {1}" -f ($key_count + 1), $keys) 
        $key_count++
    }
    Write-Host ("{0}. Go Back" -f ($neededpackage.count + 1)) -ForegroundColor Yellow
    $Select_temp = Read-Host "Select your option" :
    $selectedoption = [int]$Select_temp
    if ($selectedoption -le $neededpackage.count) {
        $confirmedoption = $allpackages[$selectedoption - 1 ]
        if ($confirmedoption -eq "All Packages") {
            foreach ($packs in $neededpackage[$confirmedoption]) {
                winget install $packs --silent
            }
        }
        else {
            winget install $neededpackage[$confirmedoption] --silent
        }
    }
    elseif ($selectedoption -eq $neededpackage.count + 1) {
        Write-Host "
                 
                Reverting to menu...
                    
                    " -ForegroundColor Cyan
        DisplayPackages
    }
}
#DisplayPackagesFunction       
Function DisplayPackages {
    # Display package options
    Write-Host "
            こんにちは, Welcome to DEFALT's windows Package installer" -ForegroundColor Red
    for ($i = 0; $i -lt $displayoptions.Length; $i++) {
        Write-Host ("  {0}. {1}" -f ($i + 1), $displayoptions[$i] ) -ForegroundColor Yellow 
    }
    Write-Host ("  {0}. Exit" -f ($displayoptions.Length + 1)) -ForegroundColor Yellow
    # Get user input
    $temp = Read-Host "Enter the option number" 
    Write-Host " "
    $selection = [int]$temp
    #Exit
    if ($selection -eq ($displayoptions.Length + 1)) {
        Write-Host "
            
                 Exiting さようなら.......
                 
                 " -ForegroundColor Green
        #Exit the program
        exit
    }
    #Function call 
    InstallPackages        
}
# Call the DisplayPackages function
DisplayPackages
