#!/bin/env bash
# SimonSed - a wrapper for Sed.
# This library has many functions to simplify usage of sed.

# Last Updated: Fri, Oct 23, 2026

# ShellCheck: Disable color warnings.
# shellcheck disable=SC2154


SimonSed_Version="26.10.1_v2"
# New in V2:
#  - Added Sanity Checks to String-related Functions.

#################################################################################################
# Define Colors Library #                                                                  			#
#################################################################################################

# Define Our Colors
# NEW Sep 14, 2026: Added orange color.

  black=$(tput setaf 0)
  red=$(tput setaf 1)
  orange=$(tput setaf 166)
  green=$(tput setaf 2)
  yellowbrown=$(tput setaf 3)
  blue=$(tput setaf 4)
  magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)
  whitelightgray=$(tput setaf 7)
  whitelightgrey=$(tput setaf 7)
  brightblack_darkgray=$(tput setaf 8)
  brightblack_darkgrey=$(tput setaf 8)
  brightred=$(tput setaf 9)
  brightgreen=$(tput setaf 10)
  brightyellow=$(tput setaf 11)
  brightblue=$(tput setaf 12)
  brightmagenta=$(tput setaf 13)
  brightcyan=$(tput setaf 14)
  brightwhite=$(tput setaf 15)
  reset=$(tput sgr0) # Reset to default 


#################################################################################################
# Define Display Functions Library #                                                      			#
#################################################################################################

function DisplayLine() {
	echo " ${brightblue}--------------------------------------------------${reset} "
}

function DisplayLine_U() {
        echo " ${brightblue}__________________________________________________${reset} "
}


function NewLine() {
	echo " "
}

function NewLineCinema() {
	NewLine
	DisplayLine
	NewLine
}

function DisplayBanner() {
	echo " ${brightyellow} $0 - Version $0_Version ${reset} "
	# DisplayLine
	echo " ${brightblue} Git Status Of Directories Is Displayed Below: ${reset}"
}


function Usage() {
  SimonSed_DisplayBanner
  echo "Usage: $0 --replace-string=[string_to_replace] [replacement_string] [FILE] - Replace a specified string within a file."
  echo "Usage: $0 --strip-string=[string] [FILE] - Strip a specified string from a file."
  echo "Usage: $0 --trim-whitespace [FILE] - Trim whitespace from a file."
  echo "Usage: $0 --strip-lead-characters=[number of characters] [FILE] - Strip a specified number of lead characters from a file."
  echo " "
}


#################################################################################################
# Define SimonSed Functions Library #                                                      			#
#################################################################################################

### TODO: Add function to replace a specified string with another one.

function Replace_String() {
# Sanity check: If input is empty, return immediately with a failure code
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Input string is empty." >&2
    return 1
fi
  
  Sed_String_To_Replace="$1"
  Sed_Replacement_String="$2"
  # FIXME: Place command here
  # Example command to test:
  #   sed "s/$Sed_String_To_Replace/$Sed_Replacement_String/g" input_file.txt > output_file.txt
   echo "Not Implemented Yet."
  }
  
## TODO:   Add function to strip a specified string $Sed_String.

Strip_String() {
  # Sanity check: If input is empty, return immediately with a failure code
  if [ -z "$1" ]; then
    echo "Error: Input string is empty." >&2
    return 1
  fi

  local Sed_String_To_Strip="$1"
  
  # Double quotes allow the variable to expand; the g flag removes all occurrences
  sed "s/$Sed_String_To_Strip //g"
}



# Function to trim leading/trailing whitespace (spaces, tabs, newlines)
Trim_Whitespace() {
  # Sanity check: If input is empty, return immediately with a failure code
  if [ -z "$1" ]; then
    echo "Error: Input string is empty." >&2
    return 1
  fi
  
  local input_string="$1"
  
  # Remove leading whitespace (\s* or ^\s*), trailing whitespace (\s*$ or \s*$)
  sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' <<< "$input_string"
}

function Trim_Whitespace_Example() {
# Example Usage:
  whitespace_var="   Lots of space before and after   "
  trimmed_var=$(trim_whitespace "$whitespace_var")
  echo "Original: '$whitespace_var'"
  echo "Trimmed:  '$trimmed_var'"
}


function Strip_Lead-Characters() {
   # Sanity check: If input is empty, return immediately with a failure code
  if [ -z "$1" ]; then
    echo "Error: Input string is empty." >&2
    return 1
  fi
  
  echo "Not Implemented Yet."
}


###################################################################################################################
# Main Program #                                                                                                  #
###################################################################################################################

# Check the value of the first argument ($1)
case "$1" in
    "--replace-string")
        Replace_String "$1" "$2"
        ;;
    "--strip-string")
        Strip_String "$1"
        ;;
    "--trim-whitespace")
        Trim-WhiteSpace "$1"
        ;;
    "--strip-lead-characters")
        Strip_Lead_Characters "$1"
        ;;
    *)
        Usage
        exit 1
        ;;
esac
