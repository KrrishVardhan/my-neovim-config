return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = {
		display = {
			theme = "default",
		},
		text = {
			viewing = function(opts)
				return "Browsing " .. opts.filename
			end,

			editing = function(opts)
				return "Editing " .. opts.filename
			end,

			workspace = function(opts)
				return "Working on " .. opts.workspace
			end,
		},
	},
}
