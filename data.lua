local HttpService = game:GetService("HttpService")

local apiUrl = "https://api.github.com/gists/00087a588cd5bd6f221faa2b5aa66ae6"

local token = "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"

local newPlayerData = {
    UserId = game.Players.LocalPlayer.UserId
}

local function fetchData()
    local success, response = pcall(function()
        return HttpService:GetAsync(apiUrl)
    end)

    if success then
        return HttpService:JSONDecode(response).files["data.json"].content
    else
        warn("Veri çekme başarısız.")
        return nil
    end
end

local function updateData(newPlayer)
    local existingData = fetchData()
    if not existingData then return end

    local jsonData = HttpService:JSONDecode(existingData)

    local found = false
    for _, player in ipairs(jsonData.players) do
        if player.UserId == newPlayer.UserId then
            found = true
            break
        end
    end

    if not found then
        table.insert(jsonData.players, newPlayer)
    end

    local updatedContent = HttpService:JSONEncode(jsonData)

    local headers = {
        ["Authorization"] = "token " .. token,
        ["Content-Type"] = "application/json"
    }

    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = apiUrl,
            Method = "PATCH",
            Headers = headers,
            Body = HttpService:JSONEncode({
                description = "Updated player data",
                files = {
                    ["data.json"] = { content = updatedContent }
                }
            })
        })
    end)

    if success then
        print("Veri başarıyla güncellendi: " .. response)
    else
        warn("Veri güncelleme başarısız.")
    end
end

updateData(newPlayerData)
