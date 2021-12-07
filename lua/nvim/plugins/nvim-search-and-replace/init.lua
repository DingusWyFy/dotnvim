R('nvim-search-and-replace').setup({
    -- file patters to ignore
    ignore = {
        '**/node_modules/**',
        '**/.git/**',
        '**/.gitignore',
        '**/.gitmodules',
        'build/**',
    },

    -- save the changes after replace
    update_changes = false,

    -- keymap for search and replace
    replace_keymap = ',gr',

    -- keymap for search and replace ( this does not care about ignored files )
    replace_all_keymap = ',gR',

    -- keymap for search and replace
    replace_and_save_keymap = ',gu',

    -- keymap for search and replace ( this does not care about ignored files )
    replace_all_and_save_keymap = ',gU',
})
