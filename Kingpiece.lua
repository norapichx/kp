if game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 5931540094 then -- KP เก่า กับ ใหม่ ลงดัน

	local ui = game:GetService("CoreGui"):FindFirstChild("สวัสดี")
if ui then
    ui:Destroy()
end

-- _G.Ui = tostring(math.random(1,1000000))


 game:GetService("RunService").RenderStepped:connect(function()
      pcall(function()
  if game:GetService("Players").LocalPlayer.Character.Services:FindFirstChild("Client") then
      game:GetService("Players").LocalPlayer.Character.Services["Client"].Disabled = true
  end
  end)
  end)

-- loading + ui -- 

 for i,v in pairs(game:GetService("Players")["LocalPlayer"].PlayerGui.Chat:GetDescendants()) do -- ลบ time server
 	if v.Name == "Timers" then
 		v:Destroy()
 	end
 end

local player = game.Players.LocalPlayer.Character.HumanoidRootPart -- เหล่า local
local plr = game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
local vu = game:GetService("VirtualUser")


xwd = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
Gamename = xwd.Name
local oofHubMainMenu = Instance.new("ScreenGui")

---------------------------------------------------------------


local player = game.Players.LocalPlayer.Character.HumanoidRootPart
local plr = game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")
local vu = game:GetService("VirtualUser")

warn("Anti-AFK Starting")
wait(.1)
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

end)
----------------------------------------------

game.StarterGui:SetCore("SendNotification", { -- starting
	Title = "Starting BETA";
	Text = Gamename;
	Icon = "rbxassetid://6738308001";
	Duration = 5;
	})

 --------------------------

local Flux = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(66, 134, 255)
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CloseBind = Enum.KeyCode.RightControl

local FluxLib = Instance.new("ScreenGui")
FluxLib.Name = "สวัสดี"
FluxLib.Parent = game.CoreGui
FluxLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

coroutine.wrap(
	function()
		while wait() do
			Flux.RainbowColorValue = Flux.RainbowColorValue + 1 / 255
			Flux.HueSelectionPosition = Flux.HueSelectionPosition + 1

			if Flux.RainbowColorValue >= 1 then
				Flux.RainbowColorValue = 0
			end

			if Flux.HueSelectionPosition == 80 then
				Flux.HueSelectionPosition = 0
			end
		end
	end
)()

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end



