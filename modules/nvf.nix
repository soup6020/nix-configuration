{
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.enableLuaLoader = true;
       vim.filetree.neo-tree {
       enable = true;
       setupOpts.git_status_async = true;
       }
      vim.lsp = {
        enable = true;
      };
    };
  };
}
}
