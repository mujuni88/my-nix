{...}: let
  weztermDir = "./.config/wezterm";
in {
  home.file = {
    ".config/wezterm/wezterm.lua".source = "${weztermDir}/wezterm.lua";
  };

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
  };
}
