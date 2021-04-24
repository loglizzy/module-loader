function new(name)
	local blur = Instance.new('BlurEffect')
	blur.Size = 0
	blur.Parent = game:GetService('Workspace')
	
	while blur.Size < 17 and wait() do
		blue.Size = blur.Size + 1
	end
	
	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local Frame_2 = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local Bar = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local List = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local ImageLabel = Instance.new("ImageLabel")

	if syn then syn.protect_gui(ScreenGui) end

	local CoreGui = game:GetService('CoreGui')
	ScreenGui.Parent = CoreGui:FindFirstChildOfClass('ScreenGui') or Instance.new('ScreenGui',CoreGui)
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.365104973, 0, 0.247491628, 0)
	Frame.Size = UDim2.new(0, 430, 0, 280)

	Frame_2.Parent = Frame
	Frame_2.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	Frame_2.BorderSizePixel = 0
	Frame_2.Size = UDim2.new(0, 430, 0, 280)

	TextLabel.Parent = Frame_2
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.0348837227, 0, 0.0250000004, 0)
	TextLabel.Size = UDim2.new(0, 137, 0, 50)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = name
	TextLabel.TextColor3 = Color3.fromRGB(189, 189, 189)
	TextLabel.TextSize = 30.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	
	local TextLabel = Instance.new("TextLabel")

    TextLabel.Parent = Frame_2
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0.706976771, 0, 0.910714269, 0)
    TextLabel.Size = UDim2.new(0, 118, 0, 19)
    TextLabel.Font = Enum.Font.GothamSemibold
    TextLabel.Text = "Loading"
    TextLabel.TextColor3 = Color3.fromRGB(125, 125, 125)
    TextLabel.TextSize = 12.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Right

	Bar.Name = "Bar"
	Bar.Parent = Frame_2
	Bar.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
	Bar.BorderSizePixel = 0
	Bar.Position = UDim2.new(0.0674418584, 0, 0.235714301, 0)
	Bar.Size = UDim2.new(0, 2, 0, 0)

	UICorner.Parent = Bar

	List.Name = "List"
	List.Parent = Frame_2
	List.BackgroundColor3 = Color3.fromRGB(116, 116, 116)
	List.BackgroundTransparency = 1.000
	List.BorderSizePixel = 0
	List.Position = UDim2.new(0.0720930248, 0, 0.235714301, 0)
	List.Size = UDim2.new(0, 141, 0, 76)

	UIListLayout.Parent = List
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	ImageLabel.Parent = Frame
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.LayoutOrder = -6
	ImageLabel.Position = UDim2.new(-0.0348837227, 0, -0.0535714291, 0)
	ImageLabel.Size = UDim2.new(0, 460, 0, 310)
	ImageLabel.ZIndex = 0
	ImageLabel.Image = "rbxassetid://222785823"

	local a = Frame_2
	local a2 = a.List
	local a3 = a2.UIListLayout
	local a4 = a.Bar

	local function update(v)
	    wait()
		a4.Size = UDim2.new(0,2,0,a3.AbsoluteContentSize.Y)
	end

	a2.ChildAdded:Connect(update)

	local function new(v,f)
		local TextLabel = Instance.new("TextLabel")
		TextLabel.Parent = List
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(0, 118, 0, 19)
		TextLabel.Font = Enum.Font.GothamSemibold
		TextLabel.Text = v
		TextLabel.TextColor3 = Color3.fromRGB(125, 125, 125)
		TextLabel.TextSize = 12.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		
		return function()
			if type(f) == 'string' then
				local res = game:HttpGet(f)
				TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
				return loadstring(res)
			end
			f()
			TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		end
	end

	local function init(tbl)
		local tbld = {}
		for i,v in pairs(tbl) do
			tbld[i] = new(i,v)
		end
		local tbl = {}
		for i,v in pairs(tbld) do
			tbl[i] = v()
		end
        
        wait(1)
        ScreenGui:Remove()
		return tbl
	end
	
	return init
end
return new
