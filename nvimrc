"{{{===PLUGINS===
call plug#begin('~/.nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'thinca/vim-quickrun'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'yejianye/vim-ctrlp-cmdpalette', { 'branch': 'devel' }
Plug 'chase/vim-ansible-yaml'
Plug 'b4winckler/vim-objc'
Plug 'jnwhiteh/vim-golang'
Plug 'rizzatti/dash.vim'
Plug 'glench/vim-jinja2-syntax'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'SirVer/ultisnips'
Plug 'szw/vim-maximizer'
call plug#end()
"}}}
"{{{===GENERAL SETTINGS===
if !exists('g:macos')
    let g:macos=has('mac') || executable('pbcopy')
endif
set nocompatible
set nowritebackup
set fileencodings=ucs-bom,utf-8,gbk,gb18030,gb2312,default,latin1
set relativenumber
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set backspace=2
set laststatus=2
set sessionoptions=blank,buffers,curdir,folds,help,localoptions,tabpages,winsize
set statusline=%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%<%{fugitive#statusline()} "  Git Hotness
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set ruler
set autoread
set incsearch
set ignorecase smartcase
set autoindent
set smartindent
set cinkeys=0{,0},!^F,o,O,e " default is: 0{,0},0),:,0#,!^F,o,O,e
set iskeyword=a-z,A-Z,48-57,_
set history=1000
set undolevels=1000
set conceallevel=2 concealcursor=i
set switchbuf=useopen,usetab
set hidden 
set wildchar=<Tab> wildmenu wildmode=full
filetype plugin on 
filetype indent on
syntax on

"fix input method conflict
au InsertEnter * set noimd
au InsertLeave * set imd
" Insert and command-line mode Caps Lock.
" Lock search keymap to be the same as insert mode.
set imsearch=-1
" Load the keymap that acts like capslock.
set keymap=insert-only_capslock
set iminsert=0
au InsertLeave * set iminsert=0

if has('gui_running')
	set guioptions-=T           " remove the toolbar
	set guioptions-=L           " remove the scrollbar
	set guioptions-=r           " remove the scrollbar
	if has('gui_macvim')
		set guifont=Source\ Code\ Pro\ Light:h12
	endif
endif
set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
au VimEnter * set background=dark
au VimEnter * color solarized
au VimEnter * AirlineRefresh

"}}}
"===FILETYPE SETTING=== {{{
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif

autocmd! BufWritePost *.sh silent !chmod +x %
autocmd! BufWritePost *.pl silent !chmod +x %

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

"html settings
let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 
let g:html_indent_inctags = "html,body,head" 

" }}}
"===KEY MAPPING=== {{{
let mapleader = ","
nnoremap s ;
nnoremap S ,
tnoremap <C-m><C-m> <C-\><C-n>
imap <C-V> <C-R>"
imap <C-B> <C-O>b
imap <C-F> <C-O>w
imap <C-H> <C-O>h
imap <C-J> <C-O>j
imap <C-K> <C-O>k
imap <C-L> <C-O>l
imap <C-A> <C-O>^
imap <C-E> <C-O>$
imap <C-S> <C-O>dw
imap <C-D> <C-O>x
inoremap # X<BS>#
inoremap <C-E> <C-^>
nmap <leader>nu :set number<CR>
nmap <leader>rn :set rnu<CR>
nmap <leader>xx :qa!<CR>
nmap j gj
nmap k gk
nmap <leader>te :tabnew<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>tn :tabn<cr>
nmap <leader>tp :tabp<cr>
nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprev<cr>
nmap <leader>en :enew<cr>
nmap <leader>, :b#<cr>
nmap <leader>sb :sb#<cr>
nmap <leader>vs :vertical sb#<cr>
nmap <leader>wj <C-W>j
nmap <leader>wk <C-W>k
nmap <leader>wh <C-W>h
nmap <leader>wl <C-W>l
nmap <leader>w] <C-W>]
nmap <leader>wg] <C-W>g]
nmap <leader>J <C-W>J
nmap <leader>K <C-W>K
nmap <leader>H <C-W>H
nmap <leader>L <C-W>L
nmap <leader>wc :bd!<cr>
nmap <leader>we <C-W>=
nmap <leader>wz <C-W>z
nmap <leader>so :source %<CR>
nmap <leader>hl :let &hlsearch=1-&hlsearch<CR>
nmap <leader>ma :make<cr>
nmap <leader>cn :cnext<cr>
nmap <leader>cp :cprev<cr>
nmap <leader>cw :botright cwindow<cr>
nmap <leader>cl :ccl<cr>
nmap <leader>ln :lnext<cr>
nmap <leader>lp :lprev<cr>
nmap <leader>lw :botright lwindow<cr>
nmap <leader>lc :lclose<cr>
nmap <leader>cf :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>@ "zyy:@z<CR>
vmap <leader>@ "zyy:@z<CR>
nmap <leader>ie /,\n\s*}<CR>
nnoremap <C-N> }
nnoremap <C-P> {
nnoremap <C-L> )
nnoremap ( [(
nnoremap ) ])
nnoremap { [{
nnoremap } ]}
nnoremap <C-J> 5j
nnoremap <C-K> 5k
vnoremap <C-N> }
vnoremap <C-P> {
vnoremap <C-L> )
vnoremap ( [(
vnoremap ) ])
vnoremap { [{
vnoremap } ]}
vnoremap <C-J> 5j
vnoremap <C-K> 5k
cmap <C-h> <LEFT>
cmap <C-k> <UP>
cmap <C-j> <DOWN>
cmap <C-l> <RIGHT>
cmap <C-B> <C-LEFT>
cmap <C-F> <C-RIGHT>
cmap <C-A> <HOME>
cmap <C-E> <END>
cmap <S-CR> <C-U><ESC>
cmap <C-V> <C-R><C-W>
cab vsb vertical sb
cab res resize
cab vres vertical resize
cab te tabe
cab cwd lcd %:p:h
cab cf :cs find 

