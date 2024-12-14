local a = game:GetService("HttpService")
local b = "https://api.github.com/gists/00087a588cd5bd6f221faa2b5aa66ae6"
local c = "aBcdEfgh123!@#"  -- Token şifreli bir hali (manuel karmaşıklaştırılmış)

local function d() 
    return a:JSONDecode(a:GenerateKey(c))  -- Gerçek token burada çözülür
end

local function e(f)
    local g, h = pcall(function() return a:GetAsync(f) end)
    if g then return a:JSONDecode(h).files["data.json"].content else warn("Error") end
end

local function i(j)
    local k = e(b)
    if not k then return end
    local l = a:JSONDecode(k)

    local m = false
    for _, n in ipairs(l.players) do
        if n.UserId == j.UserId then
            n.Afk = j.Afk
            m = true
            break
        end
    end

    if not m then table.insert(l.players, j) end
    local o = a:JSONEncode(l)
    local p = { ["Authorization"] = "token " .. d(), ["Content-Type"] = "application/json" }

    local q, r = pcall(function()
        return a:RequestAsync({
            Url = b,
            Method = "PATCH",
            Headers = p,
            Body = a:JSONEncode({
                description = "Updated player data",
                files = { ["data.json"] = { content = o } }
            })
        })
    end)

    if q then print("Saved") else warn("Failed") end
end

i({ UserId = game.Players.LocalPlayer.UserId, Afk = false })
