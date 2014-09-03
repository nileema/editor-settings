export BASH_CONF="bashrc"
export PROMPT_COMMAND='echo -ne "\033];${HOSTNAME%%.*}|${PWD##*/}\007"; '

HISTFILESIZE=10000000000
HISTSIZE=9999
ulimit -n 8192

# ssh-agent, start it up if you don't have it!# dgadling has had issues in the past where the ssh-agent auto-running on his
# Mac would get disconnected eventually, and so took this from patrick.
# mschonbach hasn't had this issue but since we can't figure out how to# reliably reproduce dgadling's failure case this is made available.
mkdir -p ~/.ssh/agent-state
SSHPROFILE=~/.ssh/agent-state/${HOSTNAME}
OLDSSHPROFILE=~/.ssh_agent_state_${HOSTNAME}
if [ -f $OLDSSHPROFILE -a ! -f $SSHPROFILE ] ; then   
	mv $OLDSSHPROFILE $SSHPROFILE
fi
# Try to attach to a currently running agent
if [ -e "$SSHPROFILE" ] ; then
  . "$SSHPROFILE" > /dev/null
fi

# Make sure we succeeded
if [ -z "$SSH_AGENT_PID" ] || \
    ! (ps -p "$SSH_AGENT_PID" -o ruser,comm | grep -qE "^(${USER}|${UID})[ \t]+ssh-agent") ; then
  echo "starting ssh-agent"
  ssh-agent -s > "$SSHPROFILE"
  .  "$SSHPROFILE" > /dev/null  echo "adding ssh keys to ssh-agent"  ssh-add
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export PS1="\[\e[00;36m\][\w\$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')]\n\$ \[\e[00m\]"

alias p='cd ~/Sources/presto'
alias pf='cd ~/Sources/presto-facebook'
alias idea='open -a /Applications/IntelliJ\ IDEA\ 13.app'
alias ll='ls -al'
alias d='terminal-notifier -title "Terminal" -message "Operation complete"'
alias mcs='mvn clean install -DskipTests'
alias mcss='mvn clean install -DskipTests -Dcheckstyle.skip'
alias gitst='git st'
alias dev1='ssh dev1162.prn1.facebook.com'
alias dev2='ssh dev208.prn1.facebook.com'
alias am='git commit --amend -a --no-edit'
alias ppfmcs='p && mcs && pf && mcs'
alias s='source ~/.bashrc'

export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_OPTS="-Djava.awt.headless=true"

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'
export EDITOR=vim
alias jgrep='grep --include *.java --exclude *generated-sources -ri'
export PATH=/Users/nileema/bin:$PATH:$M2_HOME/bin

