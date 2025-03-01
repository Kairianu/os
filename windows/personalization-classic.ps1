param(
	[switch] $Color,
	[switch] $Main
)


$personalizationPath = "\pageWallpaper"

if ( $Color ) {
	$personalizationPath = "\pageColorization"
}
elseif ( $Main ) {
	$personalizationPath = ""
}

cmd.exe /C "explorer.exe shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921} -Microsoft.Personalization$personalizationPath"
