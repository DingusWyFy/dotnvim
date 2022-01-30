local Shortcut = require('nvim.utils.nvim.shortcut')
local Lsp = require('nvim.plugins.lsp')
local Event = require('nvim.plugins.lsp.event')
local ConfEvent = require('nvim.utils.lsp.event-type')

local M = {}

function M.on_attach(_, buffer)
    Shortcut:mode('n'):options():buffer(buffer):noremap():next():keymaps({
        -- rename file name
        { '<leader>nr', vim.lsp.buf.rename },

        -- quick fix actions
        { '<leader>na', vim.lsp.buf.code_action },

        -- format the code
        { '<leader>nn', vim.lsp.buf.formatting },

        -- show more information about the current node
        { '<leader>nh', vim.lsp.buf.hover },

        -- show diagnostics for current line
        { '<leader>nc', vim.lsp.diagnostic.show_line_diagnostics },

        -- @todo find out what this is
        { '<leader>ni', vim.lsp.buf.declaration },

        -- @todo find out what this is
        { '<leader>no', vim.lsp.buf.signature_help },

        -- @todo find out what this is
        { '<leader>ne', vim.lsp.buf.type_definition },

        -- jump to next error
        { ']d', vim.diagnostic.goto_next },

        -- jump to previous error
        { '[d', vim.diagnostic.goto_prev },
    })
end

function M.setup()
    Lsp.add_listener(Event.SERVER_SETUP, function(_, conf)
        conf:add_listener(ConfEvent.ATTACH, M.on_attach)
        return conf
    end)
end

return M
