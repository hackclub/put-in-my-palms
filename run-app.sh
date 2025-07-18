#!/bin/bash

# first argument is a link to the github repository
# repo_link=$1

# project name - it will read from the submissions folder by default
# project name is expected to have no space
project_name=$1

# IFS='/' read -ra parts <<< "$repo_link"

if [ ! -d "terminalcraft" ]; then
    echo "TerminalCraft Repo does not exist, cloning..."
    git clone https://github.com/hackclub/terminalcraft/
fi

cd terminalcraft/submissions
cd $(ls | grep -i $project_name)

# if [ -f "pyproject.toml" ]; then
#     this should be the main command
#     uv run main.py &
# fi

# run the setup command
$(cat palms.json | jq -r ".setup")

ulimit -n 65536
ttyd --port 8989 -W $(cat palms.json | jq -r ".run")

# sleep infinity
# should add other commands here
