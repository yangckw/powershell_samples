$dir="\\10.0.0.2\share"
$curDir = Get-Location
Set-Location -Path $dir
$cout = 0
Get-ChildItem -Path $dir |  Sort-Object -Property Length | ForEach-Object {
        $cout++;
        $ext = Get-Content -AsByteStream -TotalCount 5 -Path $_;
        Write-Host $ext;
        $newName = (New-Guid).Guid + ".xpm";
        Rename-Item -Path $_ -NewName $newName
    }

Set-Location $curDir