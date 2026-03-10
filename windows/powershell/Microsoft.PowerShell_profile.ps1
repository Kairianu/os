$GIT_PERSONAL_EMAIL_VARIABLE_NAME = "GIT_PERSONAL_EMAIL"
$GIT_PERSONAL_USERNAME_VARIABLE_NAME = "GIT_PERSONAL_USERNAME"



function Git--Clone-Personal-Repository($repositoryPath, $outputPath) {
	if ( -not "$outputPath" ) {
		$outputPath = "$repositoryPath"
	}

	$username = [System.Environment]::GetEnvironmentVariable(
		"$GIT_PERSONAL_USERNAME_VARIABLE_NAME",
		[System.EnvironmentVariableTarget]::User
	)

	git clone `
		"git@github.com:$username/$repositoryPath.git" `
		"$outputPath"
}

function Git--Set-Personal-Config {
	$environmentTarget = [System.EnvironmentVariableTarget]::User

	$email = [System.Environment]::GetEnvironmentVariable(
		"$GIT_PERSONAL_EMAIL_VARIABLE_NAME",
		"$environmentTarget"
	)

	if ( -not "$email" ) {
		Write-Host `
			-ForegroundColor "red" `
			"Git personal email environment variable <$GIT_PERSONAL_EMAIL_VARIABLE_NAME> is not set."

		return
	}

	$username = [System.Environment]::GetEnvironmentVariable(
		"$GIT_PERSONAL_USERNAME_VARIABLE_NAME",
		"$environmentTarget"
	)

	if ( -not "$username" ) {
		Write-Host `
			-ForegroundColor "red" `
			"Git personal username environment variable <$GIT_PERSONAL_USERNAME_VARIABLE_NAME> is not set."

		return
	}

	git config user.email "$email"
	git config user.name "$username"

	git config user.email
	git config user.name
}

function Git--Set-Personal-Config-Environment-Variables($email, $username) {
	$environmentTarget = [System.EnvironmentVariableTarget]::User

	[System.Environment]::SetEnvironmentVariable(
		"$GIT_PERSONAL_EMAIL_VARIABLE_NAME",
		"$email",
		"$environmentTarget"
	)

	[System.Environment]::SetEnvironmentVariable(
		"$GIT_PERSONAL_USERNAME_VARIABLE_NAME",
		"$username",
		"$environmentTarget"
	)

	Write-Host `
		-ForegroundColor "green" `
		"$GIT_PERSONAL_EMAIL_VARIABLE_NAME = $email" `
		"`n$GIT_PERSONAL_USERNAME_VARIABLE_NAME = $username"
}

function Git--Status {
	git status
}


function History--Delete-All {
	Clear-History
	[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()

	Remove-Item (Get-PSReadLineOption).HistorySavePath
}


function Host--Exit {
	exit
}


function Network--IP-Clear {
	ipconfig /release
	ipconfig /release6
	ipconfig /flushdns
}

function Network--IP-Renew {
	ipconfig /renew
	ipconfig /renew6
}


function Windows--Repair {
	DISM.exe /Online /Cleanup-Image /RestoreHealth
	sfc /SCANNOW
}



# History Aliases
Set-Alias -Name ch -Value History--Delete-All

# Host Aliases
Set-Alias -Name c -Value Clear-Host
Set-Alias -Name e -Value Host--Exit

# Git Aliases
Set-Alias -Name gs -Value Git--Status
Set-Alias -Name gcpr -Value Git--Clone-Personal-Repository
