{
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lineNumberMode = "number";
      vim.enableLuaLoader = true;
      vim.useSystemClipboard = true;
      vim.syntaxHighlighting = true;
      vim.filetree.neo-tree = {
        enable = true;
        setupOpts.git_status_async = true;
      };
      vim.lsp = {
        enable = true;
      };
      vim.theme = {
        enable = true;
        name = "oxocarbon";
        style = "dark";
      };
      vim.ui.breadcrumbs.enable = true;
      vim.statusline.lualine = {
        enable = true;
        theme = "horizon";
        refresh.statusline = 100;
        globalStatus = true;
        sectionSeparator.left = "";
        sectionSeparator.right = "";
        componentSeparator.left = "";
        componentSeparator.right = "";
        vim.statusline.lualine.activeSection.a = {
          [
  ''
    {
      "mode",
      icons_enabled = true,
      separator = {
        left = ' ',
        right = ''
      },
    }
  ''
  ''
    {
      "",
      draw_empty = true,
      separator = { left = '', right = '' }
    }
  ''
]
          };
      };
      vim.lazy = {
        enable = true;
      };
      vim.treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };
      vim.languages = {
        enableLSP = true;
        enableTreesitter = true;
        assembly.enable = true;
        bash.enable = true;
        clang.enable = true;
        css.enable = true;
        go.enable = true;
        java.enable = true;
        lua.enable = true;
        markdown.enable = true;
        nix.enable = true;
        nix.format.enable = true;
        nu.enable = true;
        python.enable = true;
        rust.enable = true;
        sql.enable = true;
      };
    };
  };
}
