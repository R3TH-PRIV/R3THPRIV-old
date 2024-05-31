-- init
print("yeh")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- services
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new

-- additional
local utility = {}

-- themes
local objects = {}
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),
	TextColor = Color3.fromRGB(255, 255, 255)
}

do
	function utility:Create(instance, properties, children)
		local object = Instance.new(instance)

		for i, v in pairs(properties or {}) do
			object[i] = v

			if typeof(v) == "Color3" then -- save for theme changer later
				local theme = utility:Find(themes, v)

				if theme then
					objects[theme] = objects[theme] or {}
					objects[theme][i] = objects[theme][i] or setmetatable({}, {_mode = "k"})

					objects[theme][i][#objects[theme][i] + 1] = object
				end
			end
		end

		for i, module in pairs(children or {}) do
			module.Parent = object
		end

		return object
	end

	function utility:Tween(instance, properties, duration, ...)
		tween:Create(instance, tweeninfo(duration, ...), properties):Play()
	end

	function utility:Wait()
		run.RenderStepped:Wait()
		return true
	end

	function utility:Find(table, value) -- table.find doesn't work for dictionaries
		for i, v in  pairs(table) do
			if v == value then
				return i
			end
		end
	end

	function utility:Sort(pattern, values)
		local new = {}
		pattern = pattern:lower()

		if pattern == "" then
			return values
		end

		for i, value in pairs(values) do
			if tostring(value):lower():find(pattern) then
				new[#new + 1] = value
			end
		end

		return new
	end

	function utility:Pop(object, shrink)
		local clone = object:Clone()

		clone.AnchorPoint = Vector2.new(0.5, 0.5)
		clone.Size = clone.Size - UDim2.new(0, shrink, 0, shrink)
		clone.Position = UDim2.new(0.5, 0, 0.5, 0)

		clone.Parent = object
		clone:ClearAllChildren()

		object.ImageTransparency = 1
		utility:Tween(clone, {Size = object.Size}, 0.2)

		coroutine.wrap(function()
			wait(0.2)

			object.ImageTransparency = 0
			clone:Destroy()
		end)()

		return clone
	end

	function utility:InitializeKeybind()
		self.keybinds = {}
		self.ended = {}

		input.InputBegan:Connect(function(key, gameProcessedEvent)
			if self.keybinds[key.KeyCode] then
				for i, bind in pairs(self.keybinds[key.KeyCode]) do
					if (bind.gameProcessedEvent == gameProcessedEvent) then
						bind.callback()
					end
				end
			end
		end)

		input.InputEnded:Connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 then
				for i, callback in pairs(self.ended) do
					callback()
				end
			end
		end)
	end

	function utility:BindToKey(key, callback, gameProcessedEvent)

		self.keybinds[key] = self.keybinds[key] or {}

		table.insert(self.keybinds[key], {callback = callback, gameProcessedEvent = gameProcessedEvent or false})

		return {
			UnBind = function()
				for i, keybindData in pairs(self.keybinds[key]) do
					if keybindData.callback == callback then
						table.remove(self.keybinds[key], i)
					end
				end
			end
		}
	end

	function utility:KeyPressed() -- yield until next key is pressed
		local key = input.InputBegan:Wait()

		while key.UserInputType ~= Enum.UserInputType.Keyboard	 do
			key = input.InputBegan:Wait()
		end

		wait() -- overlapping connection

		return key
	end

	function utility:DraggingEnabled(frame, parent)

		parent = parent or frame

		-- stolen from wally or kiriot, kek
		local dragging = false
		local dragInput, mousePos, framePos

		frame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				mousePos = input.Position
				framePos = parent.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)

		input.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - mousePos
				parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
			end
		end)

	end

	function utility:DraggingEnded(callback)
		self.ended[#self.ended + 1] = callback
	end

end

-- classes

local library = {} -- main
local page = {}
local section = {}

do
	library.__index = library
	page.__index = page
	section.__index = section

	-- new classes

	function library.new(data)
		local title = data.title or "Venyx"

		local container = utility:Create("ScreenGui", {
			Name = title,
			Parent = game.CoreGui
		}, {
			utility:Create("ImageLabel", {
				Name = "Main",
				BackgroundTransparency = 1,
				Position = UDim2.new(0.25, 0, 0.052435593, 0),
				Size = UDim2.new(0, 511, 0, 428),
				Image = "rbxassetid://4641149554",
				ImageColor3 = themes.Background,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(4, 4, 296, 296)
			}, {
				utility:Create("ImageLabel", {
					Name = "Glow",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, -15, 0, -15),
					Size = UDim2.new(1, 30, 1, 30),
					ZIndex = 0,
					Image = "rbxassetid://5028857084",
					ImageColor3 = themes.Glow,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(24, 24, 276, 276)
				}),
				utility:Create("ImageLabel", {
					Name = "Pages",
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Position = UDim2.new(0, 0, 0, 38),
					Size = UDim2.new(0, 126, 1, -38),
					ZIndex = 3,
					Image = "rbxassetid://5012534273",
					ImageColor3 = themes.DarkContrast,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(4, 4, 296, 296)
				}, {
					utility:Create("ScrollingFrame", {
						Name = "Pages_Container",
						Active = true,
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 0, 0, 10),
						Size = UDim2.new(1, 0, 1, -20),
						CanvasSize = UDim2.new(0, 0, 0, 314),
						ScrollBarThickness = 0
					}, {
						utility:Create("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 10)
						})
					})
				}),
				utility:Create("ImageLabel", {
					Name = "TopBar",
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 0, 38),
					ZIndex = 5,
					Image = "rbxassetid://4595286933",
					ImageColor3 = themes.Accent,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(4, 4, 296, 296)
				}, {
					utility:Create("TextLabel", { -- title
						Name = "Title",
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 12, 0, 19),
						Size = UDim2.new(1, -46, 0, 16),
						ZIndex = 5,
						Font = Enum.Font.GothamBold,
						Text = title,
						TextColor3 = themes.TextColor,
						TextSize = 14,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			})
		})

		utility:InitializeKeybind()
		utility:DraggingEnabled(container.Main.TopBar, container.Main)

		return setmetatable({
			container = container,
			pagesContainer = container.Main.Pages.Pages_Container,
			pages = {}
		}, library)
	end

	function library.setTitle(library, title)
		local container = library.container
		container.Name = title
		container.Main.TopBar.Title.Text = title
	end

	function page.new(library, title, icon)
		local button = utility:Create("TextButton", {
			Name = title,
			Parent = library.pagesContainer,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 26),
			ZIndex = 3,
			AutoButtonColor = false,
			Font = Enum.Font.Gotham,
			Text = "",
			TextSize = 14
		}, {
			utility:Create("TextLabel", {
				Name = "Title",
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 40, 0.5, 0),
				Size = UDim2.new(0, 76, 1, 0),
				ZIndex = 3,
				Font = Enum.Font.Gotham,
				Text = title,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextTransparency = 0.65,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			icon and utility:Create("ImageLabel", {
				Name = "Icon",
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 12, 0.5, 0),
				Size = UDim2.new(0, 16, 0, 16),
				ZIndex = 3,
				Image = "http://www.roblox.com/asset/?id=" .. tostring(icon),
				ImageColor3 = themes.TextColor,
				ImageTransparency = 0.64
			}) or {}
		})

		local container = utility:Create("ScrollingFrame", {
			Name = title,
			Parent = library.container.Main,
			Active = true,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 134, 0, 46),
			Size = UDim2.new(1, -142, 1, -56),
			CanvasSize = UDim2.new(0, 0, 0, 466),
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = themes.DarkContrast,
			Visible = false
		}, {
			utility:Create("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 10)
			})
		})

		return setmetatable({
			library = library,
			container = container,
			button = button,
			sections = {}
		}, page)
	end

	function section.new(page, title)
		local container = utility:Create("ImageLabel", {
			Name = title,
			Parent = page.container,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -10, 0, 28),
			ZIndex = 2,
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.LightContrast,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(4, 4, 296, 296),
			ClipsDescendants = true
		}, {
			utility:Create("Frame", {
				Name = "Container",
				Active = true,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 8, 0, 8),
				Size = UDim2.new(1, -16, 1, -16)
			}, {
				utility:Create("TextLabel", {
					Name = "Title",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 20),
					ZIndex = 2,
					Font = Enum.Font.GothamSemibold,
					Text = title,
					TextColor3 = themes.TextColor,
					TextSize = 12,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTransparency = 1
				}),
				utility:Create("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				})
			})
		})

		return setmetatable({
			page = page,
			container = container.Container,
			colorpickers = {},
			modules = {},
			binds = {},
			lists = {},
		}, section)
	end

	function library:addPage(data)
		local title = data.title or "Page"
		local icon = data.icon

		local newPage = page.new(self, title, icon)
		local button = newPage.button

		table.insert(self.pages, newPage)
		self:reorderPageButtons()

		button.MouseButton1Click:Connect(function()
			self:SelectPage({
				page = newPage,
				toggle = true
			})
		end)

		return newPage
	end

	function page:setOrderPos(newPos)
		local libraryPages = self.library.pages

		if (newPos > #libraryPages) then
			return error("newPos exceeds number of pages available")
		end

		local foundi = table.find(libraryPages, self)
		if (foundi) then
			table.remove(libraryPages, foundi)
		end

		table.insert(libraryPages, newPos, self)

		self.library:reorderPageButtons()
	end

	function page:addSection(data)
		local title = data.title or "Section"

		local newSection = section.new(self, title)

		self.sections[#self.sections + 1] = newSection

		return newSection
	end

	-- functions

	function library:reorderPageButtons()
		for i, page in ipairs(self.pages) do
			page.button.LayoutOrder = i
		end
	end

	function library:setTheme(data)
		local theme = data.theme
		local color3 = data.color3

		themes[theme] = color3

		for property, objectss in pairs(objects[theme]) do
			for i, object in pairs(objectss) do
				if not object.Parent or (object.Name == "Button" and object.Parent.Name == "ColorPicker") then
					objectss[i] = nil -- i can do this because weak tables :D
				else
					object[property] = color3
				end
			end
		end
	end

	function library:toggle()

		if self.toggling then
			return
		end

		self.toggling = true

		local container = self.container.Main
		local topbar = container.TopBar

		if self.position then
			utility:Tween(container, {
				Size = UDim2.new(0, 511, 0, 428),
				Position = self.position
			}, 0.2)
			wait(0.2)

			utility:Tween(topbar, {Size = UDim2.new(1, 0, 0, 38)}, 0.2)
			wait(0.2)

			container.ClipsDescendants = false
			self.position = nil
		else
			self.position = container.Position
			container.ClipsDescendants = true

			utility:Tween(topbar, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
			wait(0.2)

			utility:Tween(container, {
				Size = UDim2.new(0, 511, 0, 0),
				Position = self.position + UDim2.new(0, 0, 0, 428)
			}, 0.2)
			wait(0.2)
		end

		self.toggling = false
	end

	-- new modules

	function library:Notify(data)
		local title = data.title or "Notification"
		local text = data.text or "nil text"
		local callback = data.callback or function() end

		-- overwrite last notification
		if self.activeNotification then
			self.activeNotification = self.activeNotification()
		end

		-- standard create
		local notification = utility:Create("ImageLabel", {
			Name = "Notification",
			Parent = self.container,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 200, 0, 60),
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.Background,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(4, 4, 296, 296),
			ZIndex = 3,
			ClipsDescendants = true
		}, {
			utility:Create("ImageLabel", {
				Name = "Flash",
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Image = "rbxassetid://4641149554",
				ImageColor3 = themes.TextColor,
				ZIndex = 5
			}),
			utility:Create("ImageLabel", {
				Name = "Glow",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, -15, 0, -15),
				Size = UDim2.new(1, 30, 1, 30),
				ZIndex = 2,
				Image = "rbxassetid://5028857084",
				ImageColor3 = themes.Glow,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(24, 24, 276, 276)
			}),
			utility:Create("TextLabel", {
				Name = "Title",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0, 8),
				Size = UDim2.new(1, -40, 0, 16),
				ZIndex = 4,
				Font = Enum.Font.GothamSemibold,
				TextColor3 = themes.TextColor,
				TextSize = 14.000,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			utility:Create("TextLabel", {
				Name = "Text",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 1, -24),
				Size = UDim2.new(1, -40, 0, 16),
				ZIndex = 4,
				Font = Enum.Font.Gotham,
				TextColor3 = themes.TextColor,
				TextSize = 12.000,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			utility:Create("ImageButton", {
				Name = "Accept",
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -26, 0, 8),
				Size = UDim2.new(0, 16, 0, 16),
				Image = "rbxassetid://5012538259",
				ImageColor3 = themes.TextColor,
				ZIndex = 4
			}),
			utility:Create("ImageButton", {
				Name = "Decline",
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -26, 1, -24),
				Size = UDim2.new(0, 16, 0, 16),
				Image = "rbxassetid://5012538583",
				ImageColor3 = themes.TextColor,
				ZIndex = 4
			})
		})

		-- dragging
		utility:DraggingEnabled(notification)

		-- position and size

		notification.Title.Text = title
		notification.Text.Text = text

		local padding = 10
		local textSize = game:GetService("TextService"):GetTextSize(text, 12, Enum.Font.Gotham, Vector2.new(math.huge, 16))

		notification.Position = library.lastNotification or UDim2.new(0, padding, 1, -(notification.AbsoluteSize.Y + padding))
		notification.Size = UDim2.new(0, 0, 0, 60)

		utility:Tween(notification, {Size = UDim2.new(0, textSize.X + 70, 0, 60)}, 0.2)
		wait(0.2)

		notification.ClipsDescendants = false
		utility:Tween(notification.Flash, {
			Size = UDim2.new(0, 0, 0, 60),
			Position = UDim2.new(1, 0, 0, 0)
		}, 0.2)

		-- callbacks
		local active = true
		local close = function()

			if not active then
				return
			end

			active = false
			notification.ClipsDescendants = true

			library.lastNotification = notification.Position
			notification.Flash.Position = UDim2.new(0, 0, 0, 0)
			utility:Tween(notification.Flash, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)

			wait(0.2)
			utility:Tween(notification, {
				Size = UDim2.new(0, 0, 0, 60),
				Position = notification.Position + UDim2.new(0, textSize.X + 70, 0, 0)
			}, 0.2)

			wait(0.2)
			notification:Destroy()
		end

		self.activeNotification = close

		notification.Accept.MouseButton1Click:Connect(function()

			if not active then
				return
			end

			if callback then
				callback(true)
			end

			close()
		end)

		notification.Decline.MouseButton1Click:Connect(function()

			if not active then
				return
			end

			if callback then
				callback(false)
			end

			close()
		end)
	end

	function section:addButton(data)
		local this = {}
		this.title = data.title or "nil text"
        this.callback = data.callback or function() end

		local button = utility:Create("ImageButton", {
			Name = "Button",
			Parent = self.container,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 30),
			ZIndex = 2,
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.DarkContrast,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 298, 298)
		}, {
			utility:Create("TextLabel", {
				Name = "Title",
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 3,
				Font = Enum.Font.Gotham,
				Text = this.title,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextTransparency = 0.10000000149012
			})
		})

		local module = {Instance = button, Options = this}
		self.modules[#self.modules + 1] = module
		--self:Resize()

		local text = button.Title
		local debounce

		button.MouseButton1Click:Connect(function()

			if debounce then
				return
			end

			-- animation
			utility:Pop(button, 10)

			debounce = true
			text.TextSize = 0
			utility:Tween(button.Title, {TextSize = 14}, 0.2)

			wait(0.2)
			utility:Tween(button.Title, {TextSize = 12}, 0.2)

			this.callback()

			debounce = false
		end)

		function this:Update(dataOptions)
            -- // Overwriting settings
            for i,v in pairs(dataOptions) do
                if (module.Options[i] and i ~= "Update") then
                    module.Options[i] = tostring(v)
                end
            end

			return section:updateButton(module)
		end

		return module
	end

	function section:addToggle(data)
		local this = {}
		this.title = data.title or "nil text"
		this.toggled = data.default or false
		this.callback = data.callback or function() end

		local toggle = utility:Create("ImageButton", {
			Name = "Toggle",
			Parent = self.container,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 30),
			ZIndex = 2,
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.DarkContrast,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 298, 298)
		},{
			utility:Create("TextLabel", {
				Name = "Title",
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0.5, 1),
				Size = UDim2.new(0.5, 0, 1, 0),
				ZIndex = 3,
				Font = Enum.Font.Gotham,
				Text = this.title,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextTransparency = 0.10000000149012,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			utility:Create("ImageLabel", {
				Name = "Button",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(1, -50, 0.5, -8),
				Size = UDim2.new(0, 40, 0, 16),
				ZIndex = 2,
				Image = "rbxassetid://5028857472",
				ImageColor3 = themes.LightContrast,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(2, 2, 298, 298)
			}, {
				utility:Create("ImageLabel", {
					Name = "Frame",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 2, 0.5, -6),
					Size = UDim2.new(1, -22, 1, -4),
					ZIndex = 2,
					Image = "rbxassetid://5028857472",
					ImageColor3 = themes.TextColor,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(2, 2, 298, 298)
				})
			})
		})
		local module = {Instance = toggle, Options = this}
		self.modules[#self.modules + 1] = module
		--self:Resize()

		self:updateToggle(module)

		function this:Update(dataOptions)
			-- // Overwriting settings
            for i,v in pairs(dataOptions) do
                if (module.Options[i] and i ~= "Update") then
                    module.Options[i] = tostring(v)
                end
			end

			return section:updateToggle(module)
		end

		toggle.MouseButton1Click:Connect(function()
			this.toggled = not this.toggled
			self:updateToggle(module)

			this.callback(this.toggled)
		end)

		return module
	end

	function section:addTextbox(data)
		local this = {}
		this.title = data.title or "nil text"
		this.callback = data.callback or function() end
		this.default = data.default or "nil text"

		local textbox = utility:Create("ImageButton", {
			Name = "Textbox",
			Parent = self.container,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 30),
			ZIndex = 2,
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.DarkContrast,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 298, 298)
		}, {
			utility:Create("TextLabel", {
				Name = "Title",
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0.5, 1),
				Size = UDim2.new(0.5, 0, 1, 0),
				ZIndex = 3,
				Font = Enum.Font.Gotham,
				Text = this.title,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextTransparency = 0.10000000149012,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			utility:Create("ImageLabel", {
				Name = "Button",
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -110, 0.5, -8),
				Size = UDim2.new(0, 100, 0, 16),
				ZIndex = 2,
				Image = "rbxassetid://5028857472",
				ImageColor3 = themes.LightContrast,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(2, 2, 298, 298)
			}, {
				utility:Create("TextBox", {
					Name = "Textbox",
					BackgroundTransparency = 1,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Position = UDim2.new(0, 5, 0, 0),
					Size = UDim2.new(1, -10, 1, 0),
					ZIndex = 3,
					Font = Enum.Font.GothamSemibold,
					Text = this.default,
					TextColor3 = themes.TextColor,
					TextSize = 11
				})
			})
		})
		local module = {Instance = textbox, Options = this}
		self.modules[#self.modules + 1] = module
		--self:Resize()

		local button = textbox.Button
		local tInput = button.Textbox

		textbox.MouseButton1Click:Connect(function()

			if textbox.Button.Size ~= UDim2.new(0, 100, 0, 16) then
				return
			end

			utility:Tween(textbox.Button, {
				Size = UDim2.new(0, 200, 0, 16),
				Position = UDim2.new(1, -210, 0.5, -8)
			}, 0.2)

			wait()

			tInput.TextXAlignment = Enum.TextXAlignment.Left
			tInput:CaptureFocus()
		end)

		tInput:GetPropertyChangedSignal("Text"):Connect(function()

			if button.ImageTransparency == 0 and (button.Size == UDim2.new(0, 200, 0, 16) or button.Size == UDim2.new(0, 100, 0, 16)) then -- i know, i dont like this either
				utility:Pop(button, 10)
			end

			this.callback(tInput.Text)
		end)

		tInput.FocusLost:Connect(function()

			tInput.TextXAlignment = Enum.TextXAlignment.Center

			utility:Tween(textbox.Button, {
				Size = UDim2.new(0, 100, 0, 16),
				Position = UDim2.new(1, -110, 0.5, -8)
			}, 0.2)

			this.callback(tInput.Text, true)
		end)

		function this:Update(dataOptions)
			-- // Overwriting settings
            for i,v in pairs(dataOptions) do
                if (module.Options[i] and i ~= "Update") then
                    module.Options[i] = tostring(v)
                end
			end

			return section:updateTextbox(module)
		end

		return module
	end

	function section:addKeybind(data)
		local this = {}
		this.title = data.title or "nil text"
		this.key = data.key or Enum.KeyCode.Unknown
		this.gameProcessedEvent = data.gameProcessedEvent or false
		this.callback = data.callback or function() end
		this.changedCallback = data.changedCallback or function(key) end

		local keybind = utility:Create("ImageButton", {
			Name = "Keybind",
			Parent = self.container,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 30),
			ZIndex = 2,
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.DarkContrast,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 298, 298)
		}, {
			utility:Create("TextLabel", {
				Name = "Title",
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0.5, 1),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 3,
				Font = Enum.Font.Gotham,
				Text = this.title,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextTransparency = 0.10000000149012,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			utility:Create("ImageLabel", {
				Name = "Button",
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -110, 0.5, -8),
				Size = UDim2.new(0, 100, 0, 16),
				ZIndex = 2,
				Image = "rbxassetid://5028857472",
				ImageColor3 = themes.LightContrast,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(2, 2, 298, 298)
			}, {
				utility:Create("TextLabel", {
					Name = "Text",
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 3,
					Font = Enum.Font.GothamSemibold,
					Text = input:GetStringForKeyCode(this.key),
					TextColor3 = themes.TextColor,
					TextSize = 11
				})
			})
		})
		local module = {Instance = keybind, Options = this}
		self.modules[#self.modules + 1] = module
		--self:Resize()

		local text = keybind.Button.Text
		local button = keybind.Button

		local animate = function()
			if button.ImageTransparency == 0 then
				utility:Pop(button, 10)
			end
		end

		self.binds[keybind] = {callback = function()
			animate()
			this.callback()
		end}

		self:updateKeybind(module)

		keybind.MouseButton1Click:Connect(function()

			animate()

			if self.binds[keybind].connection then -- unbind
			    this.key = Enum.KeyCode.Unknown
				return self:updateKeybind(module)
			end

			if text.Text == "Unknown" then -- new bind
				text.Text = "..."

				this.key = utility:KeyPressed().KeyCode

				self:updateKeybind(module)
				animate()

				this.changedCallback(this.key)
			end
		end)

		function this:Update(dataOptions)
			-- // Overwriting settings
            for i,v in pairs(dataOptions) do
                if (module.Options[i] and i ~= "Update") then
                    module.Options[i] = tostring(v)
                end
			end

			return section:updateKeybind(module)
		end

		return module
	end

	function section:addColorPicker(data)
		local this = {}
		this.title = data.title
		this.default = data.default or Color3.new(255, 150, 150)
		this.callback = data.callback or function() end

		local colorpicker = utility:Create("ImageButton", {
			Name = "ColorPicker",
			Parent = self.container,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 30),
			ZIndex = 2,
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.DarkContrast,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 298, 298)
		},{
			utility:Create("TextLabel", {
				Name = "Title",
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0.5, 1),
				Size = UDim2.new(0.5, 0, 1, 0),
				ZIndex = 3,
				Font = Enum.Font.Gotham,
				Text = this.title,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextTransparency = 0.10000000149012,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			utility:Create("ImageButton", {
				Name = "Button",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(1, -50, 0.5, -7),
				Size = UDim2.new(0, 40, 0, 14),
				ZIndex = 2,
				Image = "rbxassetid://5028857472",
				ImageColor3 = Color3.fromRGB(255, 255, 255),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(2, 2, 298, 298)
			})
		})

		local tab = utility:Create("ImageLabel", {
			Name = "ColorPicker",
			Parent = self.page.library.container,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.75, 0, 0.400000006, 0),
			Selectable = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0, 162, 0, 169),
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.Background,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 298, 298),
			Visible = false,
		}, {
			utility:Create("ImageLabel", {
				Name = "Glow",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, -15, 0, -15),
				Size = UDim2.new(1, 30, 1, 30),
				ZIndex = 0,
				Image = "rbxassetid://5028857084",
				ImageColor3 = themes.Glow,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(22, 22, 278, 278)
			}),
			utility:Create("TextLabel", {
				Name = "Title",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0, 8),
				Size = UDim2.new(1, -40, 0, 16),
				ZIndex = 2,
				Font = Enum.Font.GothamSemibold,
				Text = this.title,
				TextColor3 = themes.TextColor,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			utility:Create("ImageButton", {
				Name = "Close",
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -26, 0, 8),
				Size = UDim2.new(0, 16, 0, 16),
				ZIndex = 2,
				Image = "rbxassetid://5012538583",
				ImageColor3 = themes.TextColor
			}),
			utility:Create("Frame", {
				Name = "Container",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 8, 0, 32),
				Size = UDim2.new(1, -18, 1, -40)
			}, {
				utility:Create("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 6)
				}),
				utility:Create("ImageButton", {
					Name = "Canvas",
					BackgroundTransparency = 1,
					BorderColor3 = themes.LightContrast,
					Size = UDim2.new(1, 0, 0, 60),
					AutoButtonColor = false,
					Image = "rbxassetid://5108535320",
					ImageColor3 = Color3.fromRGB(255, 0, 0),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(2, 2, 298, 298)
				}, {
					utility:Create("ImageLabel", {
						Name = "White_Overlay",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 60),
						Image = "rbxassetid://5107152351",
						SliceCenter = Rect.new(2, 2, 298, 298)
					}),
					utility:Create("ImageLabel", {
						Name = "Black_Overlay",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 60),
						Image = "rbxassetid://5107152095",
						SliceCenter = Rect.new(2, 2, 298, 298)
					}),
					utility:Create("ImageLabel", {
						Name = "Cursor",
						BackgroundColor3 = themes.TextColor,
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1.000,
						Size = UDim2.new(0, 10, 0, 10),
						Position = UDim2.new(0, 0, 0, 0),
						Image = "rbxassetid://5100115962",
						SliceCenter = Rect.new(2, 2, 298, 298)
					})
				}),
				utility:Create("ImageButton", {
					Name = "Color",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = UDim2.new(0, 0, 0, 4),
					Selectable = false,
					Size = UDim2.new(1, 0, 0, 16),
					ZIndex = 2,
					AutoButtonColor = false,
					Image = "rbxassetid://5028857472",
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(2, 2, 298, 298)
				}, {
					utility:Create("Frame", {
						Name = "Select",
						BackgroundColor3 = themes.TextColor,
						BorderSizePixel = 1,
						Position = UDim2.new(1, 0, 0, 0),
						Size = UDim2.new(0, 2, 1, 0),
						ZIndex = 2
					}),
					utility:Create("UIGradient", { -- rainbow canvas
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
							ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
							ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
							ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
							ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
							ColorSequenceKeypoint.new(0.82, Color3.fromRGB(255, 0, 255)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
						})
					})
				}),
				utility:Create("Frame", {
					Name = "Inputs",
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 10, 0, 158),
					Size = UDim2.new(1, 0, 0, 16)
				}, {
					utility:Create("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 6)
					}),
					utility:Create("ImageLabel", {
						Name = "R",
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0.305, 0, 1, 0),
						ZIndex = 2,
						Image = "rbxassetid://5028857472",
						ImageColor3 = themes.DarkContrast,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(2, 2, 298, 298)
					}, {
						utility:Create("TextLabel", {
							Name = "Text",
							BackgroundTransparency = 1,
							Size = UDim2.new(0.400000006, 0, 1, 0),
							ZIndex = 2,
							Font = Enum.Font.Gotham,
							Text = "R:",
							TextColor3 = themes.TextColor,
							TextSize = 10.000
						}),
						utility:Create("TextBox", {
							Name = "Textbox",
							BackgroundTransparency = 1,
							Position = UDim2.new(0.300000012, 0, 0, 0),
							Size = UDim2.new(0.600000024, 0, 1, 0),
							ZIndex = 2,
							Font = Enum.Font.Gotham,
							PlaceholderColor3 = themes.DarkContrast,
							Text = "255",
							TextColor3 = themes.TextColor,
							TextSize = 10.000
						})
					}),
					utility:Create("ImageLabel", {
						Name = "G",
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0.305, 0, 1, 0),
						ZIndex = 2,
						Image = "rbxassetid://5028857472",
						ImageColor3 = themes.DarkContrast,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(2, 2, 298, 298)
					}, {
						utility:Create("TextLabel", {
							Name = "Text",
							BackgroundTransparency = 1,
							ZIndex = 2,
							Size = UDim2.new(0.400000006, 0, 1, 0),
							Font = Enum.Font.Gotham,
							Text = "G:",
							TextColor3 = themes.TextColor,
							TextSize = 10.000
						}),
						utility:Create("TextBox", {
							Name = "Textbox",
							BackgroundTransparency = 1,
							Position = UDim2.new(0.300000012, 0, 0, 0),
							Size = UDim2.new(0.600000024, 0, 1, 0),
							ZIndex = 2,
							Font = Enum.Font.Gotham,
							Text = "255",
							TextColor3 = themes.TextColor,
							TextSize = 10.000
						})
					}),
					utility:Create("ImageLabel", {
						Name = "B",
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0.305, 0, 1, 0),
						ZIndex = 2,
						Image = "rbxassetid://5028857472",
						ImageColor3 = themes.DarkContrast,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(2, 2, 298, 298)
					}, {
						utility:Create("TextLabel", {
							Name = "Text",
							BackgroundTransparency = 1,
							Size = UDim2.new(0.400000006, 0, 1, 0),
							ZIndex = 2,
							Font = Enum.Font.Gotham,
							Text = "B:",
							TextColor3 = themes.TextColor,
							TextSize = 10.000
						}),
						utility:Create("TextBox", {
							Name = "Textbox",
							BackgroundTransparency = 1,
							Position = UDim2.new(0.300000012, 0, 0, 0),
							Size = UDim2.new(0.600000024, 0, 1, 0),
							ZIndex = 2,
							Font = Enum.Font.Gotham,
							Text = "255",
							TextColor3 = themes.TextColor,
							TextSize = 10.000
						})
					}),
				}),
				utility:Create("ImageButton", {
					Name = "Button",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 20),
					ZIndex = 2,
					Image = "rbxassetid://5028857472",
					ImageColor3 = themes.DarkContrast,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(2, 2, 298, 298)
				}, {
					utility:Create("TextLabel", {
						Name = "Text",
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						ZIndex = 3,
						Font = Enum.Font.Gotham,
						Text = "Submit",
						TextColor3 = themes.TextColor,
						TextSize = 11.000
					})
				})
			})
		})

		utility:DraggingEnabled(tab)
		local module = {Instance = colorpicker, Options = this}
		self.modules[#self.modules + 1] = module
		--self:Resize()

		local allowed = {
			[""] = true
		}

		local canvas = tab.Container.Canvas
		local color = tab.Container.Color

		local canvasSize, canvasPosition = canvas.AbsoluteSize, canvas.AbsolutePosition
		local colorSize, colorPosition = color.AbsoluteSize, color.AbsolutePosition

		local draggingColor, draggingCanvas

		local hue, sat, brightness = 0, 0, 1
		local rgb = {
			r = 255,
			g = 255,
			b = 255
		}

		self.colorpickers[colorpicker] = {
			tab = tab,
			callback = function(prop, value)
				rgb[prop] = value
				hue, sat, brightness = Color3.toHSV(Color3.fromRGB(rgb.r, rgb.g, rgb.b))
			end
		}

		utility:DraggingEnded(function()
			draggingColor, draggingCanvas = false, false
		end)

		self:updateColorPicker(module)

		hue, sat, brightness = Color3.toHSV(this.default)
		this.default = Color3.fromHSV(hue, sat, brightness)

		for i, prop in pairs({"r", "g", "b"}) do
			rgb[prop] = this.default[prop:upper()] * 255
		end

		for i, container in pairs(tab.Container.Inputs:GetChildren()) do -- i know what you are about to say, so shut up
			if container:IsA("ImageLabel") then
				local textbox = container.Textbox
				local focused

				textbox.Focused:Connect(function()
					focused = true
				end)

				textbox.FocusLost:Connect(function()
					focused = false

					if not tonumber(textbox.Text) then
						textbox.Text = math.floor(rgb[container.Name:lower()])
					end
				end)

				textbox:GetPropertyChangedSignal("Text"):Connect(function()
					local text = textbox.Text

					if not allowed[text] and not tonumber(text) then
						textbox.Text = text:sub(1, #text - 1)
					elseif focused and not allowed[text] then
						rgb[container.Name:lower()] = math.clamp(tonumber(textbox.Text), 0, 255)

						this.default = Color3.fromRGB(rgb.r, rgb.g, rgb.b)
						hue, sat, brightness = Color3.toHSV(this.color3)

						self:updateColorPicker(module)
						this.callback(this.color3)
					end
				end)
			end
		end

		canvas.MouseButton1Down:Connect(function()
			draggingCanvas = true

			while draggingCanvas do

				local x, y = mouse.X, mouse.Y

				sat = math.clamp((x - canvasPosition.X) / canvasSize.X, 0, 1)
				brightness = 1 - math.clamp((y - canvasPosition.Y) / canvasSize.Y, 0, 1)

				this.color3 = Color3.fromHSV(hue, sat, brightness)

				for i, prop in pairs({"r", "g", "b"}) do
					rgb[prop] = this.color3[prop:upper()] * 255
				end

				this.default = Color3.fromHSV(hue, sat, brightness)
				self:updateColorPicker(module)
				utility:Tween(canvas.Cursor, {Position = UDim2.new(sat, 0, 1 - brightness, 0)}, 0.1) -- overwrite

				this.callback(this.color3)
				utility:Wait()
			end
		end)

		color.MouseButton1Down:Connect(function()
			draggingColor = true

			while draggingColor do

				hue = 1 - math.clamp(1 - ((mouse.X - colorPosition.X) / colorSize.X), 0, 1)
				this.color3 = Color3.fromHSV(hue, sat, brightness)

				for i, prop in pairs({"r", "g", "b"}) do
					rgb[prop] = this.color3[prop:upper()] * 255
				end

				local x = hue -- hue is updated
				this.default = Color3.fromHSV(hue, sat, brightness)
				self:updateColorPicker(module)
				utility:Tween(tab.Container.Color.Select, {Position = UDim2.new(x, 0, 0, 0)}, 0.1) -- overwrite

				this.callback(this.color3)
				utility:Wait()
			end
		end)

		-- click events
		local button = colorpicker.Button
		local toggle, debounce, animate

		local lastColor = Color3.fromHSV(hue, sat, brightness)
		animate = function(visible, overwrite)

			if overwrite then

				if not toggle then
					return
				end

				if debounce then
					while debounce do
						utility:Wait()
					end
				end
			elseif not overwrite then
				if debounce then
					return
				end

				if button.ImageTransparency == 0 then
					utility:Pop(button, 10)
				end
			end

			toggle = visible
			debounce = true

			if visible then

				if self.page.library.activePicker and self.page.library.activePicker ~= animate then
					self.page.library.activePicker(nil, true)
				end

				self.page.library.activePicker = animate
				lastColor = Color3.fromHSV(hue, sat, brightness)

				local x1, x2 = button.AbsoluteSize.X / 2, 162--tab.AbsoluteSize.X
				local px, py = button.AbsolutePosition.X, button.AbsolutePosition.Y

				tab.ClipsDescendants = true
				tab.Visible = true
				tab.Size = UDim2.new(0, 0, 0, 0)

				tab.Position = UDim2.new(0, x1 + x2 + px, 0, py)
				utility:Tween(tab, {Size = UDim2.new(0, 162, 0, 169)}, 0.2)

				-- update size and position
				wait(0.2)
				tab.ClipsDescendants = false

				canvasSize, canvasPosition = canvas.AbsoluteSize, canvas.AbsolutePosition
				colorSize, colorPosition = color.AbsoluteSize, color.AbsolutePosition
			else
				utility:Tween(tab, {Size = UDim2.new(0, 0, 0, 0)}, 0.2)
				tab.ClipsDescendants = true

				wait(0.2)
				tab.Visible = false
			end

			debounce = false
		end

		local toggleTab = function()
			animate(not toggle)
		end

		button.MouseButton1Click:Connect(toggleTab)
		colorpicker.MouseButton1Click:Connect(toggleTab)

		tab.Container.Button.MouseButton1Click:Connect(function()
			animate()
		end)

		tab.Close.MouseButton1Click:Connect(function()
			this.default = lastColor
			self:updateColorPicker(module)
			animate()
		end)

		function this:Update(dataOptions)
			-- // Overwriting settings
            for i,v in pairs(dataOptions) do
                if (module.Options[i] and i ~= "Update") then
                    module.Options[i] = tostring(v)
                end
			end

			return section:updateColorPicker(module)
		end

		return module
	end

	function section:addSlider(data)
		local this = {}
		this.title = data.title
		this.min = data.min or 0
		this.default = data.default or this.min
		this.max = data.max or 100
		this.precision = data.precision or 0
		this.value = this.default
		this.callback = data.callback or function() end

		local slider = utility:Create("ImageButton", {
			Name = "Slider",
			Parent = self.container,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0.292817682, 0, 0.299145311, 0),
			Size = UDim2.new(1, 0, 0, 50),
			ZIndex = 2,
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.DarkContrast,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 298, 298)
		}, {
			utility:Create("TextLabel", {
				Name = "Title",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0, 6),
				Size = UDim2.new(0.5, 0, 0, 16),
				ZIndex = 3,
				Font = Enum.Font.Gotham,
				Text = data.title,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextTransparency = 0.10000000149012,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			utility:Create("TextBox", {
				Name = "TextBox",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(1, -30, 0, 6),
				Size = UDim2.new(0, 20, 0, 16),
				ZIndex = 3,
				Font = Enum.Font.GothamSemibold,
				Text = this.default,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Right
			}),
			utility:Create("TextLabel", {
				Name = "Slider",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0, 28),
				Size = UDim2.new(1, -20, 0, 16),
				ZIndex = 3,
				Text = "",
			}, {
				utility:Create("ImageLabel", {
					Name = "Bar",
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 0, 4),
					ZIndex = 3,
					Image = "rbxassetid://5028857472",
					ImageColor3 = themes.LightContrast,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(2, 2, 298, 298)
				}, {
					utility:Create("ImageLabel", {
						Name = "Fill",
						BackgroundTransparency = 1,
						Size = UDim2.new(0.8, 0, 1, 0),
						ZIndex = 3,
						Image = "rbxassetid://5028857472",
						ImageColor3 = themes.TextColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(2, 2, 298, 298)
					}, {
						utility:Create("ImageLabel", {
							Name = "Circle",
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundTransparency = 1,
							ImageTransparency = 1.000,
							ImageColor3 = themes.TextColor,
							Position = UDim2.new(1, 0, 0.5, 0),
							Size = UDim2.new(0, 10, 0, 10),
							ZIndex = 3,
							Image = "rbxassetid://4608020054"
						})
					})
				})
			})
		})

		local module = {Instance = slider, Options = this}
		self.modules[#self.modules + 1] = module
		--self:Resize()

		local allowed = {
			[""] = true,
			["-"] = true
		}

		local textbox = slider.TextBox
		local circle = slider.Slider.Bar.Fill.Circle

		local dragging

		self:updateSlider(module)

		utility:DraggingEnded(function()
			dragging = false
		end)

		slider.MouseButton1Down:Connect(function()
			dragging = true

			while dragging do
				utility:Tween(circle, {ImageTransparency = 0}, 0.1)

				this.value = nil
				this.value = self:updateSlider(module)
				this.callback(this.value)

				utility:Wait()
			end

			wait(0.5)
			utility:Tween(circle, {ImageTransparency = 1}, 0.2)
		end)

		textbox.FocusLost:Connect(function()
			if not tonumber(textbox.Text) then
				this.value = nil
				this.value = self:updateSlider(module)
				this.callback(this.value)
			end
		end)

		textbox:GetPropertyChangedSignal("Text"):Connect(function()
			local text = textbox.Text

			if not allowed[text] and not tonumber(text) then
				textbox.Text = text:sub(1, #text - 1)
			elseif not allowed[text] then
				this.value = nil
				this.value = self:updateSlider(module)
				this.callback(this.value)
			end
		end)

		function this:Update(dataOptions)
			-- // Overwriting settings
            for i,v in pairs(dataOptions) do
                if (module.Options[i] and i ~= "Update") then
                    module.Options[i] = tostring(v)
                end
			end

			return section:updateSlider(module)
		end

		return module
	end

	function section:addDropdown(data)
		local this = {}
		this.list = data.list or {}
		this.backuplist = this.list
		this.title = data.title or "nil title"
		this.default = data.default
		this.callback = data.callback or function() end

		local dropdown = utility:Create("Frame", {
			Name = "Dropdown",
			Parent = self.container,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 30),
			ClipsDescendants = true
		}, {
			utility:Create("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			utility:Create("ImageLabel", {
				Name = "Search",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 30),
				ZIndex = 2,
				Image = "rbxassetid://5028857472",
				ImageColor3 = themes.DarkContrast,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(2, 2, 298, 298)
			}, {
				utility:Create("TextBox", {
					Name = "TextBox",
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundTransparency = 1,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Position = UDim2.new(0, 10, 0.5, 1),
					Size = UDim2.new(1, -42, 1, 0),
					ZIndex = 3,
					Font = Enum.Font.Gotham,
					Text = this.title,
					TextColor3 = themes.TextColor,
					TextSize = 12,
					TextTransparency = 0.10000000149012,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				utility:Create("ImageButton", {
					Name = "Button",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = UDim2.new(1, -28, 0.5, -9),
					Size = UDim2.new(0, 18, 0, 18),
					ZIndex = 3,
					Image = "rbxassetid://5012539403",
					ImageColor3 = themes.TextColor,
					SliceCenter = Rect.new(2, 2, 298, 298)
				})
			}),
			utility:Create("ImageLabel", {
				Name = "List",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, -34),
				ZIndex = 2,
				Image = "rbxassetid://5028857472",
				ImageColor3 = themes.Background,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(2, 2, 298, 298)
			}, {
				utility:Create("ScrollingFrame", {
					Name = "Frame",
					Active = true,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = UDim2.new(0, 4, 0, 4),
					Size = UDim2.new(1, -8, 1, -8),
					CanvasPosition = Vector2.new(0, 28),
					CanvasSize = UDim2.new(0, 0, 0, 120),
					ZIndex = 2,
					ScrollBarThickness = 3,
					ScrollBarImageColor3 = themes.DarkContrast
				}, {
					utility:Create("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 4)
					})
				})
			})
		})

		local module = {Instance = dropdown, Options = this}
		self.modules[#self.modules + 1] = module
		--self:Resize()

		local search = dropdown.Search
		local focused

		-- // Tostring the list
		for i,v in pairs(this.list) do
			this.list[i] = tostring(v)
		end

		search.Button.MouseButton1Click:Connect(function()
			if search.Button.Rotation == 0 then
				this.title = nil
				self:updateDropdown(module)
			else
				this.title = nil
				self:updateDropdown(module, {update = {}})
			end
		end)

		search.TextBox.Focused:Connect(function()
			if search.Button.Rotation == 0 then
				this.title = nil
				self:updateDropdown(module, {update = {}})
			end

			focused = true
		end)

		search.TextBox.FocusLost:Connect(function()
			focused = false
		end)

		search.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			if focused then
				local _list = utility:Sort(search.TextBox.Text, this.list)
				local list = #_list ~= 0 and _list

				this.title = nil
				self:updateDropdown(module, {update = list})
			end
		end)

		dropdown:GetPropertyChangedSignal("Size"):Connect(function()
			self:Resize()
		end)

		function this:Update(dataOptions)
		    -- // Overwriting settings
            for i,v in pairs(dataOptions) do
				if (i ~= "Update" and module.Options[i]) then
					-- // Making everything in the list a string
					if (i == "list") then
						for a, x in pairs(v) do
							v[a] = tostring(x)
						end
					end

					-- // Setting it
                    module.Options[i] = (i == "list" and v or tostring(v))
				end
            end

			return section:updateDropdown(module, {noOpen = dataOptions["list"]})
		end

		if (this.default) then
			this:Update({
				title = this.default
			})
		end

		return module
	end

	function section:addParagraph(title, text)
		local paragraphContainer = utility:Create("ImageLabel", {
			Name = "ParagraphContainer",
			Parent = self.container,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 30),
			ZIndex = 2,
			Image = "rbxassetid://5028857472",
			ImageColor3 = themes.DarkContrast,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 298, 298)
		})
	
		local titleLabel
		if title then
			titleLabel = utility:Create("TextLabel", {
				Name = "TitleLabel",
				Parent = paragraphContainer,
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0, 5),
				Size = UDim2.new(1, -20, 0, 16),
				ZIndex = 3,
				Font = Enum.Font.GothamSemibold,
				Text = title,
				TextColor3 = themes.TextColor,
				TextSize = 12,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		end
	
		local positionOffset = title and UDim2.new(0, 10, 0, 26) or UDim2.new(0, 10, 0, 5)
		local sizeOffset = title and UDim2.new(1, -20, 1, -26) or UDim2.new(1, -20, 1, -5)
	
		local paragraph = utility:Create("TextLabel", {
			Name = "Paragraph",
			Parent = paragraphContainer,
			BackgroundTransparency = 1,
			Position = positionOffset,
			Size = sizeOffset,
			ZIndex = 3,
			Font = Enum.Font.Gotham,
			Text = text,
			TextColor3 = themes.TextColor,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		})
	
		local module = { Container = paragraphContainer, TitleLabel = titleLabel, Paragraph = paragraph }
		return module
	end	

	-- class functions

	function library:SelectPage(data)
		local selectedPage = data.page
		local toggle = data.toggle

		if toggle and self.focusedPage == page then -- already selected
			return
		end

		local button = selectedPage.button

		if toggle then
			-- page button
			button.Title.TextTransparency = 0
			button.Title.Font = Enum.Font.GothamSemibold

			if button:FindFirstChild("Icon") then
				button.Icon.ImageTransparency = 0
			end

			-- update selected page
			local focusedPage = self.focusedPage
			self.focusedPage = selectedPage

			if focusedPage then
				self:SelectPage({
					page = focusedPage
				})
			end

			-- sections
			local existingSections = focusedPage and #focusedPage.sections or 0
			local sectionsRequired = #selectedPage.sections - existingSections

			selectedPage:Resize()

			for i = 1, #selectedPage.sections do
				local pageSection = selectedPage.sections[i]
				pageSection.container.Parent.ImageTransparency = 0
			end
			if sectionsRequired < 0 then -- "hides" some sections
				for i = existingSections, #selectedPage.sections + 1, -1 do
					local pageSection = focusedPage.sections[i].container.Parent

					utility:Tween(pageSection, {ImageTransparency = 1}, 0.1)
				end
			end

			wait(0.1)
			selectedPage.container.Visible = true

			if focusedPage then
				focusedPage.container.Visible = false
			end

			if sectionsRequired > 0 then -- "creates" more section
				for i = existingSections + 1, #selectedPage.sections do
					local pageSection = selectedPage.sections[i].container.Parent

					pageSection.ImageTransparency = 1
					utility:Tween(pageSection, {ImageTransparency = 0}, 0.05)
				end
			end

			wait(0.05)

			for i = 1, #selectedPage.sections do
				local pageSection = selectedPage.sections[i]
				utility:Tween(pageSection.container.Title, {TextTransparency = 0}, 0.1)
				pageSection:Resize(true)

				wait(0.05)
			end

			wait(0.05)
			selectedPage:Resize(true)
		else
			-- page button
			button.Title.Font = Enum.Font.Gotham
			button.Title.TextTransparency = 0.65

			if button:FindFirstChild("Icon") then
				button.Icon.ImageTransparency = 0.65
			end

			-- sections
			for i = 1, #selectedPage.sections do
				local pageSection = selectedPage.sections[i]
				utility:Tween(pageSection.container.Parent, {Size = UDim2.new(1, -10, 0, 28)}, 0.1)
				utility:Tween(pageSection.container.Title, {TextTransparency = 1}, 0.1)
			end

			wait(0.1)

			selectedPage.lastPosition = selectedPage.container.CanvasPosition.Y
			selectedPage:Resize()
		end
	end

	function page:Resize(scroll)
		local padding = 10
		local size = 0

		for i = 1, #self.sections do
			local pageSection = self.sections[i]
			size = size + pageSection.container.Parent.AbsoluteSize.Y + padding
		end

		self.container.CanvasSize = UDim2.new(0, 0, 0, size)
		self.container.ScrollBarImageTransparency = size > self.container.AbsoluteSize.Y

		if scroll then
			utility:Tween(self.container, {CanvasPosition = Vector2.new(0, self.lastPosition or 0)}, 0.2)
		end
	end

	function section:Resize(smooth)

		if self.page.library.focusedPage ~= self.page then
			return
		end

		local padding = 4
		local size = (4 * padding) + self.container.Title.AbsoluteSize.Y -- offset

		for i, module in pairs(self.modules) do
			size = size + module.Instance.AbsoluteSize.Y + padding
		end

		if smooth then
			utility:Tween(self.container.Parent, {Size = UDim2.new(1, -10, 0, size)}, 0.05)
		else
			self.container.Parent.Size = UDim2.new(1, -10, 0, size)
			self.page:Resize()
		end
	end

	function section:getModule(info)
		for i = 1, #self.modules do
			local module = self.modules[i]
			local object = module.Instance

			if (((object:FindFirstChild("Title") or object:FindFirstChild("TextBox", true)).Text == info) or object == info) then
				return module
			end
		end

		error("No module found under "..tostring(info.Instance))
	end

	-- updates

	function section:updateButton(module)
		module.Instance.Title.Text = module.Options.title
	end

	function section:updateToggle(module)
		local toggle = module.Instance
		local options = module.Options

		local position = {
			In = UDim2.new(0, 2, 0.5, -6),
			Out = UDim2.new(0, 20, 0.5, -6)
		}

		local frame = toggle.Button.Frame
		local selectedPosition = options.toggled and "Out" or "In"

		toggle.Title.Text = module.Options.title

		utility:Tween(frame, {
			Size = UDim2.new(1, -22, 1, -9),
			Position = position[selectedPosition] + UDim2.new(0, 0, 0, 2.5)
		}, 0.2)

		wait(0.1)
		utility:Tween(frame, {
			Size = UDim2.new(1, -22, 1, -4),
			Position = position[selectedPosition]
		}, 0.1)
	end

	function section:updateTextbox(module)
		module.Instance.Title.Text = module.Options.title
		module.Instance.Button.Textbox.Text = module.Options.default
	end

	function section:updateKeybind(module)
		local keybind = module.Instance
		local options = module.Options

		if (typeof(options.key) == "Instance" and options.key:IsA("InputObject")) then
			options.key = options.key.KeyCode
		end

		local text = keybind.Button.Text
		local bind = self.binds[keybind]

		keybind.Title.Text = module.Options.title

		if bind.connection then
			bind.connection = bind.connection:UnBind()
		end

		if options.key ~= Enum.KeyCode.Unknown then
			self.binds[keybind].connection = utility:BindToKey(options.key, bind.callback, options.gameProcessedEvent)
			text.Text = input:GetStringForKeyCode(options.key)
		else
			text.Text = "Unknown"
		end
	end

	function section:updateColorPicker(module)
		local colorpicker = module.Instance
		local options = module.Options

		local picker = self.colorpickers[colorpicker]
		local tab = picker.tab

		colorpicker.Title.Text = options.title
		tab.Title.Text = options.title

		local color3
		local hue, sat, brightness

		if (typeof(options.default) == "table") then
			hue, sat, brightness = unpack(options.default)
			color3 = Color3.fromHSV(hue, sat, brightness)
		else
			color3 = options.default
			hue, sat, brightness = Color3.toHSV(color3)
		end

		utility:Tween(colorpicker.Button, {ImageColor3 = color3}, 0.5)
		utility:Tween(tab.Container.Color.Select, {Position = UDim2.new(hue, 0, 0, 0)}, 0.1)

		utility:Tween(tab.Container.Canvas, {ImageColor3 = Color3.fromHSV(hue, 1, 1)}, 0.5)
		utility:Tween(tab.Container.Canvas.Cursor, {Position = UDim2.new(sat, 0, 1 - brightness)}, 0.5)

		for i, container in pairs(tab.Container.Inputs:GetChildren()) do
			if container:IsA("ImageLabel") then
				local value = math.clamp(color3[container.Name], 0, 1) * 255

				container.Textbox.Text = math.floor(value)
				--callback(container.Name:lower(), value)
			end
		end
	end

	function section:updateSlider(module)
		local slider = module.Instance
		local options = module.Options

		slider.Title.Text = options.title

		local bar = slider.Slider.Bar
		local percent = (mouse.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X

		if options.value then
			percent = (options.value - options.min) / (options.max - options.min)
		end

		local function round(what, precision)
			if (precision == 0) then
				return math.floor(what)
			elseif (precision == -1) then
				return what
			else
				return math.floor(what * math.pow(10, precision) + 0.5) / math.pow(10, precision)
			end
		end

		percent = math.clamp(percent, 0, 1)
		options.value = options.value or round(options.min + (options.max - options.min) * percent, options.precision)

		slider.TextBox.Text = options.value
		utility:Tween(bar.Fill, {Size = UDim2.new(percent, 0, 1, 0)}, 0.1)

		if options.value ~= options.lvalue and slider.ImageTransparency == 0 then
			utility:Pop(slider, 10)
		end

		return options.value
	end

	function section:updateDropdown(module, aOptions)
		local dropdown = module.Instance
		local options = module.Options
		aOptions = aOptions or {}

		if (options.title) then
			dropdown.Search.TextBox.Text = options.title
		end

		local entries = 0

		utility:Pop(dropdown.Search, 10)

		for i, button in pairs(dropdown.List.Frame:GetChildren()) do
			if button:IsA("ImageButton") then
				button:Destroy()
			end
		end

		local list = aOptions.update or options.list

		for i, value in pairs(list) do
			local button = utility:Create("ImageButton", {
				Parent = dropdown.List.Frame,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 30),
				ZIndex = 2,
				Image = "rbxassetid://5028857472",
				ImageColor3 = themes.DarkContrast,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(2, 2, 298, 298)
			}, {
				utility:Create("TextLabel", {
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 10, 0, 0),
					Size = UDim2.new(1, -10, 1, 0),
					ZIndex = 3,
					Font = Enum.Font.Gotham,
					Text = value,
					TextColor3 = themes.TextColor,
					TextSize = 12,
					TextXAlignment = "Left",
					TextTransparency = 0.10000000149012
				})
			})

			button.MouseButton1Click:Connect(function()
				options.callback(value)

				options.title = value
				self:updateDropdown(module, {update = value and {} or false})
			end)

			entries = entries + 1
		end

		local frame = dropdown.List.Frame

		if (not aOptions.noOpen) then
			utility:Tween(dropdown, {Size = UDim2.new(1, 0, 0, (entries == 0 and 30) or math.clamp(entries, 0, 3) * 34 + 38)}, 0.3)
			utility:Tween(dropdown.Search.Button, {Rotation = not aOptions.update and 180 or 0}, 0.3)
		end

		if entries > 3 then

			for i, button in pairs(dropdown.List.Frame:GetChildren()) do
				if button:IsA("ImageButton") then
					button.Size = UDim2.new(1, -6, 0, 30)
				end
			end

			frame.CanvasSize = UDim2.new(0, 0, 0, (entries * 34) - 4)
			frame.ScrollBarImageTransparency = 0
		else
			frame.CanvasSize = UDim2.new(0, 0, 0, 0)
			frame.ScrollBarImageTransparency = 1
		end
	end
end

--getgenv().Venyx = library
return library
