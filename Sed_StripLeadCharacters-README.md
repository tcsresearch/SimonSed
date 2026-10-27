### Sed: How To Strip Lead Characters
To strip leading characters using sed, use the substitution command s/ anchored to the start of the line (^).

#### Remove the First Character

| Command | How it works &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| :--- | :--- |
| ``` sed 's/^.//' filename ``` | The dot (.) matches any single character right after the start of the line (^) and replaces it with nothing. |

#### Remove the First N Characters (e.g., first 5 characters)

| Command &nbsp;&nbsp;&nbsp; <br> &nbsp;&nbsp;&nbsp; (Extended Regex) &nbsp;&nbsp;&nbsp; | Command &nbsp;&nbsp;&nbsp; <br> &nbsp;&nbsp;&nbsp; (Standard/Escaped) &nbsp;&nbsp;&nbsp; | How it works |
| :--- | :--- | :--- |
| ``` sed -E 's/^.{5}//' filename ``` | ``` sed 's/^.\{5\}//' filename ``` | ``` {5} ``` matches the preceding character class (.) five times from the beginning of the line. |

#### Remove Leading Whitespace (Spaces and Tabs)

| Command | How it works |
| :--- | :--- |
| ``` sed 's/^[ \t]*//' filename ``` | ``` ^[ \t]* ``` matches zero or more space or tab characters right at the beginning of each line and deletes them. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   Alternatively, use the POSIX character class ``` sed 's/^[[:space:]]*//' filename ```. |

#### Remove a Specific Leading Character (e.g., # or @)

| Command | How it works |
| :--- | :--- |
| ``` sed 's/^#//' filename ``` | Deletes the # character only if it is the very first character of the line. <br>  &nbsp;&nbsp;&nbsp; To strip multiple consecutive instances (like ###), use ``` sed 's/^#*//' ```. |


Note: By default, sed outputs the modified text to your terminal; add the -i flag: <br>
  &nbsp;&nbsp;&nbsp; (e.g., ``` sed -i 's/^.//' filename ```) to edit the file directly in place.
