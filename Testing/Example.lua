-- init --
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/Venyx%20UI%20Lib/Source.lua"))()
local Venyx = library.new("Venyx", 5013109572)

-- themes --
local Themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

-- Pages --
local Page1 = Venyx:addPage("Page 1", 5012544693)
local Section1 = Page1:addSection("Section 1")
local Section2 = Page1:addSection("Section 2")

local Theme = Venyx:addPage("Theme", 5012544693)
local Settings = Theme:addSection("Settings")
local Colors = Theme:addSection("Colors")

-- First Page --
Container1, Text1 = Section1:addParagraph("Hello world!", "Fixed and improved by Pethicial.")

Container2, Text2 = Section1:addParagraph(nil, "No title")

Section1:addToggle("Toggle", nil, function(value)
	print("Toggled", value)
end)

Section1:addButton("Button", function()
	print("Clicked")
end)

Section1:addTextbox("Notification", "Default", function(value, focusLost)
	print("Input", value)
	if focusLost then
		Venyx:Notify("Title", value)
	end
end)

Section2:addKeybind("Toggle Keybind", Keybind, function()
	print("Activated Keybind")
end, function()
	print("Changed Keybind")
end)

Section2:addSlider("Slider", 0, -100, 100, function(value)
	print("Dragged", value)
end)

Section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3}, function(text)
	print("Selected", text)
end)

Section2:addColorPicker("Tester", Color3.fromRGB(0, 0, 0), function(color3)
	print(color3)
end)

-- Second Page --
Settings:addKeybind("Toggle UI", Enum.KeyCode.LeftControl, function()
	print("UI Toggled")
	Venyx:toggle()
end, function()
	print("Changed Keybind")
end)

for theme, color in pairs(Themes) do
	Colors:addColorPicker(theme, color, function(color3)
		Venyx:setTheme(theme, color3)
	end)
end

Venyx:SelectPage(Venyx.pages[1], true)

while true and task.wait() do
	wait(5)
	Text1.Text = "You can also change the text!"
	wait(5)
	Text1.Text = "Can be useful for auto farm status."
	wait(5)
	Text1.Text = "Fixed and improved by Pethicial."
end
