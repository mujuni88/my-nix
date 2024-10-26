{...}: let
  shellDir = ./config/shell;
in {
  home.file = {
    ".profile".source = "${shellDir}/.profile";
    ".local/bin" = {
      source = "${shellDir}/bin";
      recursive = true;
    };
  };
}
