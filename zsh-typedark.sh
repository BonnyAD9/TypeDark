ZSH_HIGHLIGHT_HIGHLIGHTERS+=(
    regexp
    brackets
)

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff3232,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#4c8dff'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#e2ccff'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#ed478f'
ZSH_HIGHLIGHT_STYLES[function]='fg=#28cc92'
ZSH_HIGHLIGHT_STYLES[command]='fg=#28c3cc'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#4c8dff,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#e5dba0'
ZSH_HIGHLIGHT_STYLES[path]='fg=#ccc88e,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#eee,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#ccc88e,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#eee,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#e0e55b'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#e0e55b'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#e0e55b,underline'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=#d072e5'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ffa632'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ffa632'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#e0e55b'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#e5ce5b'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#ff3232'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#e5a55b'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#ff3232'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#e5ce5b'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#ff3232'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#ffd400'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#e2ccff'
ZSH_HIGHLIGHT_STYLES[dollar]='fg=#e2ccff'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#ff8800'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#ffd400'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#e5dba0'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#d072e5,underline'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#ccc88e,underline'

# additional regex styles
typeset -A ZSH_HIGHLIGHT_REGEXP
ZSH_HIGHLIGHT_REGEXP+=('\$[a-zA-Z_][a-zA-Z0-9_]*' 'fg=#e2ccff')
ZSH_HIGHLIGHT_REGEXP+=('\$\{[a-zA-Z_][a-zA-Z0-9_]*\}' 'fg=#e2ccff')
ZSH_HIGHLIGHT_REGEXP+=('\$[0-9]+' 'fg=#ffa632')
ZSH_HIGHLIGHT_REGEXP+=('\$\{[0-9]+\}' 'fg=#ffa632')
ZSH_HIGHLIGHT_REGEXP+=('^[a-zA-Z_][a-zA-Z0-9_]*=' 'fg=#e2ccff')

# bracket styles
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=#ff3232,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=#cccc8e'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=#8ecccc'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=#cc8ecc'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=#cccc8e'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=#8ecccc'
ZSH_HIGHLIGHT_STYLES[bracket-level-6]='fg=#cc8ecc'
