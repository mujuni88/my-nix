{
  # Required for nix-darwin versioning
  stateVersion = 5;

  defaults = {
    # Dock settings
    dock = {
      autohide = true;
      orientation = "bottom";
      show-recents = false;
      launchanim = true;
      tilesize = 48;
      persistent-apps = [
        "/System/Applications/Calendar.app"
        "/Applications/Email.app"
        "/System/Applications/Messages.app"
        "/Applications/Slack.app"
        "/Applications/Arc.app"
        "/Applications/Google Chrome.app"
        "/Applications/Notion.app"
        "/Applications/ChatGPT.app"
        "/Applications/Claude.app"
        "/Applications/Visual Studio Code.app"
        "/Applications/Cursor.app"
        "/Applications/WezTerm.app"
      ];
    };

    # Finder settings
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "clmv";
    };

    # Screensaver settings
    screensaver = {
      askForPasswordDelay = 10;
    };

    # Global macOS settings (NSGlobalDomain)
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 3;
    };
  };

  # Keyboard settings
  keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
}
