# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

# Automatically switch to Nushell for interactive SSH/Login sessions
if [[ $- == *i* ]] && [ -z "$NU_VERSION" ]; then
    # Ensure nu is in the PATH before trying to exec
    if command -v nu >/dev/null 2>&1; then
        exec nu
    fi
fi
