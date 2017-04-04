set clipboard=unnamed       "Enable clipboard
filetype plugin indent on   "Enable indent plugin
syntax enable               "Enable syntax coloring
syntax on                   "Turn syntax coloring on
:color desert               "Set desert syntax coloring
set nocompatible            "Allow Vim-only settings even if they break vi keybindings.
:filetype on                "Enable filetype detection
set incsearch               "Find as you type
set ignorecase              "Ignore case in search
set scrolloff=5             "Number of lines to keep above/below cursor
set smartcase               "Only ignore case when all letters are lowercase
set number                  "Show line numbers
set wildmode=longest,list   "Complete longest string, then list alternatives
set fileformats=unix        "Use Unix line endings
set smartindent             "Smart autoindenting on new line
set smarttab                "Respect space/tab settings
set history=300             "Number of commands to remember
set backspace=2             "Use standard backspace behavior
set hlsearch                "Highlight matches in search
set ruler                   "Show line and column number
set formatoptions=1         "Don't wrap text after a one-letter word
set linebreak               "Break lines when appropriate
set autoindent              "Auto indent based on previous line

                            "Prepare tab/space indent settings
set tabstop=4               "Set Tab width to 4
set shiftwidth=4            "Indents will have width of 4
set softtabstop=4           "Set the number of columns for tab
set expandtab               "Expand tabs to spaces

execute pathogen#infect()
