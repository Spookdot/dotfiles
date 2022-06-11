local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/paqs/start/paq-nvim'

if not vim.loop.fs_stat(fn.glob(install_path)) then
	os.execute('git clone https://github.com/savq/paq-nvim.git '..install_path)
end

-- Plugins
require("plugins")

-- Editor Settings
require("editor")

-- UI Settings
require("ui")

-- Keybindings
require("keybindings")
