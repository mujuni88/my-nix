{config, ...}: let
  nvimDir = "${config.home.homeDirectory}/my-nix/modules/home-manager/config/nvim";
in {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile = {
    nvim = { 
      source = config.lib.file.mkOutOfStoreSymlink "${nvimDir}";
      recursive = true;
    };
  };
}
