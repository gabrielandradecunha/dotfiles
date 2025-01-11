# Configuração do tmux

## Requisitos

- **tmux**: Certifique-se de que o tmux esteja instalado em sua máquina. Você pode verificar a versão com:

  ```bash
  tmux -V
  ```

## Passo 1: Arquivo de Configuração

Adicione o conteúdo abaixo no seu arquivo `~/.tmux.conf` para configurar o tmux conforme descrito.

### 1. Configuração do Prefixo

Por padrão, o tmux usa `Ctrl + b` como prefixo para comandos. Se você quiser usar esse prefixo para enviar para o tmux, altere o comportamento da seguinte forma:

```bash
# Definir prefixo
unbind-key           C-b
set-option -g prefix C-b
bind-key             C-b send-prefix
```

Essa configuração permite que você continue usando `C-b` como prefixo, mas também faz com que o comando `C-b` seja enviado para dentro das sessões do tmux.

### 2. Configuração da Barra de Status

A barra de status exibe informações úteis, como o nome do host e o carregamento do sistema. Abaixo estão as configurações para personalizar a barra de status:

```bash
# Barra de status
set -g status on
set -g status-bg colour235
set -g status-fg white
set -g status-left '#[fg=cyan]#H '
set -g status-right '#[fg=colour246]#(cat /proc/loadavg | cut -d" " -f1-3 | sed "s/ /, /g")  '
set -g status-left-length 20
set -g status-right-length 40
```

Explicação:
- `status-bg`: Define a cor de fundo da barra de status.
- `status-fg`: Define a cor do texto na barra de status.
- `status-left`: Define o que será exibido no lado esquerdo da barra de status (neste caso, o nome do host).
- `status-right`: Exibe a carga do sistema no lado direito da barra de status.

### 3. Configuração do Mouse

Habilite o suporte ao mouse para facilitar o controle das janelas, rolagem e seleção de texto:

```bash
# Mouse
bind-key -n DoubleClick1StatusLeft switch-client -n
set-option -g mouse on
set-option -g @scroll-down-exit-copy-mode 'on'
set-option -g @scroll-without-changing-pane 'on'
set-option -g @scroll-in-moused-over-pane 'on'
set-option -g @scroll-speed-num-lines-per-scroll '1'
set-option -g @emulate-scroll-for-no-mouse-alternate-buffer 'on'
```

Explicação:
- `set-option -g mouse on`: Ativa o uso do mouse para seleção, rolagem, e alternância de painéis.
- `@scroll-down-exit-copy-mode`: Permite sair do modo de cópia automaticamente quando rolar para baixo.
- Outras opções ajudam a controlar o comportamento de rolagem do mouse, como velocidade de rolagem e comportamento ao passar o mouse sobre os painéis.

### 4. Plugins

O tmux suporta plugins para adicionar funcionalidades extras. Use o **tmux Plugin Manager (TPM)** para gerenciar e instalar plugins facilmente. Para isso, adicione as configurações dos plugins desejados:

```bash
# Plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmuxinator'
set -g @plugin 'tmux-plugins/tmux-resize-pane'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-copycat'
set-option -g @plugin 'tmux-plugins/vim-tmux-focus-events'
set-option -g @plugin 'tmux-plugins/tmux-sensible'
set-option -g @plugin 'NHDaly/tmux-better-mouse-mode'
```

Explicação dos plugins:
- `tmux-plugins/tpm`: Gerenciador de plugins para tmux.
- `tmux-plugins/tmux-resurrect`: Restaura sessões tmux após reiniciar.
- `tmux-plugins/tmux-continuum`: Faz backups automáticos e restaura sessões automaticamente.
- `tmux-plugins/tmuxinator`: Gerencia projetos e sessões tmux.
- `tmux-plugins/tmux-resize-pane`: Ajusta automaticamente o tamanho do painel.
- `tmux-plugins/tmux-yank`: Copia texto de forma simples.
- `tmux-plugins/tmux-copycat`: Facilita a pesquisa e seleção no tmux.
- `tmux-plugins/vim-tmux-focus-events`: Sincroniza o foco entre tmux e Vim.
- `tmux-plugins/tmux-sensible`: Adiciona configurações sensatas para tmux.
- `NHDaly/tmux-better-mouse-mode`: Melhora a interação com o mouse no tmux.

Após adicionar esses plugins, execute o comando abaixo para instalar os plugins usando o TPM:

```bash
# Instalar plugins
run '~/.tmux/plugins/tpm/tpm'
```

## Passo 2: Recarregar a Configuração

Após editar o arquivo de configuração (`~/.tmux.conf`), recarregue a configuração no tmux com o seguinte comando:

```bash
# Recarregar a configuração
Ctrl + b :source-file ~/.tmux.conf
```

Ou você pode reiniciar a sessão do tmux.

## Passo 3: Usando o tmux

Após a configuração, aqui estão algumas operações básicas para usar no tmux:

### 1. **Criar uma nova sessão**
```bash
tmux new-session -s minha-sessao
```

### 2. **Abrir uma nova janela**
Pressione `Ctrl + b`, depois `c` para criar uma nova janela.

### 3. **Alternar entre janelas**
Pressione `Ctrl + b`, depois use as teclas `n` (próxima janela) ou `p` (janela anterior).

### 4. **Dividir o painel**
Pressione `Ctrl + b`, depois `%` para dividir verticalmente ou `"` para dividir horizontalmente.

### 5. **Alternar entre painéis**
Pressione `Ctrl + b`, depois use as teclas de direção para navegar entre os painéis.

### 6. **Sair de uma sessão**
Digite `exit` dentro de uma janela ou pressione `Ctrl + b`, depois `d` para desconectar da sessão sem fechá-la.


