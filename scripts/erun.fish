function erun -d "easifem run"
    set -l currentPath ( pwd )

    if count $argv >/dev/null
        set filename $argv
    else
        if set -ql _flag_directory
            set dirname (fd --type d | fzf )
            set filename (find $dirname  -name "*.[fF]*" -o -name "*.md" -type f | fzf )
        else
            set filename (find . -name "*.[fF]*" -o -name "*.md" -type f | fzf )
        end
    end

    if set -ql _flag_smartout
        easifem run $filename >tmp_erun
        _easifem_output_reshape tmp_erun
        rm -f tmp_erun
    else
        easifem run $filename
    end
    builtin cd $currentPath
end
