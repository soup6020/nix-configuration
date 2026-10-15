{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    histSize = 15000;

    shellInit = ''
      autoload -U promptinit; promptinit
    '';

    interactiveShellInit = ''
      #History options. Set here instead of setOptions, which nix-darwin lacks.
      #INC_APPEND_HISTORY is left out: SHARE_HISTORY already appends incrementally.
      setopt APPEND_HISTORY EXTENDED_HISTORY HIST_FCNTL_LOCK HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY

      #Plugins from nixpkgs
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
      source ${pkgs.zsh-history-search-multi-word}/share/zsh/zsh-history-search-multi-word/history-search-multi-word.plugin.zsh

      #Regular shell configuration
      bindkey -e
      bindkey '^A' beginning-of-line
      bindkey '^E' end-of-line
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      #history-search-multiword
      bindkey "^R" history-search-multi-word

      #zsh-history-substring-search configuration
      bindkey "$terminfo[kcuu1]" history-substring-search-up
      bindkey "$terminfo[kcud1]" history-substring-search-down
      bindkey '^R' history-incremental-pattern-search-backward

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
