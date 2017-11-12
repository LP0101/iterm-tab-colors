#!/bin/zsh

if [[ -n "$ITERM_SESSION_ID" ]]; then
    color() {
        echo -ne "\033]6;1;bg;red;brightness;$1\a"
        echo -ne "\033]6;1;bg;green;brightness;$2\a"
        echo -ne "\033]6;1;bg;blue;brightness;$3\a"
    }

    reset() {
        echo -ne "\033]6;1;bg;*;default\a"
    }

    colorcheck() {
        if [[ "$1" =~ "^ssh\ " ]]; then
            if [[ "$1" =~ "regex|containing|prod|domains\.com" ]]; then
                color 255 0 0
            else
                color 0 255 0
            fi
    elif [[ "$1" =~ "^vagrant\ ssh" ]]; then
	    color 0 0 255
        fi 
} 
    autoload -U add-zsh-hook

    add-zsh-hook precmd reset
    add-zsh-hook preexec colorcheck

fi
