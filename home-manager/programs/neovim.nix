{ config, pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        viAlias = true;
        withPython3 = true;
        defaultEditor = true;

        plugins = with pkgs.vimPlugins; [
            coc-nvim
            nerdtree
            fzf-vim
            coc-snippets
            vim-clang-format
            vim-cpp-enhanced-highlight
            vim-cmake
            coc-clangd
            vimspector
            vim-fugitive
            nerdcommenter
            ale
            vim-gutentags
            tagbar
            auto-pairs
            lualine-nvim
            nvim-web-devicons
            multicursors-nvim           
            #vim-modern-cpp
        ];

        coc.enable = true;
        coc.settings = {

        };

        extraConfig = builtins.readFile ./init.vim;

        
    };
}
