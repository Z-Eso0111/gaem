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
Frame.Size = UDim2.new(0, 250, 0, 250) -- Boyutu biraz artırdık yeni buton için
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

local ShootingStarToggle = Instance.new("TextButton")
ShootingStarToggle.Text = "Bring ShootingStar"
ShootingStarToggle.Font = Enum.Font.Gotham
ShootingStarToggle.TextSize = 14
ShootingStarToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ShootingStarToggle.Size = UDim2.new(0.9, 0, 0, 30)
ShootingStarToggle.Position = UDim2.new(0.05, 0, 1.0, 0)
ShootingStarToggle.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
ShootingStarToggle.Parent = Frame

local isBringCandyCaneEnabled = false
local isBringTacoEnabled = false
local isBringToastEnabled = false
local isBringLootBoxEnabled = false
local isShootingStarEnabled = false

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

ShootingStarToggle.MouseButton1Click:Connect(function()
    isShootingStarEnabled = not isShootingStarEnabled
    ShootingStarToggle.BackgroundColor3 = isShootingStarEnabled and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(50, 150, 255)
end)

CloseButton.MouseButton1Click:Connect(function()
    local isHidden = Frame.Visible
    Frame.Visible = not isHidden
    CloseButton.Text = isHidden and "Show" or "Hide"
end)

while wait(0.4) do
    if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChild("Humanoid") then
        continue
    end

    if player.Team.Name == "playing" then
        for _, candy in pairs(candyFold:GetChildren()) do
            if candy.Name == "candyCane" and isBringCandyCaneEnabled then
                candy.Size = Vector3.new(1, 1, 1)
                candy.Position = char.HumanoidRootPart.Position
            elseif candy.Name == "taco" and isBringTacoEnabled then
                candy.Size = Vector3.new(1, 1, 1)
                candy.Position = char.HumanoidRootPart.Position
            elseif candy.Name == "toast" and char.Humanoid.Health < 100 and isBringToastEnabled then
                if candy:FindFirstChildOfClass("Fire") then
                    candy:Destroy()
                else
                    candy.Size = Vector3.new(1, 1, 1)
                    candy.Position = char.HumanoidRootPart.Position
                end
            elseif candy.Name == "lootbox" and isBringLootBoxEnabled then
                candy.PrimaryPart.Size = Vector3.new(1, 1, 1)
                local pos = char.HumanoidRootPart.CFrame
                char.HumanoidRootPart.CFrame = candy.PrimaryPart.CFrame
                task.wait()
                char.HumanoidRootPart.CFrame = pos
            elseif candy.Name == "shootingStar" and isShootingStarEnabled then
                candy.Position = char.HumanoidRootPart.Position
            end
        end
    end
end
