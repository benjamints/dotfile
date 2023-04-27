local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format()
				end,
			})
		end
	end,

	sources = {
		-- Diagnostics
		-- null_ls.builtins.diagnostics.eslint_d.with({
		--   diagnostics_format = '[eslint] #{m}\n(#{c})'
		-- }),
		null_ls.builtins.diagnostics.fish,

		-- Formatting
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
	},
})
