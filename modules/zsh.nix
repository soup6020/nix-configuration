{
  config,
  lib,
  pkgs,
  ...
}:
{
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

    interactiveShellInit = ''
    source ${pkgs.zsh-fzf-tab}/share/fzf-tab.plugin.zsh
    source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    source ${pkgs.zsh-history-search-multiword}/share/zsh/zsh-history-search-multi-word/history-search-multi-word.plugin.zsh
    '';

  };
}
