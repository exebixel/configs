"""""""""""""""""""" Configurações gerais """"""""""""""""""""

" Usa as definições do vim, não as do vi
set nocompatible

" Habilita o reconhecimento de arquivos
filetype plugin on
filetype indent on

" Map leader to ,
let mapleader=','

" Preserva o histórico do desfazer após o fim da sessão atual salvando-o em um arquivo
set undodir=~/.vim/undobackups
set undofile

set hidden

" Vim plug
call plug#begin(expand('~/.vim/plugged'))

" Utilidade
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale', { 'do': 'pip install flake8 isort yapf' }
Plug 'airblade/vim-gitgutter'

" Visual
Plug 'ap/vim-buftabline'
Plug 'sheerun/vim-polyglot'
Plug 'tomasr/molokai'
Plug 'Yggdroot/indentLine'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" C plugs
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

" Python
Plug 'davidhalter/jedi-vim'

call plug#end()

"""""""""""""""""""""""""""""""" Atalhos """""""""""""""""""""""

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "fd --type f --hidden --follow --exclude .git"

"" Lembrar posição do cursor
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" Recarrega o arquivo caso ele seja editado por um programa externo enquanto aberto
set autoread

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Fechar buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Movimentação em janelas
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Toggle tagbar
nmap <silent> <F4> :TagbarToggle<CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" Copia/ Colar
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" Deixa o cursor fixo na linha central da tela
set scrolloff=5
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

"""""""""""""""""""" Interface """"""""""""""""""""

" Ativa a numeração das linhas
set number relativenumber

" Define spellcheck para português e inglês
set spell spelllang=en_us,pt_br
" Habilita o destaque de sintaxe
syntax enable

" Tempo de atualização 100ms
set updatetime=100 

" Esquema de cores do vim
set background=dark
colorscheme molokai
hi TabLineFill ctermfg=Black ctermbg=DarkGreen	
hi TabLine ctermfg=White ctermbg=Black
hi TabLineSel ctermfg=White ctermbg=DarkGrey

" Desativa a quebra de linha automática
set nolinebreak
set nowrap
set formatoptions-=t

" Uso inteligente de tabulações
set smarttab

" Define uma tabulação como sendo 4 espaços
set shiftwidth=4
set tabstop=4

" Sempre mostra a posição atual do cursor
set ruler

" Destaca os resultados da busca
set hlsearch

" Ativa o menu WiLd (entre outras coisas, ativa <Ctrl>n e <Ctrl>p para navegar entre as correspondências da busca
set wildmenu

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Altura da barra de comandos
set cmdheight=1

" Configurando a tecla <Backspace> para o que ela tem que fazer
set backspace=eol,start,indent

" Habilita expressões regulares
set magic

" Destaca pares de colchetes ao passar o cursor, e configura o tempo do destaque em décimos de segundo
set showmatch
set mat=10

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" ale
let g:ale_linters = {}
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0 
:call extend(g:ale_linters, {
    \'python': ['flake8'], })
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': [
\       'isort',
\       'yapf',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ]
\}


"""""""""""""""""""" Linha de status """"""""""""""""""""
"
" Sempre mostra a linha de status
set laststatus=2

let branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n' | sed -e 's/^/  /' -e 's/\$/ /'")

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{branchname}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
