return {
    themeConfigFile = "~/.config/nvim/init.lua",
    themes = {
        {
            name = "fluoromachine",
            colorscheme = "fluoromachine",
            after = [[ require('fluoromachine').theme = "fluoromachine" ]]
        }, {
            name = "delta",
            colorscheme = "fluoromachine",
            after = [[ require('fluoromachine').theme = "delta" ]]
        }, {
            name = "retrowave",
            colorscheme = "fluoromachine",
            after = [[ require('fluoromachine').theme = "retrowave" ]]
        }, "retrobox", "carbonfox", "dawnfox", "dayfox", "duskfox", "nightfox",
        "nordfox", "terafox", "nordic", "kanagawa", "kanagawa-dragon",
        "kanagawa-lotus", "kanagawa-wave", "gruvbox-baby", "dark_flat",
        "catppuccin", "catppuccin-latte", "catppuccin-frappe",
        "catppuccin-macchiato", "catppuccin-mocha", "moonlight", "tokyodark",
        "tokyonight", "tokyonight-storm", "tokyonight-night", "tokyonight-day",
        "tokyonight-moon", "material-oceanic", "material-deep-ocean",
        "material-palenight", "material-lighter", "material-darker"
    }
}
