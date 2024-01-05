# Copyright (c) 2020 Mikkel Kaysen

# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */zsh-eza && -z ${fpath[(r)${0:h}]} ]] {
    fpath+=( "${0:h}" )
}

# Standard hash for plugins, to not pollute the namespace
typeset -gA Plugins
Plugins[ZSH_EZA_DIR]="${0:h}"

(( ${+commands[eza]} )) && () {

  alias ls="eza"

} ${Plugins[ZSH_EZA_DIR]}

alias l="ls -1a"
alias ll="ls -l"
alias lr="ll -T"
alias la="ll -a"
alias lm="la | \"${PAGER}\""
alias lx="ll --sort Extension"
alias lk="ll --sort size"
alias lt="ll -U --sort created"
alias lc="ll --sort changed"
alias lu="ll -u --sort accessed"

