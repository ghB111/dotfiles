# Setup fzf
# ---------
if [[ ! "$PATH" == */home/b111/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/b111/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/b111/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/b111/.fzf/shell/key-bindings.bash"
