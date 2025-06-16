return {
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                italic_comments = true,
            })
            vim.cmd("colorscheme cyberdream")
        end,
    },
    -- {
    -- 	"projekt0n/github-nvim-theme",
    -- 	name = "github-theme",
    -- 	lazy = false,
    -- 	priority = 1000,
    -- 	config = function()
    -- 		require("github-theme").setup({
    -- 			options = {
    -- 				styles = {
    -- 					comments = "italic",
    -- 					keywords = "bold",
    -- 					types = "italic,bold",
    -- 					functions = "bold",
    -- 					strings = "NONE",
    -- 				},
    -- 			},
    -- 		})
    -- 		vim.cmd("colorscheme github_dark_high_contrast")
    -- 	end,
    -- }
}
