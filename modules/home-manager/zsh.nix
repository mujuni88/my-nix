{...}: let
  zshDir = ./config/zsh;
in {
  home.file = {
    ".zshrc".source = "${zshDir}/.zshrc";
    ".zlogout".source = "${zshDir}/.zlogout";
    ".zprofile".source = "${zshDir}/.zprofile";
    ".zshenv".source = "${zshDir}/.zshenv";
    ".p10k.zsh".source = "${zshDir}/.p10k.zsh";
  };

  programs.zsh = {
    # Enable Zsh as the default shell
    enable = true;

    # Automatically change to a directory by typing its name
    autocd = true;

    # Enable syntax highlighting for commands in the shell
    syntaxHighlighting.enable = true;

    # Enable command autosuggestions based on history
    autosuggestion.enable = true;

    # Enable command-line completion features
    enableCompletion = true;
  };
}
