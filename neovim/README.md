
# neovim config
This my own configuration for the **nvim**.

## Features
* lazy imports plugins that are language-specific
* uses **vim-plug** to manage dependencies
* support for several languages
* code autocompletion
* snippets support
* git integration

## Languages Support
* Markdown
* [Go](https://golang.org/)
* [GraphQL](http://graphql.org/)
* [Rust](https://www.rust-lang.org)
* [Crystal](https://crystal-lang.org/)
* JavaScript & React JSX

## Keyboard Shortcuts
| Shortcut       | Description                             |
| -------------- | --------------------------------------- |
| Shift+k        | moves towards the division above        |
| Shift+j        | moves towards the division below        |
| Shift+h        | moves towards the division on the left  |
| Shift+l        | moves towards the division on the right |
| Shift+PageUp   | moves towards the next buffer           |
| Shift+PageDown | moves towards the previous buffer       |
| Ctrl+Space     | trigger autocompletion                  |
| Ctrl+n         | toggle **NERDTree**                     |
| F8             | toggle **TagBar**                       |
| ,cl            | comments code                           |
| ,ci            | uncomments code                         |
| ,f             | convert file format (**dos2unix**)      |
| ,p             | fuzzy find *files*                      |
| ,b             | fuzzy find *buffers*                    |
| ,w             | fuzzy find *windows*                    |
| ,ve            | edit **init.vim**                       |
| ,vr            | reload **vim** config                   |
| ,gc            | git commit                              |
| ,ga            | git commit with amend                   |
| ,gs            | git status                              |
| ,gl            | git log (uses my `glog` alias)          |

## Styles
This config uses [airline](https://github.com/vim-airline/vim-airline) and
[devicons](https://github.com/ryanoasis/vim-devicons) together, to show a beautiful
statusbar with development icons. Also, it uses the [badwolf](https://github.com/sjl/badwolf) theme.

## See also
There is a *short* list of plugins that I've been using in my
configuration:
* [Deoplete](https://github.com/Shougo/deoplete.nvim)
* [Fugitive](https://github.com/tpope/vim-fugitive)
* [Surround](https://github.com/tpope/vim-surround)
* [FZF](https://github.com/junegunn/fzf.vim)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [NERDTree](https://github.com/scrooloose/nerdtree)
* [Syntastic](https://github.com/vim-syntastic/syntastic)
* [Tagbar](https://github.com/majutsushi/tagbar)
* [UltiSnips](https://github.com/SirVer/ultisnips)
