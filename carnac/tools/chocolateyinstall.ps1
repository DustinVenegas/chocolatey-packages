$ErrorActionPreference = 'Stop';
$packageName = 'carnac'
$url = 'https://github.com/downloads/Code52/carnac/Carnac.zip'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Ensure that shimgen understands this isn't a console application
New-Item -ItemType file -force -path "$toolsDir\Carnac\Carnac.exe.gui" | out-null
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir"

$startMenuLink=$("$env:appdata\Microsoft\Windows\Start Menu\Programs\Carnac.lnk")
Install-ChocolateyShortcut -shortcutFilePath $startMenuLink -targetPath "$toolsDir\Carnac\Carnac.exe" | out-null
