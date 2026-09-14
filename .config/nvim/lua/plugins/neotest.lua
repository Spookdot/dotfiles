return function()
    --- @module 'neotest.lib'
    --- @type neotest.Config
    require("neotest").setup({
        adapters = {
            require("rustaceanvim.neotest"),
            require("neotest-python")({ runner = "unittest" }),
            require("neotest-haskell"),
        },
    })
end
