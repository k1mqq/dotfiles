return {
    "vim-skk/skkeleton",
    dependencies = { 'vim-denops/denops.vim' },
    config = function()
        vim.fn['skkeleton#config']({
            eggLikeNewline = true,
            keepState = true,

            globalDictionaries = {
                '/usr/share/skk/SKK-JISYO.L'
            },
        })
        vim.fn['skkeleton#register_kanatable']('rom', {
            jk = 'escape',
        })
    end,
}
