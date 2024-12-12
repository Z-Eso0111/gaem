warn("Script Started")
wait(2)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local candyFold = workspace:WaitForChild("events")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local ReplicEvents = Instance.new("Folder",game.ReplicatedStorage)
ReplicEvents.Name = "ReplicEvents"

player.CharacterAdded:Connect(function(newChar)
	char = newChar
end)

script.Parent = player.PlayerScripts

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.Name = "CandyHelperGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

script.Parent = ScreenGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 250)
Frame.Position = UDim2.new(0.5, -125, 0.5, -125)
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
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Parent = Frame

local CloseButton = Instance.new("TextButton")
CloseButton.Text = "Hide"
CloseButton.Font = Enum.Font.Gotham
CloseButton.TextSize = 14
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Size = UDim2.new(0, 50, 0, 25)
CloseButton.Position = UDim2.new(1, -60, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = CloseButton

local BringCandyCaneToggle = Instance.new("TextButton")
BringCandyCaneToggle.Text = "Bring CandyCane"
BringCandyCaneToggle.Font = Enum.Font.Gotham
BringCandyCaneToggle.TextSize = 14
BringCandyCaneToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BringCandyCaneToggle.Size = UDim2.new(0.9, 0, 0, 30)
BringCandyCaneToggle.Position = UDim2.new(0.05, 0, 0.2, 0)
BringCandyCaneToggle.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
BringCandyCaneToggle.Parent = Frame

local BringTacoToggle = Instance.new("TextButton")
BringTacoToggle.Text = "Bring Taco"
BringTacoToggle.Font = Enum.Font.Gotham
BringTacoToggle.TextSize = 14
BringTacoToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BringTacoToggle.Size = UDim2.new(0.9, 0, 0, 30)
BringTacoToggle.Position = UDim2.new(0.05, 0, 0.4, 0)
BringTacoToggle.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
BringTacoToggle.Parent = Frame

local BringToastToggle = Instance.new("TextButton")
BringToastToggle.Text = "Bring Toast"
BringToastToggle.Font = Enum.Font.Gotham
BringToastToggle.TextSize = 14
BringToastToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BringToastToggle.Size = UDim2.new(0.9, 0, 0, 30)
BringToastToggle.Position = UDim2.new(0.05, 0, 0.6, 0)
BringToastToggle.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
BringToastToggle.Parent = Frame

local BringLootBoxToggle = Instance.new("TextButton")
BringLootBoxToggle.Text = "Bring LootBoxes"
BringLootBoxToggle.Font = Enum.Font.Gotham
BringLootBoxToggle.TextSize = 14
BringLootBoxToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BringLootBoxToggle.Size = UDim2.new(0.9, 0, 0, 30)
BringLootBoxToggle.Position = UDim2.new(0.05, 0, 0.8, 0)
BringLootBoxToggle.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
BringLootBoxToggle.Parent = Frame

local SafeButton = Instance.new("TextButton")
SafeButton.Text = "Safe plate"
SafeButton.Font = Enum.Font.Gotham
SafeButton.TextSize = 14
SafeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SafeButton.Size = UDim2.new(0.9, 0, 0, 30)
SafeButton.Position = UDim2.new(0.05, 0, 0.8, 0)
SafeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
SafeButton.Parent = Frame

local isBringCandyCaneEnabled = false
local isBringTacoEnabled = false
local isBringToastEnabled = false
local isBringLootBoxEnabled = false
local isSafeButtonEnabled = false

SafeButton.MouseButton1Click:Connect(function()
	isSafeButtonEnabled = not isSafeButtonEnabled
	SafeButton.BackgroundColor3 = isSafeButtonEnabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(50, 150, 255)
end)

BringCandyCaneToggle.MouseButton1Click:Connect(function()
	isBringCandyCaneEnabled = not isBringCandyCaneEnabled
	BringCandyCaneToggle.BackgroundColor3 = isBringCandyCaneEnabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(50, 150, 255)
end)

BringTacoToggle.MouseButton1Click:Connect(function()
	isBringTacoEnabled = not isBringTacoEnabled
	BringTacoToggle.BackgroundColor3 = isBringTacoEnabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(50, 150, 255)
end)

BringToastToggle.MouseButton1Click:Connect(function()
	isBringToastEnabled = not isBringToastEnabled
	BringToastToggle.BackgroundColor3 = isBringToastEnabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(50, 150, 255)
end)

BringLootBoxToggle.MouseButton1Click:Connect(function()
	isBringLootBoxEnabled = not isBringLootBoxEnabled
	BringLootBoxToggle.BackgroundColor3 = isBringLootBoxEnabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(50, 150, 255)
end)

CloseButton.MouseButton1Click:Connect(function()
	local isHidden = Frame.Visible
	Frame.Visible = not isHidden
	CloseButton.Text = isHidden and "Show" or "Hide"
end)

if player.Team.Name == "playing" then
	while wait(0.4) do
		if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChild("Humanoid") then
			continue
		end
		
		if isSafeButtonEnabled then
			for _, candyCane in pairs(ReplicEvents:GetChildren()) do
				candyCane.Parent = ReplicEvents
				if candyCane.Name == "candyCane" then
					if isBringCandyCaneEnabled then
						candyCane.Size = Vector3.new(1, 1, 1)
						candyCane.Position = char.HumanoidRootPart.Position
					end
				elseif candyCane.Name == "taco" then
					if isBringTacoEnabled then
						candyCane.Size = Vector3.new(1, 1, 1)
						candyCane.Position = char.HumanoidRootPart.Position
					end
				elseif candyCane.Name == "toast" and char.Humanoid.Health < char.Humanoid.MaxHealth then
					if isBringToastEnabled then
						if candyCane:FindFirstChildOfClass("Fire") then
							candyCane:Destroy()
						else
							candyCane.Size = Vector3.new(1, 1, 1)
							candyCane.Position = char.HumanoidRootPart.Position
						end
					end
				elseif candyCane.Name == "lootbox" then
					if isBringLootBoxEnabled then
						candyCane.PrimaryPart.Size = Vector3.new(1, 1, 1)
						local pos = char.HumanoidRootPart.CFrame
						char.HumanoidRootPart.CFrame = candyCane.PrimaryPart.CFrame
						task.wait()
						char.HumanoidRootPart.CFrame = pos
					end
				end
			end
		else
			for _, candyCane in pairs(candyFold:GetChildren()) do
				if candyCane.Name == "candyCane" then
					if isBringCandyCaneEnabled then
						candyCane.Size = Vector3.new(1, 1, 1)
						candyCane.Position = char.HumanoidRootPart.Position
					end
				elseif candyCane.Name == "taco" then
					if isBringTacoEnabled then
						candyCane.Size = Vector3.new(1, 1, 1)
						candyCane.Position = char.HumanoidRootPart.Position
					end
				elseif candyCane.Name == "toast" and char.Humanoid.Health < char.Humanoid.MaxHealth then
					if isBringToastEnabled then
						if candyCane:FindFirstChildOfClass("Fire") then
							candyCane:Destroy()
						else
							candyCane.Size = Vector3.new(1, 1, 1)
							candyCane.Position = char.HumanoidRootPart.Position
						end
					end
				elseif candyCane.Name == "lootbox" then
					if isBringLootBoxEnabled then
						candyCane.PrimaryPart.Size = Vector3.new(1, 1, 1)
						local pos = char.HumanoidRootPart.CFrame
						char.HumanoidRootPart.CFrame = candyCane.PrimaryPart.CFrame
						task.wait()
						char.HumanoidRootPart.CFrame = pos
					end
				end
			end
		end
	end
end
