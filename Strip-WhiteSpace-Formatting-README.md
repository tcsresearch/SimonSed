### Strip Whitespace: Formatting Tips for Sed.

Both commands strip leading and trailing whitespace, but the -e version is faster and more portable across different operating systems.

<hr>

#### Comparison

| Feature | `[[:space:]]+$//g'`	| `[[:space:]]+$//g'`	| `sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'` |
| :--- | :---: | :---: | :---: |
| Regex Engine | Extended Regular Expressions (-E). | Basic Regular Expressions (default). | |
| Portability | Works on modern GNU and BSD/macOS sed, but fails on older POSIX-strict sed versions. | 100% POSIX-compliant. Works on every version of sed. |
| Performance | Slightly slower because it evaluates an alternation (` | ) with /g` across the line. | Faster because anchored patterns (^ and $) stop immediately without scanning the middle of the string. |
| Readability | More compact as a single expression. | More explicit by separating leading and trailing logic. | |

<hr>

#### Key Differences
<ul>
  <li> Regex Quantifiers (+ vs *): The -E version uses + (one or more), which avoids doing a zero-length replacement on lines without spaces. <br>
    The -e version uses * (zero or more) because + is not standard in Basic Regular Expressions without escaping (\+). </li>

  <li> Global Flag (/g): The -E version requires /g so that both the start and end of the line are matched in one command. <br>
    The -e version does not need /g because each expression handles one anchor (^ or $). </li>

  <li> Quoting Flags: Wrapping -E and -e in quotes ("-E", "-e") works in Bash, though unquoted flags are standard practice. </li>

</ul>
  
<hr>

#### Recommendation

Use `sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'` in reusable scripts and functions. <br>
It avoids regex alternation overhead and guarantees compatibility across Linux, macOS, and minimal container environments.
