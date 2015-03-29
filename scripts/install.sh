#!/usr/bin/env bash

SCRIPTS_DIR="scripts"
AGENTS_FILE="scripts/agents"
AGENTS_DIR="agents"

trap "kill 0" SIGINT # kill all subprocesses

set -e # exit script if any command errors out

git submodule init
git submodule update

if [ ! -f $AGENTS_FILE ]; then
    (set -x && exec cp "$SCRIPTS_DIR/agents.sample" $AGENTS_FILE)
fi

(set -x && cd xi-core && exec npm install --production)
(set -x && cd xal-javascript && exec npm install --production)

for d in $AGENTS_DIR/* ; do
    if [[ -d "$d" && ! -L "$d" ]]; then
        (
            set -x
            cd "$d"
            if [ -f package.json ]; then
                exec npm install --production
            fi
        )
    fi
done

echo "Update complete."
