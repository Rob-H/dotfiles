function lob {
    git fetch --prune &>/dev/null
    comm -13 <(git branch -r | grep -v master | sed "s/origin\///g" | sort) <(git branch | grep -v "*" | grep -v "master" | sort)   
}

function clb {
    for BRANCH in $(lob);do git branch -d $BRANCH; done
}

set -o vi


