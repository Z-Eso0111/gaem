local studioVersion = game:GetService("HttpService"):GetAsync("http://setup.rprxy.xyz/versionQTStudio")
local Data = game:GetService("HttpService"):JSONDecode(game:GetService("HttpService"):GetAsync("http://setup.rprxy.xyz/"..studioVersion.."-API-Dump.json"))

local ClassProperties = {}

for _, v in pairs(Data.Classes) do
	local propertyTable = {Name = v.Name, Properties = {}}
	for _, v2 in pairs(v.Members) do
		if v2.MemberType == "Property" then
			table.insert(propertyTable.Properties, v2.Name)
		end
	end
	if #propertyTable.Properties > 0 then
		ClassProperties[v.Name] = propertyTable.Properties
	end
end

local function saveInstance(instance)
	local function getProperties(obj)
		local properties = {}
		for _, propName in ipairs(ClassProperties[obj.ClassName] or {}) do
			pcall(function()
				properties[propName] = obj[propName]
			end)
		end
		return properties
	end

	local function serializeInstance(obj)
		local serialized = {
			ClassName = obj.ClassName,
			Properties = getProperties(obj),
			Children = {}
		}
		for _, child in ipairs(obj:GetChildren()) do
			table.insert(serialized.Children, serializeInstance(child))
		end
		return serialized
	end

	local function serializeToCode(data, indent)
		indent = indent or 0
		local space = string.rep(" ", indent)
		local code = space .. "local instance = Instance.new(\"" .. data.ClassName .. "\")\n"
		for propName, value in pairs(data.Properties) do
			local valueStr = type(value) == "string" and "\"" .. value .. "\"" or tostring(value)
			code = code .. space .. "instance." .. propName .. " = " .. valueStr .. "\n"
		end
		for _, childData in ipairs(data.Children) do
			code = code .. serializeToCode(childData, indent + 4)
			code = code .. space .. "child.Parent = instance\n"
		end
		return code
	end

	local serializedData = serializeInstance(instance)
	local generatedCode = serializeToCode(serializedData)

	local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local screenGui = Instance.new("ScreenGui", playerGui)
	local textLabel = Instance.new("TextLabel", screenGui)
	textLabel.Text = generatedCode
	textLabel.Size = UDim2.new(0.8, 0, 0.5, 0)
	textLabel.Position = UDim2.new(0.1, 0, 0.25, 0)
	textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextWrapped = true
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.TextYAlignment = Enum.TextYAlignment.Top
	wait(10)
	screenGui:Destroy()
end

saveInstance(game.Players.LocalPlayer.PlayerGui.menu)