function Flux:Window(text, bottom,mainclr,toclose)
	CloseBind = toclose or Enum.KeyCode.RightControl
	PresetColor = mainclr or Color3.fromRGB(66, 134, 255)
	local fs = false
	local MainFrame = Instance.new("Frame")
	local MainCorner = Instance.new("UICorner")
	local LeftFrame = Instance.new("Frame")
	local LeftCorner = Instance.new("UICorner")
	local GlowTabHolder = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local BottomText = Instance.new("TextLabel")
	local TabHold = Instance.new("Frame")
	local TabLayout = Instance.new("UIListLayout")
	local Drag = Instance.new("Frame")
	local ContainerFolder = Instance.new("Folder")

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = FluxLib
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28) -- สีพื้นหลัง 
	MainFrame.ClipsDescendants = true
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 0, 0, 0)

	MainCorner.CornerRadius = UDim.new(0, 5)
	MainCorner.Name = "MainCorner"
	MainCorner.Parent = MainFrame

	LeftFrame.Name = "LeftFrame"
	LeftFrame.Parent = MainFrame
	LeftFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- สี tab ฝั่งซ้าย
	LeftFrame.Size = UDim2.new(0, 205, 0, 484)

	LeftCorner.CornerRadius = UDim.new(0, 5)
	LeftCorner.Name = "LeftCorner"
	LeftCorner.Parent = LeftFrame

	GlowTabHolder.Name = "GlowTabHolder"
	GlowTabHolder.Parent = LeftFrame
	GlowTabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GlowTabHolder.BackgroundTransparency = 1.000
	GlowTabHolder.BorderSizePixel = 0
	GlowTabHolder.Position = UDim2.new(0, -15, 0, -15)
	GlowTabHolder.Size = UDim2.new(1, 30, 1, 30)
	GlowTabHolder.ZIndex = 0
	GlowTabHolder.Image = "rbxassetid://4996891970"
	GlowTabHolder.ImageColor3 = Color3.fromRGB(15, 15, 15)
	GlowTabHolder.ScaleType = Enum.ScaleType.Slice
	GlowTabHolder.SliceCenter = Rect.new(20, 20, 280, 280)

	Title.Name = "Title"
	Title.Parent = LeftFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.097560972, 0, 0.0275206636, 0) -- ตำแหน่งชื่อ
	Title.Size = UDim2.new(0, 111, 0, 34)
	Title.Font = Enum.Font.GothamBold
	Title.Text = text
	Title.TextColor3 = Color3.fromRGB(255, 0, 0) -- สีชื่อ
	Title.TextSize = 30.000 -- ขนาดชื่อ
	Title.TextXAlignment = Enum.TextXAlignment.Left

	BottomText.Name = "BottomText"
	BottomText.Parent = LeftFrame
	BottomText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BottomText.BackgroundTransparency = 1.000
	BottomText.Position = UDim2.new(0.097560972, 0, 0.0889999792, 0)
	BottomText.Size = UDim2.new(0, 113, 0, 28)
	BottomText.Font = Enum.Font.Gotham
	BottomText.Text = bottom
	BottomText.TextColor3 = Color3.fromRGB(255, 255, 255) -- สีคำใต้ชื่อ
	BottomText.TextSize = 18.000 -- ขนาด
	BottomText.TextTransparency = 0.000 -- ความโปร่ง
	BottomText.TextXAlignment = Enum.TextXAlignment.Left

	TabHold.Name = "TabHold"
	TabHold.Parent = LeftFrame
	TabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHold.BackgroundTransparency = 1.000
	TabHold.Position = UDim2.new(0, 0, 0.167355374, 0)
	TabHold.Size = UDim2.new(0, 205, 0, 403)

	TabLayout.Name = "TabLayout"
	TabLayout.Parent = TabHold
	TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabLayout.Padding = UDim.new(0, 3)

	Drag.Name = "Drag"
	Drag.Parent = MainFrame
	Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Drag.BackgroundTransparency = 1.000
	Drag.Position = UDim2.new(0.290368259, 0, 0, 0)
	Drag.Size = UDim2.new(0, 501, 0, 23)

	ContainerFolder.Name = "ContainerFolder"
	ContainerFolder.Parent = MainFrame
	
	MakeDraggable(Drag,MainFrame)
	MakeDraggable(LeftFrame,MainFrame)
	MainFrame:TweenSize(UDim2.new(0, 706, 0, 484), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
	
	local uitoggled = false
	UserInputService.InputBegan:Connect(
		function(io, p)
			if io.KeyCode == CloseBind then
				if uitoggled == false then
					MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					uitoggled = true
					wait(.5)
					FluxLib.Enabled = false
				else
					MainFrame:TweenSize(UDim2.new(0, 706, 0, 484), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					FluxLib.Enabled = true
					uitoggled = false
				end
			end
		end
	)
	
	function Flux:Notification(desc,buttontitle)
		for i, v in next, MainFrame:GetChildren() do
			if v.Name == "NotificationBase" then
				v:Destroy()
			end
		end
		local NotificationBase = Instance.new("TextButton")
		local NotificationBaseCorner = Instance.new("UICorner")
		local NotificationFrame = Instance.new("Frame")
		local NotificationFrameCorner = Instance.new("UICorner")
		local NotificationFrameGlow = Instance.new("ImageLabel")
		local NotificationTitle = Instance.new("TextLabel")
		local CloseBtn = Instance.new("TextButton")
		local CloseBtnCorner = Instance.new("UICorner")
		local NotificationDesc = Instance.new("TextLabel")

		NotificationBase.Name = "NotificationBase"
		NotificationBase.Parent = MainFrame
		NotificationBase.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		NotificationBase.BackgroundTransparency = 1
		NotificationBase.Size = UDim2.new(0, 706, 0, 484)
		NotificationBase.AutoButtonColor = false
		NotificationBase.Font = Enum.Font.SourceSans
		NotificationBase.Text = ""
		NotificationBase.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationBase.TextSize = 14.000
		NotificationBase.Visible = true

		NotificationBaseCorner.CornerRadius = UDim.new(0, 5)
		NotificationBaseCorner.Name = "NotificationBaseCorner"
		NotificationBaseCorner.Parent = NotificationBase

		NotificationFrame.Name = "NotificationFrame" -- สีแจ้งเตือน
		NotificationFrame.Parent = NotificationBase
		NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		NotificationFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
		NotificationFrame.ClipsDescendants = true
		NotificationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		NotificationFrame.Size = UDim2.new(0, 0, 0, 0)

		NotificationFrameCorner.CornerRadius = UDim.new(0, 5)
		NotificationFrameCorner.Name = "NotificationFrameCorner"
		NotificationFrameCorner.Parent = NotificationFrame

		NotificationFrameGlow.Name = "NotificationFrameGlow"
		NotificationFrameGlow.Parent = NotificationFrame
		NotificationFrameGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationFrameGlow.BackgroundTransparency = 1.000
		NotificationFrameGlow.BorderSizePixel = 0
		NotificationFrameGlow.Position = UDim2.new(0, -15, 0, -15)
		NotificationFrameGlow.Size = UDim2.new(1, 30, 1, 30)
		NotificationFrameGlow.ZIndex = 0
		NotificationFrameGlow.Image = "rbxassetid://4996891970"
		NotificationFrameGlow.ImageColor3 = Color3.fromRGB(15, 15, 15)
		NotificationFrameGlow.ScaleType = Enum.ScaleType.Slice
		NotificationFrameGlow.SliceCenter = Rect.new(20, 20, 280, 280)

		NotificationTitle.Name = "NotificationTitle"
		NotificationTitle.Parent = NotificationFrame
		NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationTitle.BackgroundTransparency = 1.000
		NotificationTitle.Position = UDim2.new(0.0400609747, 0, 0.0761325806, 0)
		NotificationTitle.Size = UDim2.new(0, 111, 0, 34)
		NotificationTitle.Font = Enum.Font.GothamBold
		NotificationTitle.Text = Title.Text .. " | NOTIFICATION" -- คำแจ้งเตือน
		NotificationTitle.TextColor3 = Color3.fromRGB(255, 0, 0) -- สีแจ้งเตือน
		NotificationTitle.TextSize = 20.000 -- ขนาด
		NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
		NotificationTitle.TextTransparency = 1

		CloseBtn.Name = "CloseBtn"
		CloseBtn.Parent = NotificationFrame
		CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- สีปิดคำเตือน
		CloseBtn.ClipsDescendants = true
		CloseBtn.Position = UDim2.new(0.0403124988, 0, 0.720855951, 0)
		CloseBtn.Size = UDim2.new(0, 366, 0, 43)
		CloseBtn.AutoButtonColor = false
		CloseBtn.Font = Enum.Font.Gotham
		CloseBtn.Font = Enum.Font.GothamBold
		CloseBtn.Text = buttontitle
		CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn.TextSize = 20.000 -- ขนาด
		CloseBtn.TextTransparency = 1
		CloseBtn.BackgroundTransparency = 1

		CloseBtnCorner.CornerRadius = UDim.new(0, 4)
		CloseBtnCorner.Name = "CloseBtnCorner"
		CloseBtnCorner.Parent = CloseBtn

		NotificationDesc.Name = "NotificationDesc"
		NotificationDesc.Parent = NotificationFrame
		NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationDesc.BackgroundTransparency = 1.000
		NotificationDesc.Position = UDim2.new(0.112499997, 0, 0.266355127, 0)
		NotificationDesc.Size = UDim2.new(0, 309, 0, 82)
		NotificationDesc.Font = Enum.Font.Gotham
		NotificationDesc.Text = desc
		NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255) -- สี อธิบาย
		NotificationDesc.TextSize = 20.000 -- ขนาดคำอธิบาย
		NotificationDesc.TextWrapped = true
		NotificationDesc.TextTransparency = 1
		
		CloseBtn.MouseEnter:Connect(function()
			TweenService:Create(
				CloseBtn,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 0}
			):Play()
		end)

		CloseBtn.MouseLeave:Connect(function()
			TweenService:Create(
				CloseBtn,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 0.3}
			):Play()
		end)
		
		CloseBtn.MouseButton1Click:Connect(function()
			
			TweenService:Create(
				NotificationDesc,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
			TweenService:Create(
				CloseBtn,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
			TweenService:Create(
				NotificationTitle,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
			TweenService:Create(
				CloseBtn,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			
			wait(.4)
			CloseBtn.Visible = false
			NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

			wait(.2)
			
			TweenService:Create(
				NotificationBase,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
			
			wait(.2)
			
			NotificationBase.Visible = false
		end)

		
		TweenService:Create(
			NotificationBase,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.550}
		):Play()
		
		wait(.1)
		
		NotificationFrame:TweenSize(UDim2.new(0, 400, 0, 214), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
		
		wait(.4)
		TweenService:Create(
			NotificationDesc,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = .3}
		):Play()
		TweenService:Create(
			CloseBtn,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = .3}
		):Play()
		TweenService:Create(
			NotificationTitle,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = 0}
		):Play()
		TweenService:Create(
			CloseBtn,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0}
		):Play()
	end
	local Tabs = {}
	function Tabs:Tab(text,ico)
		local Tab = Instance.new("TextButton")
		local TabIcon = Instance.new("ImageLabel")
		local TabTitle = Instance.new("TextLabel")

		Tab.Name = "Tab"
		Tab.Parent = TabHold
		Tab.BackgroundColor3 = PresetColor
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(0, 205, 0, 40)
		Tab.AutoButtonColor = false
		Tab.Font = Enum.Font.SourceSans
		Tab.Text = ""
		Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
		Tab.TextSize = 14.000
		Tab.BackgroundTransparency = 1

		TabIcon.Name = "TabIcon"
		TabIcon.Parent = Tab
		TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabIcon.BackgroundTransparency = 1.000
		TabIcon.Position = UDim2.new(0.0634146333, 0, 0.25, 0)
		TabIcon.Size = UDim2.new(0, 20, 0, 20)
		TabIcon.Image = ico
		TabIcon.ImageTransparency = .3

		TabTitle.Name = "TabTitle"
		TabTitle.Parent = Tab
		TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabTitle.BackgroundTransparency = 1.000
		TabTitle.Position = UDim2.new(0.1902439, 0, 0.25, 0)
		TabTitle.Size = UDim2.new(0, 113, 0, 19)
		TabTitle.Font = Enum.Font.Gotham
		TabTitle.Text = text
		TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabTitle.TextSize = 16.000
		TabTitle.TextXAlignment = Enum.TextXAlignment.Left
		TabTitle.TextTransparency = .3
		
		local Container = Instance.new("ScrollingFrame")
		local ContainerLayout = Instance.new("UIListLayout")


		Container.Name = "Container"
		Container.Parent = ContainerFolder
		Container.Active = true
		Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Container.BackgroundTransparency = 1.000
		Container.BorderSizePixel = 0
		Container.Position = UDim2.new(0.321529746, 0, 0.0475206599, 0)
		Container.Size = UDim2.new(0, 470, 0, 438)
		Container.CanvasSize = UDim2.new(0, 0, 0, 0)
		Container.ScrollBarThickness = 5
		Container.Visible = false
		Container.ScrollBarImageColor3 = Color3.fromRGB(71, 76, 84)

		ContainerLayout.Name = "ContainerLayout"
		ContainerLayout.Parent = Container
		ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ContainerLayout.Padding = UDim.new(0, 15)
		
		if fs == false then
			fs = true
			TabTitle.TextTransparency = 0
			TabIcon.ImageTransparency = 0
			Tab.BackgroundTransparency = 0
			Container.Visible = true
		end
		
		Tab.MouseButton1Click:Connect(function()
			for i, v in next, ContainerFolder:GetChildren() do
				if v.Name == "Container" then
					v.Visible = false
				end
				Container.Visible = true
			end
			for i, v in next, TabHold:GetChildren() do
				if v.Name == "Tab" then
					TweenService:Create(
						v,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						v.TabIcon,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						v.TabTitle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = .3}
					):Play()
					TweenService:Create(
						Tab,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						TabIcon,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
					TweenService:Create(
						TabTitle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end
			end
		end)
		local ContainerContent = {}
		function ContainerContent:Button(text, desc, callback)
			if desc == "" then
				desc = "There is no description for this button."
			end
			local BtnDescToggled = false
			local Button = Instance.new("TextButton")
			local ButtonCorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local Circle = Instance.new("Frame")
			local CircleCorner = Instance.new("UICorner")
			local CircleSmall = Instance.new("Frame")
			local CircleSmallCorner = Instance.new("UICorner")
			local Description = Instance.new("TextLabel")
			local ArrowBtn = Instance.new("ImageButton")
			local ArrowIco = Instance.new("ImageLabel")

			Button.Name = "Button"
			Button.Parent = Container
			Button.BackgroundColor3 = Color3.fromRGB(51, 51, 51) -- สีปุ่ม button
			Button.ClipsDescendants = true
			Button.Position = UDim2.new(0.370312512, 0, 0.552631557, 0)
			Button.Size = UDim2.new(0, 457, 0, 43)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000

			ButtonCorner.CornerRadius = UDim.new(0, 4)
			ButtonCorner.Name = "ButtonCorner"
			ButtonCorner.Parent = Button

			Title.Name = "Title" -- คำ button
			Title.Parent = Button
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
			Title.Size = UDim2.new(0, 113, 0, 42)
			Title.Font = Enum.Font.Gotham
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextTransparency = 0.300
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Circle.Name = "Circle"
			Circle.Parent = Title
			Circle.Active = true
			Circle.AnchorPoint = Vector2.new(0.5, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
			Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
			Circle.Size = UDim2.new(0, 11, 0, 11)

			CircleCorner.CornerRadius = UDim.new(2, 6)
			CircleCorner.Name = "CircleCorner"
			CircleCorner.Parent = Circle

			CircleSmall.Name = "CircleSmall"
			CircleSmall.Parent = Circle
			CircleSmall.Active = true
			CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
			CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
			CircleSmall.BackgroundTransparency = 1.000
			CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
			CircleSmall.Size = UDim2.new(0, 9, 0, 9)

			CircleSmallCorner.CornerRadius = UDim.new(2, 6)
			CircleSmallCorner.Name = "CircleSmallCorner"
			CircleSmallCorner.Parent = CircleSmall

			Description.Name = "Description" -- คำอธิบาย
			Description.Parent = Title
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.Position = UDim2.new(-0.200942323, 0, 0.785714269, 0)
			Description.Size = UDim2.new(0, 432, 0, 31)
			Description.Font = Enum.Font.Gotham
			Description.Text = desc
			Description.TextColor3 = Color3.fromRGB(255, 255, 255)
			Description.TextSize = 15.000
			Description.TextTransparency = 1
			Description.TextWrapped = true
			Description.TextXAlignment = Enum.TextXAlignment.Left

			ArrowBtn.Name = "ArrowBtn"
			ArrowBtn.Parent = Button
			ArrowBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
			ArrowBtn.BackgroundTransparency = 1.000
			ArrowBtn.Position = UDim2.new(0.903719902, 0, 0, 0)
			ArrowBtn.Size = UDim2.new(0, 33, 0, 37)
			ArrowBtn.SliceCenter = Rect.new(30, 30, 30, 30)
			ArrowBtn.SliceScale = 7.000

			ArrowIco.Name = "ArrowIco"
			ArrowIco.Parent = ArrowBtn
			ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
			ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ArrowIco.BackgroundTransparency = 1.000
			ArrowIco.Position = UDim2.new(0.495753437, 0, 0.554054081, 0)
			ArrowIco.Selectable = true
			ArrowIco.Size = UDim2.new(0, 28, 0, 24)
			ArrowIco.Image = "http://www.roblox.com/asset/?id=6034818372"
			ArrowIco.ImageTransparency = .3
			
			Button.MouseEnter:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0}
				):Play()
			end)
			
			Button.MouseLeave:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0.3}
				):Play()
			end)
			
			Button.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
			
			ArrowBtn.MouseButton1Click:Connect(function()
				if BtnDescToggled == false then
					Button:TweenSize(UDim2.new(0, 457, 0, 74), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = PresetColor}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					TweenService:Create(
						Description,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				else
					Button:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					TweenService:Create(
						Description,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 1}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				BtnDescToggled = not BtnDescToggled
			end)
			Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
		end
		function ContainerContent:Toggle(text, desc,default, callback)
			local ToggleDescToggled = false
			local Toggled = false
			if desc == "" then
				desc = "There is no description for this toggle."
			end
			local Toggle = Instance.new("TextButton")
			local ToggleCorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local Circle = Instance.new("Frame")
			local CircleCorner = Instance.new("UICorner")
			local CircleSmall = Instance.new("Frame")
			local CircleSmallCorner = Instance.new("UICorner")
			local ToggleFrame = Instance.new("Frame")
			local ToggleFrameCorner = Instance.new("UICorner")
			local ToggleCircle = Instance.new("Frame")
			local ToggleCircleCorner = Instance.new("UICorner")
			local Description = Instance.new("TextLabel")
			local ArrowBtn = Instance.new("ImageButton")
			local ArrowIco = Instance.new("ImageLabel")

			Toggle.Name = "Toggle"
			Toggle.Parent = Container
			Toggle.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			Toggle.ClipsDescendants = true
			Toggle.Position = UDim2.new(0.110937506, 0, 0.67653507, 0)
			Toggle.Size = UDim2.new(0, 457, 0, 43)
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			ToggleCorner.CornerRadius = UDim.new(0, 4)
			ToggleCorner.Name = "ToggleCorner"
			ToggleCorner.Parent = Toggle

			Title.Name = "Title"
			Title.Parent = Toggle
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
			Title.Size = UDim2.new(0, 113, 0, 42)
			Title.Font = Enum.Font.Gotham
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextTransparency = 0.300
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Circle.Name = "Circle"
			Circle.Parent = Title
			Circle.Active = true
			Circle.AnchorPoint = Vector2.new(0.5, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
			Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
			Circle.Size = UDim2.new(0, 11, 0, 11)

			CircleCorner.CornerRadius = UDim.new(2, 6)
			CircleCorner.Name = "CircleCorner"
			CircleCorner.Parent = Circle

			CircleSmall.Name = "CircleSmall"
			CircleSmall.Parent = Circle
			CircleSmall.Active = true
			CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
			CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
			CircleSmall.BackgroundTransparency = 1.000
			CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
			CircleSmall.Size = UDim2.new(0, 9, 0, 9)

			CircleSmallCorner.CornerRadius = UDim.new(2, 6)
			CircleSmallCorner.Name = "CircleSmallCorner"
			CircleSmallCorner.Parent = CircleSmall

			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Parent = Circle
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(226, 227, 227)
			ToggleFrame.Position = UDim2.new(33.0856934, 0, 0, 0)
			ToggleFrame.Size = UDim2.new(0, 27, 0, 11)

			ToggleFrameCorner.Name = "ToggleFrameCorner"
			ToggleFrameCorner.Parent = ToggleFrame

			ToggleCircle.Name = "ToggleCircle"
			ToggleCircle.Parent = ToggleFrame
			ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleCircle.Position = UDim2.new(0, 0, -0.272727281, 0)
			ToggleCircle.Selectable = true
			ToggleCircle.Size = UDim2.new(0, 17, 0, 17)

			ToggleCircleCorner.CornerRadius = UDim.new(2, 8)
			ToggleCircleCorner.Name = "ToggleCircleCorner"
			ToggleCircleCorner.Parent = ToggleCircle

			Description.Name = "Description"
			Description.Parent = Title
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.Position = UDim2.new(-0.200942323, 0, 0.785714269, 0)
			Description.Size = UDim2.new(0, 432, 0, 31)
			Description.Font = Enum.Font.Gotham
			Description.Text = desc
			Description.TextColor3 = Color3.fromRGB(255, 255, 255)
			Description.TextSize = 15.000
			Description.TextTransparency = 1
			Description.TextWrapped = true
			Description.TextXAlignment = Enum.TextXAlignment.Left

			ArrowBtn.Name = "ArrowBtn"
			ArrowBtn.Parent = Toggle
			ArrowBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
			ArrowBtn.BackgroundTransparency = 1.000
			ArrowBtn.Position = UDim2.new(0.903719902, 0, 0, 0)
			ArrowBtn.Size = UDim2.new(0, 33, 0, 37)
			ArrowBtn.SliceCenter = Rect.new(30, 30, 30, 30)
			ArrowBtn.SliceScale = 7.000

			ArrowIco.Name = "ArrowIco"
			ArrowIco.Parent = ArrowBtn
			ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
			ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ArrowIco.BackgroundTransparency = 1.000
			ArrowIco.Position = UDim2.new(0.495753437, 0, 0.554054081, 0)
			ArrowIco.Selectable = true
			ArrowIco.Size = UDim2.new(0, 28, 0, 24)
			ArrowIco.Image = "http://www.roblox.com/asset/?id=6034818372"
			ArrowIco.ImageTransparency = .3
			
		    Toggle.MouseEnter:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0}
				):Play()
			end)

			Toggle.MouseLeave:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0.3}
				):Play()
			end)

			Toggle.MouseButton1Click:Connect(function()
				if Toggled == false then
					ToggleCircle:TweenPosition(UDim2.new(0.37, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(
						ToggleCircle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 =PresetColor}
					):Play()
				else
					ToggleCircle:TweenPosition(UDim2.new(0, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
					TweenService:Create(
						ToggleCircle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(255,255,255)}
					):Play()
				end
				Toggled = not Toggled
				pcall(callback, Toggled)
			end)
			
			ArrowBtn.MouseButton1Click:Connect(function()
				if ToggleDescToggled == false then
					Toggle:TweenSize(UDim2.new(0, 457, 0, 74), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = PresetColor}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					TweenService:Create(
						Description,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				else
					Toggle:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					TweenService:Create(
						Description,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 1}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				ToggleDescToggled = not ToggleDescToggled
			end)
			if default == true then
				ToggleCircle:TweenPosition(UDim2.new(0.37, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
				TweenService:Create(
					ToggleCircle,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 =PresetColor}
				):Play()
				Toggled = not Toggled
				pcall(callback, Toggled)
			end
			Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
		end
		
		function ContainerContent:Slider(text,desc,min,max,start,callback)
			local SliderFunc = {}
			local SliderDescToggled = false
                        local dragging = false
			if desc == "" then
				desc = "There is no description for this slider."
			end
			local Slider = Instance.new("TextButton")
			local SliderCorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local Circle = Instance.new("Frame")
			local CircleCorner = Instance.new("UICorner")
			local CircleSmall = Instance.new("Frame")
			local CircleSmallCorner = Instance.new("UICorner")
			local Description = Instance.new("TextLabel")
			local SlideFrame = Instance.new("Frame")
			local CurrentValueFrame = Instance.new("Frame")
			local SlideCircle = Instance.new("ImageButton")
			local ArrowBtn = Instance.new("ImageButton")
			local ArrowIco = Instance.new("ImageLabel")
			local Value = Instance.new("TextLabel")

			Slider.Name = "Slider"
			Slider.Parent = Container
			Slider.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			Slider.ClipsDescendants = true
			Slider.Position = UDim2.new(0.189062506, 0, 0.648612201, 0)
			Slider.Size = UDim2.new(0, 457, 0, 60)
			Slider.AutoButtonColor = false
			Slider.Font = Enum.Font.SourceSans
			Slider.Text = ""
			Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
			Slider.TextSize = 14.000

			SliderCorner.CornerRadius = UDim.new(0, 4)
			SliderCorner.Name = "SliderCorner"
			SliderCorner.Parent = Slider

			Title.Name = "Title"
			Title.Parent = Slider
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
			Title.Size = UDim2.new(0, 113, 0, 42)
			Title.Font = Enum.Font.Gotham
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextTransparency = 0.300
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Circle.Name = "Circle"
			Circle.Parent = Title
			Circle.Active = true
			Circle.AnchorPoint = Vector2.new(0.5, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
			Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
			Circle.Size = UDim2.new(0, 11, 0, 11)


			CircleCorner.CornerRadius = UDim.new(2, 6)
			CircleCorner.Name = "CircleCorner"
			CircleCorner.Parent = Circle

			CircleSmall.Name = "CircleSmall"
			CircleSmall.Parent = Circle
			CircleSmall.Active = true
			CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
			CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
			CircleSmall.BackgroundTransparency = 1.000
			CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
			CircleSmall.Size = UDim2.new(0, 9, 0, 9)

			CircleSmallCorner.CornerRadius = UDim.new(2, 6)
			CircleSmallCorner.Name = "CircleSmallCorner"
			CircleSmallCorner.Parent = CircleSmall

			Description.Name = "Description"
			Description.Parent = Title
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.Position = UDim2.new(-0.201000005, 0, 1.38600004, 0)
			Description.Size = UDim2.new(0, 432, 0, 31)
			Description.Font = Enum.Font.Gotham
			Description.Text = desc
			Description.TextColor3 = Color3.fromRGB(255, 255, 255)
			Description.TextSize = 15.000
			Description.TextTransparency = 0.300
			Description.TextWrapped = true
			Description.TextXAlignment = Enum.TextXAlignment.Left

			SlideFrame.Name = "SlideFrame"
			SlideFrame.Parent = Title
			SlideFrame.BackgroundColor3 = Color3.fromRGB(235, 234, 235)
			SlideFrame.BorderSizePixel = 0
			SlideFrame.Position = UDim2.new(-0.197140202, 0, 0.986091495, 0)
			SlideFrame.Size = UDim2.new(0, 426, 0, 3)

			CurrentValueFrame.Name = "CurrentValueFrame"
			CurrentValueFrame.Parent = SlideFrame
			CurrentValueFrame.BackgroundColor3 = PresetColor
			CurrentValueFrame.BorderSizePixel = 0
			CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 3)

			SlideCircle.Name = "SlideCircle"
			SlideCircle.Parent = SlideFrame
			SlideCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SlideCircle.BackgroundTransparency = 1.000
			SlideCircle.Position = UDim2.new((start or 0)/max, -6,-1.30499995, 0)
			SlideCircle.Size = UDim2.new(0, 11, 0, 11)
			SlideCircle.Image = "rbxassetid://3570695787"
			SlideCircle.ImageColor3 = PresetColor

			ArrowBtn.Name = "ArrowBtn"
			ArrowBtn.Parent = Slider
			ArrowBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
			ArrowBtn.BackgroundTransparency = 1.000
			ArrowBtn.Position = UDim2.new(0.903719902, 0, 0, 0)
			ArrowBtn.Size = UDim2.new(0, 33, 0, 37)
			ArrowBtn.SliceCenter = Rect.new(30, 30, 30, 30)
			ArrowBtn.SliceScale = 7.000

			ArrowIco.Name = "ArrowIco"
			ArrowIco.Parent = ArrowBtn
			ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
			ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ArrowIco.BackgroundTransparency = 1.000
			ArrowIco.Position = UDim2.new(0.495753437, 0, 0.554054081, 0)
			ArrowIco.Selectable = true
			ArrowIco.Size = UDim2.new(0, 28, 0, 24)
			ArrowIco.Image = "http://www.roblox.com/asset/?id=6034818372"
			ArrowIco.ImageTransparency = .3

			Value.Name = "Value"
			Value.Parent = Title
			Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value.BackgroundTransparency = 1.000
			Value.Position = UDim2.new(2.27693367, 0, 0, 0)
			Value.Size = UDim2.new(0, 113, 0, 41)
			Value.Font = Enum.Font.Gotham
			Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
			Value.TextColor3 = Color3.fromRGB(255, 255, 255)
			Value.TextSize = 17.000
			Value.TextTransparency = 0.300
			Value.TextXAlignment = Enum.TextXAlignment.Right
			
			ArrowBtn.MouseButton1Click:Connect(function()
				if SliderDescToggled == false then
					Slider:TweenSize(UDim2.new(0, 457, 0, 101), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						Value,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 =PresetColor}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					TweenService:Create(
						Description,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				else
					Slider:TweenSize(UDim2.new(0, 457, 0, 60), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						Value,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					TweenService:Create(
						Description,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 1}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				SliderDescToggled = not SliderDescToggled
			end)
			
				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
							-6,
						-1.30499995,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							3
						)
					CurrentValueFrame:TweenSize(pos1, "Out", "Sine", 0.1, true)
					SlideCircle:TweenPosition(pos, "Out", "Sine", 0.1, true)
					local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
					Value.Text = tostring(value)
					pcall(callback, value)
				end
				SlideCircle.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
						end
					end
				)
				SlideCircle.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(
				function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end
				)
			Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
			function SliderFunc:Change(tochange)
				CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 3)
				SlideCircle.Position = UDim2.new((tochange or 0)/max, -6,-1.30499995, 0)
				Value.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
				pcall(callback,tochange)
			end
			return SliderFunc
		end
		function ContainerContent:Dropdown(text,list,callback)
			local DropFunc = {}
			local Selected = text
			local FrameSize = 43
			local ItemCount = 0
			local DropToggled = false
			local Dropdown = Instance.new("TextButton")
			local DropdownCorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local Circle = Instance.new("Frame")
			local CircleCorner = Instance.new("UICorner")
			local CircleSmall = Instance.new("Frame")
			local CircleSmallCorner = Instance.new("UICorner")
			local ArrowIco = Instance.new("ImageLabel")
			local DropItemHolder = Instance.new("ScrollingFrame")
			local DropLayout = Instance.new("UIListLayout")

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = Container
			Dropdown.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			Dropdown.ClipsDescendants = true
			Dropdown.Position = UDim2.new(0.110937499, 0, 0.67653507, 0)
			Dropdown.Size = UDim2.new(0, 457, 0, 43)
			Dropdown.AutoButtonColor = false
			Dropdown.Font = Enum.Font.SourceSans
			Dropdown.Text = ""
			Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.TextSize = 14.000

			DropdownCorner.CornerRadius = UDim.new(0, 4)
			DropdownCorner.Name = "DropdownCorner"
			DropdownCorner.Parent = Dropdown

			Title.Name = "Title"
			Title.Parent = Dropdown
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
			Title.Size = UDim2.new(0, 113, 0, 42)
			Title.Font = Enum.Font.Gotham
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextTransparency = 0.300
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Circle.Name = "Circle"
			Circle.Parent = Title
			Circle.Active = true
			Circle.AnchorPoint = Vector2.new(0.5, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
			Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
			Circle.Size = UDim2.new(0, 11, 0, 11)

			CircleCorner.CornerRadius = UDim.new(2, 6)
			CircleCorner.Name = "CircleCorner"
			CircleCorner.Parent = Circle

			CircleSmall.Name = "CircleSmall"
			CircleSmall.Parent = Circle
			CircleSmall.Active = true
			CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
			CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
			CircleSmall.BackgroundTransparency = 1.000
			CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
			CircleSmall.Size = UDim2.new(0, 9, 0, 9)

			CircleSmallCorner.CornerRadius = UDim.new(2, 6)
			CircleSmallCorner.Name = "CircleSmallCorner"
			CircleSmallCorner.Parent = CircleSmall

			ArrowIco.Name = "ArrowIco"
			ArrowIco.Parent = Title
			ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
			ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ArrowIco.BackgroundTransparency = 1.000
			ArrowIco.Position = UDim2.new(3.45979357, 0, 0.508096159, 0)
			ArrowIco.Selectable = true
			ArrowIco.Size = UDim2.new(0, 28, 0, 24)
			ArrowIco.Image = "http://www.roblox.com/asset/?id=6035047377"
			ArrowIco.ImageTransparency = .3

			DropItemHolder.Name = "DropItemHolder"
			DropItemHolder.Parent = Title
			DropItemHolder.Active = true
			DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropItemHolder.BackgroundTransparency = 1.000
			DropItemHolder.BorderSizePixel = 0
			DropItemHolder.Position = UDim2.new(-0.203539819, 0, 1.02380955, 0)
			DropItemHolder.Size = UDim2.new(0, 436, 0, 82)
			DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropItemHolder.ScrollBarThickness = 5
			DropItemHolder.ScrollBarImageColor3 = Color3.fromRGB(41, 42, 48)

			DropLayout.Name = "DropLayout"
			DropLayout.Parent = DropItemHolder
			DropLayout.SortOrder = Enum.SortOrder.LayoutOrder
			DropLayout.Padding = UDim.new(0, 2)
			
			Dropdown.MouseEnter:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0}
				):Play()
			end)

			Dropdown.MouseLeave:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0.3}
				):Play()
			end)

			
			Dropdown.MouseButton1Click:Connect(function()
				if DropToggled == false then
					Title.Text = Selected
					Dropdown:TweenSize(UDim2.new(0, 457, 0, FrameSize), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = PresetColor}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				else
					Title.Text = Selected
					Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
			DropToggled = not DropToggled
			end)
			
			for i,v in next, list do
				ItemCount = ItemCount + 1
				
				if ItemCount == 1 then
					FrameSize = 78
				elseif ItemCount == 2 then
					FrameSize = 107
				elseif ItemCount >= 3 then
					FrameSize = 133
				end
				local Item = Instance.new("TextButton")
				local ItemCorner = Instance.new("UICorner")
				
			Item.Name = "Item"
			Item.Parent = DropItemHolder
			Item.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
			Item.ClipsDescendants = true
			Item.Size = UDim2.new(0, 427, 0, 25)
			Item.AutoButtonColor = false
			Item.Font = Enum.Font.Gotham
			Item.Text = v
			Item.TextColor3 = Color3.fromRGB(255, 255, 255)
			Item.TextSize = 15.000
			Item.TextTransparency = 0.300

			ItemCorner.CornerRadius = UDim.new(0, 4)
			ItemCorner.Name = "ItemCorner"
				ItemCorner.Parent = Item
				DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)
				
				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
				end)
				
				Item.MouseButton1Click:Connect(function()
					pcall(callback, v)
					Title.Text = text
					Selected = v
					DropToggled = not DropToggled
					Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
					
				end)
			end
			function DropFunc:Add(addtext)
				ItemCount = ItemCount + 1

				if ItemCount == 1 then
					FrameSize = 78
				elseif ItemCount == 2 then
					FrameSize = 107
				elseif ItemCount >= 3 then
					FrameSize = 133
				end
				local Item = Instance.new("TextButton")
				local ItemCorner = Instance.new("UICorner")

				Item.Name = "Item"
				Item.Parent = DropItemHolder
				Item.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
				Item.ClipsDescendants = true
				Item.Size = UDim2.new(0, 427, 0, 25)
				Item.AutoButtonColor = false
				Item.Font = Enum.Font.Gotham
				Item.Text = addtext
				Item.TextColor3 = Color3.fromRGB(255, 255, 255)
				Item.TextSize = 15.000
				Item.TextTransparency = 0.300

				ItemCorner.CornerRadius = UDim.new(0, 4)
				ItemCorner.Name = "ItemCorner"
				ItemCorner.Parent = Item
				DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					pcall(callback, addtext)
					Title.Text = text
					Selected = addtext
					DropToggled = not DropToggled
					Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end)
				if DropToggled == true then
					Title.Text = Selected
					Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
			end
			function DropFunc:Clear()
				Title.Text = text
				FrameSize = 0
				ItemCount = 0
				for i, v in next, DropItemHolder:GetChildren() do
					if v.Name == "Item" then
						v:Destroy()
					end
				end
				if DropToggled == true then
					Title.Text = Selected
					Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
			end
			return DropFunc
		end
		function ContainerContent:Colorpicker(text,preset,callback)
			local ColorPickerToggled = false
			local OldToggleColor = Color3.fromRGB(0, 0, 0)
			local OldColor = Color3.fromRGB(0, 0, 0)
			local OldColorSelectionPosition = nil
			local OldHueSelectionPosition = nil
			local ColorH, ColorS, ColorV = 1, 1, 1
			local RainbowColorPicker = false
			local ColorPickerInput = nil
			local ColorInput = nil
			local HueInput = nil
			
			local Colorpicker = Instance.new("Frame")
			local ColorpickerCorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local Circle = Instance.new("Frame")
			local CircleCorner = Instance.new("UICorner")
			local CircleSmall = Instance.new("Frame")
			local CircleSmallCorner = Instance.new("UICorner")
			local Hue = Instance.new("ImageLabel")
			local HueCorner = Instance.new("UICorner")
			local HueGradient = Instance.new("UIGradient")
			local HueSelection = Instance.new("ImageLabel")
			local Color = Instance.new("ImageLabel")
			local ColorCorner = Instance.new("UICorner")
			local ColorSelection = Instance.new("ImageLabel")
			local Toggle = Instance.new("TextLabel")
			local ToggleFrame = Instance.new("Frame")
			local ToggleFrameCorner = Instance.new("UICorner")
			local ToggleCircle = Instance.new("Frame")
			local ToggleCircleCorner = Instance.new("UICorner")
			local Confirm = Instance.new("TextButton")
			local ConfirmCorner = Instance.new("UICorner")
			local ConfirmTitle = Instance.new("TextLabel")
			local BoxColor = Instance.new("Frame")
			local BoxColorCorner = Instance.new("UICorner")
			local ColorpickerBtn = Instance.new("TextButton")
			local ToggleBtn = Instance.new("TextButton")


			Colorpicker.Name = "Colorpicker"
			Colorpicker.Parent = Container
			Colorpicker.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			Colorpicker.ClipsDescendants = true
			Colorpicker.Position = UDim2.new(0.110937499, 0, 0.67653507, 0)
			Colorpicker.Size = UDim2.new(0, 457, 0, 43)

			ColorpickerCorner.CornerRadius = UDim.new(0, 4)
			ColorpickerCorner.Name = "ColorpickerCorner"
			ColorpickerCorner.Parent = Colorpicker

			Title.Name = "Title"
			Title.Parent = Colorpicker
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
			Title.Size = UDim2.new(0, 113, 0, 42)
			Title.Font = Enum.Font.Gotham
			Title.Text = "Colorpicker"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextTransparency = 0.300
			Title.TextXAlignment = Enum.TextXAlignment.Left
			

			ColorpickerBtn.Name = "ColorpickerBtn"
			ColorpickerBtn.Parent = Title
			ColorpickerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorpickerBtn.BackgroundTransparency = 1.000
			ColorpickerBtn.Position = UDim2.new(-0.336283177, 0, 0, 0)
			ColorpickerBtn.Size = UDim2.new(0, 457, 0, 42)
			ColorpickerBtn.Font = Enum.Font.SourceSans
			ColorpickerBtn.Text = ""
			ColorpickerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ColorpickerBtn.TextSize = 14.000

			Circle.Name = "Circle"
			Circle.Parent = Title
			Circle.Active = true
			Circle.AnchorPoint = Vector2.new(0.5, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
			Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
			Circle.Size = UDim2.new(0, 11, 0, 11)

			CircleCorner.CornerRadius = UDim.new(2, 6)
			CircleCorner.Name = "CircleCorner"
			CircleCorner.Parent = Circle

			CircleSmall.Name = "CircleSmall"
			CircleSmall.Parent = Circle
			CircleSmall.Active = true
			CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
			CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
			CircleSmall.BackgroundTransparency = 1.000
			CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
			CircleSmall.Size = UDim2.new(0, 9, 0, 9)

			CircleSmallCorner.CornerRadius = UDim.new(2, 6)
			CircleSmallCorner.Name = "CircleSmallCorner"
			CircleSmallCorner.Parent = CircleSmall

			Hue.Name = "Hue"
			Hue.Parent = Title
			Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Hue.Position = UDim2.new(0, 229, 0, 46)
			Hue.Size = UDim2.new(0, 25, 0, 80)

			HueCorner.CornerRadius = UDim.new(0, 3)
			HueCorner.Name = "HueCorner"
			HueCorner.Parent = Hue

			HueGradient.Color = ColorSequence.new {
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
				ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
				ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
				ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
				ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
				ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
			}			
			HueGradient.Rotation = 270
			HueGradient.Name = "HueGradient"
			HueGradient.Parent = Hue

			HueSelection.Name = "HueSelection"
			HueSelection.Parent = Hue
			HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
			HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HueSelection.BackgroundTransparency = 1.000
			HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
			HueSelection.Size = UDim2.new(0, 18, 0, 18)
			HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
			HueSelection.Visible = false

			Color.Name = "Color"
			Color.Parent = Title
			Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			Color.Position = UDim2.new(0, -23, 0, 46)
			Color.Size = UDim2.new(0, 246, 0, 80)
			Color.ZIndex = 10
			Color.Image = "rbxassetid://4155801252"

			ColorCorner.CornerRadius = UDim.new(0, 3)
			ColorCorner.Name = "ColorCorner"
			ColorCorner.Parent = Color

			ColorSelection.Name = "ColorSelection"
			ColorSelection.Parent = Color
			ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorSelection.BackgroundTransparency = 1.000
			ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
			ColorSelection.Size = UDim2.new(0, 18, 0, 18)
			ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
			ColorSelection.ScaleType = Enum.ScaleType.Fit
			ColorSelection.Visible = false

			Toggle.Name = "Toggle"
			Toggle.Parent = Title
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.Position = UDim2.new(2.37430048, 0, 1.07157099, 0)
			Toggle.Size = UDim2.new(0, 137, 0, 38)
			Toggle.Font = Enum.Font.Gotham
			Toggle.Text = "Rainbow"
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextSize = 15.000
			Toggle.TextTransparency = 0.300
			Toggle.TextXAlignment = Enum.TextXAlignment.Left

			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Parent = Toggle
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(226, 227, 227)
			ToggleFrame.Position = UDim2.new(0.778387249, 0, 0.357142866, 0)
			ToggleFrame.Size = UDim2.new(0, 27, 0, 11)

			ToggleFrameCorner.Name = "ToggleFrameCorner"
			ToggleFrameCorner.Parent = ToggleFrame

			ToggleCircle.Name = "ToggleCircle"
			ToggleCircle.Parent = ToggleFrame
			ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleCircle.Position = UDim2.new(0, 0, -0.273000002, 0)
			ToggleCircle.Selectable = true
			ToggleCircle.Size = UDim2.new(0, 17, 0, 17)

			ToggleCircleCorner.CornerRadius = UDim.new(2, 8)
			ToggleCircleCorner.Name = "ToggleCircleCorner"
			ToggleCircleCorner.Parent = ToggleCircle

			Confirm.Name = "Confirm"
			Confirm.Parent = Title
			Confirm.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
			Confirm.ClipsDescendants = true
			Confirm.Position = UDim2.new(2.3791616, 0, 1.97633278, 0)
			Confirm.Size = UDim2.new(0, 144, 0, 42)
			Confirm.AutoButtonColor = false
			Confirm.Font = Enum.Font.SourceSans
			Confirm.Text = ""
			Confirm.TextColor3 = Color3.fromRGB(0, 0, 0)
			Confirm.TextSize = 14.000

			ConfirmCorner.CornerRadius = UDim.new(0, 4)
			ConfirmCorner.Name = "ConfirmCorner"
			ConfirmCorner.Parent = Confirm

			ConfirmTitle.Name = "ConfirmTitle"
			ConfirmTitle.Parent = Confirm
			ConfirmTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ConfirmTitle.BackgroundTransparency = 1.000
			ConfirmTitle.Size = UDim2.new(0, 116, 0, 40)
			ConfirmTitle.Font = Enum.Font.Gotham
			ConfirmTitle.Text = "Confirm"
			ConfirmTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ConfirmTitle.TextSize = 15.000
			ConfirmTitle.TextTransparency = 0.300
			ConfirmTitle.TextXAlignment = Enum.TextXAlignment.Left

			BoxColor.Name = "BoxColor"
			BoxColor.Parent = Title
			BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BoxColor.Position = UDim2.new(3.26915574, 0, 0.261904776, 0)
			BoxColor.Size = UDim2.new(0, 35, 0, 19)

			BoxColorCorner.CornerRadius = UDim.new(0, 4)
			BoxColorCorner.Name = "BoxColorCorner"
			BoxColorCorner.Parent = BoxColor

			ToggleBtn.Name = "ToggleBtn"
			ToggleBtn.Parent = Toggle
			ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleBtn.BackgroundTransparency = 1.000
			ToggleBtn.Size = UDim2.new(0, 137, 0, 38)
			ToggleBtn.Font = Enum.Font.SourceSans
			ToggleBtn.Text = ""
			ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleBtn.TextSize = 14.000
			
			ColorpickerBtn.MouseEnter:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0}
				):Play()
			end)

			ColorpickerBtn.MouseLeave:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0.3}
				):Play()
			end)
		 	
			ColorpickerBtn.MouseButton1Click:Connect(function()
				if ColorPickerToggled == false then
					ColorSelection.Visible = true
					HueSelection.Visible = true
					Colorpicker:TweenSize(UDim2.new(0, 457, 0, 138), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = PresetColor}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				else
					ColorSelection.Visible = false
					HueSelection.Visible = false
					Colorpicker:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				ColorPickerToggled = not ColorPickerToggled
			end)
			

			local function UpdateColorPicker(nope)
				BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
				Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

				pcall(callback, BoxColor.BackgroundColor3)
			end

			ColorH =
				1 -
				(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
					Hue.AbsoluteSize.Y)
			ColorS =
				(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
					Color.AbsoluteSize.X)
			ColorV =
				1 -
				(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
					Color.AbsoluteSize.Y)

			BoxColor.BackgroundColor3 = preset
			Color.BackgroundColor3 = preset
			pcall(callback, BoxColor.BackgroundColor3)

			Color.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then
							return
						end

						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput =
							RunService.RenderStepped:Connect(
								function()
								local ColorX =
									(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
										Color.AbsoluteSize.X)
								local ColorY =
									(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
										Color.AbsoluteSize.Y)

								ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
								ColorS = ColorX
								ColorV = 1 - ColorY

								UpdateColorPicker(true)
							end
							)
					end
				end
			)

			Color.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end
			)

			Hue.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if RainbowColorPicker then
							return
						end

						if HueInput then
							HueInput:Disconnect()
						end

						HueInput =
							RunService.RenderStepped:Connect(
								function()
								local HueY =
									(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
										Hue.AbsoluteSize.Y)

								HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
								ColorH = 1 - HueY

								UpdateColorPicker(true)
							end
							)
					end
				end
			)

			Hue.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end
			)

			ToggleBtn.MouseButton1Down:Connect(
				function()
					RainbowColorPicker = not RainbowColorPicker

					if ColorInput then
						ColorInput:Disconnect()
					end

					if HueInput then
						HueInput:Disconnect()
					end

					if RainbowColorPicker then
						ToggleCircle:TweenPosition(UDim2.new(0.37, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(
							ToggleCircle,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 =PresetColor}
						):Play()

						OldToggleColor = BoxColor.BackgroundColor3
						OldColor = Color.BackgroundColor3
						OldColorSelectionPosition = ColorSelection.Position
						OldHueSelectionPosition = HueSelection.Position

						while RainbowColorPicker do
							BoxColor.BackgroundColor3 = Color3.fromHSV(Flux.RainbowColorValue, 1, 1)
							Color.BackgroundColor3 = Color3.fromHSV(Flux.RainbowColorValue, 1, 1)

							ColorSelection.Position = UDim2.new(1, 0, 0, 0)
							HueSelection.Position = UDim2.new(0.48, 0, 0, Flux.HueSelectionPosition)

							pcall(callback, BoxColor.BackgroundColor3)
							wait()
						end
					elseif not RainbowColorPicker then
						ToggleCircle:TweenPosition(UDim2.new(0, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(
							ToggleCircle,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(255,255,255)}
						):Play()

						BoxColor.BackgroundColor3 = OldToggleColor
						Color.BackgroundColor3 = OldColor

						ColorSelection.Position = OldColorSelectionPosition
						HueSelection.Position = OldHueSelectionPosition

						pcall(callback, BoxColor.BackgroundColor3)
					end
				end
			)

			Confirm.MouseButton1Click:Connect(
				function()
					ColorPickerToggled = not ColorPickerToggled
					Colorpicker:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
			)
			Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
		end
		function ContainerContent:Line()
			local Line = Instance.new("TextButton")
			local LineCorner = Instance.new("UICorner")

			Line.Name = "Line"
			Line.Parent = Container
			Line.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			Line.ClipsDescendants = true
			Line.Position = UDim2.new(0, 0, 0.70091325, 0)
			Line.Size = UDim2.new(0, 457, 0, 4)
			Line.AutoButtonColor = false
			Line.Font = Enum.Font.SourceSans
			Line.Text = ""
			Line.TextColor3 = Color3.fromRGB(0, 0, 0)
			Line.TextSize = 14.000

			LineCorner.CornerRadius = UDim.new(0, 4)
			LineCorner.Name = "LineCorner"
			LineCorner.Parent = Line
			
			Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
		end
		function ContainerContent:Label(text)
			local Label = Instance.new("TextButton")
			local LabelCorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")

			Label.Name = "Label"
			Label.Parent = Container
			Label.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
			Label.ClipsDescendants = true
			Label.Position = UDim2.new(0.370312512, 0, 0.552631557, 0)
			Label.Size = UDim2.new(0, 457, 0, 43)
			Label.AutoButtonColor = false
			Label.Font = Enum.Font.SourceSans
			Label.Text = ""
			Label.TextColor3 = Color3.fromRGB(0, 0, 0)
			Label.TextSize = 14.000

			LabelCorner.CornerRadius = UDim.new(0, 4)
			LabelCorner.Name = "LabelCorner"
			LabelCorner.Parent = Label

			Title.Name = "Title"
			Title.Parent = Label
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.038480062, 0, 0, 0)
			Title.Size = UDim2.new(0, 113, 0, 42)
			Title.Font = Enum.Font.Gotham
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextTransparency = 0.300
			Title.TextXAlignment = Enum.TextXAlignment.Left
			
			Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
		end
		function ContainerContent:Textbox(text,desc,disapper,callback)
			if desc == "" then
				desc = "There is no description for this textbox."
			end
			local TextboxDescToggled = false
			local Textbox = Instance.new("TextButton")
			local TextboxCorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local Circle = Instance.new("Frame")
			local CircleCorner = Instance.new("UICorner")
			local CircleSmall = Instance.new("Frame")
			local CircleSmallCorner = Instance.new("UICorner")
			local Description = Instance.new("TextLabel")
			local TextboxFrame = Instance.new("Frame")
			local TextboxFrameCorner = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local ArrowBtn = Instance.new("ImageButton")
			local ArrowIco = Instance.new("ImageLabel")

			Textbox.Name = "Textbox"
			Textbox.Parent = Container
			Textbox.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			Textbox.ClipsDescendants = true
			Textbox.Position = UDim2.new(0.0459499061, 0, 0.734449744, 0)
			Textbox.Size = UDim2.new(0, 457, 0, 43)
			Textbox.AutoButtonColor = false
			Textbox.Font = Enum.Font.SourceSans
			Textbox.Text = ""
			Textbox.TextColor3 = Color3.fromRGB(0, 0, 0)
			Textbox.TextSize = 14.000

			TextboxCorner.CornerRadius = UDim.new(0, 4)
			TextboxCorner.Name = "TextboxCorner"
			TextboxCorner.Parent = Textbox

			Title.Name = "Title"
			Title.Parent = Textbox
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
			Title.Size = UDim2.new(0, 113, 0, 42)
			Title.Font = Enum.Font.Gotham
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextTransparency = 0.300
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Circle.Name = "Circle"
			Circle.Parent = Title
			Circle.Active = true
			Circle.AnchorPoint = Vector2.new(0.5, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
			Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
			Circle.Size = UDim2.new(0, 11, 0, 11)

			CircleCorner.CornerRadius = UDim.new(2, 6)
			CircleCorner.Name = "CircleCorner"
			CircleCorner.Parent = Circle

			CircleSmall.Name = "CircleSmall"
			CircleSmall.Parent = Circle
			CircleSmall.Active = true
			CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
			CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
			CircleSmall.BackgroundTransparency = 1.000
			CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
			CircleSmall.Size = UDim2.new(0, 9, 0, 9)

			CircleSmallCorner.CornerRadius = UDim.new(2, 6)
			CircleSmallCorner.Name = "CircleSmallCorner"
			CircleSmallCorner.Parent = CircleSmall

			Description.Name = "Description"
			Description.Parent = Title
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.Position = UDim2.new(-0.200942323, 0, 0.985714269, 0)
			Description.Size = UDim2.new(0, 432, 0, 31)
			Description.Font = Enum.Font.Gotham
			Description.Text = desc
			Description.TextColor3 = Color3.fromRGB(255, 255, 255)
			Description.TextSize = 15.000
			Description.TextTransparency = 1
			Description.TextWrapped = true
			Description.TextXAlignment = Enum.TextXAlignment.Left

			TextboxFrame.Name = "TextboxFrame"
			TextboxFrame.Parent = Title
			TextboxFrame.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
			TextboxFrame.Position = UDim2.new(1.82300889, 0, 0.202380955, 0)
			TextboxFrame.Size = UDim2.new(0, 161, 0, 26)

			TextboxFrameCorner.CornerRadius = UDim.new(0, 4)
			TextboxFrameCorner.Name = "TextboxFrameCorner"
			TextboxFrameCorner.Parent = TextboxFrame

			TextBox.Parent = TextboxFrame
			TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.BackgroundTransparency = 1.000
			TextBox.Size = UDim2.new(0, 161, 0, 26)
			TextBox.Font = Enum.Font.Gotham
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 18.000
			TextBox.TextTransparency = 0.300

			ArrowBtn.Name = "ArrowBtn"
			ArrowBtn.Parent = Textbox
			ArrowBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
			ArrowBtn.BackgroundTransparency = 1.000
			ArrowBtn.Position = UDim2.new(0.903719902, 0, 0, 0)
			ArrowBtn.Size = UDim2.new(0, 33, 0, 37)
			ArrowBtn.SliceCenter = Rect.new(30, 30, 30, 30)
			ArrowBtn.SliceScale = 7.000

			ArrowIco.Name = "ArrowIco"
			ArrowIco.Parent = ArrowBtn
			ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
			ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ArrowIco.BackgroundTransparency = 1.000
			ArrowIco.Position = UDim2.new(0.495753437, 0, 0.554054081, 0)
			ArrowIco.Selectable = true
			ArrowIco.Size = UDim2.new(0, 28, 0, 24)
			ArrowIco.Image = "http://www.roblox.com/asset/?id=6034818372"
			
			TextBox.FocusLost:Connect(
				function(ep)
					if ep then
						if #TextBox.Text > 0 then
							pcall(callback, TextBox.Text)
							if disapper then
								TextBox.Text = ""
							end
						end
					end
				end
			)
			
			ArrowBtn.MouseButton1Click:Connect(function()
				if TextboxDescToggled == false then
					Textbox:TweenSize(UDim2.new(0, 457, 0, 81), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = PresetColor}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = PresetColor}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					TweenService:Create(
						Description,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				else
					Textbox:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = .3}
					):Play()
					TweenService:Create(
						ArrowIco,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					TweenService:Create(
						Description,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 1}
					):Play()
					wait(.4)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				TextboxDescToggled = not TextboxDescToggled
			end)
			Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
		end
		function ContainerContent:Bind(text,presetbind,callback)
			local Key = presetbind.Name
			local Bind = Instance.new("TextButton")
			local BindCorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local Circle = Instance.new("Frame")
			local CircleCorner = Instance.new("UICorner")
			local CircleSmall = Instance.new("Frame")
			local CircleSmallCorner = Instance.new("UICorner")
			local BindLabel = Instance.new("TextLabel")

			Bind.Name = "Bind"
			Bind.Parent = Container
			Bind.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			Bind.ClipsDescendants = true
			Bind.Position = UDim2.new(0.40625, 0, 0.828947306, 0)
			Bind.Size = UDim2.new(0, 457, 0, 43)
			Bind.AutoButtonColor = false
			Bind.Font = Enum.Font.SourceSans
			Bind.Text = ""
			Bind.TextColor3 = Color3.fromRGB(0, 0, 0)
			Bind.TextSize = 14.000

			BindCorner.CornerRadius = UDim.new(0, 4)
			BindCorner.Name = "BindCorner"
			BindCorner.Parent = Bind

			Title.Name = "Title"
			Title.Parent = Bind
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
			Title.Size = UDim2.new(0, 113, 0, 42)
			Title.Font = Enum.Font.Gotham
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextTransparency = 0.300
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Circle.Name = "Circle"
			Circle.Parent = Title
			Circle.Active = true
			Circle.AnchorPoint = Vector2.new(0.5, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
			Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
			Circle.Size = UDim2.new(0, 11, 0, 11)

			CircleCorner.CornerRadius = UDim.new(2, 6)
			CircleCorner.Name = "CircleCorner"
			CircleCorner.Parent = Circle

			CircleSmall.Name = "CircleSmall"
			CircleSmall.Parent = Circle
			CircleSmall.Active = true
			CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
			CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
			CircleSmall.BackgroundTransparency = 1.000
			CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
			CircleSmall.Size = UDim2.new(0, 9, 0, 9)

			CircleSmallCorner.CornerRadius = UDim.new(2, 6)
			CircleSmallCorner.Name = "CircleSmallCorner"
			CircleSmallCorner.Parent = CircleSmall

			BindLabel.Name = "BindLabel"
			BindLabel.Parent = Title
			BindLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BindLabel.BackgroundTransparency = 1.000
			BindLabel.Position = UDim2.new(2.56011987, 0, 0, 0)
			BindLabel.Size = UDim2.new(0, 113, 0, 42)
			BindLabel.Font = Enum.Font.Gotham
			BindLabel.Text = Key
			BindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			BindLabel.TextSize = 15.000
			BindLabel.TextTransparency = 0.300
			BindLabel.TextXAlignment = Enum.TextXAlignment.Right
			
			Bind.MouseEnter:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0}
				):Play()
			end)

			Bind.MouseLeave:Connect(function()
				TweenService:Create(
					Title,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0.3}
				):Play()
			end)

			Bind.MouseButton1Click:connect(
				function()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						BindLabel,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = PresetColor}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = PresetColor}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					TweenService:Create(
						BindLabel,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
					BindLabel.Text = "..."
					local inputwait = game:GetService("UserInputService").InputBegan:wait()
					if inputwait.KeyCode.Name ~= "Unknown" then
						BindLabel.Text = inputwait .KeyCode.Name
						Key = inputwait .KeyCode.Name
					end
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						BindLabel,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						Circle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
					):Play()
					TweenService:Create(
						CircleSmall,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						Title,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
					TweenService:Create(
						BindLabel,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
				end
			)

			game:GetService("UserInputService").InputBegan:connect(
			function(current, pressed)
				if not pressed then
					if current.KeyCode.Name == Key then
						pcall(callback)
					end
				end
			end
			)
			
			Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
		end
		return ContainerContent
	end
	return Tabs
end

-----------------------------------------------------------------------------------------------------------------------


local win = Flux:Window("BETA0.7", "King Legacy", Color3.fromRGB(255, 0, 0), Enum.KeyCode.RightControl)
local tab = win:Tab("AutoFarm", "http://www.roblox.com/asset/?id=6022668907")

local MyLevel = game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value

local placeId = game.PlaceId -- ไอดีแมพ

if placeId == 4520749081 then -- โลก1
    OldWorld = true
elseif placeId == 6381829480 then -- โลก2 
    newworld = true
end


dis = 7
tab:Slider("Distance AutoFarm"," ",1,20,dis,function(value)
    dis = value
end)

tab:Toggle("Autofarm Level", "Autofarm Level",false, function(vu) 
    AFM = vu
end)

tab:Button("Equip All"," ",function()
	for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
		if tool:IsA("Tool") then
			 tool.Parent = game:GetService("Players").LocalPlayer.Character
		end
	end
end)

Wapon = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(Wapon ,v.Name)
    end
end

SelectWeapon = ""
function EquipWeapon(ToolSe)
   if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
      local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
      wait(.4)
      game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
   end
end

local SelectWeapon = tab:Dropdown("Select Weapon",Wapon,function(Value)
    SelectWeapon1 = Value
end)

tab:Button("Refresh Weapon"," ",function()
    SelectWeapon:Clear()
    Wapon = {}
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
		if v:IsA("Tool") then
			SelectWeapon:Add(v.Name)
		end
	end
end)
tab:Textbox("Reach Lv.", "Reach Lv.", false, function(x)
	_G.lv = x
	print(_G.lv)
end)
tab:Toggle("Break", "Break Level",false, function(x) 
    BL = x
end)
 -- CheckQuest

 function CheckQuest() -- ver. ไม่สมบูรณ์
    local MyLevel = game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value
    if OldWorld then -- เก่า
        if MyLevel == 1 or MyLevel <= 9 then -- Soldier 
           Ms = "Soldier [Lv. 1]"
           NameQuest = "QuestLvl1"
           NameMon = "Soldier"
           CFrameQuest = CFrame.new(2278.07324, 48.1432991, -1649.34082)
		   CFrameMon = CFrame.new(2335.67432, 48.1932831, -1606.96716)
        elseif MyLevel == 10 or MyLevel <= 19 then -- Clown Pirate 
            Ms = "Clown Pirate [Lv. 10]"
            NameQuest = "QuestLvl10"
            NameMon = "Clown Pirate"
            CFrameQuest = CFrame.new(2496.50562, 48.1313591, -1771.6543)
			CFrameMon = CFrame.new(2459.31006, 48.1940727, -1671.36938)
        elseif MyLevel == 20 or MyLevel <= 29 then -- Smoky
            Ms = "Smoky [Lv. 20]"
            NameQuest = "QuestLvl20"
            NameMon = "Smoky"
            CFrameQuest = CFrame.new(2228.21899, 48.1432991, -1782.27734)
			CFrameMon = CFrame.new(2321.33008, 48.1932945, -1829.81458)
		elseif MyLevel == 20 or MyLevel <= 29 then -- Tashi
            Ms = "Smoky [Lv. 20]"
            NameQuest = "QuestLvl20"
            NameMon = "Smoky"
            CFrameQuest = CFrame.new(2013.79492, 48.1417198, -1807.34363)
			CFrameMon = CFrame.new(2013.79492, 48.1417198, -1807.34363)
        elseif MyLevel == 100 or MyLevel <= 179 then 
            Ms = "Commander [Lv. 100]"
            NameQuest = "QuestLvl100"
            NameMon = "Commander"
            CFrameQuest = CFrame.new(1880.19104, 39.336544, 1159.45288)
			CFrameMon = CFrame.new(1915.03491, 39.3863792, 1452.6521)
		elseif MyLevel == 180 or MyLevel <= 249 then 
            Ms = "Fishman [Lv. 180]"
            NameQuest = "QuestLvl180"
            NameMon = "Fishman"
            CFrameQuest = CFrame.new(3874.24243, 10.4919729, 3251.10303)   
			CFrameMon = CFrame.new(3981.19653, 10.541934, 3284.33203)        
		elseif MyLevel == 250 or MyLevel <= 399 then
            Ms = "Trainer Chef [Lv. 250]"
            NameQuest = "QuestLvl250"
            NameMon = "Trainer Chef"
            CFrameQuest = CFrame.new(-52.3110924, 49.7371216, -87.4792709)  
			CFrameMon = CFrame.new(93.4975357, 12.94034, -176.857254)   
		elseif MyLevel == 400 or MyLevel <= 799 then 
            Ms = "Snow Soldier [Lv. 400]"
            NameQuest = "QuestLvl400"
            NameMon = "Snow Soldier"
            CFrameQuest = CFrame.new(-2852.38989, 18.0817909, 1421.12366)    
			CFrameMon = CFrame.new(-2815.09814, 18.0717945, 1493.57849)  
		elseif MyLevel == 800 or MyLevel <= 999 then 
            Ms = "Sky Soldier [Lv. 800]"
            NameQuest = "QuestLvl800"
            NameMon = "Sky Soldier"
            CFrameQuest = CFrame.new(-1252.55969, 200.65274, 4580.86816)    
			CFrameMon = CFrame.new(-1362.03247, 222.379227, 4703.32178)  
		elseif MyLevel == 1000 or MyLevel <= 1499 then 
            Ms = "Soldier [Lv. 1000]"
            NameQuest = "QuestLvl1000"
            NameMon = "Soldier"
            CFrameQuest = CFrame.new(8271.08008, 11.8968792, 5437.74219)    
			CFrameMon = CFrame.new(8351.88965, 11.9012327, 5565.91113) 
		elseif MyLevel == 1500 or MyLevel <= 1749 then 
            Ms = "Zombie [Lv. 1500]"
            NameQuest = "QuestLvl1500"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-775.449646, 47.8566055, 8477.65137)    
			CFrameMon = CFrame.new(-912.53772, 47.8558884, 8646.10352) 
		elseif MyLevel == 1750 or MyLevel <= 1799 then 
            Ms = "New World Pirate [Lv. 1750]"
            NameQuest = "QuestLvl1750"
            NameMon = "New World Pirate"
            CFrameQuest = CFrame.new(8601.64551, 49.5820999, 1731.67859)    
			CFrameMon = CFrame.new(8470.72852, 49.5910835, 1894.18689) 
		elseif MyLevel == 1800 or MyLevel <= 1999 then 
            Ms = "Rear Admiral [Lv. 1800]"
            NameQuest = "QuestLvl1800"
            NameMon = "Rear Admiral"
            CFrameQuest = CFrame.new(8581.98145, 49.5780907, 1346.16626)    
			CFrameMon = CFrame.new(8507.16699, 49.5940742, 1316.30176) 
		elseif MyLevel == 2000 or MyLevel <= 2149 then 
            Ms = "Fishman [Lv. 2000]"
            NameQuest = "QuestLvl2000"
            NameMon = "Fishman"
            CFrameQuest = CFrame.new(2974.53638, 40.2607422, 13350.7148)    
			CFrameMon = CFrame.new(3111.46973, 40.272541, 13497.9824)
		elseif MyLevel >= 2150 then  
            Ms = "Fishman Soldier [Lv. 2150]"
            NameQuest = "QuestLvl2150"
            NameMon = "Fishman Soldier"
            CFrameQuest = CFrame.new(3021.55811, 40.270649, 13884.3408)    
			CFrameMon = CFrame.new(3111.46973, 40.272541, 13497.9824) 
		end
	end
	if newworld then
		if MyLevel == 2300 or MyLevel <= 2399 then  -- โลกสอง
            Ms = "Beast Pirate [Lv. 2300]"
            NameQuest = "QuestLvl2300"
            NameMon = "Beast Pirate"
            CFrameQuest = CFrame.new(414.411407, 75.2909546, -5425.81787)    
			CFrameMon = CFrame.new(707.726929, 75.3450241, -5521.07617) 
		elseif MyLevel == 2400 or MyLevel <= 2449 then  
            Ms = "Bandit Beast Pirate [Lv. 2400]"
            NameQuest = "QuestLvl2400"
            NameMon = "Bandit Beast Pirate"
            CFrameQuest = CFrame.new(-2120.19263, 75.3445282, -4903.81982)    
			CFrameMon = CFrame.new(-1892.9679, 75.3957672, -4751.98877) 
		elseif MyLevel == 2450 or MyLevel <= 2699 then  
            Ms = "Powerful Beast Pirate [Lv. 2450]"
            NameQuest = "QuestLvl2450"
            NameMon = "Powerful Beast Pirate"
            CFrameQuest = CFrame.new(-2757.20752, 75.3966675, -5291.75146)    
			CFrameMon = CFrame.new(-2724.89624, 75.3956146, -5621.62549) 
		elseif MyLevel == 2700 or MyLevel <= 3024 then  
            Ms = "Elite Beast Pirate [Lv. 2700]"
            NameQuest = "QuestLvl2700"
            NameMon = "Elite Beast Pirate"
            CFrameQuest = CFrame.new(-1041.19666, 75.3444672, 170.048309)    
			CFrameMon = CFrame.new(-838.555481, 75.3444672, 346.406403) 
		elseif MyLevel >= 3025 then
            Ms = "Skull Pirate [Lv. 3050]"
            NameQuest = "QuestLvl3025"
            NameMon = "Skull Pirate"
            CFrameQuest = CFrame.new(-3813.87988, 51.9128647, 9891.00879)    
			CFrameMon = CFrame.new(-3879.97925, 51.5950127, 10304.1348) 
        end
    end
