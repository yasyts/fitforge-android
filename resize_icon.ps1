Add-Type -AssemblyName System.Drawing

$sourceIcon = $args[0]
$resDir = $args[1]

$sizes = @{
    "mipmap-mdpi" = 48
    "mipmap-hdpi" = 72
    "mipmap-xhdpi" = 96
    "mipmap-xxhdpi" = 144
    "mipmap-xxxhdpi" = 192
}

$img = [System.Drawing.Image]::FromFile($sourceIcon)

foreach ($entry in $sizes.GetEnumerator()) {
    $folder = $entry.Key
    $size = $entry.Value
    $outDir = Join-Path $resDir $folder

    if (-not (Test-Path $outDir)) {
        New-Item -ItemType Directory -Path $outDir -Force | Out-Null
    }

    # Create resized bitmap
    $bmp = New-Object System.Drawing.Bitmap($size, $size)
    $graphics = [System.Drawing.Graphics]::FromImage($bmp)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.DrawImage($img, 0, 0, $size, $size)
    $graphics.Dispose()

    # Save as PNG - ic_launcher
    $outPath = Join-Path $outDir "ic_launcher.png"
    $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Host "Created ${size}x${size} ic_launcher in $folder"

    # Save as PNG - ic_launcher_round
    $outPathRound = Join-Path $outDir "ic_launcher_round.png"
    $bmp.Save($outPathRound, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Host "Created ${size}x${size} ic_launcher_round in $folder"

    $bmp.Dispose()
}

$img.Dispose()
Write-Host "All icons generated successfully!"
