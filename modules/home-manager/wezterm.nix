{...}: let
  weztermDir = ./.config/wezterm;
in {
  home.file = {
    ".config/wezterm" = {
      source = weztermDir;
      recursive = true;
    };
  };

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    extraConfig = builtins.readFile "${weztermDir}/wezterm.lua";
  };
}
