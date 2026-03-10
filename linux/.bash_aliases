## Bindings ##

bind 'set bell-style none'

bind '"\C-i": menu-complete'



## Aliases ##

# Font Aliases
alias font-bold='setfont Uni3-TerminusBold28x14'


# Git Aliases
alias gs='git status'


# History Aliases
alias ch='rm --force "$HOME/.bash_history"; history -c'
alias che='ch && exit'


# Host Aliases
alias c='clear'
alias e='exit'
alias l='ls -a'


# OpenSSL Aliases
alias generate-certificate='openssl req -x509 -out "./certificate.pem" -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -nodes -keyout "./certificate-key.pem"'


# System Aliases
alias apt-upgrade='(set -x; sudo apt update) && printf '\n'; (set -x; sudo apt full-upgrade --auto-remove --purge)'

alias u='apt-upgrade'


# User Aliases
alias up='ps --user "$(id --user)"'


# Wireless Radio Aliases
alias block-radios='sudo rfkill block all'
