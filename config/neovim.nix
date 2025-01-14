{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      fd
      ripgrep
      nerdfonts
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-cmp

      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
        p.tree-sitter-go
        p.tree-sitter-rust
        p.tree-sitter-c
        p.tree-sitter-zig
        p.tree-sitter-java
        p.tree-sitter-javascript
      ]))

      nightfox-nvim
      dashboard-nvim
      telescope-nvim
      lualine-nvim
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      lualine-nvim
      nvim-web-devicons
      plenary-nvim
      indent-blankline-nvim
      gitsigns-nvim
    ];
  };

  home.file."${config.xdg.configHome}/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
