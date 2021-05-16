#!/bin/sh
#
# Detects if system is macOS
#
is_mac() {
    if [[ `uname` == "Darwin" ]]; then
        return 0
    else
        return 1
    fi
}

#
# Detects if system is Linux
#
is_linux() {
    if [[ `uname` == "Linux" ]]; then
        return 0
    else
        return 1
    fi
}

#
# Detects if environment is ZSH
#
is_zsh() {
    if [ -n "$ZSH_VERSION" ]; then
        return 0
    elif [ -n "$BASH_VERSION" ]; then
        return 1
    fi
}

#
# Resets the color
#
msg_reset () {
  RESET='\033[0m'
  printf "${RESET}\n"
}

#
# Log an error
#
error () {
  RED_FORE='\033[0;31m'
  printf "${RED_FORE}ERROR: $1"
  msg_reset
}

#
# Log verbose message
#
verbose () {
  CYAN_FORE='\033[0;36m'
  printf "${CYAN_FORE}INFO: $1"
  msg_reset
}

#
# Log message
#
msg () {
  printf "$1\n"
}
gnome-terminal --wait --tab --title="Setup" -e 'sh ./setup.sh'
gnome-terminal --wait --tab --title="Populate Database" -e 'sh ./database.sh'
msg "You should now be able to launch the server with bundle exec rails s"
verbose "Doubtfire should be successfuly Installed!"