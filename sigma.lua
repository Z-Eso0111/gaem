if game.ReplicatedStorage:FindFirstChild(game.Players.LocalPlayer.Name .. "_XXxx[plkmnjhbvklnjawdewdaadbnhxd_Workspace]") then
	
else
	TextChatService = game:GetService("TextChatService")
	isLegacyChat = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService
	ReplicatedStorage = game:GetService("ReplicatedStorage")
	local function chatMessage(str,where)
		str = tostring(str)
		if not isLegacyChat then
			TextChatService.TextChannels.RBXGeneral:SendAsync(str)
		else
			ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, where)
		end
	end
	chatMessage('⁆▢Woa!▢⁅', "All")
	warn("Script Started")
	wait(2)
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local Camera = workspace.CurrentCamera

	player.CharacterAdded:Connect(function(newChar)
		char = newChar
	end)

	local isSpectating = false
	local spectateConnection

	local function startCycleSpectate()
		if isSpectating then return end
		isSpectating = true

		local players = Players:GetPlayers()
		local currentIndex = 1

		spectateConnection = task.spawn(function()
			while isSpectating do
				if player.Team.Name == "playing" then
					stopCycleSpectate()
				else
					local currentPlayer = players[currentIndex]

					if currentPlayer and currentPlayer.Character and currentPlayer ~= Players.LocalPlayer then
						local humanoid = currentPlayer.Character:FindFirstChild("Humanoid")
						if humanoid then
							Camera.CameraSubject = humanoid
						end
					end

					currentIndex += 1
					if currentIndex > #players then
						currentIndex = 1
					end

					task.wait(10)
				end
			end
		end)
	end

	local function stopCycleSpectate()
		if not isSpectating then return end
		isSpectating = false
		Camera.CameraSubject = Players.LocalPlayer.Character:FindFirstChild("Humanoid")
		if spectateConnection then
			task.cancel(spectateConnection)
		end
	end

	local UwU = Instance.new("Part")
	UwU.BottomSurface = Enum.SurfaceType.Smooth
	UwU.TopSurface = Enum.SurfaceType.Smooth
	UwU.CanCollide = false
	UwU.Anchored = false
	UwU.Name = "UwU"
	UwU.Parent = char

	local Mesh = Instance.new("SpecialMesh")
	Mesh.MeshType = Enum.MeshType.FileMesh
	Mesh.MeshId = "rbxassetid://145815862"
	Mesh.TextureId = "rbxassetid://145815901"
	Mesh.Scale = Vector3.new(0.4, 0.4, 0.4)
	Mesh.Parent = UwU

	local Motor6D_Sigma = Instance.new("Motor6D")
	Motor6D_Sigma.Part0 = char:WaitForChild("Torso") or char:WaitForChild("UpperTorso")
	Motor6D_Sigma.Part1 = UwU

	Motor6D_Sigma.C0 = CFrame.new(-0.653, 0.467, -0.512) * CFrame.Angles(math.rad(58.6), math.rad(-47.266), math.rad(19.519))
	Motor6D_Sigma.Parent = UwU

	task.wait()

	local afk = Instance.new("BoolValue")

	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")
	local cloneref = cloneref or function(o) return o end

	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		local VirtualUser = cloneref(game:GetService("VirtualUser"))
		Players.LocalPlayer.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end

	local candyFold = workspace:WaitForChild("events")
	local badstuf = false

	script.Parent = player.PlayerScripts
	local WorkspaceFold = Instance.new("Folder",game.Workspace)
	WorkspaceFold.Name = player.Name .. "_XXxx[plkmnjhbvklnjawdewdaadbnhxd_Workspace]"

	local Box = Instance.new("Model")
	Box.Name = "Box"
	Box.Parent = WorkspaceFold

	local function createPart(name, size, position, orientation, transparency, parent,color,anc,cancol)
		local part = Instance.new("Part")
		part.BottomSurface = Enum.SurfaceType.Smooth
		part.TopSurface = Enum.SurfaceType.Smooth
		part.Transparency = transparency or 0
		part.Anchored = anc
		part.CanCollide = cancol
		part.Size = size
		part.CFrame = CFrame.new(position) * CFrame.Angles(math.rad(orientation.X), math.rad(orientation.Y), math.rad(orientation.Z))
		part.Name = name
		part.Parent = parent
		part.Color = color
		return part
	end

	local RootPart = createPart("RootPart", Vector3.new(2, 2, 1), Vector3.new(-26, 6, 18), Vector3.new(0, 0, 0), 0.5, Box,Color3.fromRGB(255, 0, 255),true,false)
	RootPart.Anchored = true

	local knrTop = createPart("knrTop", Vector3.new(12, 0.2, 12), Vector3.new(-26, 11.9, 18), Vector3.new(0, 0, 0), 0.75, Box,Color3.fromRGB(250, 110, 255),false,true)
	local knrBottom = createPart("knrBottom", Vector3.new(12, 0.2, 12), Vector3.new(-26, 0.1, 18), Vector3.new(0, 0, 0), 0.75,Box,Color3.fromRGB(250, 110, 255),false,true)
	local knrFront = createPart("knrFront", Vector3.new(12, 12, 0.2), Vector3.new(-26, 6, 12.1), Vector3.new(0, 0, 0), 0.75,Box,Color3.fromRGB(250, 110, 255),false,true)
	local knrBack = createPart("knrBack", Vector3.new(12, 12, 0.2), Vector3.new(-26, 6, 23.9), Vector3.new(0, 180, 0), 0.75,Box,Color3.fromRGB(250, 110, 255),false,true)
	local knrLeft = createPart("knrLeft", Vector3.new(0.2, 12, 12), Vector3.new(-31.9, 6, 18), Vector3.new(0, -90, 0), 0.75,Box,Color3.fromRGB(250, 110, 255),false,true)
	local knrRight = createPart("knrRight", Vector3.new(0.2, 12, 12), Vector3.new(-20.1, 6, 18), Vector3.new(0, 90, 0), 0.75,Box,Color3.fromRGB(250, 110, 255),false,true)

	local function createMotor(part0, part1, cframe, parent)
		local motor = Instance.new("Motor6D")
		motor.Part0 = part0
		motor.Part1 = part1
		motor.C0 = cframe
		motor.Parent = parent
	end

	createMotor(RootPart, knrFront, CFrame.new(0, 0, -5.9), RootPart)
	createMotor(RootPart, knrBack, CFrame.new(0, 0, 5.9), RootPart)
	createMotor(RootPart, knrLeft, CFrame.new(-5.9, 0, 0), RootPart)
	createMotor(RootPart, knrRight, CFrame.new(5.9, 0, 0), RootPart)
	createMotor(RootPart, knrTop, CFrame.new(0, 5.9, 0), RootPart)
	createMotor(RootPart, knrBottom, CFrame.new(0, -5.9, 0), RootPart)

	local PinkLight = Instance.new("PointLight")
	PinkLight.Range = 24
	PinkLight.Brightness = 0.8
	PinkLight.Color = Color3.new(1, 0.42, 1)
	PinkLight.Parent = RootPart

	local Decal = Instance.new("Decal")
	Decal.Texture = "rbxassetid://15937441147"
	Decal.Face = Enum.NormalId.Front
	Decal.Parent = RootPart

	local Decal1 = Instance.new("Decal")
	Decal1.Texture = "rbxassetid://15600096005"
	Decal1.Face = Enum.NormalId.Back
	Decal1.Parent = RootPart

	Box.PrimaryPart = RootPart

	local foldOfPro = Instance.new("Folder",game.ReplicatedStorage)
	foldOfPro.Name = player.Name .. "_XXxx[plkmnjhbvklnjawdewdaadbnhxd]"
	afk.Parent = foldOfPro
	afk.Name = "afkStatu"
