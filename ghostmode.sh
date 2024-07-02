#!/bin/bash

PROMPT_COMMAND_STRING='PROMPT_COMMAND=\'READLINE_LINE=" $READLINE_LINE"; READLINE_POINT=${#READLINE_LINE}\''

# Check if the .bashrc file already contains PROMPT_COMMAND modification
if grep -q "$PROMPT_COMMAND_STRING" ~/.bashrc; then
    echo "You are already a ghost"
else
    # Append the PROMPT_COMMAND to the .bashrc file
    echo "$PROMPT_COMMAND_STRING" >> ~/.bashrc
    echo "PROMPT_COMMAND has been added to ~/.bashrc"

    # Source the .bashrc to apply changes immediately
    source ~/.bashrc
    echo "Ghost mode"
fi