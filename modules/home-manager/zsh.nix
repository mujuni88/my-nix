{}: let
  zshDir = "./.config/zsh";
in {
  home.file = {
    ".zshrc".source = "${zshDir}/.zshrc";
    ".zlogout".source = "${zshDir}/.zlogout";
    ".zprofile".source = "${zshDir}/.zprofile";
    ".zshenv".source = "${zshDir}/.zshenv";
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    enableHistory = true;
    enableCompletion = true;
    enableAliases = true;
  };
}