end

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local VirtualUser = game:GetService('VirtualUser')

	function autofarm()
		CheckQuest()
		if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.QuestCount.Text,NameMon) then
		else
			game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible = false
		end
		if LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false then
			  LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
			  wait(1)
			  pcall(function()
              game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(workspace.AntiTPNPC[NameQuest])
              for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                if v.Name == NameQuest then
                    game:GetService("Players").LocalPlayer.PlayerGui[NameQuest].Dialogue:WaitForChild("Accept").Position = UDim2.new(-1.5,0,-3.5)
                    game:GetService("Players").LocalPlayer.PlayerGui[NameQuest].Dialogue:WaitForChild("Accept").Size = UDim2.new(35,35,35)
					game:GetService("Players").LocalPlayer.PlayerGui[NameQuest].Dialogue:WaitForChild("Accept").BackgroundTransparency = 1
					game:GetService("Players").LocalPlayer.PlayerGui[NameQuest].Dialogue:WaitForChild("Accept").ImageTransparency = 1
                end
			end
            end)
                 game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):ClickButton1(Vector2.new())
        elseif LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == true then
            CheckQuest()
			pcall(function()
						CheckQuest()
                        for i, v in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
                           if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == Ms then            
								if game:GetService("Workspace").Monster.Mon:FindFirstChild(Ms) then
									Hit = true
                            		repeat wait()
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.QuestCount.Text,NameMon) then
                                		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,dis,0) * CFrame.Angles(math.rad(-90),0,0)
									else
										game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible = false
								end
                                until not v.Parent or v.Humanoid.Health <= 0 or AFM == false or game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false
								Hit = false
                        end
					   else    
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
					   end       
					end 
				end) 
            end
        end
         
 
 game:GetService("RunService").Heartbeat:Connect(function()
    if AFM or AFB or raidaura or mobau or pk or ENMA or SABER then
		pcall(
			function()
       game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
    end
 end)

 
spawn(function()
    while wait(.1) do
       if AFM then
          autofarm()
       end 
    end
 end)


 spawn(function() -- Hit
	while wait() do
	   if Hit then
		VirtualUser:CaptureController()
		VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
		VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
	   end
	end
 end)

 spawn(function()
    while wait(.1) do
		pcall(function()
       if AFM and LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == true then
			EquipWeapon(SelectWeapon1)
       end
	   if mobau then
		EquipWeapon(SelectWeapon1)
   	   end
	end)
    end
 end)

 spawn(function()
    while wait(.1) do
       if BL then
		lv = tonumber(_G.lv)
		pcall(function ()
		if game.Players.LocalPlayer.PlayerStats.lvl.Value >= lv then
			print("BREAK..!")
			loadstring(game:HttpGet("https://raw.githubusercontent.com/norapichx/BF-Utility/main/Serverhop.lua"))()
		end
	end)
       end 
    end
 end)

 tab:Toggle("Auto NewWorld", " ",false, function(x)
    AutoNewworld = x
    end)

 spawn(function()
    while wait(.1) do
       if AutoNewworld then
		pcall(
			function()
		if MyLevel >= 1500 and OldWorld then
		  if game.Players.LocalPlayer.Backpack:FindFirstChild("Map") then
			AFM = false
			AFB = false
             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8783.8584, 211.303848, 1708.29797)
             wait(0.5)
local args = {
    [1] = workspace.AntiTPNPC.Traveler
}

game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(unpack(args))
             wait(0.5)
			 pcall(
				function()
			 for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                    game:GetService("Players").LocalPlayer.PlayerGui.Traveler.Dialogue:WaitForChild("Accept").Position = UDim2.new(-1.5,0,-3.5)
                    game:GetService("Players").LocalPlayer.PlayerGui.Traveler.Dialogue:WaitForChild("Accept").Size = UDim2.new(35,35,35)
					game:GetService("Players").LocalPlayer.PlayerGui.Traveler.Dialogue:WaitForChild("Accept").BackgroundTransparency = 1
			end	
		end)
		wait(1)
			game:GetService("VirtualUser"):CaptureController()
			game:GetService("VirtualUser"):ClickButton1(Vector2.new())
			wait(4)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8783.8584, 211.303848, 1708.29797)
			wait(0.5)
local args = {
   [1] = workspace.AntiTPNPC.Traveler
}

game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(unpack(args))
			wait(0.5)
			pcall(
			   function()
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
				   game:GetService("Players").LocalPlayer.PlayerGui.Traveler.Dialogue:WaitForChild("Accept").Position = UDim2.new(-1.5,0,-3.5)
				   game:GetService("Players").LocalPlayer.PlayerGui.Traveler.Dialogue:WaitForChild("Accept").Size = UDim2.new(35,35,35)
				   game:GetService("Players").LocalPlayer.PlayerGui.Traveler.Dialogue:WaitForChild("Accept").BackgroundTransparency = 1
		   end	
	   end)
	   wait(1)
	   game:GetService("VirtualUser"):CaptureController()
	   game:GetService("VirtualUser"):ClickButton1(Vector2.new())
wait(4)
game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2329.33887, 49.1540298, -1998.07971)

