{pkgs, ...}: let
  nvimDir = ./.config/nvim;
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
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/bufferline.lua";
      }

      {
        plugin = auto-session;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/auto-session.lua";
      }
      {
        plugin = which-key-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/which-key.lua";
      }
      plenary-nvim
      vim-tmux-navigator # Allows to switch panes with CTRL + jkhl

      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/nvim-tree.lua";
      }

      {
        plugin = alpha-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/alpha.lua";
      }

      trouble-nvim

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/lsp.lua";
      }

      {
        plugin = comment-nvim;
        type = "lua";
        config = "require(\"Comment\").setup()";
      }

      neodev-nvim

      nvim-cmp
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/nvim-cmp.lua";
      }

      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/telescope.lua";
      }

      telescope-fzf-native-nvim

      cmp_luasnip
      cmp-nvim-lsp
      lspkind-nvim

      luasnip
      friendly-snippets

      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginsDir}/lualine.lua";
      }

      nvim-web-devicons

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
        config = builtins.readFile "${nvimPluginDir}/treesitter.lua";
      }

      vim-nix

      {
        plugin = tokyonight-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginDir}/colorscheme.lua";
      }

      {
        plugin = dressing-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginDir}/dressing.lua";
      }

      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = builtins.readFile "${nvimPluginDir}/indent-blankline.lua";
      }
    ];

    extraLuaConfig = ''
      ${builtins.readFile "${nvimDir}/core/options.lua"}
      ${builtins.readFile "${nvimDir}/core/keymaps.lua"}
    '';
  };
}
