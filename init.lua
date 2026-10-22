require('core.options')
require('core.mapping')

local profile =  vim.env.NVIM_PROFILE or "default"
vim.g.nvim_profile = profile

local profile_path = "plugins.profiles." .. profile
if profile != "default" then
	local ok, err = pcall(require, profile_path)

	if not ok and err then
		vim.notify(
			"Could not load profile '" .. profile .. "': " .. err,
			vim.log.levels.ERROR
		)
	end
end

require('core.lazy')
