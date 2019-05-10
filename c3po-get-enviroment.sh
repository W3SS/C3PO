grep -o 'hubot-[a-z0-9_-]\+' external-scripts.json | \
    xargs -n1 -I {} sh -c 'sed -n "/^# Configuration/,/^#$/ s/^/{} /p" \
        $(find node_modules/{}/ -name "*.coffee")' | \
    awk -F '#' '{ printf "%-25s %s\n", $1, $2 }'