local args = {
    [1] = workspace.AntiTPNPC:FindFirstChild("Elite Pirate")
}

game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(unpack(args))
wait(.2)
pcall(
function()
	for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
		   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").Position = UDim2.new(-1.5,0,-3.5)
		   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").Size = UDim2.new(35,35,35)
		   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").BackgroundTransparency = 1
   end	
end)
wait(1)
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton1(Vector2.new())

             end 
          end
		end)
		end
	end
end)


 tab:Line()

 tab:Toggle("Mob Aura", " ",false, function(moba) 
    mobau = moba
end)

function mobaura()

	pcall(
		function()         
				for i, v in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do             
				   if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and 
				   (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
					Hit = true
					repeat wait()  
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,dis,0) * CFrame.Angles(math.rad(-90),0,0)
						until not v.Parent or v.Humanoid.Health <= 0 or mobau == false
					Hit = false
				end
			   end
		end) 
end

spawn(function()
    while wait(.1) do
       if mobau then
		mobaura()
       end 
    end
 end)

tab:Toggle("Boss Aura", " ",false, function(vb) 
    AFB = vb
end)

function allboss()

	pcall(
		function()         
				for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do             
				   if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 100 then            
					repeat wait()  
						EquipWeapon(SelectWeapon1)
						game:GetService'VirtualUser':CaptureController()
						game:GetService'VirtualUser':Button1Down(Vector2.new(1240, 372))
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,dis,0) * CFrame.Angles(math.rad(-90),0,0)
						until not v.Parent or v.Humanoid.Health <= 0 or AFB == false
				end
			   end
		end) 
	
