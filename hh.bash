###-begin-hh-completion-###
if type complete &>/dev/null; then
  _hh_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           hardhat-completion completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"

    if [ "$COMPREPLY" = "__tabtab_complete_files__" ]; then
      COMPREPLY=($(compgen -f -- "$cword"))
    fi

    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _hh_completion hh
fi
###-end-hh-completion-###
