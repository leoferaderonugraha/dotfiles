## Navigation
- `h`: move left
- `j`: move down
- `k`: move up
- `l`: move right
- `w`: move to the beginning of the next word
- `b`: move to the beginning of the previous word
- `e`: move to the end of the current word
- `gg`: go to the beginning of the document
- `G`: go to the end of the document
- `0`: move to the beginning of the current line
- `^`: move to the first non-blank character of the current line
- `$`: move to the end of the current line
- `{`: move to the beginning of the previous paragraph
- `}`: move to the beginning of the next paragraph
- `gg`: go to the beginning of the document
- `Gg`: go to the end of the document
- `ge`: move to the end of the previous word
- `gu`: change the current word to lowercase
- `gU`: change the current word to uppercase

## Editing
- `i`: enter insert mode
- `a`: enter insert mode after the cursor
- `o`: insert a new line below and enter insert mode
- `O`: insert a new line above and enter insert mode
- `dd`: delete the current line
- `dw`: delete from the cursor to the end of the current word
- `yy`: yank (copy) the current line
- `p`: paste the yanked or deleted text after the cursor
- `u`: undo the last change
- `Ctrl-r`: redo the last change
- `gd`: go to the definition of the current word
- `gc`: change the current word
- `gr`: replace the current character with another
- `gq`: format the current paragraph to fit the screen
- `g?`: encrypt the current text with ROT13 cipher

## Searching
- `/`: search forward for a pattern
- `?`: search backward for a pattern
- `n`: repeat the last search in the same direction
- `N`: repeat the last search in the opposite direction
- `*`: search for the current word forward
- `#`: search for the current word backward
- `g*`: search for the current word with partial matches forward
- `g#`: search for the current word with partial matches backward
- `:s/foo/bar/g`: replace all occurrences of `foo` with `bar` on the current line
- `:s/foo/bar/gc`: replace all occurrences of `foo` with `bar` on the current line, with confirmation
- `:%s/foo/bar/g`: replace all occurrences of `foo` with `bar` in the document
- `:%s/foo/bar/gc`: replace all occurrences of `foo` with `bar` in the document, with confirmation

## Some Tips
- Remove something in between: `ci`
    - eg: `ci"` to replace the content within ""
