# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/USERNAME/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/USERNAME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/USERNAME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/USERNAME/.fzf/shell/key-bindings.zsh"

