# Learning VIM

## Date: 14/12/2023

- Use `vim` to open vim, make changes, then use `:wq file.txt` to write to the file and quit the file. Alternatively use `vim file.txt` to create a file in edit mode and save it with `:w`.
- `:e[dit]` accepts wildcard arguments. `*` matches any files in the current directory. If you are only looking for files with `.yml` extension in the current directory:

```
:edit *.yml<Tab>
```

## Date: 1/1/2024

- To split the vim pane horizontally use `Ctrl + w + s` or `:sp` or `:split`, eg: `sp file1.txt`
- To split the vim pane vertically use `Ctrl + w + v` or `:vsp` or `vsplit`, eg: `vsp file1.txt`
- To make the vim panes all equal width use `Ctrl + w + =`
- To shift the vim pane to the top, right, bottom, left use `Ctrl + w + K` `Ctrl + w + L` `Ctrl + w + J` `Ctrl + w + H`
- To search for a text use `/text` and to find the next occurrence press `n` and to go back to previous occurrence use `N`
- To search and replace, use `:%s/textToFind/replacementText/g, here /g will apply the changes for all the occurence but if you want to search and replace the first occurence then use `:%s/textToFind/replacementText`
- Use `:bn` for buffer next, use `:bp` for buffer previous, use `:b 1` for using a numbered buffer
- Use `:bd 1` to delete a buffer
- Use `Ctrl + ^` to open the previously edited buffer on the current vim window
- I can go visual line mode with `V`, visual mode with `v` and visual block mode with `Ctrl + v`
- I can yank a single line with `yy` or yank multiple lines towards bottom with `y2j` or multiple lines towards top with `y4k`
- I can delete multiple lines with `d5j` or `d5k`, I can also do `d5l` and `d5h` but this is not often used
- I can go 5 words backwards with `5b` or `5B` and go 5 words in-front with `4w` or `5W`, again this is not often used

## Date: 2/1/2024

- From the netrw listing, I can `%` to create a file and `d` to create a directory
- From the file that is opened, I can use `E` or `Ex` or `Explore` to bring in the listing
- CHANGE - use ` ` (space) as `<leader>`
- CHANGE - use `<leader>pv` to explore the listing
- Use `:so` to source the current file and to see the changes then and there, but the more permanent changes will happen after restart
- Use `Ctrl + e` to scroll down and `Ctrl + y` to scroll up

## Date: 10/1/2024

- Use `g0` to go the start of a line (multiline sentence)
- Use `g$` to go the end of a line (multiline sentence)

## Date: 11/1/2024

- Use `:Lazy` to invoke lazy.nvim config

## Date: 15/1/2024

- Use `Ctrl + o` to jump back to previous cursor position
- Use `Ctrl + i` to jump to the current cursor position

## Date: 17/1/2024

- Use `ciw` to delete and go to insert mode
- Use `caw` to delete with spaces and go to insert mode

## Date: 23/1/2024

- CHANGE - Use `Ctrl + p` to move the view upwards

## Date: 26/1/2024

- Use `ci + something` eg: `ci +"` from with in or near to "" to remove everything inside ""
  ```js
  const str = "something in here";
  ```
  Outputs:
  ```js
  const str = "";
  ```
- Use `ca + something` eg: `ca +"` from with in or near to "" to remove everything including ""
  ```js
  const str = "something in here";
  ```
  Outputs:
  ```js
  const str =
  ```

## Date 27/1/2024

- Use `vert {cmd}` to split the command window to right eg: `vert h vsp`
- Use `di + something` to delete inside the nearest eg: `di [` on
  ```js
  const arr = [2, 5, 6, 12];
  ```
  gives this in visual mode
  ```js
  const arr = [];
  ```
- Use `yi + something` to delete inside the nearest eg: `yi [` on
  ```js
  const arr = [2, 5, 6, 12];
  ```
  copies the values inside the string [
