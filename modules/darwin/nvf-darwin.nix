{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.nvf = {
    enable = true;

    settings = {
      #Basics
      #vim.spellcheck.enable = true;
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lineNumberMode = "number";
      vim.enableLuaLoader = true;
      vim.clipboard = {
        enable = true;
        registers = "unnamedplus";
      };
      vim.syntaxHighlighting = true;
      vim.binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
      };

      vim.filetree.neo-tree = {
        enable = true;
        setupOpts.git_status_async = true;
      };

      vim.utility = {
        snacks-nvim.enable = true;
      };

      #Neorg
      vim.notes.neorg = {
        enable = true;
        setupOpts.load."core.defaults".enable = true;
        treesitter.enable = true;
        treesitter.norgPackage = pkgs.tree-sitter-grammars.tree-sitter-norg;
      };

      #Aesthetic enhancements
      vim.mini.icons.enable = true;
      vim.theme = {
        enable = true;
        name = "oxocarbon";
        style = "dark";
      };
      vim.visuals = {
        indent-blankline.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
      };
      vim.ui.breadcrumbs.enable = true;
      vim.ui.breadcrumbs.lualine.winbar.alwaysRender = false;
      vim.tabline.nvimBufferline.enable = true;
      vim.dashboard.dashboard-nvim = {
        enable = false;
      };

      #Languages, completion, parsers...
      vim.lsp = {
        enable = true;
        formatOnSave = true;
        lightbulb.enable = false;
        trouble.enable = true;
      };

      vim.autocomplete = {
        blink-cmp = {
          enable = true;
          setupOpts = {
            cmdline.keymap.preset = "none";
            cmdline.completion.menu.auto_show = true;
          };
        };
        enableSharedCmpSources = true;
      };

      vim.lazy = {
        enable = true;
      };

      vim.telescope = {
        enable = true;
      };

      vim.treesitter = {
        enable = true;
        context.enable = false;
        highlight.enable = true;
        indent.enable = false; # this shit sucks, prefer default autoindent
        grammars = with pkgs; [
          #Manually install some grammars that do not have options available. vim.languages.* sets many of these automatically.
          tree-sitter-grammars.tree-sitter-yaml
          tree-sitter-grammars.tree-sitter-latex
          tree-sitter-grammars.tree-sitter-dockerfile
        ];
      };

      vim.languages = {
        enableTreesitter = true;
        assembly.enable = true;
        bash.enable = true;
        clang.enable = true;
        css.enable = true;
        go.enable = true;
        java.enable = true;
        lua.enable = true;
        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
        };
        nix = {
          enable = true;
          format.enable = true;
          format.type = "nixfmt";
        };
        nu.enable = true;
        python.enable = true;
        rust.enable = true;
        sql.enable = true;
      };

      #Lualine (at the bottom because it is long)
      vim.statusline.lualine = {
        enable = true;
        theme = "horizon";
        refresh.statusline = 100;
        globalStatus = true;
        sectionSeparator.left = "";
        sectionSeparator.right = "";
        componentSeparator.left = "";
        componentSeparator.right = "";
        activeSection.a = [
          ''
            {
              "mode",
              icons_enabled = true,
              separator = {
                right = ''
              },
            }
          ''
          ''
            {
              "",
              draw_empty = true,
              separator = { left = '', right = '' }
            }
          ''
        ];
        activeSection.b = [
          ''
            {
              "filetype",
              colored = true,
              icon_only = true,
              separator = {
                right = ''
              },
              icon = { align = 'left' }
            }
          ''
          ''
            {
              "filename",
              symbols = {modified = ' ', readonly = ' '},
              separator = {right = ''}
            }
          ''
          ''
            {
              "",
              draw_empty = true,
              separator = { left = '', right = '' }
            }
          ''
        ];
        activeSection.c = [
          ''
            {
              "diff",
              colored = false,
              diff_color = {
                -- Same color values as the general color option can be used here.
                added    = 'DiffAdd',    -- Changes the diff's added color
                modified = 'DiffChange', -- Changes the diff's modified color
                removed  = 'DiffDelete', -- Changes the diff's removed color you
              },
              symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the diff symbols
              separator = {right = ''}
            }
          ''
        ];
        activeSection.x = [
          ''
            {
              -- Lsp server name
              function()
                local buf_ft = vim.api.nvim_get_option_value('filetype', {})

                -- List of buffer types to exclude
                local excluded_buf_ft = {"toggleterm", "NvimTree", "neo-tree", "TelescopePrompt"}

                -- Check if the current buffer type is in the excluded list
                for _, excluded_type in ipairs(excluded_buf_ft) do
                  if buf_ft == excluded_type then
                    return ""
                  end
                end

                -- Get the name of the LSP server active in the current buffer
                local clients = vim.lsp.get_clients()
                local msg = 'No Lsp'

                -- if no lsp client is attached then return the msg
                if next(clients) == nil then
                  return msg
                end

                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end

                return msg
              end,
              icon = ' ',
              separator = {left = ''},
            }
          ''
          ''
            {
              "diagnostics",
              sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'},
              symbols = {error = '󰅙  ', warn = '  ', info = '  ', hint = '󰌵 '},
              colored = true,
              update_in_insert = false,
              always_visible = false,
              diagnostics_color = {
                color_error = { fg = 'red' },
                color_warn = { fg = 'yellow' },
                color_info = { fg = 'cyan' },
              },
            }
          ''
        ];
        activeSection.y = [
          ''
            {
              "",
              draw_empty = true,
              separator = { left = '', right = '' }
            }
          ''
          ''
            {
              'searchcount',
              maxcount = 999,
              timeout = 120,
              separator = {left = ''}
            }
          ''
          ''
            {
              "branch",
              draw_empty = true,
              icon = ' •',
              separator = {left = ''}
            }
          ''
        ];
        activeSection.z = [
          ''
            {
              "",
              draw_empty = true,
              separator = { left = '', right = '' }
            }
          ''
          ''
            {
              "progress",
              separator = {left = ''}
            }
          ''
          ''
            {"location"}
          ''
          ''
            {
              "fileformat",
              color = {fg='black'},
              separator = {left = ''},
              symbols = {
                unix = '', -- e712
                dos = '',  -- e70f
                mac = '',  -- e711
              }
            }
          ''
        ];
      };
    };
  };
}
