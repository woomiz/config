# Learning VIM

## Date: 14/12/2023
- Use `vim` to open vim, make changes, then use `:wq file.txt` to write to the file and quit the file. Alternatively use `vim file.txt` to create a file in edit mode and save it with `:w`.
- `:e[dit]` accepts wildcard arguments. `*` matches any files in the current directory. If you are only looking for files with `.yml` extension in the current directory:
```
:edit *.yml<Tab>
```

## Date: 1/1/2024
- To split the vim pane horizontally use `Ctrl + w + s` or `:sp` or `:split`, eg: `sp file1.txt`
- To split the vim pane verticallly use `Ctrl + w + v` or `:vsp` or `vsplit`, eg: `vsp file1.txt`
- To make the vim panes all of equal width use `Ctrl + w + =`
- To shift the vim pane to the top,right,bottom,left use `Ctrl + w + K` `Ctrl + w + L` `Ctrl + w + J` `Ctrl + w + H`
- To search for a text use `/text` and to find the next occurence press `n` and to go back to previous occurence use `N`
- To search and replace, use `:%s/textToFind/replacementText/g, here /g will apply the changes for all the occurence but if you want to search and replace the first occurence then use `:%s/textToFind/replacementText`
- Use `:bn` for buffer next, use `:bp` for buffer previous, use `:b 1` for using a numbered buffer
- Use `:bd 1` to delete a buffer
- Use `Ctrl + ^` to open the previously edited buffer on the current vim window