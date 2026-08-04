# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# If the shell is interactive and not dumb and nu exists, switch to it
if [[ $- == *i* ]] && [ -z "$NU_VERSION" ] && [ "$TERM" != "dumb" ]; then
    # Ensure nu is in the PATH before trying to exec
    if command -v nu >/dev/null 2>&1; then
        exec nu
    fi
fi