end

tab:Toggle("Find Boss", " ",false, function(fb)  -- แก้ Position ใหม่
	if AFB == true then
		Findboss = fb
	else
		Flux:Notification("Open Boss Aura!!","Okay!!")
	end
end)

spawn(function()
    while wait(.1) do
       if Findboss then
		findboss()
		end
       end 
 end)

function findboss()
	if OldWorld then
			game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2023.90918, 48.1932945, -1671.4873)
			wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4035.46411, 37.8441544, 244.575745)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1880.66003, 39.336544, 1225.96362)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3936.66357, 10.541934, 3236.86377)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(59.1432037, 99.4314957, -79.532135)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2826.00098, 18.0717945, 1388.91125)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1581.31677, 43.0943527, 3541.448)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-857.51886, 386.473694, 4839.23926)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8225.72559, 11.84688, 5523.85352)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4195.46582, 22.1771049, 6134.26416)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1085.04187, 226.748688, 8384.25488)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8587.34766, 81.4805832, 1592.68201)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3448.94653, 40.2424316, 13571.792)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6158.94434, 256.987762, -2141.6001)
			   wait(2)
			   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9625.23926, 37.7222023, -3846.9978)
			   wait(2)
	elseif newworld then
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-189.915604, 75.3443527, -5310.46973)
		wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3374.13647, 75.3949738, -5103.06982)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2762.21216, 75.3451385, -1699.57837)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3211.63965, 75.3451385, -1478.50134)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-338.920074, 75.3445282, -74.5727921)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3311.99365, 75.4035187, 1087.27673)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-935.340515, 74.7125549, 4231.95654)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4686.07275, 74.7577515, 4637.34033)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2711.08301, 51.5950127, 10289)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8639.99707, 14.445549, 1685.66064)
		   wait(2)
		   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9177.5459, 48.8062172, 1785.41931)
		   wait(2)
	end
