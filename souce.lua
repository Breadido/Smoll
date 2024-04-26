local uh = {}

local firstTabOpened = false
function uh:DraggingEnabled(frame, parent)
	parent = parent or frame

	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		game:GetService("TweenService"):Create(gui,TweenInfo.new(0.15), {
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		}):Play()
		--gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

function uh.SetupUI(conpigs)
	conpigs = conpigs or {}
	conpigs.Title = conpigs.Title or "beat your meat"
	local kys = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local LineBar = Instance.new("Frame")
	local UITitle = Instance.new("TextLabel")
	local TabList = Instance.new("ScrollingFrame")
	local TabListLayout = Instance.new("UIListLayout")
	local ContainerFrame = Instance.new("Frame")
	kys.Name = "kys"
	kys.Parent = game.CoreGui
	kys.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = kys
	MainFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.279347837, 0, 0.243346006, 0)
	MainFrame.Size = UDim2.new(0, 405, 0, 270)

	LineBar.Name = "LineBar"
	LineBar.Parent = MainFrame
	LineBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
	LineBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineBar.BorderSizePixel = 0
	LineBar.Position = UDim2.new(0, 0, -0.0185185187, 0)
	LineBar.Size = UDim2.new(0, 405, 0, 5)

	UITitle.Name = "UITitle"
	UITitle.Parent = MainFrame
	UITitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UITitle.BackgroundTransparency = 1.000
	UITitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UITitle.BorderSizePixel = 0
	UITitle.Position = UDim2.new(0.0246913582, 0, 0.0222222228, 0)
	UITitle.Size = UDim2.new(0, 395, 0, 20)
	UITitle.Font = Enum.Font.GothamBold
	UITitle.Text = tostring(conpigs.Title)
	UITitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	UITitle.TextSize = 15.000
	UITitle.TextXAlignment = Enum.TextXAlignment.Left
	UITitle.TextYAlignment = Enum.TextYAlignment.Bottom
	uh:DraggingEnabled(UITitle, MainFrame)

	TabList.Name = "TabList"
	TabList.Parent = MainFrame
	TabList.Active = true
	TabList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TabList.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabList.BorderSizePixel = 0
	TabList.Position = UDim2.new(0.01728395, 0, 0.122222222, 0)
	TabList.Size = UDim2.new(0, 390, 0, 25)
	TabList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	TabList.CanvasSize = UDim2.new(2, 0, 0, 0)
	TabList.ScrollBarThickness = 1
	TabList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

	TabListLayout.Name = "TabListLayout"
	TabListLayout.Parent = TabList
	TabListLayout.FillDirection = Enum.FillDirection.Horizontal
	TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	ContainerFrame.Name = "ContainerFrame"
	ContainerFrame.Parent = MainFrame
	ContainerFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	ContainerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContainerFrame.Position = UDim2.new(0.01728395, 0, 0.240740746, 0)
	ContainerFrame.Size = UDim2.new(0, 390, 0, 198)
	
	local tabsthing = {}
	
	function tabsthing.CreateTabs(conpigs)
		conpigs = conpigs or {}
		conpigs.Text = conpigs.Text or "kys cuz no text"
		local Main = Instance.new("TextButton")
		local Main_2 = Instance.new("ScrollingFrame")
		local TabListLayout_2 = Instance.new("UIListLayout")
		Main.Name = tostring(conpigs.Text)
		Main.Parent = TabList
		Main.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		Main.BackgroundTransparency = 1.000
		Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main.BorderSizePixel = 0
		Main.Position = UDim2.new(0, 0, -0.0399999991, 0)
		Main.Size = UDim2.new(0, 39, 0, 26)
		Main.Font = Enum.Font.GothamBold
		Main.Text = "  "..tostring(conpigs.Text)
		Main.TextColor3 = Color3.fromRGB(255, 255, 255)
		Main.TextSize = 14.000
		Main.TextXAlignment = Enum.TextXAlignment.Left
		Main.Size = UDim2.fromOffset(Main.TextBounds.X, 26)
		
		Main_2.Name = tostring(conpigs.Text)
		Main_2.Parent = ContainerFrame
		Main_2.Active = true
		Main_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Main_2.BackgroundTransparency = 1.000
		Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main_2.BorderSizePixel = 0
		Main_2.Position = UDim2.new(0.0205128212, 0, 0.0404040404, 0)
		Main_2.Size = UDim2.new(0, 381, 0, 190)
		Main_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		Main_2.ScrollBarThickness = 3
		Main_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		if firstTabOpened == false then
			firstTabOpened = true
			Main_2.Visible = true
		else
			Main_2.Visible = false
		end
		
		TabListLayout_2.Name = "TabListLayout"
		TabListLayout_2.Parent = Main_2
		TabListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		TabListLayout_2.Padding = UDim.new(0, 2)
		
		game:GetService("RunService").RenderStepped:Connect(function()
			Main_2.CanvasSize = UDim2.new(0,0,0,TabListLayout_2.AbsoluteContentSize.Y)
		end)
		
		local tabc = ContainerFrame
		local tabl = TabList
		for i, v in next, tabl:GetChildren() do
			if v.ClassName == "TextButton" then
				v.MouseButton1Click:connect(function()
					print(v.Name)
					for i, v2 in next, tabc:GetChildren() do
						if v2.Name == v.Name then
							print("a")
							v2.Visible = true
						else
							v2.Visible = false
						end
					end
				end)
			end
		end
		
		
		
		local nuhuh = {}
		function nuhuh.CreateToggle(conpig)
			conpig = conpig or {}
			conpig.Text = conpig.Text
			conpig.Callback = conpig.Callback or function(a) print(a) end
			
			local Toggle = Instance.new("Frame")
			local MainToggle = Instance.new("TextButton")
			local ToggleListLayout = Instance.new("UIListLayout")
			local TogglePadding = Instance.new("UIPadding")
			local ToggleFill = Instance.new("Frame")
			local ToggleText = Instance.new("TextLabel")
			
			Toggle.Name = "Toggle"
			Toggle.Parent = Main_2
			Toggle.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
			Toggle.BackgroundTransparency = 1.000
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 370, 0, 20)

			MainToggle.Name = "MainToggle"
			MainToggle.Parent = Toggle
			MainToggle.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			MainToggle.BorderColor3 = Color3.fromRGB(255, 60, 60)
			MainToggle.Position = UDim2.new(0.00540540554, 0, 0.0500000007, 0)
			MainToggle.Size = UDim2.new(0, 18, 0, 18)
			MainToggle.AutoButtonColor = false
			MainToggle.Font = Enum.Font.SourceSans
			MainToggle.Text = ""
			MainToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			MainToggle.TextSize = 14.000

			ToggleListLayout.Name = "ToggleListLayout"
			ToggleListLayout.Parent = MainToggle
			ToggleListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			ToggleListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ToggleListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

			TogglePadding.Name = "TogglePadding"
			TogglePadding.Parent = MainToggle
			TogglePadding.PaddingBottom = UDim.new(0, 1)
			TogglePadding.PaddingLeft = UDim.new(0, 1)
			TogglePadding.PaddingRight = UDim.new(0, 1)
			TogglePadding.PaddingTop = UDim.new(0, 1)

			ToggleFill.Name = "ToggleFill"
			ToggleFill.Parent = MainToggle
			ToggleFill.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
			ToggleFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleFill.BorderSizePixel = 0

			ToggleText.Name = "ToggleText"
			ToggleText.Parent = Toggle
			ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.BackgroundTransparency = 1.000
			ToggleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleText.BorderSizePixel = 0
			ToggleText.Position = UDim2.new(0.0540540554, 0, 0.0500000007, 0)
			ToggleText.Size = UDim2.new(0, 350, 0, 18)
			ToggleText.Font = Enum.Font.GothamMedium
			ToggleText.Text = "   "..tostring(conpig.Text)
			ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.TextSize = 12.000
			ToggleText.TextXAlignment = Enum.TextXAlignment.Left
			
			local toggled = false
			--pcall(function()
			MainToggle.MouseButton1Click:Connect(function()
				print("click")
				--game:GetService("TweenService"):Create(script.Parent.MainToggle.ToggleFill, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Size = toggled and UDim2.new(1,0,1,0) or UDim2.new(0,0,0,0)}):Play()
				if toggled == false then
					toggled = true
					conpig.Callback(true)
					game:GetService("TweenService"):Create(ToggleFill, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Size = UDim2.new(1,0,1,0)}):Play()
				else
					toggled = false
					conpig.Callback(false)
					game:GetService("TweenService"):Create(ToggleFill, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Size = UDim2.new(0,0,0,0)}):Play()
				end
			end)
			--end)
		end
		function nuhuh.CreateSlider(conpig)
			conpig = conpig or {}
			conpig.Text = conpig.Text or "lider"
			conpig.Minimum = conpig.Minimum or 0
			conpig.Maximum = conpig.Maximum or 50
			conpig.Precise = conpig.Precise or false
			conpig.Default = conpig.Default or 25
			conpig.Callback = conpig.Callback or function(a) print(a) end
			
			local Slider = Instance.new("Frame")
			local SliderText = Instance.new("TextLabel")
			local MainSlider = Instance.new("Frame")
			local SliderFill = Instance.new("Frame")
			local SliderValueAndTrigger = Instance.new("TextButton")
			local SliderStroke = Instance.new("UIStroke")
			
			Slider.Name = "Slider"
			Slider.Parent = Main_2
			Slider.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
			Slider.BackgroundTransparency = 1.000
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0, 0, 0.115789473, 0)
			Slider.Size = UDim2.new(0, 370, 0, 35)

			SliderText.Name = "SliderText"
			SliderText.Parent = Slider
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 1.000
			SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderText.BorderSizePixel = 0
			SliderText.Position = UDim2.new(0.00540540554, 0, 0.0500000007, 0)
			SliderText.Size = UDim2.new(0, 368, 0, 12)
			SliderText.Font = Enum.Font.GothamMedium
			SliderText.Text = tostring(conpig.Text)
			SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.TextSize = 12.000
			SliderText.TextXAlignment = Enum.TextXAlignment.Left
			SliderText.TextYAlignment = Enum.TextYAlignment.Top

			MainSlider.Name = "MainSlider"
			MainSlider.Parent = Slider
			MainSlider.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			MainSlider.BackgroundTransparency = 1.000
			MainSlider.BorderColor3 = Color3.fromRGB(255, 60, 60)
			MainSlider.BorderSizePixel = 2
			MainSlider.Position = UDim2.new(0.00499999989, 0, 0.430000007, 0)
			MainSlider.Size = UDim2.new(0, 368, 0, 16)

			SliderFill.Name = "SliderFill"
			SliderFill.Parent = MainSlider
			SliderFill.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
			SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderFill.BorderSizePixel = 0
			SliderFill.Position = UDim2.new(0, 0, -9.53674316e-07, 0)
			SliderFill.Size = UDim2.new(0, 0, 0, 16)

			SliderValueAndTrigger.Name = "SliderValueAndTrigger"
			SliderValueAndTrigger.Parent = Slider
			SliderValueAndTrigger.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			SliderValueAndTrigger.BackgroundTransparency = 1.000
			SliderValueAndTrigger.BorderColor3 = Color3.fromRGB(255, 60, 60)
			SliderValueAndTrigger.BorderSizePixel = 0
			SliderValueAndTrigger.Position = UDim2.new(0.00540540554, 0, 0.428570569, 0)
			SliderValueAndTrigger.Size = UDim2.new(0, 368, 0, 16)
			SliderValueAndTrigger.AutoButtonColor = false
			SliderValueAndTrigger.Font = Enum.Font.SourceSans
			SliderValueAndTrigger.Text = conpig.Default
			SliderValueAndTrigger.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderValueAndTrigger.TextSize = 16.000
			
			SliderStroke.Parent = MainSlider
			SliderStroke.Color = Color3.fromRGB(255,60,60)
			
			local mouse = game:GetService("Players").LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")

			local Min_Value = conpig.Minimum
			local Max_Value = conpig.Maximum
			local Precise = true
			local Bar = SliderFill
			local Sliderbox = SliderValueAndTrigger
			local SizeChia = 370
			local DefaultValue = conpig.Default

			if DefaultValue then 
				if DefaultValue <= Min_Value then DefaultValue = Min_Value elseif DefaultValue >= Max_Value then DefaultValue = Max_Value end
				Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, 16)
				Sliderbox.Text = DefaultValue
				conpig.Callback(DefaultValue)
			end

			Sliderbox.MouseButton1Down:Connect(function()
				local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

				pcall(function()
					conpig.Callback(value)
					Sliderbox.Text = value
				end)
				Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 16)
				moveconnection = mouse.Move:Connect(function()   
					local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
					pcall(function()
						conpig.Callback(value)
						Sliderbox.Text = value
					end)
					Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 16)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
						local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

						pcall(function()
							conpig.Callback(value)
							Sliderbox.Text = value
						end)
						Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 16)
					end
				end)
				uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
		end
		function nuhuh.CreateButtons(conpig)
			conpig = conpig or {}
			conpig.Text = conpig.Text or "yashda"
			conpig.Callback = conpig.Callback or function() print("haha i fucked your mom last night") end
			
			local Button = Instance.new("Frame")
			local MainButton = Instance.new("TextButton")
			
			Button.Name = "Button"
			Button.Parent = Main_2
			Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
			Button.BackgroundTransparency = 1.000
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 370, 0, 20)

			MainButton.Name = "MainButton"
			MainButton.Parent = Button
			MainButton.BackgroundColor3 = Color3.fromRGB(225, 53, 53)
			MainButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainButton.BorderSizePixel = 0
			MainButton.Position = UDim2.new(0.00270270277, 0, 0, 0)
			MainButton.Size = UDim2.new(0, 370, 0, 20)
			MainButton.Font = Enum.Font.SourceSans
			MainButton.Text = tostring(conpig.Text)
			MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			MainButton.TextSize = 14.000
			
			MainButton.MouseButton1Click:Connect(function()
				conpig.Callback()
			end)
		end
		function nuhuh.CreateLabel(text, textxalignment)
			text = text or "lol"
			textxalignment = textxalignment or Enum.TextXAlignment.Left
			
			local Label = Instance.new("Frame")
			local MainLabel = Instance.new("TextButton")
			
			Label.Name = "Label"
			Label.Parent = Main_2
			Label.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 370, 0, 20)

			MainLabel.Name = "MainLabel"
			MainLabel.Parent = Label
			MainLabel.BackgroundColor3 = Color3.fromRGB(225, 53, 53)
			MainLabel.BackgroundTransparency = 1.000
			MainLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainLabel.BorderSizePixel = 0
			MainLabel.Position = UDim2.new(0.00270270277, 0, 0, 0)
			MainLabel.Size = UDim2.new(0, 370, 0, 20)
			MainLabel.Font = Enum.Font.SourceSansSemibold
			MainLabel.Text = tostring(text)
			MainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			MainLabel.TextSize = 14.000
			MainLabel.TextXAlignment = textxalignment
		end
		return nuhuh
	end
	return tabsthing
end
return uh
