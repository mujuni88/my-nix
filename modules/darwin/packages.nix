{pkgs}:
with pkgs; [
  # Terminal and Shell Tools
  tmux # Terminal multiplexer for multiple sessions
  starship # Customizable cross-shell prompt
  zoxide # Smarter cd command with learning capabilities
  fzf # Command-line fuzzy finder
  atuin # Shell history sync, search, and backup tool
  gnused # GNU stream editor for text manipulation
  bat # Cat clone with syntax highlighting and Git integration
  ripgrep # Fast text search tool
  alejandra # Nix code formatter
  lazygit # Git UI

  # Code Editors and IDEs
  neovim # Highly configurable text editor

  # Version Control and Diff Tools
  delta # Syntax-highlighting pager for git, diff, and grep output

  # Development Tools
  docker # Containerization platform
  cargo # Rust package manager and build tool
  rustc # Rust compiler
  ngrok # Secure tunnels to localhost
  deno # Secure JavaScript and TypeScript runtime
  go # Go programming language
  tree # Directory listing as a tree
  fnm # Fast Node.js version manager
  stow # Dotfiles management

  # Utility Applications
  unar # Universal archive unpacker
]
