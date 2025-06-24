function Exit-Host {
	exit;
}


Set-Alias -Name c -Value Clear-Host
Set-Alias -Name e -Value Exit-Host
