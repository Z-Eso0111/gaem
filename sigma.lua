warn("Script Started")
wait(2)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local candyFold = workspace:WaitForChild("events")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

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
Frame.Size = UDim2.new(0, 300, 0, 350)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
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
	{Text = "Anti Void", Variable = "AirWalk"},
	{Text = "-", Variable = "q1"},
	{Text = "-", Variable = "q2"}
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
		if buttonInfo.Text == "Anti Void" and not buttonClicked[buttonInfo.Text] then
			local antiWoid = Instance.new("Part")
			antiWoid.Parent = workspace
			antiWoid.Position = Vector3.new(0, 0, 0)
			antiWoid.Size = Vector3.new(2047, 3, 2047)
			antiWoid.Anchored = true
			antiWoid.CanCollide = true
			antiWoid.Transparency = 1
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

while wait(0.4) do
	if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChild("Humanoid") then
		continue
	end

	if player.Team and player.Team.Name == "playing" then
		for _, candy in pairs(candyFold:GetChildren()) do
			if candy.Name == "candyCane" and variables.isBringCandyCaneEnabled then
				candy.Size = Vector3.new(1, 1, 1)
				candy.Position = char.HumanoidRootPart.Position
			elseif candy.Name == "taco" and variables.isBringTacoEnabled then
				candy.Size = Vector3.new(1, 1, 1)
				candy.Position = char.HumanoidRootPart.Position
			elseif candy.Name == "toast" and char.Humanoid.Health < 100 and variables.isBringToastEnabled then
				if candy:FindFirstChildOfClass("Fire") then
					candy:Destroy()
				else
					candy.Size = Vector3.new(1, 1, 1)
					candy.Position = char.HumanoidRootPart.Position
				end
			elseif candy.Name == "lootbox" and variables.isBringLootBoxEnabled then
				candy.PrimaryPart.Size = Vector3.new(1, 1, 1)
				local pos = char.HumanoidRootPart.CFrame
				char.HumanoidRootPart.CFrame = candy.PrimaryPart.CFrame
				task.wait()
				char.HumanoidRootPart.CFrame = pos
			elseif candy.Name == "shootingStar" and variables.isShootingStarEnabled then
				candy.Position = char.HumanoidRootPart.Position
			end
		end
	end
end
