. ${HOME}/.bash_prompt

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias c="cd ~/Assets/Code/"

case $(lsb_release -si) in
	Fedora)
		alias install="sudo dnf install"
		;;
	Debian)
		alias install="sudo apt-get install"	
		;;
esac
