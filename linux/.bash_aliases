bind "set bell-style none"

bind ""\C-i": menu-complete"


alias c="clear"
alias e="exit"
alias l="ls -A"

alias bw="sudo rfkill block all"

alias ch="rm --force ~/.bash_history; history -c"
alias che="ch && exit"

alias fb="setfont Uni3-TerminusBold28x14"

alias generate-certificate="openssl req -x509 -days 365 -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -nodes -keyout certificate-key.pem -out certificate.pem"

alias u="(set -x; sudo apt update) && printf '\n'; (set -x; sudo apt full-upgrade --auto-remove --purge)"

alias up="ps -u "$(id -u)""
