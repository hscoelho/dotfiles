-- config.color_scheme_dirs = { "./colors/" }
-- config.color_scheme = "everforest"
-- config.color_scheme = "monokai_pro_machine"
-- config.colors = require("cyberdream-light")
local module = {}
function module.apply_to_config(config)
	-- config.colors = require("cyberdream-light")
	-- config.colors = require("kanagawa-lotus")
	config.color_scheme = "GruvboxLight"
end
return module
