{pkgs, ...}: let
  nvimDir = ./.config/nvim;
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
  home.file = {
    "./.config/nvim/" = {
      source = nvimDir;
      recursive = true;
    };
    "./.config/nvim/lua/init.lua".text = ''
      require("lazy")
      require("core")
    '';
  };

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      # Add other plugins you want to manage with Nix here
    ];
  };
}
