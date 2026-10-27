### Sed: How To Strip Lead Characters
To strip leading characters using sed, use the substitution command s/ anchored to the start of the line (^).

#### Remove the First Character

• Command: sed 's/^.//' filename
• How it works: The dot (.) matches any single character right after the start of the line (^) and replaces it with nothing.

#### Remove the First N Characters (e.g., first 5 characters)

• Command (Extended Regex): sed -E 's/^.{5}//' filename
• Command (Standard/Escaped):' sed 's/^.\{5\}//' filename
• How it works: {5} matches the preceding character class (.) five times from the beginning of the line.

#### Remove Leading Whitespace (Spaces and Tabs)

• Command: sed 's/^[ \t]*//' filename
• How it works: ^[ \t]* matches zero or more space or tab characters right at the beginning of each line and deletes them. Alternatively, use the POSIX character class sed 's/^[[:space:]]*//' filename.

#### Remove a Specific Leading Character (e.g., # or @)

• Command: sed 's/^#//' filename
• How it works: Deletes the # character only if it is the very first character of the line. To strip multiple consecutive instances (like ###), use sed 's/^#*//'.


Note: By default, sed outputs the modified text to your terminal; add the -i flag (e.g., sed -i 's/^.//' filename) to edit the file directly in place.
