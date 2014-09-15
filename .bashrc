export PATH=$PATH:/share/es-ops/scripts:/usr/local/bin:/usr/sbin:/usr/ccs/bin:/usr/bin:/usr/sfw/bin
export PATH=$PATH:/usr/X/bin:/usr/X11/bin:/usr/local/bin
export PATH=$PATH:~/myutools:/share/soft/bin/
export WS=/export/ws/homer/mao/
export PATH=$PATH:/opt/yobuild/bin/
# alias setup
##########################################
alias aws1='ssh ubuntu@ec2-54-68-132-178.us-west-2.compute.amazonaws.com -i ~/.ssh/awskey1.pem'
alias ls='ls -G'
alias gv='gvim'
alias opendir='nautilus'
alias nunki='ssh -X zemao@nunki.usc.edu'
alias aludra='ssh -X zemao@aludra.usc.edu'
alias scripts='cd /share/es-ops/scripts'
alias connex='cd /share/es-ops/scripts/CONNEX/SourceFiles'
alias 3par='ssh maoze@3par-serv1.3pardata.com'
alias simpsons='ssh maoze@simpsons.3pardata.com'
alias flanders='ssh maoze@flanders.3pardata.com'
alias console2='ssh maoze@console2.3pardata.com'
alias pa='ssh maoze@pa-console1.usa.hp.com'
alias hp='cd /export/ws/homer/mao/swiss_3.1.4/tpdsrc'
alias cs='cscope'
alias gdn="git diff --no-ext-diff"
if [ "$PS1" ]; then
  if [ -z "$PROMPT_COMMAND" ]; then
    case $TERM in
    xterm*)
        if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
        else
            PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        fi
        ;;
    screen)
        if [ -e /etc/sysconfig/bash-prompt-screen ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
        else
            PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        fi
        ;;
    *)
        [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
        ;;
      esac
  fi
  # Turn on checkwinsize
  shopt -s checkwinsize
  [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
  # You might want to have e.g. tty in prompt (e.g. more virtual machines)
  # and console windows
  # If you want to do so, just add e.g.
  # if [ "$PS1" ]; then
  #   PS1="[\u@\h:\l \W]\\$ "
  # fi
  # to your custom modification shell script in /etc/profile.d/ directory
fi

if ! shopt -q login_shell ; then # We're not a login shell
    # Need to redefine pathmunge, it get's undefined at the end of /etc/profile
    pathmunge () {
        case ":${PATH}:" in
            *:"$1":*)
                ;;
            *)
                if [ "$2" = "after" ] ; then
                    PATH=$PATH:$1
                else
                    PATH=$1:$PATH
                fi
        esac
    }

    # Only display echos from profile.d scripts if we are no login shell
    # and interactive - otherwise just process them to set envvars
    for i in /etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            if [ "$PS1" ]; then
                . "$i"
            else
                . "$i" >/dev/null 2>&1
            fi
        fi
    done

    unset i
    unset pathmunge
fi
