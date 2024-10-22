{...}: let
  gitDir = "./.config/git";
in {
  home.file = {
    ".gitconfig".source = "${gitDir}/.gitconfig";
    ".git-commit-template.txt".source = "${gitDir}/.git-commit-template.txt";
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}
