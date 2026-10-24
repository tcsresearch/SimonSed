#!/bin/env bash

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
