return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- custom function for displaying usage of CPU and memory
		local function resources_usage()
			local cpu_usage = ""
			local mem_usage = ""

			local cpu_handle = io.popen("mpstat | sed -n '4p' | awk '{print 100 - $NF}'") -- gets the loaded CPU percentage
			if cpu_handle then
				cpu_usage = cpu_handle:read("*a") -- read all output
				cpu_usage = cpu_usage:gsub("%s+", "") -- remove any whitespace
			end
			-- data in the format: used_memory/all_memory
		  local mem_handle = io.popen("free -m | sed -n '2p' | sed 's/[[:space:]]\\+/;/g' | awk -F';' '{print $3 \"/\" $2}'")
			if mem_handle then
				mem_usage = mem_handle:read("*a") -- read all output
				mem_usage = mem_usage:gsub("%s+", "") -- remove any whitespace
			end
			return string.format("CPU: %s | MEM: %s", cpu_usage, mem_usage)
		end
    local function nickname()
      return [[Config by rastr-0]]
    end

		require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = 'gruvbox-material',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '|', right = '|'},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", resources_usage, "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {nickname},
				lualine_y = {"location"},
				lualine_z = {"filetype", "selectioncount"},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
