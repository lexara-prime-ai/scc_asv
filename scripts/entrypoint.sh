#! /bin/bash

set -u

# Overide repository ownership
sh -c "git config --global --add safe.directory $PWD"

VERSION_STRING="$INPUT_INITIAL_VERSION"

# Check for the event that occurred
if [ "$GITHUB_EVENT_NAME" = "pull_request" ]; then
    VERSION_STRING=$(versioning.sh --pull-request)
    elif [ "$GITHUB_EVENT_NAME" = "push" ]; then
    if [ "$GITHUB_REF" = "refs/heads/$INPUT_MASTER_BRANCH" ]; then
        VERSION_STRING=$(versioning.sh)
    else
        echo "Push did [NOT] occur on <master> branch"
    fi
fi

echo "version-string=$VERSION_STRING" >> "$GITHUB_OUTPUT"

exit 0