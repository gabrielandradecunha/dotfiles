# Vim Configuration Setup

Este documento fornece as instruções para configurar o **Vim** com plugins e personalizações para melhorar a produtividade no desenvolvimento.

## Requisitos

- **Vim**: Certifique-se de ter o Vim instalado. Você pode verificar isso executando:

  ```bash
  vim --version
  ```

- **Plug.vim**: Para gerenciar plugins, este setup usa o vim-plug. Se ainda não o tiver instalado, siga as instruções abaixo:

  Baixe o vim-plug com o comando:

  ```bash
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

## Passo 1: Estrutura do Arquivo de Configuração

Este arquivo configura o Vim com uma série de plugins e ajustes para um ambiente de desenvolvimento produtivo. Vamos dividir as configurações em seções:

### 1. Instalação de Plugins

Adicione as configurações abaixo no seu arquivo `~/.vimrc`:

```vim
call plug#begin()

"""" -> General
" File system plugin
Plug 'preservim/NERDTree'
" Colored line plugin
Plug 'itchyny/lightline.vim'
" Tabs plugin
Plug 'bagrat/vim-buffet'
" Git gutter plugin
Plug 'airblade/vim-gitgutter'

"""" -> Themes
" Cyberpunk theme plugin
Plug 'thedenisnikulin/vim-cyberpunk'
" Schekaur theme plugin
Plug 'scheakur/vim-scheakur'
" Gruvbox theme plugin (retro)
Plug 'morhetz/gruvbox'

"""" -> Programming
" Syntax highlighting plugin
Plug 'dense-analysis/ale'
" LSF installer with :CocInstall <lsf name>
Plug 'neoclide/coc.nvim'
" PHP Language Server
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
" Blade Templates extension
Plug 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
" Laravel Extension
Plug 'yaegassy/coc-laravel', {'do': 'yarn install --frozen-lockfile'}

call plug#end()
```

### 2. Configuração do ALE (Asynchronous Linting)

O plugin ALE oferece linting assíncrono para várias linguagens. Adicione as seguintes configurações para habilitar o linting para as linguagens de sua escolha:

```vim
"""" -> ALE configs
let g:ale_enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_async = 1
let g:ale_sign_column_always = 1

" C
let g:ale_linters = {'c': ['clangtidy']}
let g:ale_c_clangtidy_executable = 'clang-tidy'

" Python
let g:ale_python_flake8_executable = 'flake8'

" PHP
let g:ale_php_phpcs_executable = 'phpcs'
let g:ale_php_phpcs_standard = 'Laravel'

" PHPStan Configuration
let g:ale_php_phpstan_executable = 'phpstan'
let g:ale_php_phpstan_level = 8  " Rigor level (0 to 8)
let g:ale_php_php_cs_fixer_executable = 'php-cs-fixer'
let g:ale_php_php_cs_fixer_rules = '@PSR2'
```

### 3. Configuração do Lightline

O lightline.vim fornece uma barra de status mais leve. Para configurá-lo, adicione a seguinte linha:

```vim
" lightline
set laststatus=2
```

### 4. Configurações Gerais do Vim

Aqui estão algumas configurações gerais que podem ser adicionadas para melhorar a experiência de desenvolvimento:

```vim
" Vim configs
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

" Mapping Ctrl + B to toggle NERDTree
map <C-b> :NERDTreeToggle<CR>

" Enable Matchit plugin for HTML and other languages
runtime! macros/matchit.vim

" Set the theme
colorscheme gruvbox
set background=dark
```

### 5. Mapeamento de Guias (Tabs)

Adicione os seguintes mapeamentos de teclas para navegação rápida entre guias (tabs) e buffers no Vim:

```vim
" Mapping for tabs
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

" More tab mappings
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>
```

## Passo 2: Instalação dos Plugins

Após adicionar as configurações no seu arquivo `~/.vimrc`, abra o Vim e execute o seguinte comando para instalar os plugins:

```vim
:PlugInstall
```

Isso irá baixar e instalar todos os plugins listados.

## Passo 3: Uso de Plugins

Aqui está como usar cada um dos plugins configurados no seu arquivo:

### 1. NERDTree (Gerenciador de Arquivos)

NERDTree é um plugin que permite navegar pelo sistema de arquivos dentro do Vim. Para abrir ou fechar o painel do NERDTree:

- Pressione `Ctrl + B` para alternar a visibilidade do painel NERDTree.
- Você também pode abrir o NERDTree com o comando:

  ```vim
  :NERDTreeToggle
  ```

Para navegar dentro do NERDTree:

- Use as setas ou as teclas `j` e `k` para mover-se entre os diretórios e arquivos.
- Pressione `Enter` para abrir um arquivo.
- Pressione `o` para abrir o arquivo em uma nova janela.

### 2. Lightline (Barra de Status)

Lightline fornece uma barra de status na parte inferior do Vim, mostrando informações como:

- O arquivo atual
- O modo de operação
- O status do linting

### 3. ALE (Linting Assíncrono)

ALE oferece linting em tempo real, identificando erros e avisos em seu código conforme você escreve. Ele pode ser configurado para diferentes linguagens.

- **C**: ALE usará clang-tidy para linting de arquivos C.
- **Python**: ALE usará flake8 para linting de arquivos Python.
- **PHP**: ALE usará phpcs e phpstan para linting de arquivos PHP, com configurações específicas para o padrão Laravel.

Exemplo de uso:

- Ao editar um arquivo com erros de sintaxe, o ALE vai destacar as linhas com erros, e você verá mensagens de erro na parte inferior da tela.

### 4. Coc.nvim (Autocompletar e LSP)

Coc.nvim é um poderoso plugin de autocompletar que usa o Language Server Protocol (LSP). Para instalar extensões, você pode usar o comando `:CocInstall <extension-name>`. Por exemplo:

- Para instalar o servidor de linguagem PHP (Intelephense), execute:

  ```vim
  :CocInstall coc-intelephense
  ```

Após instalar uma extensão, o autocompletar e o linting começarão a funcionar automaticamente para a linguagem configurada.

### 5. Vim Buffets (Navegação entre Buffers)

Vim Buffets facilita a navegação entre buffers (arquivos abertos no Vim):

- Pressione `<leader>1`, `<leader>2`, ..., `<leader>9` para alternar rapidamente entre os primeiros 9 buffers.
- Use `Tab` para alternar para o próximo buffer e `Shift + Tab` para voltar ao buffer anterior.

