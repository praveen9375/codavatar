#!/bin/bash
command="/usr/bin/htop"
if [ -x "$command" ]; then
    echo "$command is available for run"
else
    echo "$command is unavailable"
fi
$command
