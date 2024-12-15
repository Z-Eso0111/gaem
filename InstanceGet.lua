local HttpService = game:GetService("HttpService")

local url = "https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Tracker/roblox/API-Dump.json"

local function fetchAPIDump()
	local success, response = pcall(function()
		return HttpService:GetAsync(url)
	end)
	if not success then
		warn("API Dump alınamadı: ", response)
		return nil
	end

	local decoded
	pcall(function()
		decoded = HttpService:JSONDecode(response)
	end)
	if not decoded then
		warn("API Dump çözümlenemedi!")
		return nil
	end

	return decoded
end

local apiDump = fetchAPIDump()
if not apiDump then return end

-- Özellik tablosunu oluştur
local ClassProperties = {}
for _, classData in ipairs(apiDump.Classes) do
	if classData.Members then
		local propertyList = {}
		for _, member in ipairs(classData.Members) do
			if member.MemberType == "Property" and not table.find(member.Tags or {}, "Deprecated") then
				table.insert(propertyList, member.Name)
			end
		end
		ClassProperties[classData.Name] = propertyList
	end
end

print("ClassProperties hazır!")

local function formatValue(value)
	local t = typeof(value)
	if t == "string" then
		return "\"" .. value:gsub("\"", "\\\"") .. "\""
	elseif t == "number" or t == "boolean" then
		return tostring(value)
	elseif t == "Color3" then
		return string.format("Color3.new(%f, %f, %f)", value.R, value.G, value.B)
	elseif t == "Vector3" then
		return string.format("Vector3.new(%f, %f, %f)", value.X, value.Y, value.Z)
	elseif t == "UDim2" then
		return string.format("UDim2.new(%f, %d, %f, %d)", value.X.Scale, value.X.Offset, value.Y.Scale, value.Y.Offset)
	elseif t == "EnumItem" then
		return tostring(value)
	else
		return "nil -- Unsupported Value Type"
	end
end

local function convertInstanceToCode(instance, parentName)
	local className = instance.ClassName
	local name = instance.Name
	local parent = parentName or "nil"
	local code = string.format("local %s = Instance.new(\"%s\", %s)\n", name, className, parent)

	for _, property in ipairs(ClassProperties[className] or {}) do
		local success, value = pcall(function() return instance[property] end)
		if success and value ~= nil then
			code = code .. string.format("%s.%s = %s\n", name, property, formatValue(value))
		end
	end

	return code
end

local function convertHierarchyToCode(instance)
	local code = convertInstanceToCode(instance)
	for _, child in ipairs(instance:GetChildren()) do
		code = code .. convertHierarchyToCode(child)
	end
	return code
end

local function showCodeOnScreen(code)
	local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local screenGui = Instance.new("ScreenGui", playerGui)
	local textLabel = Instance.new("TextLabel", screenGui)
	textLabel.Text = code
	textLabel.Size = UDim2.new(0.8, 0, 0.5, 0)
	textLabel.Position = UDim2.new(0.1, 0, 0.25, 0)
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	textLabel.TextScaled = true
	textLabel.TextWrapped = true
	wait(10)
	screenGui:Destroy()
end

local selectedInstance = workspace.Part
local generatedCode = convertHierarchyToCode(game.Players.LocalPlayer.PlayerGui.menu)
showCodeOnScreen(generatedCode)
