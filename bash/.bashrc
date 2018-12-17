# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias l='ls -alh --colo=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias yl='yarn logs -applicationId'

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

# export PS1="\[\e[33;41m\]\`nonzero_return\`\[\e[m\]\[\e[32m\]\u\[\e[m\] @ \[\e[32;40m\]\h\[\e[m\] at \[\e[34m\]\t\[\e[m\] in \[\e[36m\]\w\[\e[m\]\[\e[33m\]  --->\[\e[m\]\n" 
export PS1="\n\[\e[33;41m\]\[\e[m\]\[\e[32m\]\u\[\e[m\] @ \[\e[32;40m\]\h\[\e[m\] at \[\e[34m\]\t\[\e[m\] in \[\e[36m\]\w\[\e[m\]\n\[\e[33m\]---> \[\e[m\]"
