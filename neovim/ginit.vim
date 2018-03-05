"
" Gustavo Paulo <gustavo.paulo.segura@gmail.com>
" nvimrc configuration

"" set gui font
if exists('g:GuiLoaded')
  Guifont Knack Nerd Font Mono:h11
else
  call rpcnotify(1, 'Gui', 'Font', 'Knack Nerd Font Regular 11')
endif
