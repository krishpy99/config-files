return {
	"L3MON4D3/LuaSnip",
	config = function()
		local luasnip = require("luasnip")
		
		-- Load the function from snippets/init.lua
--		local snippet_loader = require("snippets")

		-- Call the function to load all snippets
--		snippet_loader.load_all_snippets()

		-- Keep the print_loaded_snippets function
		local function print_loaded_snippets()
			print("Loaded Snippets:")
			for filetype, snippets in pairs(require("luasnip").snippets) do
				print("Filetype: " .. filetype)
				for _, snippet in ipairs(snippets) do
					local trigger = snippet.trigger
					local name = snippet.name or "Unnamed"
					local auto = snippet.snippetType == "autosnippet" and " (Auto)" or ""
					print(string.format("  - [%s] %s%s", trigger, name, auto))
				end
			end
		end
		vim.api.nvim_create_user_command('PrintSnippets', print_loaded_snippets, {})

		-- Basic LuaSnip configuration (now handled in snippets/init.lua)
		-- You can add any additional configuration here if needed
	end,
}
