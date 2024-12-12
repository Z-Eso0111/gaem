warn("Script Started")
wait(2)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local candyFold = workspace:WaitForChild("events")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")

player.CharacterAdded:Connect(function(newChar)
    char = newChar
    humanoidRootPart = char:WaitForChild("HumanoidRootPart")
    humanoid = char:WaitForChild("Humanoid")
end)

script.Parent = player.PlayerScripts

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.Name = "CandyHelperGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

script.Parent = ScreenGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 200)
Frame.Position = UDim2.new(0.5, -125, 0.5, -100)
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

-- Toggle Buttons ve işlevler...

CloseButton.MouseButton1Click:Connect(function()
    local isHidden = Frame.Visible
    Frame.Visible = not isHidden
    CloseButton.Text = isHidden and "Show" or "Hide"
end)

while wait(0.4) do
    if humanoidRootPart and humanoid then
        for _, candyCane in pairs(candyFold:GetChildren()) do
            if candyCane.Name == "candyCane" then
                if isBringCandyCaneEnabled then
                    candyCane.Size = Vector3.new(1, 1, 1)
                    candyCane.Position = humanoidRootPart.Position
                end
            elseif candyCane.Name == "taco" then
                if isBringTacoEnabled then
                    candyCane.Size = Vector3.new(1, 1, 1)
                    candyCane.Position = humanoidRootPart.Position
                end
            elseif candyCane.Name == "toast" and humanoid.Health < 100 then
                if isBringToastEnabled then
                    if candyCane:FindFirstChildOfClass("Fire") then
                        candyCane:Destroy()
                    else
                        candyCane.Size = Vector3.new(1, 1, 1)
                        candyCane.Position = humanoidRootPart.Position
                    end
                end
            elseif candyCane.Name == "lootbox" then
                if isBringLootBoxEnabled then
                    candyCane.PrimaryPart.Size = Vector3.new(1, 1, 1)
                    candyCane.PrimaryPart.Position = humanoidRootPart.Position
                end
            end
        end
    end
end
