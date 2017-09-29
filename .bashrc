function lob {
    git fetch --prune &>/dev/null
    comm -13 <(git branch -r | grep -v master | sed "s/origin\///g" | sort) <(git branch | grep -v "*" | grep -v "master" | sort)   
}

function clb {
    for BRANCH in $(lob);do git branch -d $BRANCH; done
}

function reportLoud {
    if [ -x "$(which say)" ] ; then 
        "$@" && say "$1 completed successfully" || say "$1 failed"
    else
        echo "say not found, sorry cannot report"
    fi
}

function report {
    if [ -x "$(which osascript)" ] ; then 
        "$@" && osascript -e "display notification \"$1\" with title \"Succeeded!\"" || osascript -e "display notification \"$1\" with title \"Failed!\"" 
    else
        echo "say osascript not found, sorry cannot report"
    fi
}

set -o vi


