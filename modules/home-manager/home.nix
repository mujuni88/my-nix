{
  user,
  pkgs,
  inputs,
  lib,
  ...
}: let
  configDir = ./config;
in {
  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./shell.nix
    ./wezterm.nix
    # ./nvim-original.nix
    ./nvim.nix
  ];

  home = {
    username = user;
    homeDirectory = lib.mkDefault "/Users/${user}";
    stateVersion = "24.05";

    # file = {
    #   ".config" = {
    #     source = configDir;
    #     recursive = true;
    #   };
    # };

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bat = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
    eza = {
      enable = true;
    };
  };
}
