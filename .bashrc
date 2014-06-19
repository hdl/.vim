export PATH=$PATH:/share/es-ops/scripts:/usr/local/bin:/usr/sbin:/usr/ccs/bin:/usr/bin:/usr/sfw/bin
export PATH=$PATH:/usr/X/bin:/usr/X11/bin
export PATH=$PATH:~/myutools:/share/soft/bin/
export WS=/export/ws/homer/mao/
export KERNELSRC=/export/ws/homer/mao/linux_3.1.4

# alias setup
##########################################
alias la='ls -all'
alias gv='gvim'
alias nunki='ssh zemao@nunki.usc.edu'
alias aludra='ssh zemao@aludra.usc.edu'
alias scripts='cd /share/es-ops/scripts'
alias connex='cd /share/es-ops/scripts/CONNEX/SourceFiles'
alias 3par='ssh maoze@3par-serv1.3pardata.com'
alias simpsons='ssh maoze@simpsons.3pardata.com'
alias flanders='ssh maoze@flanders.3pardata.com'
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
