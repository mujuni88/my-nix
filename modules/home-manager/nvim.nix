{pkgs, ...}: let
  nvimDir = ./.config/nvim;
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
        config = builtins.readFile "${nvimDir}/plugin/bufferline.lua";
      }

      {
        plugin = auto-session;
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/auto-session.lua";
      }
      {
        plugin = which-key-nvim;
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/which-key.lua";
      }
      plenary-nvim
      vim-tmux-navigator # Allows to switch panes with CTRL + jkhl

      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/nvim-tree.lua";
      }

      {
        plugin = alpha-nvim;
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/alpha.lua";
      }

      trouble-nvim

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/lsp.lua";
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
        config = builtins.readFile "${nvimDir}/plugin/nvim-cmp.lua";
      }

      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/telescope.lua";
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
        config = builtins.readFile "${nvimDir}/plugin/lualine.lua";
      }

      nvim-web-devicons

      {
        plugin = nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
        ]);
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/treesitter.lua";
      }

      vim-nix

      {
        plugin = tokyonight-nvim;
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/colorscheme.lua";
      }

      {
        plugin = dressing-nvim;
        type = "lua";
        config = builtins.readFile "${nvimDir}/plugin/dressing.lua";
      }
    ];

    extraLuaConfig = ''
      ${builtins.readFile "${nvimDir}/core/options.lua"}
      ${builtins.readFile "${nvimDir}/core/keymaps.lua"}
    '';
  };
}
