--!strict

local module = {}

local replicated_storage = game:GetService('ReplicatedStorage')

module.ui = nil :: ScreenGui | nil
module.remote = replicated_storage:WaitForChild('basic_admin', 10) :: RemoteFunction

module.debug_update_speed = 1

module.commands = {} :: {any}

module.config = {
	ui_key = Enum.KeyCode.F2,
}

return module
