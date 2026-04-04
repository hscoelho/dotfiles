local module = {}
function module.apply_to_config(config)
	-- config.colors = require("kanagawa-lotus")
	-- config.color_scheme = "GruvboxLight"
	-- config.colors = require("cyberdream-light")
	config.colors = require("my-theme")
end
return module
