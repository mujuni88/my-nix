{pkgs, ...}: let
  # Define variables for reuse
  user = builtins.getEnv "USER";

  # Import system packages and homebrew configurations
  packages = import ./darwin/packages.nix {inherit pkgs;};
  systemConfig = import ./darwin/system.nix;
  homebrewConfig = import ./darwin/homebrew.nix;
in {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = packages;

  # Homebrew configuration
  homebrew = homebrewConfig;

  # System configurations
  system = systemConfig;

  # Font packages
  fonts.packages = [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  # Auto-upgrade Nix package and daemon service
  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  # Nix flakes settings
  nix.settings.experimental-features = "nix-command flakes";

  # Zsh as the default shell
  programs.zsh.enable = true;

  # Platform configuration for Apple Silicon
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set user's home directory. Default is /var/empty
  users = {
    users."${user}".home = "/Users/" + user;
  };

  # home manager backups
  home-manager.backupFileExtension = "backup";
}
