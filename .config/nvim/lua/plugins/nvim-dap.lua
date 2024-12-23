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
			keymap("n", "d]", dap.step_into, { desc = "Step Into" })
			keymap("n", "d[", dap.step_over, { desc = "Step Over" })
			keymap("n", "<Space>dq", dap.terminate, { desc = "Quit Debugging" })

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
		end,
	},
}
