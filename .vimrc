" install plugins
call plug#begin()
	
	"""""" ->General
	" filesystem plgin
	Plug 'preservim/NERDTree'
	" colored line plugin
	Plug 'itchyny/lightline.vim'
	" tabs plugin
	Plug 'bagrat/vim-buffet'
	" git gutter
	Plug 'airblade/vim-gitgutter'

	"""""" ->Themes 
	" cyberpunk theme plugin
	Plug 'thedenisnikulin/vim-cyberpunk'
	" schekaur theme plugin
	Plug 'scheakur/vim-scheakur'
	" gruvbox theme plugin (retro)
	Plug 'morhetz/gruvbox'

	"""""" ->Programming	
	" syntax highlighting plugin
	Plug 'dense-analysis/ale'
	" lsf installer with :CocInstall <lsf name>
	Plug 'neoclide/coc.nvim'
	" PHP Language Server
	Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
	" Blade Templates extension
	Plug 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
	" Laravel Extension
	Plug 'yaegassy/coc-laravel', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

"""" -> ale configs
let g:ale_enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_async = 1
let g:ale_sign_column_always = 1

" c
let g:ale_linters = {'c': ['clangtidy']}
let g:ale_c_clangtidy_executable = 'clang-tidy'

" python
let g:ale_python_flake8_executable = 'flake8'

" php
let g:ale_php_phpcs_executable = 'phpcs'
let g:ale_php_phpcs_standard = 'Laravel'

" PHPStan Configuration
let g:ale_php_phpstan_executable = 'phpstan'
let g:ale_php_phpstan_level = 8  " nivel de rigor (0 a 8)
let g:ale_php_php_cs_fixer_executable = 'php-cs-fixer'
let g:ale_php_php_cs_fixer_rules = '@PSR2'

" lightline
set laststatus=2

" vim configs
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set incsearch
set hlsearch
set number
set mouse=a
set splitbelow
set tabstop=4
set termwinsize=12x0
set backspace=indent,eol,start
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0

" maping crtl b for nerdtree
map <C-b> :NERDTreeToggle<CR>

runtime! macros/matchit.vim

" vim cyberpunk silverhand theme
" set termguicolors
" colorscheme silverhand
" let g:airline_theme='silverhand'

" theme
colorscheme gruvbox
set background=dark

" mapping tabs
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" more mappings for tabs
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>
