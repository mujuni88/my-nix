{config, ...}: let
  gitDir = "${config.home.homeDirectory}/my-nix/modules/home-manager/config/git";
in {
  xdg.configFile = {
    "git/config".source = config.lib.file.mkOutOfStoreSymlink "${gitDir}/.gitconfig";
    "git/git-commit-template.txt".source = config.lib.file.mkOutOfStoreSymlink "${gitDir}/.git-commit-template.txt";
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}