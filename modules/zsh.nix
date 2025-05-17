{ config, lib, pkgs, ...}:
{
#TODO: programs.zsh.plugins appears to be a home-manager option, so this file doess not currently work.
programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    histSize = 5000;
   
    setOptions = [
     "APPEND_HISTORY"
     "EXTENDED_HISTORY"
     "HIST_IGNORE_DUPS"
     "HIST_IGNORE_SPACE"
     "INC_APPEND_HISTORY"
    ];

    plugins = [
    {
        # Must be before plugins that wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "fast-syntax-highlighting";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "zsh-autosuggestions";
        file = "zsh-autosuggestions.zsh";
        src = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "history-search-multi-word";
        src = pkgs.zsh-history-search-multi-word;
        file = "${pkgs.zsh-powerlevel10k}/share/zsh/zsh-history-search-multi-word/history-search-multi-word";
      }
      {
        name = "history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }
      ];

  };
}
