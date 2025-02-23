local Option = require('nvim.utils.nvim.option')

local v = vim

Option.g({
    ----------------------------------------------------------------------
    --                              EDITOR                              --
    ----------------------------------------------------------------------
    -- replace tab with spaces
    expandtab = true,

    -- tabstop
    tabstop = 4,

    -- acts editing spaces like tabs
    softtabstop = 4,

    -- number of spaces to use  for indentation
    shiftwidth = 4,

    -- remove highlighting after search is done
    hlsearch = false,

    -- auto code folding when openeing new file at level 1
    foldlevelstart = 4,
    -- don't wrap the text when lines can't fit the window
    wrap = false,

    -- auto wrap after 80 characters in the line
    textwidth = 80,

    -- enable mouse in vim. 'a' for all modes (normal, visual, insert & command)
    mouse = 'a',

    -- 'backup' 'writebackup'	action	~
    -- off	     off	no backup made
    -- off	     on		backup current file, deleted afterwards (default)
    -- on	     off	delete old backup, backup current file
    -- on	     on		delete old backup, backup current file
    backup = false,
    writebackup = false,
    swapfile = false,

    -- write changes to swap file after "n" ms
    -- for some reason when the updatetime is high, autocompletion in coc nvim
    -- takes a long time
    updatetime = 30,

    -- controls how short messages are displayed in status bar section
    shortmess = v.o.shortmess .. 'c',

    -- open completion menu even for single item
    -- do not auto insert items from completion menu
    -- @warning - preview is removed. when it's on, default lsp opens a vertical tab
    completeopt = 'menuone,noselect',

    -- stop showing the current mode
    showmode = false,

    -- show global status bar
    laststatus = 3,

    -- show window bar
    winbar = "%{%v:lua.require'nvim.utils.nvim.winbar'.eval()%}",

    -- @TODO now sure how this is working. need to find out
    showcmd = false,

    -- stop showing the current line and cursor position in the status bar
    ruler = false,

    -- set the font for GUI clients like neovide
    guifont = 'Recursive Monospace Casual, Cascadia Code, FiraCode, Nerd Font:h19',

    -- highlight the current cursor line.
    cursorline = true,

    -- wrap line
    -- breakindent = false,

    -- wrap line custom character to show
    showbreak = '↳',

    -- operator pending timeout
    timeoutlen = 500,

    -- vim try to keep 15 lines below and above when scrolling
    -- if buffer cannot display more than 15 lines, cursor will stay in center
    -- and scroll the buffer
    scrolloff = 15,

    -- height of the cmd to hidden
    cmdheight = 0,

    ----------------------------------------------------------------------
    --                             EDITING                              --
    ----------------------------------------------------------------------
    smartcase = true,
    ignorecase = true,

    -- shows the effects of a command incrementally
    inccommand = 'nosplit',

    -- where to place the new split windows
    splitright = true,
    splitbelow = true,

    -- hide unsaved file when closing the buffer
    -- usually vim doesn't allow closing unsaved buffer unless you force it
    -- but with hidden option, buffer will be hidden when you close it
    -- vim will prompt you to save when closing vim editor
    hidden = true,

    ----------------------------------------------------------------------
    --                                UI                                --
    ----------------------------------------------------------------------
    background = 'dark',
    termguicolors = true,

    ----------------------------------------------------------------------
    --                              OTHER                               --
    ----------------------------------------------------------------------
    -- assign unnamedplus register to clipboard
    -- anything in the clipboard can be pasted directly
    -- any yanked text will be copied to clipboard
    clipboard = 'unnamedplus',
})

Option.w({
    ----------------------------------------------------------------------
    --                              EDITOR                              --
    ----------------------------------------------------------------------
    -- shows the number bar in left hand side of the window
    number = true,

    -- shows numbers relative to the current cursor position
    relativenumber = true,

    -- code folding method to syntax
    -- common methods will be used such as curly braces
    -- foldmethod = 'syntax',

    -- error signs and warnings will be displayed in the number line
    -- usually it adds new column when signs, moving buffer to right side.
    -- adding a column create weird effect that's little bit hard for the eye
    signcolumn = 'yes:1',
})

Option.b({

    -- set the tab size to length of 4 spaces
    -- shiftwidth set the indentation length
    shiftwidth = 4,
})
