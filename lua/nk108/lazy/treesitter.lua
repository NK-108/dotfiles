return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- List of parser names, or "all"
                ensure_installed = {
                    "vimdoc", "javascript", "typescript", "c", "lua", "rust", "bash", "python", "go", "cpp",
                },

                -- Install parsers synchronously (only applied to 'ensure_installed'
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                indent = {
                    enable = true
                },

                highlight = {
                    -- 'false' will disable the whole extension
                    enable = true,
                    disable = function(lang, buf)
                        if lang == "html" then
                            print("disabled")
                            return true
                        end

                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            vim.notify(
                                "File larger than 100 KB treesitter disabled for performance",
                                vim.log.levels.WARN,
                                {title = "Treesitter"}
                            )
                            return true
                        end
                    end,

                    -- Setting this to true will run ':h syntax' and tree-sitter at the same time
                    additional_vim_regex_highlighting = { "markdown" },
                },
            })

            local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            treesitter_parser_config.templ = {
                install_info = {
                    url = "https://github.com/vrischmann/tree-sitter-templ.git",
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "master",
                },
            }

            vim.treesitter.language.register("templ", "templ")
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        config = function()
            require('treesitter-context').setup{
                enable = true, -- enable plugin
                multiwindow = false, -- enable multiwindow support
                max_lines = 0, -- lines windows spans, <=0 means no limit
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = 'outer',
                mode = 'cursor',
                separator = nil,
                zindex = 20,
                on_attach = nil,
            }
        end
    }
}