"smart open
if g:macos
    nnoremap <leader>op :silent !open '<C-R>=expand('<cWORD>')<CR>'<CR>
    vnoremap <leader>op "zy:silent !open '<C-R>=getreg('z')<CR>'<CR>
endif

"Copy text to Mac clipboard, even in ssh session
"This only works with clipper (https://github.com/wincent/clipper)
vnoremap <leader>yy "xy<ESC>:call system('nc localhost 8377', @x)<CR>
noremap <leader>pp :set paste<CR>:put *<CR>:set nopaste<CR>
" }}}
"===PLUGIN SETTINGS=== {{{
"-Dash-
nmap <leader>D <Plug>DashSearch
vmap <leader>D "zy:Dash <C-R>=getreg('z')<CR><CR>
let g:dash_map = {
    \ 'objc'       : 'iphoneos',
    \ 'python'     : 'python2',
    \ }

"-TagBar-
nmap <leader>tt :TagbarToggle<CR>
nmap <leader>tj :TagbarOpen fj<CR>

"-NERDTree-
nmap <leader>nd :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

"-NERDCommenter-
let g:NERDCreateDefaultMappings = 0
nmap <leader>cc <plug>NERDCommenterComment
vmap <leader>cc <plug>NERDCommenterComment
nmap <leader>cu <plug>NERDCommenterUncomment
vmap <leader>cu <plug>NERDCommenterUncomment
nmap <leader>cs <plug>NERDCommenterSexy
vmap <leader>cs <plug>NERDCommenterSexy
nmap <leader>c<space> <plug>NERDCommenterToggle
vmap <leader>c<space> <plug>NERDCommenterToggle

"-CtrlP-
let g:ctrlp_map = ';d'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
nmap ;a :CtrlPMixed<CR>
nmap ;s :CtrlPBuffer<CR>
nmap ;f :CtrlPMRU<CR>
nmap ;r :CtrlP <C-R>=expand('%:p:h')<CR><CR>
nmap ;t :CtrlPTag<CR>
nmap ;g :CtrlPBufTag<CR>
nmap ;h :CtrlPClearCache<CR>:echo 'CtrlP file cache has been cleared!'<CR>
nmap ;H :CtrlPClearAllCaches<CR>:echo 'CtrlP cache has been cleared!'<CR> 
nmap ;b :CtrlPBookmarkDir<CR>
nmap ;c :CtrlPCmdPalette<CR>

command! CtrlPVimPlugin :CtrlP ~/.nvim/plugged
let g:ctrlp_extensions = ['buffertag', 'tag', 'mixed']
let g:ctrlp_buftag_types = { 'objc' : {'bin' : 'objctags.py', 'args' : ''}}
let g:ctrlp_root_markers = ['.ctrlp_root']
let g:ctrlp_use_caching = 3000
let g:ctrlp_cmdpalette_ignore_internal = 1

"-Fugitive-
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit -a<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gg :Ggrep <C-R>=expand('<cword>')<CR><CR>
vmap <leader>gg "zy:Ggrep <C-R>=getreg('z')<CR><CR>

"-Tabular-
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= <ESC>:'<,'>Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: <ESC>:'<,'>Tabularize /:<CR>
nmap <Leader>a<bar> :Tabularize /<bar><CR>
vmap <Leader>a<bar> <ESC>:'<,'>Tabularize /<bar><CR>

"-Syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "-E --msg-template='{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}' -r n"
let g:syntastic_mode_map = {
	\ 'mode' : 'passive',
	\ 'active_filetypes' : ['coffee', 'less']
\ }
nmap <leader>li :SyntasticCheck<CR>
let g:syntastic_objc_checker = 'clang'
let g:syntastic_objc_config_file = '.clang_complete'

