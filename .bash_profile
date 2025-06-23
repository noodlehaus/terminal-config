alias ls='ls -G'
alias ll='ls -l'

# git prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# clean prompt
export PS1="[$(parse_git_branch)]\n\w \$ "

# python
alias initenv='[ ! -e .venv ] && python3 -m venv .venv || echo "Environment already present."'
alias activate='[ -e .venv/bin/activate ] && source .venv/bin/activate || echo "No .venv directory found."'

