{...}: let
  shellDir = ./.config/shell;
in {
  home.file = {
    ".profile".source = "${shellDir}/.profile";
    "bin" = {
      source = "${shellDir}/bin";
      recursive = true;
    };
  };
}
