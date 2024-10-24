{
  pkgs,
  lib,
  ...
}: let
  tmuxDir = ./.config/tmux;
in {
  home.file = {
    ".tmux.conf".source = "${tmuxDir}/.tmux.conf";
  };

  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    prefix = "C-space";
    escapeTime = 10;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "wezterm";

    extraConfig = lib.fileContents "${tmuxDir}/.tmux.conf";

    plugins = with pkgs.tmuxPlugins; [
      logging
      pain-control
      sessionist
      tmux-thumbs
      yank
    ];
  };
}
