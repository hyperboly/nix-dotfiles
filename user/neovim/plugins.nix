{ config, pkgs-unstable, ... }:

{
    plugins = with pkgs-unstable.vimPlugins; = [
        catppuccin-nvim
        nvim-cmp
        telescope-nvim
        telescope-fzf-native-nvim
        cmp_luasnip
        luasnip

        (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitterbash
            p.tree-sitter-c
            p.tree-sitter-lua
            p.tree-sitter-markdown
            p.tree-sitter-vim
            p.tree-sitter-python
        ]));
    ];
}