"Perl Settings
let perl_fold = 1
let perl_nofold_packages = 1

"Python Settings
let pydoc_highlight = 0

"Quickrun
map <unique> <Leader>qr <Plug>(quickrun)

"IPython Shell
nmap <leader>ip :IPythonShellToggle<CR>
nmap <leader>ij :IPythonShellFocus<CR>
vmap <leader>is <esc>:IPythonShellSendText<CR>
let g:ipy_completefunc = ''

"Obvious Resize
noremap <silent> <leader>wK :ObviousResizeUp 5<CR>
noremap <silent> <leader>wJ :ObviousResizeDown 5<CR>
noremap <silent> <leader>wH :ObviousResizeLeft 5<CR>
noremap <silent> <leader>wL :ObviousResizeRight 5<CR>

"Airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

"YouCompleteMe
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

"UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

"Maximizer
nmap <leader>wo :MaximizerToggle<CR>

" }}}
"===COMMANDS & FUNCS=== {{{
command! Vimrc :tabe ~/.nvim/nvimrc
command! SudoWrite :w !sudo tee %
command! CtagsGenerate :silent !ctags -R .

set grepprg=ag\ --nogroup\ --nocolor
command! -nargs=1 SearchCurrentFile :call s:SearchCurrentFile(<q-args>)
nmap <leader>* :SearchCurrentFile <C-R>=expand('<cword>')<CR><CR>
vmap <leader>* "zy:SearchCurrentFile <C-R>=getreg('z')<CR><CR>

function! s:SearchCurrentFile(pattern)
	let searchcmd = 'vimgrep '. a:pattern . ' ' . expand("%")
	exec searchcmd
endfunction

command! -nargs=1 SmartGrep :call s:SmartGrep(<q-args>)
command! -nargs=1 SmartReplace :call s:SmartReplace(<q-args>)
cab sgrep SmartGrep
cab srep SmartReplace
nmap <leader>gr :SmartGrep <C-R>=expand('<cword>')<CR><CR>
vmap <leader>gr "zy:SmartGrep <C-R>=getreg('z')<CR><CR>
nmap <leader>re :SmartReplace <C-R>=expand('<cword>')<CR><CR>
vmap <leader>re "zy:SmartReplace <C-R>=getreg('z')<CR><CR>
let g:smartGrep_rules = []

function! LookupDirs(curfile)
	let dir = "**/*." . expand("%:t:e")
	for rule in g:smartGrep_rules
		if a:curfile =~ rule[0]
			let dir = rule[1]
			break
		endif
	endfor
	return dir
endfunction

function! s:SmartGrep(pattern)
	let grepcmd = 'silent grep ' . a:pattern
	exec grepcmd
	exec 'botright cwindow'
	exec 'redraw!'
endfunction

function! s:SmartReplace(pattern, ...)
	let sub = a:0 > 1 ? a:1 : input("Replace '" . a:pattern . "' with: ")
	if sub == ''
		return
	endif
	exec 'wa'
	let curfile = bufname('%')
	let grepcmd = 'ag --nocolor --nogroup ' . a:pattern
	let matches = system(grepcmd)
	let match_list = split(matches, '\n')
	let match_files = []
	for i in range(len(match_list))
		let filename = substitute(match_list[i], ':.*$', '', '')
		if count(match_files, filename) == 0
			call add(match_files, filename)
		endif
	endfor
	let choice = input(matches . "Are you sure to replace all those occurences with '" . sub . "'([y]es/[n]o/[c]onfirm)?")
	if choice == 'y' || choice == 'Y' || choice == 'c' || choice == 'C'
		exec 'args ' . join(match_files, ' ')
		let confirm = (choice == 'c' || choice == 'C') ? 'c' : ''
		exec 'argdo %s/' . a:pattern . '/' . sub . '/g' . confirm
	endif
endfunction

"hex
if has('Python')
    nmap ,h :call HexValueInfo()<CR>
endif

function! HexValueInfo()
python <<EOF
    import vim, re, struct
    val = vim.eval('expand("<cword>")')
    val = eval(val)
    fval = struct.unpack('f', struct.pack("I", val))[0]
    #add comma to decimal value
    dval = str(val)
    dval = dval[::-1]
    dval = re.sub(r'(\d\d\d)(?=\d)',r'\1,',dval)
    dval = dval[::-1]
    print "val: 0x%x/%s/%g" % (val, dval, fval)
EOF
endfunction

"Paste mod
nmap <leader>pa :call PasteModeToggle()<CR>
function! PasteModeToggle()
	if &paste == 1
		let &paste = 0
		echo 'Paste Mode Off'
	else
		let &paste = 1
		echo 'Paste Mode On'
	endif
endfunction

" }}}

" vim:foldmethod=marker
