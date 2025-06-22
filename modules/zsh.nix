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
    histSize = 15000;

    setOptions = [
      "APPEND_HISTORY"
      "EXTENDED_HISTORY"
      "HIST_IGNORE_DUPS"
      "HIST_IGNORE_SPACE"
      "INC_APPEND_HISTORY"
    ];

    shellInit = ''
      autoload -U promptinit; promptinit
    '';

    interactiveShellInit = ''
      #Plugins from nixpkgs
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      source ${pkgs.zsh-history-search-multi-word}/share/zsh/zsh-history-search-multi-word/history-search-multi-word.plugin.zsh

      #Regular shell configuration
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';

    promptInit = ''
                if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
              source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
            fi
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

  };

  environment.systemPackages = with pkgs; [
    zsh-fzf-tab
    zsh-fast-syntax-highlighting
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-history-substring-search
    zsh-history-search-multi-word
  ];
}