end


spawn(function()
    while wait(.1) do
       if AFB then
		allboss()
	   end
    end
 end)

 if newworld then
 tab:Label("King Samurai : Spawns every 3-4 hours Drop rate of 50%")

 tab:Toggle("Auto Hell Sword (ENMA)", " ",false, function(en) 
    ENMA = en
end)
function autoENMA()

	pcall(
		function()         
			if game:GetService("Workspace").Monster.Boss:FindFirstChild("King Samurai [Lv. 3500]") then
				for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do             
				   if v.Name == "King Samurai [Lv. 3500]" then            
					repeat wait(.1)  
						EquipWeapon(SelectWeapon1)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
						game:GetService'VirtualUser':CaptureController()
						game:GetService'VirtualUser':Button1Down(Vector2.new(1240, 372))
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,dis,0) * CFrame.Angles(math.rad(-90),0,0)
						until not v.Parent or v.Humanoid.Health <= 0 or ENMA == false
				end
			   end
			else
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3617.84692, 508.8349, -1410.08398)
			end
		end) 
end

spawn(function()
    while wait(.1) do
       if ENMA then
		autoENMA()
       end 
    end
 end)
end

if OldWorld then
	tab:Label("Swordsman : appears every 2 hours and will de-spawn after 30 minutes")
   
	tab:Toggle("Auto Saber", " ",false, function(sb) 
	   SABER = sb
   end)
   function autoSaber()
   
	   pcall(
		   function()         
			   if game:GetService("Workspace").Monster.Boss:FindFirstChild("Expert Swordsman [Lv. 3000]") then
				   for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do             
					  if v.Name == "Expert Swordsman [Lv. 3000]" then            
					   repeat wait()  
						   EquipWeapon(SelectWeapon1)
						   game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
						   game:GetService'VirtualUser':CaptureController()
						   game:GetService'VirtualUser':Button1Down(Vector2.new(1240, 372))
						   game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,dis,0) * CFrame.Angles(math.rad(-90),0,0)
						   until not v.Parent or v.Humanoid.Health <= 0 or SABER == false
				   end
				  end
			   else
				   game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9614.0625, 37.7222023, -3778.05054)
			   end
		   end) 
   end
   
   spawn(function()
	   while wait(.1) do
		  if SABER then
			autoSaber()
		  end 
	   end
	end)
   end

tab:Line()
 
 tab:Toggle("Auto Buso"," ",true,function(bu)
    buso = bu
end)

spawn(function()
    while wait(1) do 
       if buso then 
		if game.Players.LocalPlayer.Character.Haki.Value == 0 then
game:GetService("Players").LocalPlayer.Character.Services.Client.Armament:FireServer()
		end
		end
	end
 end)

   tab:Toggle("Auto Skill Z", " ", false, function(z)
 	skillz = z
 end)

 tab:Toggle("Auto Skill X", " ", false, function(x)
 	skillx = x
 end)
 tab:Toggle("Auto Skill C", " ", false, function(c)
 	skillc = c
 end)
 tab:Toggle("Auto Skill V", " ", false, function(v)
 	skillv = v
 end)

 spawn(function()
	while wait(1) do
		if skillz then
			pcall(function()
			game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart) -- z
			game:GetService("VirtualInputManager"):SendKeyEvent(false,122,true,game.Players.LocalPlayer.Character.HumanoidRootPart)
			game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			end)
 		end
 	end
 	end)

 	spawn(function()
		while wait(1) do
			if skillx then
				pcall(function()
				game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart) -- x
				game:GetService("VirtualInputManager"):SendKeyEvent(false,120,true,game.Players.LocalPlayer.Character.HumanoidRootPart)
				game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart) 
				end)
 			end
 		end
 		end)

 		spawn(function()
 			while wait(1) do
				if skillc then
					pcall(function()
					game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart) -- c
					game:GetService("VirtualInputManager"):SendKeyEvent(false,99,true,game.Players.LocalPlayer.Character.HumanoidRootPart)
					game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart) 
					end)
 				end
 			end
 			end)

			spawn(function()
 				while wait(1) do
 					if skillv then
						pcall(function()
						game:GetService("VirtualInputManager"):SendKeyEvent(true,118,false,game.Players.LocalPlayer.Character.HumanoidRootPart) -- v
						game:GetService("VirtualInputManager"):SendKeyEvent(false,118,true,game.Players.LocalPlayer.Character.HumanoidRootPart)
						game:GetService("VirtualInputManager"):SendKeyEvent(false,118,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						end)
 					end
 				end
 				end)

local Stats = win:Tab("Stats", "http://www.roblox.com/asset/?id=6023426974")
melee = false
Stats:Toggle("✊   Melee","",false,function(value)
   melee = value
end)
defense = false
Stats:Toggle("❤️  Defense","",false,function(value)
  defense = value
end)
sword = false
Stats:Toggle("⚔️  Sword","",false,function(value)
  sword = value
end)
demonfruit = false
Stats:Toggle("✨  Blox Fruit","",false,function(value)
   demonfruit = value
end)

value = 1
Stats:Slider("Set Point","",1,1524,1,function(p)
    value = (p)
    end)

    spawn(function()
        while wait() do
          if melee then
			pcall(function()
local args = {
    [1] = "Melee",
    [2] = value
}

game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))
end)
          end 
          if defense then
			pcall(function()
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "Defense",
    [2] = value
}

game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))

end)
          end 
          if sword then

pcall(function()
-- Script generated by SimpleSpy - credits to exx#9394

local args = {
    [1] = "Sword",
    [2] = value
}

game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))

end)

          end 
          if demonfruit then
			pcall(function()

local args = {
    [1] = "Devil Fruit",
    [2] = value
}

game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))

end)
          end
        end
        end)

 local Teleport = win:Tab("Teleport ", "http://www.roblox.com/asset/?id=6023426906")
 if newworld then -- โลกใหม่
	Teleport:Button("✈️ First Sea","", function()
		while true do wait()
			game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1907.03601, 72.3570099, -1995.37585)
	
			local args = {
				[1] = workspace.AntiTPNPC:FindFirstChild("Elite Pirate")
			}
			
			game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(unpack(args))
			wait(1)
			pcall(
			function()
				for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
					   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").Position = UDim2.new(-1.5,0,-3.5)
					   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").Size = UDim2.new(35,35,35)
					   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").BackgroundTransparency = 1
					   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").ImageTransparency = 1
			   end	
			end)
			wait(1)
			game:GetService("VirtualUser"):CaptureController()
			game:GetService("VirtualUser"):ClickButton1(Vector2.new())
		end
	  end)

   elseif OldWorld then
	Teleport:Button("✈️ Second Sea","", function()
		while true do wait()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1834.88977, 22.6869621, -1482.9231)

		local args = {
			[1] = workspace.AntiTPNPC:FindFirstChild("Elite Pirate")
		}
		
		game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(unpack(args))
		wait(1)
		pcall(
		function()
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
				   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").Position = UDim2.new(-1.5,0,-3.5)
				   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").Size = UDim2.new(35,35,35)
				   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").BackgroundTransparency = 1
				   game:GetService("Players").LocalPlayer.PlayerGui["Elite Pirate"].Dialogue:WaitForChild("Accept").ImageTransparency = 1
		   end	
		end)
		wait(1)
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):ClickButton1(Vector2.new())
	end
	  end)
  end


  Teleport:Line()

  
 if OldWorld then
 Teleport:Button("Louge town"," ",function()
 game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2023.90918, 48.1932945, -1671.4873)
