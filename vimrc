"""""""""""""""""""" 1) Configurações gerais """"""""""""""""""""
"
" Usa as definições do vim, não as do vi
set nocompatible
"
" Define o tamanho do histórico de comandos do vim:
set history=1000
"  
" Habilita o reconhecimento de arquivos
filetype plugin on
filetype indent on
"
" Recarrega o arquivo caso ele seja editado por um programa externo enquanto aberto
set autoread
"
" Habilita o uso do mouse no vim para cliques e coisas do tipo
"set mouse=a
"
"""""""""""""""""""" 1) Configurações gerais """"""""""""""""""""

"""""""""""""""""""" 2) Interface do vim """""""""""""""""""""
"
" Ativa o menu WiLd (entre outras coisas, ativa <Ctrl>n e <Ctrl>p para navegar entre as correspondências da busca
set wildmenu
"
" Sempre mostra a posição atual do cursor
set ruler
"
" Altura da barra de comandos
set cmdheight=1
"
" Configurando a tecla <Backspace> para o que ela tem que fazer
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l
"
" Destaca os resultados da busca
set hlsearch
"
" Habilita expressões regulares
set magic
"
" Destaca pares de colchetes ao passar o cursor, e configura o tempo do destaque em décimos de segundo
set showmatch
set mat=10
"
"""""""""""""""""""" 2) Interface do vim """""""""""""""""""""

"""""""""""""""""""" 3) Cores e fontes """"""""""""""""""""
"
" Ativa a numeração das linhas
set number
"
" Habilita o destaque de sintaxe
syntax enable
"
" Esquema de cores do vim
"colorscheme desert
set background=dark
"
" Desativa a quebra de linha automática (comentado por padrão)
set nolinebreak
set nowrap
set formatoptions-=t
"
" Permite a navegação dentro de uma mesma linha longa com j e k
"set wrap
"
"""""""""""""""""""" 3) Cores e fontes """"""""""""""""""""

"""""""""""""""""""" 4) Texto e tabulações """"""""""""""""""""
"
" Insere espaços no lugar de caracteres de tabulação
set expandtab
"
" Uso inteligente de tabulações
set smarttab
"
" Define uma tabulação como sendo 4 espaços
set shiftwidth=4
set tabstop=4
"
"""""""""""""""""""" 4) Texto e tabulações """"""""""""""""""""

"""""""""""""""""""" 5) Linha de status """"""""""""""""""""
"
" Sempre mostra a linha de status
set laststatus=2
"
" Formato da linha de status
function! GitBranch()
      return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
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
"
"""""""""""""""""""" 5) Linha de status """"""""""""""""""""

"""""""""""""""""""" 6) Desfazer persistente """"""""""""""""""""
"
" Preserva o histórico do desfazer após o fim da sessão atual salvando-o em um arquivo
set undodir=~/.vim/undobackups
set undofile
"