local StatsUI = Instance.new("ScreenGui")
local BackFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local stat = Instance.new("Folder")
local candy = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local WhatIsThis = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local shootingStar = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local WhatIsThis_2 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local toast = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local Frame_3 = Instance.new("Frame")
local WhatIsThis_3 = Instance.new("TextLabel")
local UIGradient_3 = Instance.new("UIGradient")
local tix = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")
local Frame_4 = Instance.new("Frame")
local WhatIsThis_4 = Instance.new("TextLabel")
local UIGradient_4 = Instance.new("UIGradient")
local taco = Instance.new("TextLabel")
local UICorner_6 = Instance.new("UICorner")
local Frame_5 = Instance.new("Frame")
local WhatIsThis_5 = Instance.new("TextLabel")
local UIGradient_5 = Instance.new("UIGradient")
local lootbox = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local Frame_6 = Instance.new("Frame")
local WhatIsThis_6 = Instance.new("TextLabel")
local UIGradient_6 = Instance.new("UIGradient")
local UIGridLayout = Instance.new("UIGridLayout")
local farm = Instance.new("TextLabel")
local UICorner_8 = Instance.new("UICorner")
local Frame_7 = Instance.new("Frame")
local WhatIsThis_7 = Instance.new("TextLabel")
local UIGradient_7 = Instance.new("UIGradient")
local Title = Instance.new("TextLabel")

	StatsUI.Name = "StatsUI"
	StatsUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	StatsUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	StatsUI.Enabled = false
	StatsUI.ResetOnSpawn = false

	BackFrame.Name = "BackFrame"
	BackFrame.Parent = StatsUI
	BackFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	BackFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	BackFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BackFrame.BorderSizePixel = 0
	BackFrame.Position = UDim2.new(0.876953304, 0, 0.652201235, 0)
	BackFrame.Size = UDim2.new(0.133705646, 0, 0.356289297, 0)

	UICorner.Parent = BackFrame

	stat.Name = "stats"
	stat.Parent = BackFrame

	candy.Name = "candy"
	candy.Parent = stat
	candy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	candy.BorderColor3 = Color3.fromRGB(0, 0, 0)
	candy.BorderSizePixel = 0
	candy.Size = UDim2.new(0, 200, 0, 50)
	candy.Font = Enum.Font.SourceSans
	candy.TextColor3 = Color3.fromRGB(0, 0, 0)
	candy.TextSize = 14.000
	local candyValue = Instance.new("NumberValue")
	candyValue.Name = "candyValue"
	candyValue.Parent = foldOfPro
	candyValue.Value = 0

	UICorner_2.CornerRadius = UDim.new(1, 0)
	UICorner_2.Parent = candy
	

	Frame.Parent = candy
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0, 0, -0.349999994, 0)
	Frame.Size = UDim2.new(1, 0, 0.726000011, 0)

	WhatIsThis.Name = "What Is This"
	WhatIsThis.Parent = Frame
	WhatIsThis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WhatIsThis.BackgroundTransparency = 1.000
	WhatIsThis.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WhatIsThis.BorderSizePixel = 0
	WhatIsThis.Position = UDim2.new(0, 0, 0.150000006, 0)
	WhatIsThis.Size = UDim2.new(1, 0, 1, 0)
	WhatIsThis.Font = Enum.Font.SourceSansBold
	WhatIsThis.Text = "Candy"
	WhatIsThis.TextColor3 = Color3.fromRGB(0, 10, 193)
	WhatIsThis.TextScaled = true
	WhatIsThis.TextSize = 14.000
	WhatIsThis.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
	WhatIsThis.TextWrapped = true

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
	UIGradient.Rotation = -90
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.51, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient.Parent = Frame

	shootingStar.Name = "shootingStar"
	shootingStar.Parent = stat
	shootingStar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	shootingStar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	shootingStar.BorderSizePixel = 0
	shootingStar.Size = UDim2.new(0, 200, 0, 50)
	shootingStar.Font = Enum.Font.SourceSans
	shootingStar.TextColor3 = Color3.fromRGB(0, 0, 0)
	shootingStar.TextSize = 14.000
	local shootingStarVal = Instance.new("NumberValue")
	shootingStarVal.Name = "shootingStarValue"
	shootingStarVal.Parent = foldOfPro
	shootingStarVal.Value = 0

	UICorner_3.CornerRadius = UDim.new(1, 0)
	UICorner_3.Parent = shootingStar
	
	Frame_2.Parent = shootingStar
	Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0, 0, -0.349999994, 0)
	Frame_2.Size = UDim2.new(1, 0, 0.726000011, 0)

	WhatIsThis_2.Name = "What Is This"
	WhatIsThis_2.Parent = Frame_2
	WhatIsThis_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WhatIsThis_2.BackgroundTransparency = 1.000
	WhatIsThis_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WhatIsThis_2.BorderSizePixel = 0
	WhatIsThis_2.Position = UDim2.new(0, 0, 0.150000006, 0)
	WhatIsThis_2.Size = UDim2.new(1, 0, 1, 0)
	WhatIsThis_2.Font = Enum.Font.SourceSansBold
	WhatIsThis_2.Text = "Star"
	WhatIsThis_2.TextColor3 = Color3.fromRGB(0, 10, 193)
	WhatIsThis_2.TextScaled = true
	WhatIsThis_2.TextSize = 14.000
	WhatIsThis_2.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
	WhatIsThis_2.TextWrapped = true

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
	UIGradient_2.Rotation = -90
	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.51, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = Frame_2
	
	farm.Name = "farm"
	farm.Parent = stat
	farm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	farm.BorderColor3 = Color3.fromRGB(0, 0, 0)
	farm.BorderSizePixel = 0
	farm.Size = UDim2.new(0, 200, 0, 50)
	farm.Font = Enum.Font.SourceSans
	farm.TextColor3 = Color3.fromRGB(0, 0, 0)
	farm.TextSize = 14.000
	local farmVal = Instance.new("NumberValue")
	farmVal.Name = "FarmTime"
	farmVal.Parent = foldOfPro
	farmVal.Value = 0

	UICorner_4.CornerRadius = UDim.new(1, 0)
	UICorner_4.Parent = farm

	Frame_3.Parent = toast
	Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0, 0, -0.349999994, 0)
	Frame_3.Size = UDim2.new(1, 0, 0.726000011, 0)

	WhatIsThis_3.Name = "What Is This"
	WhatIsThis_3.Parent = Frame_3
	WhatIsThis_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WhatIsThis_3.BackgroundTransparency = 1.000
	WhatIsThis_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WhatIsThis_3.BorderSizePixel = 0
	WhatIsThis_3.Position = UDim2.new(0, 0, 0.150000006, 0)
	WhatIsThis_3.Size = UDim2.new(1, 0, 1, 0)
	WhatIsThis_3.Font = Enum.Font.SourceSansBold
	WhatIsThis_3.Text = "Toast"
	WhatIsThis_3.TextColor3 = Color3.fromRGB(0, 10, 193)
	WhatIsThis_3.TextScaled = true
	WhatIsThis_3.TextSize = 14.000
	WhatIsThis_3.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
	WhatIsThis_3.TextWrapped = true

	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
	UIGradient_3.Rotation = -90
	UIGradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.51, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_3.Parent = Frame_3

	toast.Name = "toast"
	toast.Parent = stat
	toast.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toast.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toast.BorderSizePixel = 0
	toast.Size = UDim2.new(0, 200, 0, 50)
	toast.Font = Enum.Font.SourceSans
	toast.TextColor3 = Color3.fromRGB(0, 0, 0)
	toast.TextSize = 14.000
	local toastVal = Instance.new("NumberValue")
	toastVal.Name = "toastValue"
	toastVal.Parent = foldOfPro
	toastVal.Value = 0

	UICorner_5.CornerRadius = UDim.new(1, 0)
	UICorner_5.Parent = toast

	Frame_4.Parent = tix
	Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_4.BorderSizePixel = 0
	Frame_4.Position = UDim2.new(0, 0, -0.349999994, 0)
	Frame_4.Size = UDim2.new(1, 0, 0.726000011, 0)

	WhatIsThis_4.Name = "What Is This"
	WhatIsThis_4.Parent = Frame_4
	WhatIsThis_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WhatIsThis_4.BackgroundTransparency = 1.000
	WhatIsThis_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WhatIsThis_4.BorderSizePixel = 0
	WhatIsThis_4.Position = UDim2.new(0, 0, 0.150000006, 0)
	WhatIsThis_4.Size = UDim2.new(1, 0, 1, 0)
	WhatIsThis_4.Font = Enum.Font.SourceSansBold
	WhatIsThis_4.Text = "Tix"
	WhatIsThis_4.TextColor3 = Color3.fromRGB(0, 10, 193)
	WhatIsThis_4.TextScaled = true
	WhatIsThis_4.TextSize = 14.000
	WhatIsThis_4.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
	WhatIsThis_4.TextWrapped = true

	UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
	UIGradient_4.Rotation = -90
	UIGradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.51, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_4.Parent = Frame_4

	tix.Name = "tix"
	tix.Parent = stat
	tix.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tix.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tix.BorderSizePixel = 0
	tix.Size = UDim2.new(0, 200, 0, 50)
	tix.Font = Enum.Font.SourceSans
	tix.TextColor3 = Color3.fromRGB(0, 0, 0)
	tix.TextSize = 14.000
	local tixVal = Instance.new("NumberValue")
	tixVal.Name = "tixValue"
	tixVal.Parent = foldOfPro
	tixVal.Value = 0

	UICorner_6.CornerRadius = UDim.new(1, 0)
	UICorner_6.Parent = tix

	Frame_5.Parent = taco
	Frame_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_5.BorderSizePixel = 0
	Frame_5.Position = UDim2.new(0, 0, -0.349999994, 0)
	Frame_5.Size = UDim2.new(1, 0, 0.726000011, 0)

	WhatIsThis_5.Name = "What Is This"
	WhatIsThis_5.Parent = Frame_5
	WhatIsThis_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WhatIsThis_5.BackgroundTransparency = 1.000
	WhatIsThis_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WhatIsThis_5.BorderSizePixel = 0
	WhatIsThis_5.Position = UDim2.new(0, 0, 0.150000006, 0)
	WhatIsThis_5.Size = UDim2.new(1, 0, 1, 0)
	WhatIsThis_5.Font = Enum.Font.SourceSansBold
	WhatIsThis_5.Text = "Taco"
	WhatIsThis_5.TextColor3 = Color3.fromRGB(0, 10, 193)
	WhatIsThis_5.TextScaled = true
	WhatIsThis_5.TextSize = 14.000
	WhatIsThis_5.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
	WhatIsThis_5.TextWrapped = true

	UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
	UIGradient_5.Rotation = -90
	UIGradient_5.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.51, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_5.Parent = Frame_5

	taco.Name = "taco"
	taco.Parent = stat
	taco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	taco.BorderColor3 = Color3.fromRGB(0, 0, 0)
	taco.BorderSizePixel = 0
	taco.Size = UDim2.new(0, 200, 0, 50)
	taco.Font = Enum.Font.SourceSans
	taco.TextColor3 = Color3.fromRGB(0, 0, 0)
	taco.TextSize = 14.000
	local tacoVal = Instance.new("NumberValue")
	tacoVal.Name = "tacoValue"
	tacoVal.Parent = foldOfPro
	tacoVal.Value = 0

	UICorner_7.CornerRadius = UDim.new(1, 0)
	UICorner_7.Parent = taco
	
	Frame_6.Parent = lootbox
	Frame_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_6.BorderSizePixel = 0
	Frame_6.Position = UDim2.new(0, 0, -0.349999994, 0)
	Frame_6.Size = UDim2.new(1, 0, 0.726000011, 0)

	WhatIsThis_6.Name = "What Is This"
	WhatIsThis_6.Parent = Frame_6
	WhatIsThis_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WhatIsThis_6.BackgroundTransparency = 1.000
	WhatIsThis_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WhatIsThis_6.BorderSizePixel = 0
	WhatIsThis_6.Position = UDim2.new(0, 0, 0.150000006, 0)
	WhatIsThis_6.Size = UDim2.new(1, 0, 1, 0)
	WhatIsThis_6.Font = Enum.Font.SourceSansBold
	WhatIsThis_6.Text = "LootBox"
	WhatIsThis_6.TextColor3 = Color3.fromRGB(0, 10, 193)
	WhatIsThis_6.TextScaled = true
	WhatIsThis_6.TextSize = 14.000
	WhatIsThis_6.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
	WhatIsThis_6.TextWrapped = true

	UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
	UIGradient_6.Rotation = -90
	UIGradient_6.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.51, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_6.Parent = Frame_6

	lootbox.Name = "lootbox"
	lootbox.Parent = stat
	lootbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	lootbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	lootbox.BorderSizePixel = 0
	lootbox.Size = UDim2.new(0, 200, 0, 50)
	lootbox.Font = Enum.Font.SourceSans
	lootbox.TextColor3 = Color3.fromRGB(0, 0, 0)
	lootbox.TextSize = 14.000
	local lootboxVal = Instance.new("NumberValue")
	lootboxVal.Name = "tacoValue"
	lootboxVal.Parent = foldOfPro
	lootboxVal.Value = 0

	UICorner_8.CornerRadius = UDim.new(1, 0)
	UICorner_8.Parent = lootbox

	Frame_7.Parent = farm
	Frame_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_7.BorderSizePixel = 0
	Frame_7.Position = UDim2.new(0, 0, -0.349999994, 0)
	Frame_7.Size = UDim2.new(1, 0, 0.726000011, 0)

	WhatIsThis_7.Name = "What Is This"
	WhatIsThis_7.Parent = Frame_7
	WhatIsThis_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WhatIsThis_7.BackgroundTransparency = 1.000
	WhatIsThis_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WhatIsThis_7.BorderSizePixel = 0
	WhatIsThis_7.Position = UDim2.new(0, 0, 0.150000006, 0)
	WhatIsThis_7.Size = UDim2.new(1, 0, 1, 0)
	WhatIsThis_7.Font = Enum.Font.SourceSansBold
	WhatIsThis_7.Text = "Script Time"
	WhatIsThis_7.TextColor3 = Color3.fromRGB(0, 10, 193)
	WhatIsThis_7.TextScaled = true
	WhatIsThis_7.TextSize = 14.000
	WhatIsThis_7.TextStrokeColor3 = Color3.fromRGB(156, 156, 156)
	WhatIsThis_7.TextWrapped = true

	UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
	UIGradient_7.Rotation = -90
	UIGradient_7.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.51, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_7.Parent = Frame_7

	UIGridLayout.Parent = stat
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIGridLayout.CellPadding = UDim2.new(1, 0, 0.0399999991, 0)
	UIGridLayout.CellSize = UDim2.new(0.800000012, 0, 0.100000001, 0)

	Title.Name = "Title"
	Title.Parent = StatsUI
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.882862031, 0, 0.617127717, 0)
	Title.Rotation = 90.000
	Title.Size = UDim2.new(0.180241019, 0, 0.0765042752, 0)
	Title.Font = Enum.Font.SourceSansBold
	Title.Text = "Farm Stats"
	Title.TextColor3 = Color3.fromRGB(0, 0, 0)
	Title.TextScaled = true
	Title.TextSize = 47.000
	Title.TextWrapped = true

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = player:WaitForChild("PlayerGui")
	ScreenGui.Name = "CandyHelperGUI"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true

	script.Parent = ScreenGui

	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(0, 300, 0, 350)
	Frame.Position = UDim2.new(0.5, -300,0.5, 0)
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Frame.BorderSizePixel = 0
	Frame.Parent = ScreenGui
	Frame.Active = true
	Frame.Draggable = true

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = Frame

	local Title = Instance.new("TextLabel")
	Title.Text = "Candy Helper"
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 30
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1
	Title.Size = UDim2.new(1, 0, 0, 80)
	Title.Parent = Frame

	local CloseButton = Instance.new("TextButton")
	CloseButton.Text = "Hide"
	CloseButton.Font = Enum.Font.Gotham
	CloseButton.TextSize = 14
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.Size = UDim2.new(0, 50, 0, 25)
	CloseButton.Position = UDim2.new(1, -60, 0, 7)
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
	CloseButton.Parent = ScreenGui

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = CloseButton

	local buttonYOffset = 70
	local buttonSpacing = 15
	local buttonsPerPage = 4
	local currentPage = 1

	local buttons = {
		{Text = "Bring CandyCane", Variable = "isBringCandyCaneEnabled"},
		{Text = "Bring Taco", Variable = "isBringTacoEnabled"},
		{Text = "Bring Toast", Variable = "isBringToastEnabled"},
		{Text = "Bring LootBoxes", Variable = "isBringLootBoxEnabled"},
		{Text = "Bring ShootingStar", Variable = "isShootingStarEnabled"},
		{Text = "Bring Tix", Variable = "isTixEnabled"},
		{Text = "Anti Void", Variable = "AirWalk"},
		{Text = "Start/Stop Farm", Variable = "farm"},
		{Text = "-", Variable = "q2"},
		{Text = "-", Variable = "q2"},
		{Text = "-", Variable = "q2"},
		{Text = "-", Variable = "q2"},
	}

	local variables = {}
	local buttonInstances = {}
	local buttonClicked = {}

	local function updatePage()
		for i, button in ipairs(buttonInstances) do
			button.Visible = false
		end

		local startIndex = (currentPage - 1) * buttonsPerPage + 1
		local endIndex = math.min(startIndex + buttonsPerPage - 1, #buttonInstances)

		for i = startIndex, endIndex do
			buttonInstances[i].Visible = true
		end
	end

	local function teleportCharacterUp(character, height)
		local rootPart = character:FindFirstChild("HumanoidRootPart")
		if rootPart then
			local currentCFrame = rootPart.CFrame
			local newCFrame = currentCFrame + Vector3.new(0, height, 0)
			rootPart.CFrame = newCFrame
		else
			warn("HumanoidRootPart bulunamadı!")
		end
	end

	local function createButton(buttonInfo, index)
		local button = Instance.new("TextButton")
		button.Text = buttonInfo.Text
		button.Font = Enum.Font.Gotham
		button.TextSize = 14
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.Size = UDim2.new(0.9, 0, 0, 40)
		button.Position = UDim2.new(0.05, 0, 0, buttonYOffset + ((index - 1) % buttonsPerPage) * (40 + buttonSpacing))
		button.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
		button.Parent = Frame

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 8)
		UICorner.Parent = button

		variables[buttonInfo.Variable] = false

		button.MouseButton1Click:Connect(function()
			if buttonInfo.Text == "Start/Stop Farm" and not buttonClicked[buttonInfo.Text] then
				Box.Parent = WorkspaceFold
				buttonClicked[buttonInfo.Text] = true
				afk.Value = true
				StatsUI.Enabled = true
				startCycleSpectate()
			elseif buttonInfo.Text == "Start/Stop Farm" and buttonClicked[buttonInfo.Text] then
				buttonClicked[buttonInfo.Text] = false
				afk.Value = false
				StatsUI.Enabled = false
				stopCycleSpectate()
				Box.Parent = foldOfPro
			end
			if buttonInfo.Text == "Anti Void" and not buttonClicked[buttonInfo.Text] then
				local antiWoid = Instance.new("Part")
				antiWoid.Parent = workspace
				antiWoid.Position = Vector3.new(0, 0, 0)
				antiWoid.Size = Vector3.new(2047, 1.76, 2047)
				antiWoid.Anchored = true
				antiWoid.CanCollide = true
				antiWoid.Transparency = 0.75
				antiWoid.Name = "AntiVoid"
				local selectionBox = Instance.new("SelectionBox")
				selectionBox.Parent = antiWoid
				selectionBox.Adornee = antiWoid
				selectionBox.SurfaceColor3 = Color3.fromRGB(246, 147, 255)
				selectionBox.SurfaceTransparency = 0.8
				selectionBox.Color3 = Color3.fromRGB(251, 121, 255)
				selectionBox.LineThickness = 2
				buttonClicked[buttonInfo.Text] = true
			elseif buttonInfo.Text == "Anti Void" and buttonClicked[buttonInfo.Text] then
				local antiWoid = workspace:FindFirstChild("AntiVoid")
				if antiWoid then
					antiWoid:Destroy()
				end
				buttonClicked[buttonInfo.Text] = false
			end
			variables[buttonInfo.Variable] = not variables[buttonInfo.Variable]
			button.BackgroundColor3 = variables[buttonInfo.Variable] and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(50, 150, 255)
		end)

		buttonInstances[#buttonInstances + 1] = button
		return button
	end

	for i, buttonInfo in ipairs(buttons) do
		createButton(buttonInfo, i)
	end

	local nextPageButton = Instance.new("TextButton")
	nextPageButton.Text = ">>>"
	nextPageButton.Font = Enum.Font.Gotham
	nextPageButton.TextSize = 23
	nextPageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	nextPageButton.Size = UDim2.new(0.3, 0, 0, 40)
	nextPageButton.Position = UDim2.new(0.65, 0, 1, -60)
	nextPageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 100)
	nextPageButton.Parent = Frame

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = nextPageButton

	nextPageButton.MouseButton1Click:Connect(function()
		if currentPage * buttonsPerPage < #buttonInstances then
			currentPage = currentPage + 1
			updatePage()
		end
	end)

	local prevPageButton = Instance.new("TextButton")
	prevPageButton.Text = "<<<"
	prevPageButton.Font = Enum.Font.Gotham
	prevPageButton.TextSize = 23
	prevPageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	prevPageButton.Size = UDim2.new(0.3, 0, 0, 40)
	prevPageButton.Position = UDim2.new(0.05, 0, 1, -60)
	prevPageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 100)
	prevPageButton.Parent = Frame


	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = prevPageButton

	prevPageButton.MouseButton1Click:Connect(function()
		if currentPage > 1 then
			currentPage = currentPage - 1
			updatePage()
		end
	end)

	updatePage()

	CloseButton.MouseButton1Click:Connect(function()
		Frame.Visible = not Frame.Visible
		CloseButton.Text = Frame.Visible and "Hide" or "Show"
	end)

	spawn(function()
		afk.Changed:Connect(function()
			if afk.Value == true and player.Team.Name == "playing" then
				Box.PrimaryPart.CFrame = CFrame.new(-30, 450, 200)
				char.HumanoidRootPart.CFrame = CFrame.new(-30, 450, 200)
			end
		end)
		player.Changed:Connect(function()
			if player.Team.Name == "playing" and afk.Value == true then
				Box.PrimaryPart.CFrame = CFrame.new(-30, 450, 200)
				char.HumanoidRootPart.CFrame = CFrame.new(-30, 450, 200)
			end
		end)
	end)

	farmVal.Value = 0
	spawn(function()
		while wait(0.1) do
			farmVal.Value = farmVal.Value + 0.1
			farm.Text = farmVal.Value
			taco.Text = tacoVal.Value
			tix.Text = tixVal.Value
			toast.Text = toastVal.Value
			shootingStar.Text = shootingStarVal.Value
			candy.Text = candyValue.Value
			lootbox.Text = lootboxVal.Value
		end
	end)

	while wait(0.3) do
		if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChild("Humanoid") then
			continue
		end
		if player.Team and player.Team.Name == "playing" then
			for _, candy in pairs(candyFold:GetChildren()) do
				if candy.Name == "candyCane" and variables.isBringCandyCaneEnabled then
					candy.Size = Vector3.new(1, 1, 1)
					candy.Position = char.HumanoidRootPart.Position
					candyValue.Value = candyValue.Value+1
				elseif candy.Name == "taco" and variables.isBringTacoEnabled then
					candy.Size = Vector3.new(1, 1, 1)
					candy.Position = char.HumanoidRootPart.Position
					tacoVal.Value = tacoVal.Value+1
				elseif candy.Name == "toast" and char.Humanoid.Health < 100 and variables.isBringToastEnabled then
					if candy:FindFirstChildOfClass("Fire") then
						candy:Destroy()
					else
						candy.Size = Vector3.new(1, 1, 1)
						candy.Position = char.HumanoidRootPart.Position
						toastVal.Value = toastVal.Value+1
					end
				elseif candy.Name == "lootbox" and variables.isBringLootBoxEnabled then
					candy.PrimaryPart.Size = Vector3.new(1, 1, 1)
					local pos = char.HumanoidRootPart.CFrame
					char.HumanoidRootPart.CFrame = candy.PrimaryPart.CFrame
					task.wait()
					char.HumanoidRootPart.CFrame = pos
					lootboxVal.Value = lootboxVal.Value+1
				elseif candy.Name == "shootingStar" and variables.isShootingStarEnabled then
					candy.Position = char.HumanoidRootPart.Position
					shootingStarVal.Value = shootingStarVal.Value+1
				elseif candy.Name == "tix" and variables.isTixEnabled then
					candy.Position = char.HumanoidRootPart.Position
					tixVal.Value = tixVal.Value+1
				end
			end
		end
	end
end
