#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


parse_git_branch() {
  git rev-parse --is-inside-work-tree &>/dev/null && git branch --show-current 2>/dev/null || echo ""
}

PS1='\[\e[38;2;126;156;216m\]┌─ [\[\e[38;2;152;187;108m\]\w\[\e[38;2;126;156;216m\]]'
PS1+='$(branch=$(parse_git_branch); if [ -n "$branch" ]; then printf "─[\e[38;2;230;195;132m%s\e[38;2;126;156;216m]" "$branch"; fi)'
PS1+='\n└─❯ \[\e[0m\]'

