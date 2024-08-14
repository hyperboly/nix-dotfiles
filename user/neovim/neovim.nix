{ config, pkgs-unstable, ... }:

{
    programs.neovim =
        let
            toLua = str: "lua << EOF\n${str}\nEOF\n";
            toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
        in
        {
            enable = true;
            package = pkgs-unstable.neovim-unwrapped;

            extraPackages = with pkgs-unstable; [
                gnumake
                unzip
                nodePackages_latest.nodejs
                cargo

                lua-language-server
                nil
                yaml-language-server
                ccls
                docker-compose-language-service
                ansible-language-server
                bash-language-server
            ];

            plugins = with pkgs-unstable.vimPlugins; [
                {
                    plugin = nvim-lspconfig;
                    config = toLuaFile ./conf/lua/kickstart/plugins/lspconfig.lua;
                }
                {
                    plugin = comment-nvim;
                    config = toLua "require(\"Comment\").setup()";
                }
                {
                    plugin = catppuccin-nvim;
                    config = toLuaFile ./conf/lua/kickstart/plugins/colorscheme.lua;
                }
                {
                    plugin = telescope-nvim;
                    config = toLuaFile ./conf/lua/kickstart/plugins/telescope.lua;
                }
                {
                    plugin = which-key-nvim;
                    config = toLuaFile ./conf/lua/kickstart/plugins/which-key.lua;
                }
                {
                    plugin = gitsigns-nvim;
                    config = toLuaFile ./conf/lua/kickstart/plugins/gitsigns.lua;
                }
                {
                    plugin = nvim-cmp;
                    config = toLuaFile ./conf/lua/kickstart/plugins/cmp.lua;
                }
                {
                    plugin = mini-nvim;
                    config = toLuaFile ./conf/lua/kickstart/plugins/mini.lua;
                }
                {
                    plugin = todo-comments-nvim;
                    config = toLuaFile ./conf/lua/kickstart/plugins/todo-comments.lua;
                }
                {
                    plugin = (nvim-treesitter.withPlugins (p: [
                        p.tree-sitter-nix
                        p.tree-sitter-vim
                        p.tree-sitter-vimdoc
                        p.tree-sitter-bash
                        p.tree-sitter-lua
                        p.tree-sitter-luadoc
                        p.tree-sitter-python
                        p.tree-sitter-c
                        p.tree-sitter-markdown
                    ]));
                    config = toLuaFile ./conf/lua/kickstart/plugins/treesitter.lua;
                }
                # TODO: Most of these packages need configuration
                {
                    plugin = telescope-undo-nvim;
                }

                telescope-fzf-native-nvim
                cmp_luasnip
                cmp-nvim-lsp
                nvim-cmp
                luasnip
                friendly-snippets
                lualine-nvim
                vim-nix
                fidget-nvim
            ];

            #extraLuaPackages = ps: with pkgs-unstable; [
            #    luajitPackages.lua-utils-nvim
            #];

            extraLuaConfig = ''
                ${builtins.readFile ./conf/lua/options.lua}
                ${builtins.readFile ./conf/lua/keymaps.lua}
                ${builtins.readFile ./conf/lua/kickstart/health.lua}
            '';

            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;
        };
}