end)
Teleport:Button("Pirate Island"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4035.46411, 37.8441544, 244.575745)
   end)
   Teleport:Button("Shells town"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1880.66003, 39.336544, 1225.96362)
   end)
   Teleport:Button("Arlong Park"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3936.66357, 10.541934, 3236.86377)
   end)
   Teleport:Button("Baratie"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(59.1432037, 99.4314957, -79.532135)
   end)
   Teleport:Button("Snow Island"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2826.00098, 18.0717945, 1388.91125)
   end)
   Teleport:Button("Desert Island"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1581.31677, 43.0943527, 3541.448)
   end)
   Teleport:Button("Sky Island"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-857.51886, 386.473694, 4839.23926)
   end)
   Teleport:Button("Bubble Island"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8225.72559, 11.84688, 5523.85352)
   end)
   Teleport:Button("Enies Lobby"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4195.46582, 22.1771049, 6134.26416)
   end)
   Teleport:Button("Thriller Bark"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1085.04187, 226.748688, 8384.25488)
   end)
   Teleport:Button("Marineford"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8587.34766, 81.4805832, 1592.68201)
   end)
   Teleport:Button("Fish Man Island"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3448.94653, 40.2424316, 13571.792)
   end)
   Teleport:Button("Rock Island"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6158.94434, 256.987762, -2141.6001)
   end)
   Teleport:Button("Stone Arena"," ",function()
    game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9625.23926, 37.7222023, -3846.9978)
   end)
elseif newworld then
    Teleport:Button("Dock"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1889.65491, 72.3570099, -2091.01074)
    end)
	Teleport:Button("Fons Land"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(212.100159, 75.3445282, -4806.19189)
    end)
	Teleport:Button("Hibernus Land"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1398.89893, 75.3445282, -5781.67139)
    end)
	Teleport:Button("Floresco Land"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2254.35913, 75.3446808, -1809.35315)
    end)
	Teleport:Button("Carcer Land"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-89.7725754, 75.3446808, 238.019348)
    end)
	Teleport:Button("King Samurai (Raid Boss)"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3617.84692, 508.8349, -1410.08398)
    end)
	Teleport:Button("Torrefacio"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3610.31909, 75.3496933, 522.277527)
    end)
	Teleport:Button("Viridans"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2930.32959, 74.7022629, 3004.95239)
    end)
	Teleport:Button("Skull Island"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3438.10791, 51.4371223, 10338.6338)
    end)
	Teleport:Button("Dead Tundra"," ",function()
        game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8431.08398, 14.3615818, 990.840576)
    end)
end

local Teleport2 = win:Tab("Teleport NPC", "http://www.roblox.com/asset/?id=6034503375")
if OldWorld then
Teleport2:Button("Black Market"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2133.73657, 79.9022598, -1596.13232)
end)
Teleport2:Button("Gacha"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2015.10571, 48.1432877, -1727.69031)
end)
Teleport2:Button("Delete Fruit"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-930.983154, 386.420685, 4756.65137)
end)
Teleport2:Button("Reset Stats"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2049.5708, 48.1432991, -1802.85901)
end)
Teleport2:Button("Random Appearance"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2095.91748, 49.3003693, -1766.4021)
end)
Teleport2:Button("Soru Shop"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1643.65637, 40.609642, 1174.27539)
end)
Teleport2:Button("Buso Shop"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8137.15918, 12.7555771, 5436.8208)
end)
Teleport2:Button("Ken Shop"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-892.359741, 386.964813, 4697.16016)
end)
Teleport2:Button("Pipe Shop"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8103.03223, 11.8468285, 5374.82129)
end)
Teleport2:Button("Triple Katana"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6227.92041, 26.5671806, -2121.84155)
end)
Teleport2:Button("Mini Mace"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8700.28711, 310.095123, 1923.63208)
end)
Teleport2:Button("DarkLeg Shop"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6433.2915, 103.330521, -2334.13794)
end)
Teleport2:Button("Cyborg"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4581.2666, 123.651573, 3224.02539)
end)
Teleport2:Button("Water Style"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2857.86548, 40.2725754, 14145.1279)
end)
Teleport2:Button("Traveler"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8783.8584, 211.303848, 1708.29797)
end)
Teleport2:Button("Elite Pirate"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1836.13538, 17.2347126, -1483.94019)
end)
elseif newworld then
	Teleport2:Button("Black Market"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1908.87976, 72.3570099, -2100.90552)
	end)
	Teleport2:Button("Gacha"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2326.70313, 75.4357529, -1890.0199)
	end)
	Teleport2:Button("Reset Stats"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2274.44263, 75.294342, -1778.19775)
	end)
	Teleport2:Button("DarkLeg Shop"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(783.430359, 75.2943649, -4034.49854)
	end)
	Teleport2:Button("Cyborg"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(841.562561, 76.1378403, -4033.59741)
	end)
	Teleport2:Button("Water Style"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(851.139587, 75.2943649, -3968.21313)
	end)
	Teleport2:Button("Dragon Claw"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(246.915741, 432.900879, -936.023315)
	end)
	Teleport2:Button("Awake Master"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2067.57422, 169.789749, 5003.48877)
	end)
	Teleport2:Button("Random Appearance"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1338.28735, 75.8476715, -2216.00391)
	end)
end

local Players = win:Tab("Players", "http://www.roblox.com/asset/?id=6022668898")


PlayerName = {}
for i,v in pairs(game.Players:GetChildren()) do  
    table.insert(PlayerName ,v.Name)
end
local Player = Players:Dropdown("Select Player",PlayerName,function(plys) --true/false, replaces the current title "Dropdown" with the option that t
    KillPlayer = plys
    SelectedPly:Refresh(plys)
end)

Players:Button("Refrsh Player","",function()
    PlayerName = {}
    Player:Clear()
    for i,v in pairs(game.Players:GetChildren()) do  
       Player:Add(v.Name)
    end
end)
Players:Line()

Players:Toggle("Kill Player"," ",false,function(bool)
    pk = bool
    local plr1 = game.Players.LocalPlayer.Character
    local plr2 = game.Players:FindFirstChild(KillPlayer)
    repeat wait(.1)
        plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
        game:GetService'VirtualUser':CaptureController() -- Click
        game:GetService'VirtualUser':Button1Down(Vector2.new(1270, 371))
    until pk == false
end)

Players:Toggle("Ctrl + Click = TP","",false,function(vu)
   CTRL = vu
end)

local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:connect(
   function()
       if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
           return
       end
       if not Mouse.Target then
           return
       end
       if CTRL then
           Plr.Character:MoveTo(Mouse.Hit.p)
       end
   end)

Players:Toggle("Spectate Player"," ",false,function(bool)
   Sp = bool
   local plr1 = game.Players.LocalPlayer.Character.Humanoid
   local plr2 = game.Players:FindFirstChild(KillPlayer)
   repeat wait(.1)
      game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
   until Sp == false 
   game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)

Players:Button("Teleport Player"," ",function()
    local plr1 = game.Players.LocalPlayer.Character
    local plr2 = game.Players:FindFirstChild(KillPlayer)
    plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
end)

Players:Line()

   Players:Slider("Walkspeed", " ",36,500,0,function(value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
  end)
  Players:Slider("JumpPower", " ",50,500,0,function(value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
  end)


  local Dungeon = win:Tab("Dungeon", "http://www.roblox.com/asset/?id=6023565902")

  if OldWorld then
  Dungeon:Button("Teleport Raid"," ",function()
	game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8699.43457, 103.673241, 1588.67957)
   end)
   elseif newworld then 
	Dungeon:Button("Teleport Raid"," ",function()
		game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1559.97485, 677.027893, -2822.86304, 0, 0, 1, 0, 1, -0, -1, 0, 0)
	end)
end

Dungeon:Label("Raid Aura : It is recommended to enable the auto skill.")

  Dungeon:Toggle("Raid Aura"," ",false,function(kuy)
	if game.PlaceId == 5931540094 then
		raidaura = kuy
	else
		Flux:Notification("Used only in Raid.","Okay!!")
	end
   end)

   spawn(function()
	while wait(.1) do
	  if raidaura then
		godmode = true
		for i,v in pairs(game:GetService("Workspace").MOB:GetChildren()) do
			   pcall(function()
				if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then            
					repeat wait(.1)  
						game:GetService'VirtualUser':CaptureController()
						game:GetService'VirtualUser':Button1Down(Vector2.new(1240, 372))
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,5,0) * CFrame.Angles(math.rad(-90),0,0)
						until not v.Parent or v.Humanoid.Health <= 0 or raidaura == false
				end
			end)
		end
		end
	end
end)

spawn(function()
    while wait(.1) do
       if raidaura then
		pcall(function()
			EquipWeapon(SelectWeaponraid)
			wait(.1)
			EquipWeapon(SelectWeaponraid2)
			wait(.1)
			EquipWeapon(SelectWeaponraid3)
			wait(.1)
		end)
       end
    end
 end)

   local SelectWeaponraid = Dungeon:Dropdown("Select Weapon (Raid)",Wapon,function(Value)
    SelectWeaponraid = Value
end)

local SelectWeaponraid2 = Dungeon:Dropdown("Select Weapon (Raid 2)",Wapon,function(Value2)
    SelectWeaponraid2 = Value2
end)

local SelectWeaponraid3 = Dungeon:Dropdown("Select Weapon (Raid 3)",Wapon,function(Value3)
    SelectWeaponraid3 = Value3
end)

Dungeon:Button("Refresh Weapon"," ",function()
    SelectWeaponraid:Clear()
	SelectWeaponraid2:Clear()
	SelectWeaponraid3:Clear()
    Wapon = {}
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
		if v:IsA("Tool") then
			SelectWeaponraid:Add(v.Name)
			SelectWeaponraid2:Add(v.Name)
			SelectWeaponraid3:Add(v.Name)
		end
	end
end)



local Misc = win:Tab("Misc", "http://www.roblox.com/asset/?id=6022668883")

local TextLabel = Instance.new("TextLabel",game:GetService("Players") ["LocalPlayer"].PlayerGui.Chat)  -- เวลา
TextLabel.Active = false 
TextLabel.AnchorPoint = Vector2.new(0, 0) 
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1) 
TextLabel.BackgroundTransparency = 1 
TextLabel.BorderColor3 = Color3.new(1, 0.333333, 0) 
TextLabel.BorderMode = Enum.BorderMode.Outline 
TextLabel.BorderSizePixel = 1 
TextLabel.LayoutOrder = 0 
TextLabel.Name = "Timers" 
TextLabel.Position = UDim2.new(0, 0, 0, -30)
TextLabel.Rotation = 0 
TextLabel.Selectable = false 
TextLabel.Size = UDim2.new(1, 0, 0, 30) 
TextLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY 
TextLabel.Visible = true 
TextLabel.ZIndex = 1 
TextLabel.Archivable = true 
TextLabel.ClipsDescendants = false 
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.LineHeight = 1 
TextLabel.RichText = false 
TextLabel.Text = "Timers" 
TextLabel.TextColor3 = Color3.fromRGB(235, 64, 52) 
TextLabel.TextScaled = false
TextLabel.TextSize = 30
TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) 
TextLabel.TextStrokeTransparency = 1 
TextLabel.TextTransparency = 0 
TextLabel.TextTruncate = Enum.TextTruncate.None 
TextLabel.TextWrapped = true
TextLabel.TextStrokeTransparency = 0

game:GetService("Players")["LocalPlayer"].PlayerGui.Chat.Timers.Visible = false

	 Misc:Toggle("Server Timer"," ",false,function(time)
servertime = time
if servertime == false then
	game:GetService("Players")["LocalPlayer"].PlayerGui.Chat.Timers.Visible = false
end

	 	    -- เวลาเซิฟ
			 
			 _G.Loop = servertime
			 while _G.Loop do
			 wait()
			 
			 local seconds = math.floor(game.Workspace.DistributedGameTime)
			 local minutes = math.floor(game.Workspace.DistributedGameTime / 60)
			 local hours = math.floor(game.Workspace.DistributedGameTime / 60 / 60)
			 local seconds = seconds - (minutes * 60)
			 local minutes = minutes - (hours * 60)
			 
			 
			 if hours < 1 then
				 if minutes < 1 then
					 TextLabel.Text = ("Server Time : "..hours.." Hr. "..minutes.. " Min. "..seconds.." Sec.")
				 else
					 TextLabel.Text = ("Server Time : "..hours.." Hr. "..minutes.. " Min. "..seconds.." Sec.")
				 end
			 else
				 TextLabel.Text = ("Server Time : "..hours.." Hr. "..minutes.. " Min. "..seconds.." Sec.")
			 end
			 end
	 end)


	 spawn(function()
		while wait(.1) do
		   if servertime then
	 if game:GetService("Players")["LocalPlayer"].PlayerGui.Chat.Timers.Visible == false then
		game:GetService("Players")["LocalPlayer"].PlayerGui.Chat.Timers.Visible = true 
		end
	end
end
end)

Misc:Button("Invisible Mode"," ",function() -- Ghost
   game.Players.LocalPlayer.Character.LowerTorso:Destroy()
   end)

