#
# ~/.bashrc
#

# .bashrc by Gabriel Andrade Cunha

[[ $- != *i* ]] && return

#enable autocomplet
if [ -f .bash_completion.sh ]; then
    . .bash_completion.sh
fi

###### Variables #######

# variables for my personal configs
export BASH_USER_TO_APPLY=gabriel
export MAX_LOG_LINES=10
export BASH_LOG_ARCHIVE=".my_bash_log.txt"
export EDITOR='vim'
export HISTSIZE=10000
export HISTCONTROL=ignoreboth

# my lang and timezone
export LANG='pt_BR.UTF-8'
export LC_ALL='pt_BR.UTF-8'
export TZ="America/Cuiaba"


###### Aliases ########

# pkg mng aliases
alias pacman='sudo pacman'
alias apt='sudo apt'
alias apt-get='sudo apt-get'

# admin aliases
alias service='sudo systemctl'
alias flushdns='sudo systemctl restart systemd-resolved'
alias start='sudo systemctl start'  
alias stop='sudo systemctl stop' 
alias restart='sudo systemctl restart'  
alias status='sudo systemctl status'
alias shutdown='sudo shutdown now'
alias reboot='sudo reboot'
alias vi='vim'

#git aliases
alias gs='git status'
alias gl='git log'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gb='git branch'
alias gco='git checkout'
alias gcm='git commit -m'
alias gdiff='git diff'
alias gtag='git tag'
alias gst='git stash'
alias glog='git log --oneline --graph --decorate --all'

# docker aliases
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias db='docker build'
alias dstop='docker stop'
alias drm='docker rm'
alias drmi='docker rmi'
alias dexec='docker exec -it'
alias dlogs='docker logs'
alias dcompose='docker-compose'
alias dcp='docker cp'
alias drun='docker run'
alias dbuild='docker build -t'
alias dtag='docker tag'
alias drunbg='docker run -d'
alias dprune='docker system prune'


# kubernets aliases
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'
alias ksysgpo='kubectl --namespace=kube-system get pod'
alias krm='kubectl delete'
alias krmf='kubectl delete -f'
alias krming='kubectl delete ingress'
alias krmingl='kubectl delete ingress -l'
alias krmingall='kubectl delete ingress --all-namespaces'
alias kgsvcoyaml='kubectl get service -o=yaml'
alias kgsvcwn='kubectl get service --watch --namespace'
alias kgsvcslwn='kubectl get service --show-labels --watch --namespace'
alias kgwf='kubectl get --watch -f'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# prompt like kali
PS1="\[\033[01;32m\]┌──${debian_chroot:+($debian_chroot)}(\[\033[00m\]\u@\h\[\033[01;32m\])-[\[\033[01;34m\]\w\[\033[01;32m\]]\n└─\[\033[00m\]\$ "

# applying my configs
if [ $USER = 'gabriel' ]; then
	echo "$USER login in $(uname) at $(date +"%A, %B %d, %Y %H:%M:%S") with bash!"
	echo "$(who)" >> "$BASH_LOG_ARCHIVE"

	if [ $(wc -l < "$BASH_LOG_ARCHIVE") -gt $MAX_LOG_LINES ]; then
		remove=$(( $(wc -l < "$BASH_LOG_ARCHIVE") - $MAX_LOG_LINES ))
		if [ $remove -gt 0 ]; then
			sed -i "1,${remove}d" "$BASH_LOG_ARCHIVE"
		fi
	fi
fi

