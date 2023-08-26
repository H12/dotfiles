return {
	"cormacrelf/dark-notify",
	config = function()
		require("dark_notify").run({
			schemes = {
				dark = "tokyonight-night",
				light = "tokyonight-day",
			}
		})
	end
}
