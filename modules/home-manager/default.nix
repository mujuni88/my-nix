{
  user,
  config,
  pkgs,
  inputs,
  ...
}: let
  configDir = "./config/";
in {
  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./shell.nix
    ./wezterm.nix
    (import ./nvim.nix {inherit pkgs inputs;})
    # ./bat.nix
    # ./fzf.nix
    # ./eza.nix
  ];

  home = {
    username = user;
    homeDirectory = "/Users/" + user;
    stateVersion = "24.05";

    packages = [];

    file = {
      ".config" = {
        source = configDir;
        recursive = true;
      };
      ".vim".source = "${configDir}/.vim";
      ".vimrc".source = "${configDir}/.vimrc";
    };

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
