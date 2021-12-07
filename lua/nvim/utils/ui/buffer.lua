local v = vim
local api = v.api

local M = {}

function M:new(options)
    self.buffer = options.buffer
    self.highlights = {}

    return self
end

-- Render the passed list of content to the buffer
-- IF the start and end range is given, this replaces the content in the range
-- IF the range is not given, this replaces the entire buffer
function M:render(line_info, startLine, endLine)
    startLine = startLine or 0
    endLine = endLine or api.nvim_buf_line_count(self.buffer)

    local lines = {}

    for index, line in ipairs(line_info) do
        local line_text = ''
        local line_no = index

        if #line > 0 then
            local column = 1

            for _, segment in ipairs(line) do
                table.insert(self.highlights, {
                    range = { line_no, column, #segment.text },
                    color_group = segment.color_group,
                })

                column = column + #segment.text
                line_text = line_text .. segment.text
            end
        else
            local column = 1

            table.insert(self.highlights, {
                range = { line_no },
                color_group = line.color_group,
            })

            column = column + #line.text
            line_text = line.text
        end

        table.insert(lines, line_text)
    end

    api.nvim_buf_set_lines(self.buffer, startLine, endLine, true, lines)

    self:_set_highlights()

    return { startLine, #lines }
end

function M:append(lines)
    local startLine = api.nvim_buf_line_count(self.buffer)

    self:render(lines, startLine, startLine + 1)
end

function M:_set_highlights()
    for _, highlight in ipairs(self.highlights) do
        vim.fn.matchaddpos(highlight.color_group, highlight.range)
    end
end

return M
