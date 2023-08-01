require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'dracula',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            {
                'mode',
                icons_enabled = true,
                icon = '',
            }
        },
        lualine_b = {
            'branch',
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
            {
                'filetype',
                colored = true,            -- Displays filetype icon in color if set to true
                icon_only = true,          -- Display only an icon for filetype
                icon = { align = 'left' }, -- Display filetype icon on the right hand side
            },
        },
        lualine_c = {
            'diff',
            'diagnostics'
        },
        lualine_x = {
            'encoding',
            'fileformat',
        },
        lualine_y = { 'searchcount' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}

    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
