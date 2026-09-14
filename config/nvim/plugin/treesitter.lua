-- nvim-treesitter v1.0 (main branch, shipped in nixpkgs 25.11+) removed the
-- `nvim-treesitter.configs` module. Parsers come from the nix-built bundle
-- in config/neovim.nix; highlight/indent are enabled per-buffer here.
local disabled_langs = { vimdoc = true }

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if not lang or disabled_langs[lang] then return end
    if not pcall(vim.treesitter.start, args.buf, lang) then return end
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