Misc:Toggle("Semi God"," ",false,function(value)
	godmode = value
 end)

 spawn(function()
    while wait(.1) do
       if godmode then
		pcall(function()
        game.Players.LocalPlayer.Character.KenHaki:Destroy()
		end)
       end
    end
 end)

 Misc:Toggle("infinity Geppo"," ",false,function(bool)
    _G.Gppor = bool
    
    while _G.Gppor do
    wait()
    game:GetService("Players").LocalPlayer.Backpack.GeppoNew.cds.Value = 7
    end
    end)

 Misc:Toggle("Water No Damage"," ",false,function(bool)
    _G.Swin = bool
    
    while _G.Swin do
    wait(1)
    
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack.SwimScript:GetChildren()) do
    
        if v.Name == "RemoteEvent" then
            v:Destroy()
        end
        
    end
    end
    end)


		Misc:Button("FPS Boost"," ",function()
			local a = game
			local b = a.Workspace
			local c = a.Lighting
			local d = b.Terrain
			d.WaterWaveSize = 0
			d.WaterWaveSpeed = 0
			d.WaterReflectance = 0
			d.WaterTransparency = 0
			c.GlobalShadows = false
			c.FogEnd = 9e9
			c.Brightness = 0
			settings().Rendering.QualityLevel = "Level01"
			for e, f in pairs(a:GetDescendants()) do
			   if f:IsA("Part") or f:IsA("Union") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
				   f.Material = "Plastic"
				   f.Reflectance = 0
			   elseif f:IsA("Decal") or f:IsA("Texture") then
				   f.Transparency = 0
			   elseif f:IsA("ParticleEmitter") or f:IsA("Trail") then
				   f.Lifetime = NumberRange.new(0)
			   elseif f:IsA("Explosion") then
				   f.BlastPressure = 0
				   f.BlastRadius = 0
			   elseif f:IsA("Fire") or f:IsA("SpotLight") or f:IsA("Smoke") or f:IsA("Sparkles") then
				   f.Enabled = false
			   elseif f:IsA("MeshPart") then
				   f.Material = "Plastic"
				   f.Reflectance = 0
				   f.TextureID = 10385902758728957
			   end
			end
			for e, g in pairs(c:GetChildren()) do
			   if
				   g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or
					   g:IsA("DepthOfFieldEffect")
				then
				   g.Enabled = false
			   end
			end
			sethiddenproperty(game.Lighting, "Technology", "Compatibility")
	
	 wait(0.5)
	   wait(.1)
	   local Lighting = game:GetService("Lighting")
	   Lighting.FogEnd = 2500000
	   Lighting.FogStart = 2500000
	
		end)
    
		Misc:Line()

Misc:Textbox("Music ID", "Music ID", false, function(ID)
    music = tonumber(ID)
    print(music)
	game:GetService("Players")["LocalPlayer"].PlayerScripts.Sound:Destroy()
        end)

		
 
Volumes = 1
Misc:Toggle("Music : Play"," ",false,function(song)
	if song == false then
		game:GetService("Players")["LocalPlayer"].PlayerScripts.Sound:Destroy()
	end
	if song == true then
	local s = Instance.new("Sound")

	s.Name = "Sound"
	s.SoundId = "rbxassetid://"..tostring(music)
	s.Volume = Volumes
	s.Looped = true
	s.archivable = false
	 
	s.Parent = game:GetService("Players")["LocalPlayer"].PlayerScripts
	 
        s:play()
    else
        s:stop()
	end
end)

Misc:Slider("Set Volume"," ",0,10,0,function(valuesong)
	Volumes = valuesong
	game:GetService("Players")["LocalPlayer"].PlayerScripts.Sound.Volume = valuesong
end)
if OldWorld then
Misc:Toggle("Show MiniMAP"," ",false,function(map)
	if map == true then
local ImageLabel = Instance.new("ImageLabel",game:GetService("Players") ["LocalPlayer"].PlayerGui.Chat)
ImageLabel.Active = false 
ImageLabel.AnchorPoint = Vector2.new(0, 0) 
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1) 
ImageLabel.BackgroundTransparency = 0 
ImageLabel.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843) 
ImageLabel.BorderMode = Enum.BorderMode.Outline 
ImageLabel.BorderSizePixel = 1 
ImageLabel.LayoutOrder = 0 
ImageLabel.Name = "MAP" 
ImageLabel.Position = UDim2.new(0.00814999547, 0, 0.018394649, 0) 
ImageLabel.Rotation = 0 
ImageLabel.Selectable = false 
ImageLabel.Size = UDim2.new(0, 880, 0, 575) 
ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY 
ImageLabel.Visible = true 
ImageLabel.ZIndex = 1 
ImageLabel.Archivable = true 
ImageLabel.ClipsDescendants = false 
ImageLabel.Image = "rbxassetid://6807246008" 
ImageLabel.ImageColor3 = Color3.new(1, 1, 1) 
ImageLabel.ImageRectOffset = Vector2.new(0, 0) 
ImageLabel.ImageRectSize = Vector2.new(0, 0) 
ImageLabel.ImageTransparency = 0 
ImageLabel.ScaleType = Enum.ScaleType.Stretch 
ImageLabel.SliceScale = 1 
	else
		for i,v in pairs(game:GetService("Players")["LocalPlayer"].PlayerGui.Chat:GetDescendants()) do
			if v.Name == "MAP" then
				v:Destroy()
			end
		end
	end
end)
end
	
Misc:Button("Spawn Coffin Boat"," ",function() 

local args = {
    [1] = "CoffinBoat",
    [2] = "ShipA"
}

game:GetService("ReplicatedStorage").Remotes.Events.Ship:FireServer(unpack(args))

end)

Misc:Button("Redeem AllCode"," ",function() -- Code

local args = {
    [1] = "SORRYFORSHUTDOWN"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))
wait(.2)
local args = {
    [1] = "300MVISITS"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))
wait(.2)
local args = {
    [1] = "500KFAV"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))
wait(.2)
local args = {
    [1] = "GasGas"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))
wait(.2)
local args = {
    [1] = "DinoxLive"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))
wait(.2)
local args = {
    [1] = "REDBIRD"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))
wait(.2)
local args = {
    [1] = "BeckyStyle"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))
wait(.2)
local args = {
    [1] = "Peodiz"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))
wait(.2)
local args = {
    [1] = "KingPieceComeBack"
}

game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer(unpack(args))

	end)

	Fly = false  
	function activatefly()
	   local mouse=game.Players.LocalPlayer:GetMouse''
	   localplayer=game.Players.LocalPlayer
	   game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	   local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
	   local speedSET=25
	   local keys={a=false,d=false,w=false,s=false}
	   local e1
	   local e2
	   local function start()
		  local pos = Instance.new("BodyPosition",torso)
		  local gyro = Instance.new("BodyGyro",torso)
		  pos.Name="EPIXPOS"
		  pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
		  pos.position = torso.Position
		  gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		  gyro.cframe = torso.CFrame
		  repeat
				wait()
				localplayer.Character.Humanoid.PlatformStand=true
				local new=gyro.cframe - gyro.cframe.p + pos.position
				if not keys.w and not keys.s and not keys.a and not keys.d then
				   speed=1
				end
				if keys.w then
				   new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
				   speed=speed+speedSET
				end
				if keys.s then
				   new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
				   speed=speed+speedSET
				end
				if keys.d then
				   new = new * CFrame.new(speed,0,0)
				   speed=speed+speedSET
				end
				if keys.a then
				   new = new * CFrame.new(-speed,0,0)
				   speed=speed+speedSET
				end
				if speed>speedSET then
				   speed=speedSET
				end
				   pos.position=new.p
				if keys.w then
				   gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
				elseif keys.s then
				   gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
				else
				   gyro.cframe = workspace.CurrentCamera.CoordinateFrame
				end
		  until not Fly
		  if gyro then 
				   gyro:Destroy() 
		  end
		  if pos then 
				   pos:Destroy() 
		  end
		  flying=false
		  localplayer.Character.Humanoid.PlatformStand=false
		  speed=0
	   end
	   e1=mouse.KeyDown:connect(function(key)
		  if not torso or not torso.Parent then 
				flying=false e1:disconnect() e2:disconnect() return 
		  end
		  if key=="w" then
			 keys.w=true
		  elseif key=="s" then
			 keys.s=true
		  elseif key=="a" then
			 keys.a=true
		  elseif key=="d" then
			 keys.d=true
		  end
	   end)
	   e2=mouse.KeyUp:connect(function(key)
		  if key=="w" then
			 keys.w=false
		  elseif key=="s" then
			 keys.s=false
		  elseif key=="a" then
			 keys.a=false
		  elseif key=="d" then
			 keys.d=false
		  end
	   end)
	   start()
	end

	Misc:Toggle("Fly"," ",false,function(Value)
		Fly = Value
		activatefly()
	 end)

	 Misc:Toggle("No Clip"," ",false,function(t)
		if t == true then
		_G.conn = game:GetService("RunService").Stepped:Connect(function()
			for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false    
				end
			end
		 end)
		else
		 _G.conn:Disconnect()
		end
	end)

	Misc:Toggle("No Clip 2 "," ",false,function(noclip)
		if noclip == true then
		_G.conn = game:GetService("RunService").Stepped:Connect(function()
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		 end)
		else
		 _G.conn:Disconnect()
		end
	end)


 local fruit = win:Tab("Devil Fruit", "http://www.roblox.com/asset/?id=6023426906")

 fruit:Toggle("Bring Fruit"," ",false,function(t)
    tpfruit = t
 end)

 spawn(function()
    while wait(.1) do
       if tpfruit then
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:IsA "Tool" then -- ผลดรอปจากคน
                v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
         end
       end
 end)

 fruitstock = {           -- list ชื่อผลใน shop
	"BombBomb",
	"WolfWolf",
	"BarrierBarrier",
	"DarkDark",
	"DragonDragon",
	"FlameFlame",
	"GiraffeGiraffe",
	"GumGum",
	"HumanHuman",
	"IceIce",
	"LeopardLeopard",
	"LightLight",
	"LoveLove",
	"MagmaMagma",
	"OpOp",
	"PawPaw",
	"PhoenixPhoenix",
	"QuakeQuake",
	"RumbleRumble",
	"SandSand",
	"ShadowShadow",
	"SnowSnow",
	"StringString",
	"SnowSnow",
	"VenomVenom",
	"BuddhaBuddha",
	"SpinoSpino",
	"AlloAllo",
	"DoughDough",
	"BrachioBrachio" -- 30 ผล
	   }

 SelectDevil = ""

fruit:Dropdown("Devil Fruit Sniper",fruitstock,function(ply) 
	SelectDevil = ply
   end)

   fruit:Toggle("DevilFruit Sniper"," ",false,function(value)
	if SelectDevil == "" and value then
	   Flux:Notification("Select Devil Fruit","Okay!!")
	elseif value then
	   BuyFruitSinper = value
	end	
 end)
 
 spawn(function()
	while wait(2) do
	   if BuyFruitSinper then

local args = {
    [1] = SelectDevil,
    [2] = true
}

game:GetService("ReplicatedStorage").Remotes.Functions.dfbeli:InvokeServer(unpack(args))

	   end 
	end
 end)

 local Game = win:Tab("Game", "http://www.roblox.com/asset/?id=6031225816") 

 Game:Button("Rejoin","",function()
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	ts:Teleport(game.PlaceId, p)
 end)
 Game:Button("Teleport to lower server","",function()
   getgenv().AutoTeleport = true
   getgenv().DontTeleportTheSameNumber = false --If you set this true it won't teleport to the server if it has the same number of players as your current server
   getgenv().CopytoClipboard = false
   
   if not game:IsLoaded() then
	   print("Game is loading waiting... | Amnesia Empty Server Finder")
	   repeat
		   wait()
	   until game:IsLoaded()
	   end
   
   local maxplayers = math.huge
   local serversmaxplayer;
   local goodserver;
   local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
   
   function serversearch()
	   for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
		   if type(v) == "table" and maxplayers > v.playing then
			   serversmaxplayer = v.maxPlayers
			   maxplayers = v.playing
			   goodserver = v.id
		   end
	   end
	   print("Currently checking the servers with max this number of players : " .. maxplayers .. " | Amnesia Empty Server Finder")
   end
   
   function getservers()
	   serversearch()
	   for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
		   if i == "nextPageCursor" then
			   if gamelink:find("&cursor=") then
				   local a = gamelink:find("&cursor=")
				   local b = gamelink:sub(a)
				   gamelink = gamelink:gsub(b, "")
			   end
			   gamelink = gamelink .. "&cursor=" ..v
			   getservers()
		   end
	   end
   end
   
   getservers()
   
	   print("All of the servers are searched") 
	   print("Server : " .. goodserver .. " Players : " .. maxplayers .. "/" .. serversmaxplayer .. " | Amnesia Empty Server Finder")
	   if CopytoClipboard then
	   setclipboard(goodserver)
	   end
	   if AutoTeleport then
		   if DontTeleportTheSameNumber then 
			   if #game:GetService("Players"):GetPlayers() - 1 == maxplayers then
				   return warn("It has same number of players (except you)")
			   elseif goodserver == game.JobId then
				   return warn("Your current server is the most empty server atm") 
			   end
		   end
		   print("AutoTeleport is enabled. Teleporting to : " .. goodserver)
		   game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
	   end
end)

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
  AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
  table.insert(AllIDs, actualHour)
  writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
  local Site;
  if foundAnything == "" then
	  Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
  else
	  Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
  end
  local ID = ""
  if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
	  foundAnything = Site.nextPageCursor
  end
  local num = 0;
  for i,v in pairs(Site.data) do
	  local Possible = true
	  ID = tostring(v.id)
	  if tonumber(v.maxPlayers) > tonumber(v.playing) then
		  for _,Existing in pairs(AllIDs) do
			  if num ~= 0 then
				  if ID == tostring(Existing) then
					  Possible = false
				  end
			  else
				  if tonumber(actualHour) ~= tonumber(Existing) then
					  local delFile = pcall(function()
						  delfile("NotSameServers.json")
						  AllIDs = {}
						  table.insert(AllIDs, actualHour)
					  end)
				  end
			  end
			  num = num + 1
		  end
		  if Possible == true then
			  table.insert(AllIDs, ID)
			  wait()
			  pcall(function()
				  writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
				  wait()
				  game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
			  end)
			  wait(4)
		  end
	  end
  end
end

function Teleport()
  while wait() do
	  pcall(function()
		  TPReturner()
		  if foundAnything ~= "" then
			  TPReturner()
		  end
	  end)
  end
end


 Game:Button("Server Hop"," ",function() -- copy  P shoji & P nate
	Teleport()
 end)
 Game:Button("TP Chest Sea Beast"," ",function() -- copy  P shoji & P nate
local MyCF = game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame
for i,v in pairs(game:GetService("Workspace").Island:GetDescendants()) do
    if v:IsA("Model") then
        if v.Name:find("Legacy Island") then
            game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Island[v.Name].ChestSpawner.Position)
            print(ChestP)
        end
    end
end
 end)
        

 Game:Label("UI Toggle : Right-Ctrl")
 Game:Line()

Game:Button("Delete Ui"," ",function()
 local ui = game:GetService("CoreGui"):FindFirstChild(_G.Ui)
	ui:Destroy()
end)
end
