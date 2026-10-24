#!/bin/env bash
# SimonSed - a wrapper for Sed.
# This library has many functions to simplify usage of sed.

# Last Updated: Fri, Oct 23, 2026

# ShellCheck: Disable color warnings.
# shellcheck disable=SC2154


SimonSed_Version="26.10"


### Insert SplitConfig calls here ###

###################################################################################################################
# Main Program #                                                                                                  #
###################################################################################################################

# Check the value of the first argument ($1)
case "$1" in
    "--replace-string")
        Replace_String $1 $2
        ;;
    "--strip-string")
        Strip_String $1
        ;;
    "--trim-whitespace")
        Trim-WhiteSpace
        ;;
    "--strip-lead-characters")
        Strip_Lead_Characters $1
        ;;
    *)
        Usage
        exit 1
        ;;
esac
