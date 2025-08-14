local module = {}

local ui = require('./k_ui')
local config = require('./config_ui')

local root = ui.new('abau')

------------------------- main
local main = ui.window(900, 500, root, true)
main:draggable()
main:anchor(ui.directions.center)
main:list_layout(0)
main:pad(20)
main:corner(10)
main:bind(Enum.KeyCode.F2, function()
	main.item.Visible = not main.item.Visible
end)
module.main = main

local header = ui.header(main.item, 'ABAU')
header.item.Size = UDim2.fromScale(1, .05)
header.item.LayoutOrder = 1
header.item.TextXAlignment = Enum.TextXAlignment.Left
header.item.TextScaled = true
header.item.FontFace.Bold = true
header:anchor(ui.directions.top)

local logs = ui.item('ScrollingFrame', main.item)
logs.item.LayoutOrder = 2
logs.item.Size = UDim2.fromScale(1, .85)
logs:list_layout()
logs:corner(10)
logs:pad(10)
logs:containerize(10)
logs:canvas_adapt()
module.logs = logs

local bar = ui.item('TextBox', main.item)
bar.item.LayoutOrder = 3
bar.item.Size = UDim2.fromScale(1, .1)
bar.item.Text = ''
bar.item.TextScaled = true
bar.item.PlaceholderText = 'Command Bar'
bar.item.TextXAlignment = Enum.TextXAlignment.Left
bar.item.BackgroundColor3 = config.bg3
bar:corner(10)
bar:pad(10)
bar:containerize(10)
bar:bind(Enum.KeyCode.F2, function()
	bar.item:CaptureFocus()
end)
module.bar = bar

------------------------- players
local players = ui.window(400, 600, root, true)
players:draggable()
players:anchor(ui.directions.center)
players:list_layout(10)
players:pad(20)
players:corner(10)
players:bind(Enum.KeyCode.Semicolon, function()
	players.item.Visible = not players.item.Visible
end)

local players_header = ui.header(players.item, 'Players')
players_header.item.Size = UDim2.fromScale(1, .05)
players_header.item.LayoutOrder = 1
players_header.item.TextXAlignment = Enum.TextXAlignment.Left
players_header.item.TextScaled = true
players_header.item.FontFace.Bold = true
players_header:anchor(ui.directions.top)

local players_body = ui.item('ScrollingFrame', players.item)
players_body.item.LayoutOrder = 2
players_body.item.Size = UDim2.fromScale(1, .95)
players_body.item.ScrollBarThickness = 2
players_body:list_layout(10)
players_body:corner(10)
players_body:pad(10)
players_body:pad_fix(10)
module.players_container = players_body

------------------------- notepad
local notepad = ui.window(400, 300, root, true)
notepad:draggable()
notepad:anchor(ui.directions.left)
notepad:list_layout(10)
notepad:pad(20)
notepad:corner(10)
notepad:bind(Enum.KeyCode.Quote, function()
	notepad.item.Visible = not notepad.item.Visible
end)

local notepad_header = ui.header(notepad.item, 'Notepad')
notepad_header.item.Size = UDim2.fromScale(1, .1)
notepad_header.item.LayoutOrder = 1
notepad_header.item.TextXAlignment = Enum.TextXAlignment.Left
notepad_header.item.TextScaled = true
notepad_header.item.FontFace.Bold = true
notepad_header:anchor(ui.directions.top)

local notepad_textbox = ui.item('TextBox', notepad.item)
notepad_textbox.item.LayoutOrder = 2
notepad_textbox.item.Size = UDim2.fromScale(1, .9)
notepad_textbox.item.TextXAlignment = Enum.TextXAlignment.Left
notepad_textbox.item.TextScaled = true
notepad_textbox.item.MultiLine = true
notepad_textbox:corner(10)
notepad_textbox:pad(10)
notepad_textbox:pad_fix(10)

return module
