{pkgs, ...}: let
  nvimDir = ./config/nvim-nix;
  nvimPluginsDir = "${nvimDir}/plugins";
in {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nil
      xclip
      wl-clipboard
      alejandra
      ripgrep
      lazygit
    ];

    plugins = with pkgs.vimPlugins; [
      # Core Dependencies
      plenary-nvim # Required by multiple plugins
      nvim-web-devicons # Icons for multiple plugins

      # UI Components
      {
        plugin = alpha-nvim; # Dashboard
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/alpha.lua";
      }
      {
        plugin = bufferline-nvim; # Buffer/Tab line
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/bufferline.lua";
      }
      {
        plugin = lualine-nvim; # Status line
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/lualine.lua";
      }
      {
        plugin = indent-blankline-nvim; # Indentation guides
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/indent-blankline.lua";
      }
      {
        plugin = dressing-nvim; # Better UI elements
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/dressing.lua";
      }

      # Navigation and File Management
      {
        plugin = nvim-tree-lua; # File explorer
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/nvim-tree.lua";
      }
      {
        plugin = telescope-nvim; # Fuzzy finder
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/telescope.lua";
      }
      telescope-fzf-native-nvim # Telescope performance improvement
      vim-tmux-navigator # Pane navigation
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/gitsigns.lua";
      }
      {
        plugin = lazygit-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/lazygit.lua";
      }

      # Session Management
      {
        plugin = auto-session;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/auto-session.lua";
      }

      # LSP, Completion, and Snippets
      {
        plugin = conform-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/formatting.lua";
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/lsp/lspconfig.lua";
      }
      mason-nvim # Package manager for LSP servers
      mason-tool-installer-nvim
      {
        plugin = mason-lspconfig-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/lsp/mason.lua";
      }
      neodev-nvim # Neovim API completion
      {
        plugin = trouble-nvim; # LSP diagnostics viewer
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/trouble.lua";
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/nvim-cmp.lua";
      }
      {
        plugin = nvim-lint;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/linting.lua";
      }
      cmp_luasnip
      cmp-nvim-lsp
      lspkind-nvim
      luasnip
      friendly-snippets

      # Code Enhancement
      {
        plugin = nvim-treesitter.withPlugins (p:
          with p; [
            tree-sitter-nix
            tree-sitter-vim
            tree-sitter-bash
            tree-sitter-lua
            tree-sitter-python
            tree-sitter-json
            tree-sitter-javascript
            tree-sitter-typescript
            tree-sitter-tsx
            tree-sitter-yaml
            tree-sitter-html
            tree-sitter-css
            tree-sitter-markdown
            tree-sitter-svelte
            tree-sitter-graphql
            tree-sitter-c
            tree-sitter-go
            tree-sitter-rust
            # Add any other parsers you need
          ]);
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/treesitter.lua";
      }
      {
        plugin = nvim-autopairs; # Auto close brackets
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/autopaires.lua";
      }

      # Comments
      nvim-ts-context-commentstring
      {
        plugin = comment-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/comment.lua";
      }
      {
        plugin = todo-comments-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/todo-comments.lua";
      }

      # Keybinding
      {
        plugin = which-key-nvim; # Keybinding helper
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/which-key.lua";
      }

      # Theme
      {
        plugin = tokyonight-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/colorscheme.lua";
      }

      # Language Specific
      vim-nix # Nix support
    ];

    extraLuaConfig = ''
      ${builtins.readFile "${nvimDir}/core/options.lua"}
      ${builtins.readFile "${nvimDir}/core/keymaps.lua"}
    '';
  };
}
