#!/bin/bash

set -e

LOGDIR="logs"

if [ ! -d "$LOGDIR" ]; then
    mkdir "$LOGDIR"
fi

echo "Starting xi-core."
(
    unset http_proxy && unset https_proxy
    cd xi-core
    exec npm start 2>&1 >> "../logs/xi-core.log"
) &

while read agent; do
    [ -z "$agent" ] && continue # skip empty lines
    [[ $agent == \#* ]] && continue # skip comments
    sleep 1
    (
        cd "agents/$agent"
        exec node index.js --logfile "../../logs/$agent.log"
    ) &
    echo "Starting agent: $agent."

done < scripts/agents

echo "Xi started"
wait
