return {
	{
		-- Neovim Debugger Application Protocol (DAP) for better integration with debugging
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local widgets = require("dap.ui.widgets")

			-- Set up custom keymaps for dap
			local keymap = vim.keymap.set

			-- Keymap for Debugging
			keymap("n", "<Space>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			keymap("n", "<Space>dc", dap.continue, { desc = "Continue Execution" })
			keymap("n", "<Right>", dap.step_into, { desc = "Step Into" })
			keymap("n", "<Down>", dap.step_over, { desc = "Step Over" })
			keymap("n", "<Space>dq", dap.terminate, { desc = "Quit Debugging" })

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)

			-- Set the sidebar width to 50% of the screen width
			local screen_width = vim.api.nvim_win_get_width(0) -- Get the width of the current window
			local sidebar_width = math.floor(screen_width * 0.5) -- Set the sidebar width to 50% of the screen width
			local sidebar = widgets.sidebar(widgets.scopes, { width = sidebar_width }) -- 50% of screen height

			-- Keymap to toggle the sidebar widget
			keymap("n", "<Space>du", function()
				sidebar.toggle()
			end, { desc = "Toggle DAP Sidebar" })

			-- Automatically open the sidebar when the debugger starts
			dap.listeners.after.event_initialized["dapui_config"] = function()
				sidebar.open()
			end
			-- Automatically close the sidebar when the debugger stops (terminated or exited)
			dap.listeners.before.event_terminated["dapui_config"] = function()
				sidebar.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				sidebar.close()
			end
			dap.configurations.go = {
				{
					type = "go",
					name = "start debugging interface",
					request = "launch",
					mode = "debug",
					program = "/home/dimi/main", -- path to you go program binary
					args = {}, -- add argument like this {"add", "task"}
					showLog = true, -- Optional: shows Delve logs in the console
				},
			}
		end,
	},
}
