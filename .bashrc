function lob {
    git fetch --prune &>/dev/null
    comm -13 <(git branch -r | grep -v master | sed "s/origin\///g" | sort) <(git branch | grep -v "*" | grep -v "master" | sort)   
}

function clb {
    for BRANCH in $(lob);do git branch -d $BRANCH; done
}

function reportLoud {
    if [ -x "$(which say)" ] ; then 
        "$@" && say "$1 completed successfully" || ( say "$1 failed" ; false )
    else
        echo "say not found, sorry cannot report"
        false
    fi
}

function report {
    if [ -x "$(which osascript)" ] ; then 
        "$@" && osascript -e "display notification \"$1\" with title \"Succeeded!\"" || ( osascript -e "display notification \"$1\" with title \"Failed!\"" ; false ) 
    else
        echo "say osascript not found, sorry cannot report"
        false
    fi
}

set -o vi



# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/robert.haley/.nvm/versions/node/v6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/robert.haley/.nvm/versions/node/v6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/robert.haley/.nvm/versions/node/v6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/robert.haley/.nvm/versions/node/v6.10.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
