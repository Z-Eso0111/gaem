local HttpService = game:GetService("HttpService")

local referencedump = [[
-- Referans özelliklerini buraya ekleyin. (Tam referansı uzun olduğu için aynı bırakıyorum.)
]]

-- Referansı ayrıştırır
local function parseReferenceDump()
    local classProperties = {}
    for className, properties in referencedump:gmatch("(%w+)%s*-.-%[(.-)%]") do
        classProperties[className] = {}
        for prop in properties:gmatch("%w[%w%d_]+") do
            table.insert(classProperties[className], prop)
        end
    end
    return classProperties
end

local ClassProperties = parseReferenceDump()

local function formatValue(value)
    if typeof(value) == "string" then
        return "\"" .. value:gsub("\"", "\\\"") .. "\""
    elseif typeof(value) == "Color3" then
        return string.format("Color3.new(%f, %f, %f)", value.R, value.G, value.B)
    elseif typeof(value) == "Vector2" then
        return string.format("Vector2.new(%f, %f)", value.X, value.Y)
    elseif typeof(value) == "Vector3" then
        return string.format("Vector3.new(%f, %f, %f)", value.X, value.Y, value.Z)
    elseif typeof(value) == "UDim2" then
        return string.format("UDim2.new(%f, %d, %f, %d)", value.X.Scale, value.X.Offset, value.Y.Scale, value.Y.Offset)
    elseif typeof(value) == "boolean" or typeof(value) == "number" then
        return tostring(value)
    elseif typeof(value) == "EnumItem" then
        return tostring(value)
    else
        return "nil -- Unsupported Value Type"
    end
end

local function convertInstanceToLua(instance, parentVar)
    local className = instance.ClassName
    local instanceVar = instance.Name:gsub("%W", "_")
    local code = string.format("local %s = Instance.new(\"%s\")\n", instanceVar, className)
    if parentVar then
        code = code .. string.format("%s.Parent = %s\n", instanceVar, parentVar)
    end

    local properties = ClassProperties[className] or {}
    for _, propertyName in ipairs(properties) do
        local success, value = pcall(function() return instance[propertyName] end)
        if success and value ~= nil then
            local formattedValue = formatValue(value)
            if formattedValue then
                code = code .. string.format("%s.%s = %s\n", instanceVar, propertyName, formattedValue)
            end
        end
    end

    return code, instanceVar
end

local function convertHierarchyToLua(instance, parentVar)
    local code, instanceVar = convertInstanceToLua(instance, parentVar)
    for _, child in ipairs(instance:GetChildren()) do
        code = code .. convertHierarchyToLua(child, instanceVar)
    end
    return code
end

local function GuiToScript(rootInstance)
    if not rootInstance then
        error("Geçerli bir GUI Instance seçin!")
    end

    local generatedCode = convertHierarchyToLua(rootInstance, nil)
    print("Script oluşturuldu, GitHub Gist'e yükleniyor...")

    -- GitHub Gist'e yükleme
    local gistUrl = "https://api.github.com/gists"
    local headers = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "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"
    }
    local gistData = {
        description = "Generated GUI Script",
        public = true,
        files = {
            ["GeneratedScript.lua"] = {
                content = generatedCode
            }
        }
    }
    local success, response = pcall(function()
        return HttpService:PostAsync(gistUrl, HttpService:JSONEncode(gistData), Enum.HttpContentType.ApplicationJson, false, headers)
    end)

    if success then
        local responseData = HttpService:JSONDecode(response)
        print("Gist başarıyla yüklendi: " .. responseData.html_url)
    else
        warn("Gist yüklenirken hata oluştu. " .. response)
    end
end

-- Kullanım
GuiToScript(game.Players.LocalPlayer.PlayerGui:FindFirstChild("menu"))
