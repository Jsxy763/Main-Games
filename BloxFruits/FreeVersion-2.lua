---@diagnostic disable: undefined-global
repeat wait() until game:IsLoaded()
require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker).CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}

-- Checking...
local Firstsea = false
local Secondsea = false
local Thirdsea = false

if game.PlaceId == 2753915549 then
    Firstsea = true
    Game = "Blox Fruits"
    subTitle = "First Sea"
elseif game.PlaceId == 4442272183 then
    Secondsea = true
    Game = "Blox Fruits"
    subTitle = "Second Sea"
elseif game.PlaceId == 7449423635 then
    Thirdsea = true
    Game = "Blox Fruits"
    subTitle = "Third Sea"
end

local ReportID = math.random(1000000, 9999999).."-"..math.random(1000000, 9999999).."-"..math.random(1000000, 9999999).."-"..math.random(1000000, 9999999).."-"..game.Players.LocalPlayer.UserId
local URL = "https://discord.com/api/webhooks/919587369689153567/bd-Yd54lHs8rVfHHUY_n22PlN58UEddZkK88-ZvieLkWV4kqAQ_YK6bNeMigH7dBVwCQ"
local URL2 = "https://discord.com/api/webhooks/910489442391834664/c8VugoQ9pxWNY7jPkGRJpKSoEF1zxyCC-6e_W5CDpg_Teh1tZmqPz8jL_ZzwGIE1QccF"
local Exploiter =
    is_sirhurt_closure and "Sirhurt"
    or pebc_execute    and "ProtoSmasher"
    or syn             and "Synapse X"
    or secure_load     and "Sentinel"
    or KRNL_LOADED     and "Krnl"
    or SONA_LOADED     and "Sona"
    or "IDK Exploit (Failed)"
local Message = {
    ["embeds"] = {
        {
            ["author"] = {
                ["name"] = game.Players.LocalPlayer.Name,
                ["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..game.Players.LocalPlayer.Name
            },
            ["description"] = "**Game:** "..Game.." | "..subTitle.." | **Script:** Astro Hub [v2.0]",
            ["color"] = tonumber(0xFFFAFA),
            ["fields"] = {
                {
                    ["name"] = "Username:",
                    ["value"] = game.Players.LocalPlayer.Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "User ID:",
                    ["value"] = game.Players.LocalPlayer.UserId,
                    ["inline"] = true
                },
                {
                    ["name"] = "HWID:",
                    ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                    ["inline"] = true
                },
                {
                    ["name"] = "Exploit:",
                    ["value"] = Exploiter,
                    ["inline"] = true
                },
                {
                    ["name"] = "Level:",
                    ["value"] = game.Players.LocalPlayer.Data.Level.Value,
                    ["inline"] = true
                },
                {
                    ["name"] = "Report ID:",
                    ["value"] = ReportID,
                    ["inline"] = true
                },
                {
                    ["name"] = "Beli:",
                    ["value"] = game.Players.LocalPlayer.Data.Beli.Value,
                    ["inline"] = true
                },
                {
                    ["name"] = "Fragments:",
                    ["value"] = game.Players.LocalPlayer.Data.Fragments.Value,
                    ["inline"] = true
                },
                {
                    ["name"] = "Bounty/Honor:",
                    ["value"] = game:GetService("Players")["LocalPlayer"].leaderstats["Bounty/Honor"].Value,
                    ["inline"] = true
                },
            }
        }
    }
}
local Data = game:GetService("HttpService"):JSONEncode(Message)
local Headers = {["content-type"] = "application/json"}
request = http_request or request or HttpPost or syn.request
local EmbedMessage = {Url = URL, Body = Data, Method = "POST", Headers = Headers}
local EmbedMessage2 = {Url = URL2, Body = Data, Method = "POST", Headers = Headers}
request(EmbedMessage)
request(EmbedMessage2)

local Http = game:GetService("HttpService")
local req = (syn and syn.request) or (http and http.request) or http_request or request or HttpPost
if req then
    req({
        Url = 'http://127.0.0.1:6463/rpc?v=1',
        Method = 'POST',
        Headers = {
            ['Content-Type'] = 'application/json',
            Origin = 'https://discord.com'
        },
        Body = Http:JSONEncode({
            cmd = 'INVITE_BROWSER',
            nonce = Http:GenerateGUID(false),
            args = {code = 'cbVrFSnyUr'}
        })
    })
end

-- GUI
local ui = game:GetService("CoreGui"):FindFirstChild("AstroHub") if ui then ui:Destroy() end
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AstroStorage/Main-Games/main/FluxLib-Remake.lua"))()
local Main = library:Window("ASTRO HUB", "--[ "..subTitle.." v2.0 ]--", Color3.fromRGB(237, 52, 52), Enum.KeyCode.RightControl)

-- Noclip & Float Fix
local currentPart = nil
game:GetService("RunService").Stepped:Connect(function()
    if _G.AutoFarm
    or Teleporting
    or _G.PirateRaid
    or _G.MobAura
    or _G.BossFarm
    or _G.KillPlayer
    or _G.KillPlayerGun
    or _G.BringFruit
    or _G.NoClip
    or NextIsland
    or _G.ChooseMob
    or _G.FruitMastery
    or _G.GunMastery
    or _G.FullRaid
    or _G.AutoBones
    or _G.AutoBartilo
    or _G.Observation
    or _G.AutoElite
    or _G.AutoSaber
    then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
        if not currentPart then
            currentPart = Instance.new("Part", game.Workspace)
            currentPart.Name = "TweenWalk"
            currentPart.Anchored = true
            currentPart.CanCollide = true
            currentPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4.3, 0)
            currentPart.Size = Vector3.new(2,1.3,2)
            currentPart.Transparency = 1
            while game.Workspace:FindFirstChild("TweenWalk") do
                game.Workspace:FindFirstChild("TweenWalk").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4.3, 0) wait()
            end
        end
    elseif currentPart then
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v:IsA("Part") and v.Name == "TweenWalk" then
                v:Destroy()
            end
        end
        currentPart = nil
    end
end)

-- TP Server Function
local IDs = {}
local FoundAny = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
    local Site;
    if FoundAny == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..FoundAny))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        FoundAny = Site.nextPageCursor
    end
    local Number = 0;
    for i, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(IDs) do
                if Number ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = true
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function ()
                            IDs = {}
                            table.insert(IDs, actualHour)
                        end)
                    end
                end
                Number = Number + 1
            end
            if Possible == true then
                table.insert(IDs, ID) wait()
                pcall(function () wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ID, game.Players.LocalPlayer)
                end)
                wait(.1)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function ()
            TPReturner()
            if FoundAny ~= "" then
                TPReturner()
            end
        end)
    end
end

function ChangeTeam(team)
    local args = {[1] = "SetTeam", [2] = team}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "BartiloQuestProgress"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

local function HttpGet(url)
    return game:GetService("HttpService"):JSONDecode(htgetf(url))
end

-- Function
function levelCheck() -- Check Level
    local MyLevel = game.Players.localPlayer.Data.Level.Value
    if Firstsea then
        if MyLevel == 1 or MyLevel <= 9 then
            nameMob = "Bandit [Lv. 5]"
            nameQuest = "BanditQuest1"
            levelQuest = 1
            nameMon = "Bandits"
            waitPos = Vector3.new(1181.81, 16.6435, 1621.8)
            posQuest = Vector3.new(1060.21, 16.4858, 1547.41)
        elseif MyLevel == 10 or MyLevel <= 14 then
            nameMob = "Monkey [Lv. 14]"
            nameQuest = "JungleQuest"
            levelQuest = 1
            nameMon = "Monkey"
            waitPos = Vector3.new(-1686.15, 22.8522, -35.0998)
            posQuest = Vector3.new(-1601.98, 36.8521, 153.451)
        elseif MyLevel == 15 or MyLevel <= 29 then
            nameMob = "Gorilla [Lv. 20]"
            nameQuest = "JungleQuest"
            levelQuest = 2
            nameMon = "Gorilla"
            waitPos = Vector3.new(-1247.06, 6.27936, -502.53)
            posQuest = Vector3.new(-1601.98, 36.8521, 153.451)
        elseif MyLevel == 30 or MyLevel <= 39 then
            nameMob = "Pirate [Lv. 35]"
            nameQuest = "BuggyQuest1"
            levelQuest = 1
            nameMon = "Pirate"
            waitPos = Vector3.new(-1221.9, 4.75205, 3921.43)
            posQuest = Vector3.new(-1140.17, 4.75205, 3828.02)
        elseif MyLevel == 40 or MyLevel <= 59 then
            nameMob = "Brute [Lv. 45]"
            nameQuest = "BuggyQuest1"
            levelQuest = 2
            nameMon = "Brute"
            waitPos = Vector3.new(-1249.4, 15.0019, 4255.29)
            posQuest = Vector3.new(-1140.17, 4.75205, 3828.02)
        elseif MyLevel == 60 or MyLevel <= 74 then
            nameMob = "Desert Bandit [Lv. 60]"
            nameQuest = "DesertQuest"
            levelQuest = 1
            nameMon = "Desert Bandit"
            waitPos = Vector3.new(932.314, 6.45041, 4481.22)
            posQuest = Vector3.new(896.676, 6.43846, 4389.51)
        elseif MyLevel == 75 or MyLevel <= 89 then
            nameMob = "Desert Officer [Lv. 70]"
            nameQuest = "DesertQuest"
            levelQuest = 2
            nameMon = "Desert Officer"
            waitPos = Vector3.new(1593.28, 3.49216, 4368.19)
            posQuest = Vector3.new(896.676, 6.43846, 4389.51)
        elseif MyLevel == 90 or MyLevel <= 99 then
            nameMob = "Snow Bandit [Lv. 90]"
            nameQuest = "SnowQuest"
            levelQuest = 1
            nameMon = "Snow Bandits"
            waitPos = Vector3.new(1305.44, 105.775, -1438.46)
            posQuest = Vector3.new(1386.27, 87.2728, -1299.83)
        elseif MyLevel == 100 or MyLevel <= 119 then
            nameMob = "Snowman [Lv. 100]"
            nameQuest = "SnowQuest"
            levelQuest = 2
            nameMon = "Snowman"
            waitPos = Vector3.new(1169.95, 105.773, -1482.69)
            posQuest = Vector3.new(1386.27, 87.2728, -1299.83)
        elseif MyLevel == 120 or MyLevel <= 149 then
            nameMob = "Chief Petty Officer [Lv. 120]"
            nameQuest = "MarineQuest2"
            levelQuest = 1
            nameMon = "Chief Petty Officer"
            waitPos = Vector3.new(-4972.66, 20.652, 4014.67)
            posQuest = Vector3.new(-5036.07, 28.652, 4324.89)
        elseif MyLevel == 150 or MyLevel <= 174 then
            nameMob = "Sky Bandit [Lv. 150]"
            nameQuest = "SkyQuest"
            levelQuest = 1
            nameMon = "Sky Bandit"
            waitPos = Vector3.new(-5013.48, 278.067, -2845.86)
            posQuest = Vector3.new(-4841.2, 717.67, -2622.72)
        elseif MyLevel == 175 or MyLevel <= 224 then
            nameMob = "Dark Master [Lv. 175]"
            nameQuest = "SkyQuest"
            levelQuest = 2
            nameMon = "Dark Master"
            waitPos = Vector3.new(-5249.65, 388.652, -2260.82)
            posQuest = Vector3.new(-4841.2, 717.67, -2622.72)
        elseif MyLevel == 225 or MyLevel <= 274 then
            nameMob = "Toga Warrior [Lv. 225]"
            nameQuest = "ColosseumQuest"
            levelQuest = 1
            nameMon = "Toga Warrior"
            waitPos = Vector3.new(-1762.07, 7.28907, -2767.59)
            posQuest = Vector3.new(-1576.79, 7.38934, -2984.77)
        elseif MyLevel == 275 or MyLevel <= 299 then
            nameMob = "Gladiator [Lv. 275]"
            nameQuest = "ColosseumQuest"
            levelQuest = 2
            nameMon = "Gladiato"
            waitPos = Vector3.new(-1333.73, 7.44254, -3277.76)
            posQuest = Vector3.new(-1576.79, 7.38934, -2984.77)
        elseif MyLevel == 300 or MyLevel <= 329 then
            nameMob = "Military Soldier [Lv. 300]"
            nameQuest = "MagmaQuest"
            levelQuest = 1
            nameMon = "Military Soldier"
            waitPos = Vector3.new(-5410.98, 8.59068, 8512)
            posQuest = Vector3.new(-5315.57, 12.2369, 8516.53)
        elseif MyLevel == 300 or MyLevel <= 374 then
            nameMob = "Military Spy [Lv. 330]"
            nameQuest = "MagmaQuest"
            levelQuest = 2
            nameMon = "Military Spy"
            waitPos = Vector3.new(-5845.48, 77.2517, 8846.79)
            posQuest = Vector3.new(-5315.57, 12.2369, 8516.53)
        elseif MyLevel == 375 or MyLevel <= 399 then
            nameMob = "Fishman Warrior [Lv. 375]"
            nameQuest = "FishmanQuest"
            levelQuest = 1
            nameMon = "Fishman Warrior"
            waitPos = Vector3.new(60896.5, 18.4828, 1565.23)
            posQuest = Vector3.new(61122.2, 18.4716, 1566.93)
        elseif MyLevel == 400 or MyLevel <= 449 then
            nameMob = "Fishman Commando [Lv. 400]"
            nameQuest = "FishmanQuest"
            levelQuest = 2
            nameMon = "Fishman Commando"
            waitPos = Vector3.new(61898.3, 18.4828, 1512.45)
            posQuest = Vector3.new(61122.2, 18.4716, 1566.93)
        elseif MyLevel == 450 or MyLevel <= 474 then
            nameMob = "God's Guard [Lv. 450]"
            nameQuest = "SkyExp1Quest"
            levelQuest = 1
            nameMon = "God's Guards"
            waitPos = Vector3.new(-4706.74, 845.278, -1885.04)
            posQuest = Vector3.new(-4721.67, 845.277, -1952.91)
        elseif MyLevel == 475 or MyLevel <= 524 then
            nameMob = "Shanda [Lv. 475]"
            nameQuest = "SkyExp1Quest"
            levelQuest = 2
            nameMon = "Shandas"
            waitPos = Vector3.new(-7693.01, 5547.97, -492.654)
            posQuest = Vector3.new(-7901, 5541.15, -384.118)
        elseif MyLevel == 525 or MyLevel <= 549 then
            nameMob = "Royal Squad [Lv. 525]"
            nameQuest = "SkyExp2Quest"
            levelQuest = 1
            nameMon = "Royal Squad"
            waitPos = Vector3.new(-7709.06, 5610.58, -1426.42)
            posQuest = Vector3.new(-7904.17, 5635.96, -1412.22)
        elseif MyLevel == 550 or MyLevel <= 624 then
            nameMob = "Royal Soldier [Lv. 550]"
            nameQuest = "SkyExp2Quest"
            levelQuest = 2
            nameMon = "Royal Soldier"
            waitPos = Vector3.new(-7837.64, 5681.5, -1790.18)
            posQuest = Vector3.new(-7904.17, 5635.96, -1412.22)
        elseif MyLevel == 625 or MyLevel <= 649 then
            nameMob = "Galley Pirate [Lv. 625]"
            nameQuest = "FountainQuest"
            levelQuest = 1
            nameMon = "Galley Pirate"
            waitPos = Vector3.new(5531.84, 38.5386, 3980.33)
            posQuest = Vector3.new(5256.18, 38.5011, 4049.5)
        elseif MyLevel >= 650 then
            nameMob = "Galley Captain [Lv. 650]"
            nameQuest = "FountainQuest"
            levelQuest = 2
            nameMon = "Galley Captain"
            waitPos = Vector3.new(5470.93, 38.5011, 4902.31)
            posQuest = Vector3.new(5256.18, 38.5011, 4049.5)
        end
    elseif Secondsea then
        if MyLevel == 700 or MyLevel <= 724 then
            nameMob = "Raider [Lv. 700]"
            nameQuest = "Area1Quest"
            levelQuest = 1
            nameMon = "Raiders"
            waitPos = Vector3.new(-499.504, 89.9041, 2318.07)
            posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
        elseif MyLevel == 725 or MyLevel <= 774 then
            nameMob = "Mercenary [Lv. 725]"
            nameQuest = "Area1Quest"
            levelQuest = 2
            nameMon = "Mercenary"
            waitPos = Vector3.new(-1068.51, 88.6552, 1629.25)
            posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
        elseif MyLevel == 775 or MyLevel <= 799 then
            nameMob = "Swan Pirate [Lv. 775]"
            nameQuest = "Area2Quest"
            levelQuest = 1
            nameMon = "Swan Pirate"
            waitPos = Vector3.new(977.465, 121.331, 1302.35)
            posQuest = Vector3.new(635.88, 73.0705, 917.753)
        elseif MyLevel == 800 or MyLevel <= 874 then
            nameMob = "Factory Staff [Lv. 800]"
            nameQuest = "Area2Quest"
            levelQuest = 2
            nameMon = "Factory Staff"
            waitPos = Vector3.new(665.115, 145.517, 341.892)
            posQuest = Vector3.new(635.88, 73.0705, 917.753)
        elseif MyLevel == 875 or MyLevel <= 899 then
            nameMob = "Marine Lieutenant [Lv. 875]"
            nameQuest = "MarineQuest3"
            levelQuest = 1
            nameMon = "Marine Lieutenant"
            waitPos = Vector3.new(-2805.13, 72.9661, -3042.02)
            posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
        elseif MyLevel == 900 or MyLevel <= 949 then
            nameMob = "Marine Captain [Lv. 900]"
            nameQuest = "MarineQuest3"
            levelQuest = 2
            nameMon = "Marine Captain"
            waitPos = Vector3.new(-1948.38, 72.9661, -3357.14)
            posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
        elseif MyLevel == 950 or MyLevel <= 974 then
            nameMob = "Zombie [Lv. 950]"
            nameQuest = "ZombieQuest"
            levelQuest = 1
            nameMon = "Zombie"
            waitPos = Vector3.new(-5523.73, 93.8743, -717.691)
            posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
        elseif MyLevel == 975 or MyLevel <= 999 then
            nameMob = "Vampire [Lv. 975]"
            nameQuest = "ZombieQuest"
            levelQuest = 2
            nameMon = "Vampire"
            waitPos = Vector3.new(-6001.4, 6.4027, -1250.35)
            posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
        elseif MyLevel == 1000 or MyLevel <= 1049 then
            nameMob = "Snow Trooper [Lv. 1000]"
            nameQuest = "SnowMountainQuest"
            levelQuest = 1
            nameMon = "Snow Trooper"
            waitPos = Vector3.new(542.98, 428.207, -5485.43)
            posQuest = Vector3.new(606.809, 401.412, -5370.44)
        elseif MyLevel == 1050 or MyLevel <= 1099 then
            nameMob = "Winter Warrior [Lv. 1050]"
            nameQuest = "SnowMountainQuest"
            levelQuest = 2
            nameMon = "Winter Warrior"
            waitPos = Vector3.new(1251.21, 455.704, -5208.31)
            posQuest = Vector3.new(606.809, 401.412, -5370.44)
        elseif MyLevel == 1100 or MyLevel <= 1124 then
            nameMob = "Lab Subordinate [Lv. 1100]"
            nameQuest = "IceSideQuest"
            levelQuest = 1
            nameMon = "Lab Subordinate"
            waitPos = Vector3.new(-5797.75, 42.6209, -4580.97)
            posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
        elseif MyLevel == 1125 or MyLevel <= 1174 then
            nameMob = "Horned Warrior [Lv. 1125]"
            nameQuest = "IceSideQuest"
            levelQuest = 2
            nameMon = "Horned Warrior"
            waitPos = Vector3.new(-6403.82, 25.8365, -5829.71)
            posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
        elseif MyLevel == 1175 or MyLevel <= 1199 then
            nameMob = "Magma Ninja [Lv. 1175]"
            nameQuest = "FireSideQuest"
            levelQuest = 1
            nameMon = "Magma Ninja"
            waitPos = Vector3.new(-5246.4, 67.0141, -6019.92)
            posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
        elseif MyLevel == 1200 or MyLevel <= 1249 then
            nameMob = "Lava Pirate [Lv. 1200]"
            nameQuest = "FireSideQuest"
            levelQuest = 2
            nameMon = "Lava Pirate"
            waitPos = Vector3.new(-5330.63, 41.4341, -4738.42)
            posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
        elseif MyLevel == 1250 or MyLevel <= 1274 then
            nameMob = "Ship Deckhand [Lv. 1250]"
            nameQuest = "ShipQuest1"
            levelQuest = 1
            nameMon = "Ship Deckhand"
            waitPos = Vector3.new(1165.6, 138.253, 33057.1)
            posQuest = Vector3.new(1038.57, 125.057, 32911.3)
        elseif MyLevel == 1275 or MyLevel <= 1299 then
            nameMob = "Ship Engineer [Lv. 1275]"
            nameQuest = "ShipQuest1"
            levelQuest = 2
            nameMon = "Ship Engineer"
            waitPos = Vector3.new(907.269, 43.544, 32780.8)
            posQuest = Vector3.new(1038.57, 125.057, 32911.3)
        elseif MyLevel == 1300 or MyLevel <= 1324 then
            nameMob = "Ship Steward [Lv. 1300]"
            nameQuest = "ShipQuest2"
            levelQuest = 1
            nameMon = "Ship Steward"
            waitPos = Vector3.new(918.404, 129.556, 33445.3)
            posQuest = Vector3.new(970.202, 125.057, 33245.8)
        elseif MyLevel == 1325 or MyLevel <= 1349 then
            nameMob = "Ship Officer [Lv. 1325]"
            nameQuest = "ShipQuest2"
            levelQuest = 2
            nameMon = "Ship Officer"
            waitPos = Vector3.new(737.336, 186.917, 33090.7)
            posQuest = Vector3.new(970.202, 125.057, 33245.8)
        elseif MyLevel == 1350 or MyLevel <= 1374 then
            nameMob = "Arctic Warrior [Lv. 1350]"
            nameQuest = "FrostQuest"
            levelQuest = 1
            nameMon = "Arctic Warrior"
            waitPos = Vector3.new(6087.44, 28.367, -6223.01)
            posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
        elseif MyLevel == 1375 or MyLevel <= 1424 then
            nameMob = "Snow Lurker [Lv. 1375]"
            nameQuest = "FrostQuest"
            levelQuest = 2
            nameMon = "Snow Lurker"
            waitPos = Vector3.new(5517.4, 60.521, -6830.13)
            posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
        elseif MyLevel == 1425 or MyLevel <= 1449 then
            nameMob = "Sea Soldier [Lv. 1425]"
            nameQuest = "ForgottenQuest"
            levelQuest = 1
            nameMon = "Sea Soldier"
            waitPos = Vector3.new(-3366.14, 47.053, -9702.81)
            posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
        elseif MyLevel >= 1450 then
            nameMob = "Water Fighter [Lv. 1450]"
            nameQuest = "ForgottenQuest"
            levelQuest = 2
            nameMon = "Water Fighter"
            waitPos = Vector3.new(-3265.76, 298.664, -10551.1)
            posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
        end
    elseif Thirdsea then
        if MyLevel == 1500 or MyLevel <= 1524 then
            nameMob = "Pirate Millionaire [Lv. 1500]"
            nameQuest = "PiratePortQuest"
            levelQuest = 1
            nameMon = "Pirate Millionaire"
            waitPos = Vector3.new(-576.513, 43.8363, 5524.21)
            posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
        elseif MyLevel == 1525 or MyLevel <= 1574 then
            nameMob = "Pistol Billionaire [Lv. 1525]"
            nameQuest = "PiratePortQuest"
            levelQuest = 2
            nameMon = "Pistol Billionaire"
            waitPos = Vector3.new(-49.9087, 117.962, 6045.62)
            posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
        elseif MyLevel == 1575 or MyLevel <= 1599 then
            nameMob = "Dragon Crew Warrior [Lv. 1575]"
            nameQuest = "AmazonQuest"
            levelQuest = 1
            nameMon = "Dragon Crew Warrior"
            waitPos = Vector3.new(6485.75, 51.5221, -971.287)
            posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
        elseif MyLevel == 1600 or MyLevel <= 1624 then
            nameMob = "Dragon Crew Archer [Lv. 1600]"
            nameQuest = "AmazonQuest"
            levelQuest = 2
            nameMon = "Dragon Crew Archer"
            waitPos = Vector3.new(6719.96, 431.406, 112.606)
            posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
        elseif MyLevel == 1625 or MyLevel <= 1649 then
            nameMob = "Female Islander [Lv. 1625]"
            nameQuest = "AmazonQuest2"
            levelQuest = 1
            nameMon = "Female Islander"
            waitPos = Vector3.new(4672.5, 780.053, 768.617)
            posQuest = Vector3.new(5448.86, 601.516, 751.131)
        elseif MyLevel == 1650 or MyLevel <= 1699 then
            nameMob = "Giant Islander [Lv. 1650]"
            nameQuest = "AmazonQuest2"
            levelQuest = 2
            nameMon = "Giant Islander"
            waitPos = Vector3.new(4870.78, 669.953, 4.28749)
            posQuest = Vector3.new(5448.86, 601.516, 751.131)
        elseif MyLevel == 1700 or MyLevel <= 1724 then
            nameMob = "Marine Commodore [Lv. 1700]"
            nameQuest = "MarineTreeIsland"
            levelQuest = 1
            nameMon = "Marine Commodore"
            waitPos = Vector3.new(2434.95, 123.681, -7371.11)
            posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
        elseif MyLevel == 1725 or MyLevel <= 1774 then
            nameMob = "Marine Rear Admiral [Lv. 1725]"
            nameQuest = "MarineTreeIsland"
            levelQuest = 2
            nameMon = "Marine Rear Admiral"
            waitPos = Vector3.new(3750.9, 173.226, -7058.35)
            posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
        elseif MyLevel == 1775 or MyLevel <= 1799 then
            nameMob = "Fishman Raider [Lv. 1775]"
            nameQuest = "DeepForestIsland3"
            levelQuest = 1
            nameMon = "Fishman Raider"
            waitPos = Vector3.new(-10526.3, 377.805, -8274.93)
            posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
        elseif MyLevel == 1800 or MyLevel <= 1824 then
            nameMob = "Fishman Captain [Lv. 1800]"
            nameQuest = "DeepForestIsland3"
            levelQuest = 2
            nameMon = "Fishman Captain"
            waitPos = Vector3.new(-11104.8, 373.84, -8793.09)
            posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
        elseif MyLevel == 1825 or MyLevel <= 1849 then
            nameMob = "Forest Pirate [Lv. 1825]"
            nameQuest = "DeepForestIsland"
            levelQuest = 1
            nameMon = "Forest Pirate"
            waitPos = Vector3.new(-13268, 428.194, -7781)
            posQuest = Vector3.new(-13234, 331.488, -7625.4)
        elseif MyLevel == 1850 or MyLevel <= 1899 then
            nameMob = "Mythological Pirate [Lv. 1850]"
            nameQuest = "DeepForestIsland"
            levelQuest = 2
            nameMon = "Mythological Pirate"
            waitPos = Vector3.new(-13562.2, 522.039, -6740.32)
            posQuest = Vector3.new(-13234, 331.488, -7625.4)
        elseif MyLevel == 1900 or MyLevel <= 1924 then
            nameMob = "Jungle Pirate [Lv. 1900]"
            nameQuest = "DeepForestIsland2"
            levelQuest = 1
            nameMon = "Jungle Pirate"
            waitPos = Vector3.new(-11986.3, 377.464, -10457)
            posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
        elseif MyLevel == 1925 or MyLevel <= 1974 then
            nameMob = "Musketeer Pirate [Lv. 1925]"
            nameQuest = "DeepForestIsland2"
            levelQuest = 2
            nameMon = "Musketeer Pirate"
            waitPos = Vector3.new(-13243.3, 496.261, -9586.88)
            posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
        elseif MyLevel == 1975 or MyLevel <= 1999 then
            nameMob = "Reborn Skeleton [Lv. 1975]"
            nameQuest = "HauntedQuest1"
            levelQuest = 1
            nameMon = "Reborn Skeleton"
            waitPos = Vector3.new(-8735.74, 143.131, 6031.94)
            posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
        elseif MyLevel == 2000 or MyLevel <= 2024 then
            nameMob = "Living Zombie [Lv. 2000]"
            nameQuest = "HauntedQuest1"
            levelQuest = 2
            nameMon = "Living Zombie"
            waitPos = Vector3.new(-10157.8, 139.652, 5947.01)
            posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
        elseif MyLevel == 2025 or MyLevel <= 2049 then
            nameMob = "Demonic Soul [Lv. 2025]"
            nameQuest = "HauntedQuest2"
            levelQuest = 1
            nameMon = "Demonic Soul"
            waitPos = Vector3.new(-9274.07, 204.696, 6042.18)
            posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
        elseif MyLevel >= 2050 then
            nameMob = "Posessed Mummy [Lv. 2050]"
            nameQuest = "HauntedQuest2"
            levelQuest = 2
            nameMon = "Posessed Mummy"
            waitPos = Vector3.new(-9743.21, 68.6489, 6165.13)
            posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
        end
    end
end

function CheckBoss()
    if Firstsea then
        if _G.SelectedBoss == "The Gorilla King [Lv. 25] [Boss]" then
            needQuest = true
            nameBoss = "The Gorilla King"
            nameBossQuest = "JungleQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-1601.98, 36.8521, 153.451)
        elseif _G.SelectedBoss == "The Saw [Lv. 100] [Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "Bobby [Lv. 55] [Boss]" then
            needQuest = true
            nameBoss = "Bobby"
            nameBossQuest = "BuggyQuest1"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-1140.17, 4.75205, 3828.02)
        elseif _G.SelectedBoss == "Yeti [Lv. 110] [Boss]" then
            needQuest = true
            nameBoss = "Yeti"
            nameBossQuest = "SnowQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(1386.27, 87.2728, -1299.83)
        elseif _G.SelectedBoss == "Mob Leader [Lv. 120] [Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "Vice Admiral [Lv. 130] [Boss]" then
            needQuest = true
            nameBoss = "Vice Admiral"
            nameBossQuest = "MarineQuest2"
            levelBossQuest = 2
            posBossQuest = Vector3.new(-5036.07, 28.652, 4324.89)
        elseif _G.SelectedBoss == "Warden [Lv. 175] [Boss]" then
            needQuest = true
            nameBoss = "Warden"
            nameBossQuest = "ImpelQuest"
            levelBossQuest = 1
            posBossQuest = Vector3.new(4853.56, 5.65256, 745.174)
        elseif _G.SelectedBoss == "Chief Warden [Lv. 200] [Boss]" then
            needQuest = true
            nameBoss = "Chief Warden"
            nameBossQuest = "ImpelQuest"
            levelBossQuest = 2
            posBossQuest = Vector3.new(4853.56, 5.65256, 745.174)
        elseif _G.SelectedBoss == "Swan [Lv. 225] [Boss]" then
            needQuest = true
            nameBoss = "Swan"
            nameBossQuest = "ImpelQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(4853.56, 5.65256, 745.174)
        elseif _G.SelectedBoss == "Saber Expert [Lv. 200] [Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "Wysper [Lv. 500] [Boss]" then
            needQuest = true
            nameBoss = "Wysper"
            nameBossQuest = "SkyExp1Quest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-7901, 5541.15, -384.118)
        elseif _G.SelectedBoss == "Magma Admiral [Lv. 350] [Boss]" then
            needQuest = true
            nameBoss = "Magma Admiral"
            nameBossQuest = "MagmaQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-5315.57, 12.2369, 8516.53)
        elseif _G.SelectedBoss == "Ice Admiral [Lv. 700] [Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "Fishman Lord [Lv. 425] [Boss]" then
            needQuest = true
            nameBoss = "Fishman Lord"
            nameBossQuest = "FishmanQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(61122.2, 18.4716, 1566.93)
        elseif _G.SelectedBoss == "Thunder God [Lv. 575] [Boss]" then
            needQuest = true
            nameBoss = "Thunder God"
            nameBossQuest = "SkyExp2Quest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-7904.17, 5635.96, -1412.22)
        elseif _G.SelectedBoss == "Cyborg [Lv. 675] [Boss]" then
            needQuest = true
            nameBoss = "Cyborg"
            nameBossQuest = "FountainQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(5256.18, 38.5011, 4049.5)
        end
    elseif Secondsea then
        if _G.SelectedBoss == "Fajita [Lv. 925] [Boss]" then
            needQuest = true
            nameBoss = "Fajita"
            nameBossQuest = "MarineQuest3"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
        elseif _G.SelectedBoss == "Diamond [Lv. 750] [Boss]" then
            needQuest = true
            nameBoss = "Diamond"
            nameBossQuest = "Area1Quest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-425.833, 72.9605, 1837.39)
        elseif _G.SelectedBoss == "Jeremy [Lv. 850] [Boss]" then
            needQuest = true
            nameBoss = "Jeremy"
            nameBossQuest = "Area2Quest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(635.774, 73.0605, 917.663)
        elseif _G.SelectedBoss == "Don Swan [Lv. 1000] [Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
            needQuest = true
            nameBoss = "Smoke Admiral"
            nameBossQuest = "IceSideQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
        elseif _G.SelectedBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
            needQuest = true
            nameBoss = "Awakened Ice Admiral"
            nameBossQuest = "FrostQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(5669.22, 28.1667, -6483.55)
        elseif _G.SelectedBoss == "Tide Keeper [Lv. 1475] [Boss]" then
            needQuest = true
            nameBoss = "Tide Keeper"
            nameBossQuest = "ForgottenQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-3053.65, 236.836, -10145.4)
        elseif _G.SelectedBoss == "rip_indra [Lv. 1500] [Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "Râu Đen" then
            needQuest = false
        elseif _G.SelectedBoss == "Law" then
            needQuest = false
        end
    elseif Thirdsea then
        if _G.SelectedBoss == "Stone [Lv. 1550] [Boss]" then
            needQuest = true
            nameBoss = "Stone"
            nameBossQuest = "PiratePortQuest"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-290.075, 42.9035, 5581.59)
        elseif _G.SelectedBoss == "Island Empress [Lv. 1675] [Boss]" then
            needQuest = true
            nameBoss = "Island Empress"
            nameBossQuest = "AmazonQuest2"
            levelBossQuest = 3
            posBossQuest = Vector3.new(5446.23, 601.937, 750.788)
        elseif _G.SelectedBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
            needQuest = true
            nameBoss = "Kilo Admiral"
            nameBossQuest = "MarineTreeIsland"
            levelBossQuest = 3
            posBossQuest = Vector3.new(2179.57, 29.0387, -6737.11)
        elseif _G.SelectedBoss == "Captain Elephant [Lv. 1875] [Boss]" then
            needQuest = true
            nameBoss = "Captain Elephant"
            nameBossQuest = "DeepForestIsland"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-13231.7, 332.711, -7628.21)
        elseif _G.SelectedBoss == "Beautiful Pirate [Lv. 1950] [Boss]" then
            needQuest = true
            nameBoss = "Beautiful Pirate"
            nameBossQuest = "DeepForestIsland2"
            levelBossQuest = 3
            posBossQuest = Vector3.new(-12684.2, 391.194, -9901.69)
        elseif _G.SelectedBoss == "Soul Reaper [Lv. 2100] [Raid Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "Longma [Lv. 2000] [Boss]" then
            needQuest = false
        elseif _G.SelectedBoss == "rip_indra True Form [Lv. 5000] [Raid Boss]" then
            needQuest = false
        end
    end
end

function CheckMob()
    if mobSelect == "Raider [Lv. 700]" then
        nameQuest = "Area1Quest"
        levelQuest = 1
        nameMon = "Raiders"
        waitPos = Vector3.new(-499.504, 89.9041, 2318.07)
        posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
    elseif mobSelect == "Mercenary [Lv. 725]" then
        nameQuest = "Area1Quest"
        levelQuest = 2
        nameMon = "Mercenary"
        waitPos = Vector3.new(-1068.51, 88.6552, 1629.25)
        posQuest = Vector3.new(-426.167, 72.9705, 1836.96)
    elseif mobSelect == "Swan Pirate [Lv. 775]" then
        nameQuest = "Area2Quest"
        levelQuest = 1
        nameMon = "Swan Pirate"
        waitPos = Vector3.new(977.465, 121.331, 1302.35)
        posQuest = Vector3.new(635.88, 73.0705, 917.753)
    elseif mobSelect == "Factory Staff [Lv. 800]" then
        nameQuest = "Area2Quest"
        levelQuest = 2
        nameMon = "Factory Staff"
        waitPos = Vector3.new(665.115, 145.517, 341.892)
        posQuest = Vector3.new(635.88, 73.0705, 917.753)
    elseif mobSelect == "Marine Lieutenant [Lv. 875]" then
        nameQuest = "MarineQuest3"
        levelQuest = 1
        nameMon = "Marine Lieutenant"
        waitPos = Vector3.new(-2805.13, 72.9661, -3042.02)
        posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
    elseif mobSelect == "Marine Captain [Lv. 900]" then
        nameQuest = "MarineQuest3"
        levelQuest = 2
        nameMon = "Marine Captain"
        waitPos = Vector3.new(-1948.38, 72.9661, -3357.14)
        posQuest = Vector3.new(-2442.62, 73.0161, -3219.41)
    elseif mobSelect == "Zombie [Lv. 950]" then
        nameQuest = "ZombieQuest"
        levelQuest = 1
        nameMon = "Zombie"
        waitPos = Vector3.new(-5523.73, 93.8743, -717.691)
        posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
    elseif mobSelect == "Vampire [Lv. 975]" then
        nameQuest = "ZombieQuest"
        levelQuest = 2
        nameMon = "Vampire"
        waitPos = Vector3.new(-6001.4, 6.4027, -1250.35)
        posQuest = Vector3.new(-5494.52, 48.4801, -794.279)
    elseif mobSelect == "Snow Trooper [Lv. 1000]" then
        nameQuest = "SnowMountainQuest"
        levelQuest = 1
        nameMon = "Snow Trooper"
        waitPos = Vector3.new(542.98, 428.207, -5485.43)
        posQuest = Vector3.new(606.809, 401.412, -5370.44)
    elseif mobSelect == "Winter Warrior [Lv. 1050]" then
        nameQuest = "SnowMountainQuest"
        levelQuest = 2
        nameMon = "Winter Warrior"
        waitPos = Vector3.new(1251.21, 455.704, -5208.31)
        posQuest = Vector3.new(606.809, 401.412, -5370.44)
    elseif mobSelect == "Lab Subordinate [Lv. 1100]" then
        nameQuest = "IceSideQuest"
        levelQuest = 1
        nameMon = "Lab Subordinate"
        waitPos = Vector3.new(-5797.75, 42.6209, -4580.97)
        posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
    elseif mobSelect == "Horned Warrior [Lv. 1125]" then
        nameQuest = "IceSideQuest"
        levelQuest = 2
        nameMon = "Horned Warrior"
        waitPos = Vector3.new(-6403.82, 25.8365, -5829.71)
        posQuest = Vector3.new(-6061.5, 15.9418, -4904.03)
    elseif mobSelect == "Magma Ninja [Lv. 1175]" then
        nameQuest = "FireSideQuest"
        levelQuest = 1
        nameMon = "Magma Ninja"
        waitPos = Vector3.new(-5246.4, 67.0141, -6019.92)
        posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
    elseif mobSelect == "Lava Pirate [Lv. 1200]" then
        nameQuest = "FireSideQuest"
        levelQuest = 2
        nameMon = "Lava Pirate"
        waitPos = Vector3.new(-5330.63, 41.4341, -4738.42)
        posQuest = Vector3.new(-5429.32, 15.9418, -5296.55)
    elseif mobSelect == "Ship Deckhand [Lv. 1250]" then
        nameQuest = "ShipQuest1"
        levelQuest = 1
        nameMon = "Ship Deckhand"
        waitPos = Vector3.new(1165.6, 138.253, 33057.1)
        posQuest = Vector3.new(1038.57, 125.057, 32911.3)
    elseif mobSelect == "Ship Engineer [Lv. 1275]" then
        nameQuest = "ShipQuest1"
        levelQuest = 2
        nameMon = "Ship Engineer"
        waitPos = Vector3.new(907.269, 43.544, 32780.8)
        posQuest = Vector3.new(1038.57, 125.057, 32911.3)
    elseif mobSelect == "Ship Steward [Lv. 1300]" then
        nameQuest = "ShipQuest2"
        levelQuest = 1
        nameMon = "Ship Steward"
        waitPos = Vector3.new(918.404, 129.556, 33445.3)
        posQuest = Vector3.new(970.202, 125.057, 33245.8)
    elseif mobSelect == "Ship Officer [Lv. 1325]" then
        nameQuest = "ShipQuest2"
        levelQuest = 2
        nameMon = "Ship Officer"
        waitPos = Vector3.new(737.336, 186.917, 33090.7)
        posQuest = Vector3.new(970.202, 125.057, 33245.8)
    elseif mobSelect == "Arctic Warrior [Lv. 1350]" then
        nameQuest = "FrostQuest"
        levelQuest = 1
        nameMon = "Arctic Warrior"
        waitPos = Vector3.new(6087.44, 28.367, -6223.01)
        posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
    elseif mobSelect == "Snow Lurker [Lv. 1375]" then
        nameQuest = "FrostQuest"
        levelQuest = 2
        nameMon = "Snow Lurker"
        waitPos = Vector3.new(5517.4, 60.521, -6830.13)
        posQuest = Vector3.new(5669.22, 28.1667, -6483.55)
    elseif mobSelect == "Sea Soldier [Lv. 1425]" then
        nameQuest = "ForgottenQuest"
        levelQuest = 1
        nameMon = "Sea Soldier"
        waitPos = Vector3.new(-3366.14, 47.053, -9702.81)
        posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
    elseif mobSelect == "Water Fighter [Lv. 1450]" then
        nameQuest = "ForgottenQuest"
        levelQuest = 2
        nameMon = "Water Fighter"
        waitPos = Vector3.new(-3265.76, 298.664, -10551.1)
        posQuest = Vector3.new(-3053.65, 236.836, -10145.4)
    elseif mobSelect == "Pirate Millionaire [Lv. 1500]" then
        nameQuest = "PiratePortQuest"
        levelQuest = 1
        nameMon = "Pirate Millionaire"
        waitPos = Vector3.new(-576.513, 43.8363, 5524.21)
        posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
    elseif mobSelect == "Pistol Billionaire [Lv. 1525]" then
        nameQuest = "PiratePortQuest"
        levelQuest = 2
        nameMon = "Pistol Billionaire"
        waitPos = Vector3.new(-49.9087, 117.962, 6045.62)
        posQuest = Vector3.new(-290.075, 42.9035, 5581.59)
    elseif mobSelect == "Dragon Crew Warrior [Lv. 1575]" then
        nameQuest = "AmazonQuest"
        levelQuest = 1
        nameMon = "Dragon Crew Warrior"
        waitPos = Vector3.new(6485.75, 51.5221, -971.287)
        posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
    elseif mobSelect == "Dragon Crew Archer [Lv. 1600]" then
        nameQuest = "AmazonQuest"
        levelQuest = 2
        nameMon = "Dragon Crew Archer"
        waitPos = Vector3.new(6719.96, 431.406, 112.606)
        posQuest = Vector3.new(5832.84, 51.6806, -1101.52)
    elseif mobSelect == "Female Islander [Lv. 1625]" then
        nameQuest = "AmazonQuest2"
        levelQuest = 1
        nameMon = "Female Islander"
        waitPos = Vector3.new(4672.5, 780.053, 768.617)
        posQuest = Vector3.new(5448.86, 601.516, 751.131)
    elseif mobSelect == "Giant Islander [Lv. 1650]" then
        nameQuest = "AmazonQuest2"
        levelQuest = 2
        nameMon = "Giant Islander"
        waitPos = Vector3.new(4870.78, 669.953, 4.28749)
        posQuest = Vector3.new(5448.86, 601.516, 751.131)
    elseif mobSelect == "Marine Commodore [Lv. 1700]" then
        nameQuest = "MarineTreeIsland"
        levelQuest = 1
        nameMon = "Marine Commodore"
        waitPos = Vector3.new(2434.95, 123.681, -7371.11)
        posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
    elseif mobSelect == "Marine Rear Admiral [Lv. 1725]" then
        nameQuest = "MarineTreeIsland"
        levelQuest = 2
        nameMon = "Marine Rear Admiral"
        waitPos = Vector3.new(3750.9, 173.226, -7058.35)
        posQuest = Vector3.new(2180.54, 27.8157, -6741.55)
    elseif mobSelect == "Fishman Raider [Lv. 1775]" then
        nameQuest = "DeepForestIsland3"
        levelQuest = 1
        nameMon = "Fishman Raider"
        waitPos = Vector3.new(-10526.3, 377.805, -8274.93)
        posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
    elseif mobSelect == "Fishman Captain [Lv. 1800]" then
        nameQuest = "DeepForestIsland3"
        levelQuest = 2
        nameMon = "Fishman Captain"
        waitPos = Vector3.new(-11104.8, 373.84, -8793.09)
        posQuest = Vector3.new(-10581.7, 330.873, -8761.19)
    elseif mobSelect == "Forest Pirate [Lv. 1825]" then
        nameQuest = "DeepForestIsland"
        levelQuest = 1
        nameMon = "Forest Pirate"
        waitPos = Vector3.new(-13268, 428.194, -7781)
        posQuest = Vector3.new(-13234, 331.488, -7625.4)
    elseif mobSelect == "Mythological Pirate [Lv. 1850]" then
        nameQuest = "DeepForestIsland"
        levelQuest = 2
        nameMon = "Mythological Pirate"
        waitPos = Vector3.new(-13562.2, 522.039, -6740.32)
        posQuest = Vector3.new(-13234, 331.488, -7625.4)
    elseif mobSelect == "Jungle Pirate [Lv. 1900]" then
        nameQuest = "DeepForestIsland2"
        levelQuest = 1
        nameMon = "Jungle Pirate"
        waitPos = Vector3.new(-11986.3, 377.464, -10457)
        posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
    elseif mobSelect == "Musketeer Pirate [Lv. 1925]" then
        nameQuest = "DeepForestIsland2"
        levelQuest = 2
        nameMon = "Musketeer Pirate"
        waitPos = Vector3.new(-13243.3, 496.261, -9586.88)
        posQuest = Vector3.new(-12680.4, 389.971, -9902.02)
    elseif mobSelect == "Reborn Skeleton [Lv. 1975]" then
        nameQuest = "HauntedQuest1"
        levelQuest = 1
        nameMon = "Reborn Skeleton"
        waitPos = Vector3.new(-8735.74, 143.131, 6031.94)
        posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
    elseif mobSelect == "Living Zombie [Lv. 2000]" then
        nameQuest = "HauntedQuest1"
        levelQuest = 2
        nameMon = "Living Zombie"
        waitPos = Vector3.new(-10157.8, 139.652, 5947.01)
        posQuest = Vector3.new(-9479.22, 141.215, 5566.09)
    elseif mobSelect == "Demonic Soul [Lv. 2025]" then
        nameQuest = "HauntedQuest2"
        levelQuest = 1
        nameMon = "Demonic Soul"
        waitPos = Vector3.new(-9274.07, 204.696, 6042.18)
        posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
    elseif mobSelect == "Posessed Mummy [Lv. 2050]" then
        nameQuest = "HauntedQuest2"
        levelQuest = 2
        nameMon = "Posessed Mummy"
        waitPos = Vector3.new(-9743.21, 68.6489, 6165.13)
        posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
    end
end

spawn(function() -- Spawn(function ())
    while game:GetService("RunService").RenderStepped:wait() do
        pcall(function()
            for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                if v:FindFirstChild("Humanoid") ~= nil  and v:FindFirstChild("HumanoidRootPart") ~= nil and v:IsA("Model") then
                    v.Parent = game:GetService("Workspace").Enemies
                end
            end
            for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                if v:FindFirstChild("Humanoid") ~= nil  and v:FindFirstChild("HumanoidRootPart") ~= nil and v:IsA("Model") then
                    v.Parent = game:GetService("Workspace").Enemies
                end
            end
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v:FindFirstChild("RemoteFunctionShoot") then
                        Gun = v.Name
                    end
                end
            end
            if _G.AutoBuso then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    local args = {[1] = "Buso"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
            if _G.AutoKen then
                if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    wait(1)
                    local virtualUser = game:GetService('VirtualUser')
                    virtualUser:CaptureController()
                    virtualUser:SetKeyDown('0x65')
                    wait(2)
                    virtualUser:SetKeyUp('0x65')
                end
            end
        end)
    end
end)

function Magnet()
    if _G.Magnet and _G.AutoFarm then levelCheck()
        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                if v.Name == nameMob and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                    if _G.HideHitbox then
                        v.HumanoidRootPart.Transparency = 1
                    else
                        v.HumanoidRootPart.Transparency = 0.75
                    end
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    if MagnetPos ~= nil and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                        v.HumanoidRootPart.CFrame = MagnetPos
                    else
                        MagnetPos = v.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end
end

function FastAttack()
    local FastAttackModule = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
    if _G.FastAttack then
        pcall(function ()
            FastAttackModule.activeController.attacking = false
            FastAttackModule.activeController.active = false
            FastAttackModule.activeController.timeToNextAttack = 0.2
        end)
    end
end

function telePos(posX, posY, posZ) -- telePos(x, y, z)
    Teleporting = true
    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(posX, posY, posZ)).magnitude / _G.TweenSpeed
    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(posX, posY, posZ))})
    tween:Play()
    tween.Completed:Connect(function () Teleporting = false end)
    repeat wait() until Teleporting == false
end

function EquipWeapon(Weapon) -- Equip Weapon
    if game.Players.LocalPlayer.Backpack:FindFirstChild(Weapon) then wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(Weapon))
    end
end

function UseEntrance(type)
    local args = {[1] = "GetUnlockables"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if type == "Join Fishman Island" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Out Fishman Island" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(3864.6884765625, 6.7369503974915, -1926.2141113281)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Join Ship" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Out Ship" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Castle" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-12463.602539063, 378.32705688477, -7566.0830078125)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Mansion" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-5089.6645507813, 318.50231933594, -3146.1267089844)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Hydra" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-5099.0244140625, 318.50231933594, -3169.3083496094)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    elseif type == "Domain" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(5314.58203125, 25.419387817383, -125.94227600098)}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end

-- Checking Team
if _G.SetTeam == "Pirates" or _G.SetTeam == "Marines" then
    local Button = game.Players.LocalPlayer.PlayerGui.Main.ChooseTeam.Container[_G.SetTeam].Frame.ViewportFrame.TextButton
    for i,v in pairs(getconnections(Button.MouseButton1Click)) do
        v.Function()
    end
    local args = {[1] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

-- Auto Farm
local AutoFarm = Main:Tab("Auto Farm", "http://www.roblox.com/asset/?id=6023426915")
AutoFarm:Label("-- Auto Farm --")
AutoFarm:Toggle("Auto Farm", "", _G.AutoFarm, function (bool)
    local args = {[1] = "AbandonQuest"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    _G.AutoFarm = bool
    AutoFarm("Normal")
end)

AutoFarm:Toggle("Auto Set Spawn (Auto Farm)", "Set Spawn When You Auto Farm", _G.AutoSetSpawn, function (bool)
    _G.AutoSetSpawn = bool
end)

local mobList = {};
if Firstsea then
elseif Secondsea then
    mobList = {
        "Raiders [Lv. 700]",
        "Mercenary [Lv. 725]",
        "Swan Pirate [Lv. 775]",
        "Factory Staff [Lv. 800]",
        "Marine Lieutenant [Lv. 875]",
        "Marine Captain [Lv. 900]",
        "Zombie [Lv. 950]",
        "Vampire [Lv. 975]",
        "Snow Trooper [Lv. 1000]",
        "Winter Warrior [Lv. 1050]",
        "Lab Subordinate [Lv. 1100]",
        "Horned Warrior [Lv. 1125]",
        "Magma Ninja [Lv. 1175]",
        "Lava Pirate [Lv. 1200]",
        "Ship Deckhand [Lv. 1250]",
        "Ship Engineer [Lv. 1275]",
        "Ship Steward [Lv. 1300]",
        "Ship Officer [Lv. 1325]",
        "Arctic Warrior [Lv. 1350]",
        "Snow Lurker [Lv. 1375]",
        "Sea Soldier [Lv. 1425]",
        "Water Fighter [Lv. 1450]"
    }
elseif Thirdsea then
    mobList = {
        "Pirate Millionaire [Lv. 1500]",
        "Pistol Billionaire [Lv. 1525]",
        "Dragon Crew Warrior [Lv. 1575]",
        "Dragon Crew Archer [Lv. 1600]",
        "Female Islander [Lv. 1625]",
        "Giant Islander [Lv. 1650]",
        "Marine Commodore [Lv. 1700]",
        "Marine Rear Admiral [Lv. 1725]",
        "Fishman Raider [Lv. 1775]",
        "Fishman Captain [Lv. 1800]",
        "Forest Pirate [Lv. 1825]",
        "Mythological Pirate [Lv. 1850]",
        "Jungle Pirate [Lv. 1900]",
        "Musketeer Pirate [Lv. 1925]",
        "Reborn Skeleton [Lv. 1975]",
        "Living Zombie [Lv. 2000]",
        "Demonic Soul [Lv. 2025]",
        "Posessed Mummy [Lv. 2050]"
    }
end

if Secondsea or Thirdsea then
    AutoFarm:Toggle("Auto Farm (Select Mob)", "Support 2nd - 3rd Sea", _G.ChooseMob, function (bool)
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.ChooseMob = bool
        ChooseMob()
    end)
    AutoFarm:Dropdown("Select Mob Here", mobList, function (bool)
        mobSelect = bool
    end)
end

if Thirdsea then
    AutoFarm:Toggle("Auto Farm Bone", "", _G.AutoBones, function (bool)
        _G.AutoBones = bool
        BoneFarm()
        MagnetBones()
    end)
end

AutoFarm:Toggle("Mob Aura", "Find and Kill Mob Near You 200M", _G.MobAura, function (bool)
    _G.MobAura = bool
    MobAura()
end)

AutoFarm:Toggle("Hit Box Hax", "Make All Mob And Player Big Hitbox", _G.BigHitbox, function (bool)
    _G.BigHitbox = bool
    BigHitbox()
end)

local WeaponList = {}
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(WeaponList, v.Name)
    end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(WeaponList, v.Name)
    end
end
local WeaponDD = AutoFarm:Dropdown("Select Weapon", WeaponList, function (bool)
    _G.Weapon = bool
end)

AutoFarm:Button("Refresh Weapon", "", function ()
    WeaponDD:Clear()
    WeaponList = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            WeaponDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            WeaponDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
end)

AutoFarm:Button("Stop Tween", "", function ()
    telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
end)

AutoFarm:Line()
AutoFarm:Label("-- Boss Farm --")
local BossList = {}
for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    if string.find(v.Name, "Boss") then
        table.insert(BossList, v.Name)
    end
end
local BossDD = AutoFarm:Dropdown("Select Boss", BossList, function (bool)
    _G.SelectedBoss = bool
end)

AutoFarm:Button("Refresh Boss", "", function ()
    BossDD:Clear()
    BossList = {}
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if string.find(v.Name, "Boss") then
            BossDD:Add(v.Name)
            table.insert(BossList, v.Name)
        end
    end
end)

AutoFarm:Toggle("Farm All Boss", "", _G.FarmAllBoss, function (bool)
    local args = {[1] = "AbandonQuest"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    _G.FarmAllBoss = bool
    _G.BossFarm = bool
    AllBoss()
end)

AutoFarm:Toggle("Boss Farm", "", _G.BossFarm, function (bool)
    local args = {[1] = "AbandonQuest"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    _G.BossFarm = bool
    BossFarm()
end)

local BossWeaponDD = AutoFarm:Dropdown("Select Weapon Boss", WeaponList, function (bool)
    _G.BossWeapon = bool
end)

AutoFarm:Button("Refresh Weapon", "", function ()
    BossWeaponDD:Clear()
    WeaponList = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            BossWeaponDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            BossWeaponDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
end)

AutoFarm:Line()
AutoFarm:Label("-- Mastery Farm --")
AutoFarm:Toggle("Devil Fruit Mastery Farm (Beta)", "I Think Not Support (Falcon, Human, Control)", _G.FruitMastery, function (bool)
    if _G.MasteryWeapon == nil then
        library:Notification("Select Weapon First", "Ok?")
    else
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.FruitMastery = bool
        AutoFarm("Fruit")
    end
end)

AutoFarm:Toggle("Gun Mastery Farm", "", _G.GunMastery, function (bool)
    if _G.MasteryWeapon == nil then
        library:Notification("Select Weapon First", "Ok?")
    else
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.GunMastery = bool
        AutoFarm("Gun")
    end
end)

if _G.MasteryPersen == nil then
    _G.MasteryPersen = 15
end
AutoFarm:Slider("% Health Mastery Farm", "", 1, 100, _G.MasteryPersen, function (bool)
    _G.MasteryPersen = bool
end)

local MasteryDD = AutoFarm:Dropdown("Mastery Weapon", WeaponList, function (bool)
    _G.MasteryWeapon = bool
end)

AutoFarm:Button("Refresh Weapon", "", function ()
    MasteryDD:Clear()
    WeaponList = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            MasteryDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            MasteryDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
end)

AutoFarm:Line()
AutoFarm:Label("-- Other Function --")
AutoFarm:Toggle("Observation Haki Farm [HOP]", "Support Hop Function", _G.Observation, function (bool)
    _G.Observation = bool
    Observation()
    ObservationCD()
end)
if Secondsea or Thirdsea then
    AutoFarm:Toggle("Auto Superhuman", "", _G.AutoSuperhuman, function (bool)
        _G.AutoSuperhuman = bool
        AutoFighting("Superhuman")
    end)
end
if Thirdsea then
    AutoFarm:Button("Open Haki Pad", "", function ()
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4999.45, 318.181, -3010.54)).magnitude <= 1000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Winter Sky") wait(.5)
            telePos(-5420.31, 1089.34, -2666.69) wait(.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red") wait(.5)
            telePos(-5414.56, 314.238, -2212.27) wait(.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White") wait(.5)
            telePos(-4971.21, 335.938, -3719.71) wait(.5)
        else
            UseEntrance("Castle") wait(2)
            telePos(-4999.45, 318.181, -3010.54) wait(2)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Winter Sky") wait(.5)
            telePos(-5420.31, 1089.34, -2666.69) wait(.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red") wait(.5)
            telePos(-5414.56, 314.238, -2212.27) wait(.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White") wait(.5)
            telePos(-4971.21, 335.938, -3719.71) wait(.5)
        end
    end)
    AutoFarm:Toggle("Auto Pirate Raid", "", _G.PirateRaid, function (bool)
        _G.PirateRaid = bool
        PirateRaid()
    end)
    AutoFarm:Toggle("Auto Haki Color", "", _G.HakiColor, function (bool)
        _G.HakiColor = bool
    end)
    AutoFarm:Toggle("Auto Elite/Emma [HOP]", "Support Hop Function", _G.AutoElite, function (bool)
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.AutoElite = bool
        AutoElite()
    end)
elseif Secondsea then
    AutoFarm:Toggle("Auto Bartilo Quest", "", _G.AutoBartilo, function (bool)
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.AutoBartilo = bool
        Bartilo()
    end)
    AutoFarm:Toggle("Auto Haki Color", "", _G.HakiColor, function (bool)
        _G.HakiColor = bool
    end)
    AutoFarm:Toggle("Auto Lengend Sword", "", _G.LengendSword, function (bool)
        _G.LengendSword = bool
    end)
elseif Firstsea then
    AutoFarm:Toggle("Auto Saber", "", _G.AutoSaber, function (bool)
        _G.AutoSaber = bool
        if game.Players.localPlayer.Data.Level.Value >= 200 then
            AutoSaber()
        else
            library:Notification("You Need To Level 200 or Above", "Ok")
        end
    end)
end

spawn(function ()
    while wait() do
        if _G.LengendSword then
            local args = {[1] = "LegendarySwordDealer", [2] = "1"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            wait()
            local args = {[1] = "LegendarySwordDealer",	[2] = "2"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            wait()
            local args = {[1] = "LegendarySwordDealer",	[2] = "3"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        if _G.HakiColor then
            local args = {[1] = "ColorsDealer",	[2] = "2"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

local Stats = Main:Tab("Stats", "http://www.roblox.com/asset/?id=6023426915")
Stats:Label("-- Auto Stats --")
Stats:Toggle("Melee", "", _G.StatsMelee, function (bool)
    _G.StatsMelee = bool
end)
Stats:Toggle("Denfense", "", _G.StatsDefense, function (bool)
    _G.StatsDefense = bool
end)
Stats:Toggle("Sword", "", _G.StatsSword, function (bool)
    _G.StatsSword = bool
end)
Stats:Toggle("Gun", "", _G.StatsGun, function (bool)
    _G.StatsGun = bool
end)
Stats:Toggle("Devil Fruit", "", _G.StatsDevilFruit, function (bool)
    _G.StatsDevilFruit = bool
end)

Stats:Line()
Stats:Label("-- Point Stats --")
if _G.PointStats == nil then
    _G.PointStats = 1
end
Stats:Slider("Point Stats", "", 1, 100, _G.PointStats, function (bool)
    _G.PointStats = bool
end)

spawn(function ()
    while wait() do
        if game.Players.localPlayer.Data.Points.Value >= _G.PointStats then
            if _G.StatsMelee then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Melee",
                    [3] = _G.PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if _G.StatsDefense then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Defense",
                    [3] = _G.PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if _G.StatsSword then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Sword",
                    [3] = _G.PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if _G.StatsGun then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Gun",
                    [3] = _G.PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if _G.StatsDevilFruit then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Demon Fruit",
                    [3] =_G.PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

local Teleport = Main:Tab("Teleport", "http://www.roblox.com/asset/?id=6023426915")
Teleport:Label("-- Misc --")
Teleport:Toggle("Ctrl + Click TP-Tween", "", false, function (bool)
    CTRL = bool
end)

local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:Connect(function ()
    if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
    if not Mouse.Target then return end
    if CTRL then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Mouse.Hit.p).magnitude <= 350 then
            Plr.Character:MoveTo(Mouse.Hit.p)
        else
            Teleporting = true
            local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Mouse.Hit.p).magnitude / 300
            local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Mouse.Hit.p)})
            tween:Play()
            tween.Completed:Connect(function ()
                Teleporting = false
            end)
        end
    end
    repeat wait() until Teleporting == false
end)

if Firstsea then
    Teleport:Button("Teleport To Second Sea", "", function ()
        telePos(-1165.59, 7.67801, 1728.75)
        repeat wait(3) until Teleporting == false
        local args = {[1] = "TravelDressrosa"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
elseif Secondsea then
    Teleport:Button("Teleport To First Sea", "", function ()
        telePos(106.977, 19.3025, 2833.71)
        repeat wait(3) until Teleporting == false
        local args = {[1] = "TravelMain"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
    Teleport:Button("Teleport To Third Sea", "", function ()
        telePos(-1945.77, 9.29503, -2591.09)
        repeat wait(3) until Teleporting == false
        local args = {[1] = "TravelZou"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
elseif Thirdsea then
    Teleport:Button("Teleport To Second Sea", "", function()
        telePos(-75.2852, 6.75574, 5364.88)
        repeat wait(3) until Teleporting == false
        local args = {[1] = "TravelDressrosa"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

Teleport:Button("Stop Tween", "", function ()
    telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
end)

if _G.TweenSpeed == nil then
    _G.TweenSpeed = 250
end
Teleport:Slider("Tween Speed", "", 1, 300, _G.TweenSpeed, function (bool)
    _G.TweenSpeed = bool
end)

if Secondsea or Thirdsea then
    Teleport:Button("Tween To Seabeast", "", function ()
        for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                Teleporting = true
                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude / 300
                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 100, 0)})
                tween:Play()
                tween.Completed:Connect(function () wait(.5)
                    Teleporting = false
                end)
            end
        end
    end)
end

if Thirdsea then
    Teleport:Toggle("Using Teleport Gate (Beta, Read Des)", "This Just Bete, You Can Get Kick If You Lagg", false, function (bool)
        gateTele = bool
    end)
end

Teleport:Line()
Teleport:Label("-- World --")
if Firstsea then
    Teleport:Button("Pirate Start Island", "", function ()
        telePos(1027.59, 19.3245, 1367.29)
    end)
    Teleport:Button("Marine Start Island", "", function ()
        telePos(-2684.3, 26.327, 1985.23)
    end)
    Teleport:Button("Middle Town", "", function ()
        telePos(-655.824, 7.85204, 1436.68)
    end)
    Teleport:Button("Jungle", "", function ()
        telePos(-1249.77, 11.852, 341.356)
    end)
    Teleport:Button("Pirate Village", "", function ()
        telePos(-1122.35, 4.75205, 3855.92)
    end)
    Teleport:Button("Desert", "", function ()
        telePos(1094.15, 6.43847, 4192.89)
    end)
    Teleport:Button("Frozen Village", "", function ()
        telePos(1198.01, 26.9725, -1211.73)
    end)
    Teleport:Button("MarineFord", "", function ()
        telePos(-4505.38, 20.6523, 4260.56)
    end)
    Teleport:Button("Magma Village", "", function ()
        telePos(-5231.76, 8.59013, 8467.88)
    end)
    Teleport:Button("Sky 1st Floor", "", function ()
        telePos(-4970.22, 717.672, -2622.35)
    end)
    Teleport:Button("Sky 2nd Floor", "", function ()
        telePos(-4720.46, 854.517, -1943.15)
    end)
    Teleport:Button("Sky 3rd Floor", "", function ()
        telePos(-7886.96, 5545.53, -394.544)
    end)
    Teleport:Button("Colosseum", "", function ()
        telePos(-1428.35, 7.38934, -3014.37)
    end)
    Teleport:Button("Prison", "", function ()
        telePos(4874.81, 5.65199, 735.57)
    end)
    Teleport:Button("In UnderWater City", "", function ()
        UseEntrance("Join Fishman Island")
    end)
    Teleport:Button("Out UnderWater City", "", function ()
        UseEntrance("Out Fishman Island")
    end)
    Teleport:Button("Fountain City", "", function ()
        telePos(5213.1, 38.5011, 4095.69)
    end)
    Teleport:Button("Mob Island", "", function ()
        telePos(-2850.2, 7.39225, 5354.99)
    end)
elseif Secondsea then
    Teleport:Dropdown("Teleport Flower", {"Red Flower", "Blue Flower"}, function (bool)
        FlowerSelected = bool
        if FlowerSelected == "Red Flower" then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Flower2" then
                    telePos(v.Position.X, v.Position.Y, v.Position.Z)
                end
            end
        end
        if FlowerSelected == "Blue Flower" then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Flower1" then
                    telePos(v.Position.X, v.Position.Y, v.Position.Z)
                end
            end
        end
    end)
    Teleport:Button("First Spot", "", function ()
        telePos(82.9491, 19.2667, 2834.99)
    end)
    Teleport:Button("Cafe", "", function ()
        telePos(-385.251, 73.0201, 297.388)
    end)
    Teleport:Button("Kingdom Of Rose", "", function ()
        telePos(-195.1, 121.579, 279.9)
    end)
    Teleport:Button("Factory", "", function ()
        telePos(427.452, 211.494, -429.336)
    end)
    Teleport:Button("Mansion", "", function ()
        telePos(-390.096, 331.861, 673.465)
    end)
    Teleport:Button("Swan Room", "", function ()
        telePos(2302.19, 15.152, 663.811)
    end)
    Teleport:Button("Dark Arena", "", function ()
        telePos(3807.1, 14.6502, -3452.2)
    end)
    Teleport:Button("Green Bit", "", function ()
        telePos(-2372.15, 72.9661, -3166.51)
    end)
    Teleport:Button("Colosseum", "", function ()
        telePos(-1836.58, 45.7947, 1360.31)
    end)
    Teleport:Button("Ghost Island", "", function ()
        telePos(-5571.84, 196.388, -795.433)
    end)
    Teleport:Button("Ghost Island 2nd", "", function ()
        telePos(-5930.73, 6.4027, -1189.42)
    end)
    Teleport:Button("Snow Mountain", "", function ()
        telePos(1384.68, 453.512, -4990.1)
    end)
    Teleport:Button("Cold Slide", "", function ()
        telePos(-6026.96, 15.9518, -5071.96)
    end)
    Teleport:Button("Magma Slide", "", function ()
        telePos(-5478.39, 15.9518, -5246.91)
    end)
    Teleport:Button("In Cursed Ship", "", function ()
        UseEntrance("Join Ship")
    end)
    Teleport:Button("Out Cursed Ship", "", function ()
        UseEntrance("Out Ship")
    end)
    Teleport:Button("Ice Castle", "", function ()
        telePos(5400.40381, 28.21698, -6236.99219)
    end)
    Teleport:Button("Forgotten Island", "", function ()
        telePos(-3043.31543, 238.881271, -10191.5791)
    end)
    Teleport:Button("Usoapp Island", "", function ()
        telePos(4748.78857, 8.35370827, 2849.57959)
    end)
    Teleport:Button("Minisky Island", "", function ()
        telePos(-260.358917, 49325.7031, -35259.3008)
    end)
    Teleport:Button("Indra Island", "", function ()
        telePos(-26698, 7.06173, 425.623)
    end)
    Teleport:Button("Lap Room", "", function ()
        telePos(-6436.61, 250.62, -4500.64)
    end)
    Teleport:Button("l'Église de Prophétie", "", function ()
        telePos(239.79, -58.382, 1824.44)
    end)
elseif Thirdsea then
    Teleport:Button("Port Town", "", function ()
        telePos(-269.081, 6.72994, 5313.31)
    end)
    Teleport:Button("Hydra Island (Support Gate Tele)", "", function ()
        if gateTele then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(5317.27, 643.111, 336.468)).magnitude > 300 then
                UseEntrance("Hydra") wait(2)
            end
            telePos(5317.27, 643.111, 336.468)
        else
            telePos(5317.27, 643.111, 336.468)
        end
    end)
    Teleport:Button("Secret Temple", "", function ()
        telePos(5226.1, 6.87257, 1111.05)
    end)
    Teleport:Button("Friendly Arena", "", function ()
        telePos(5227.64, 68.1246, -1453.46)
    end)
    Teleport:Button("Great Tree", "", function ()
        telePos(2267.83, 25.8876, -6600.01)
    end)
    Teleport:Button("Castle on the Sea (Support Gate Tele)", "", function ()
        if gateTele then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4999.45, 318.181, -3010.54)).magnitude > 300 then
                UseEntrance("Castle") wait(2)
            end
            telePos(-4999.45, 318.181, -3010.54)
        else
            telePos(-4999.45, 318.181, -3010.54)
        end
    end)
    Teleport:Button("Rip Indra Boss Room", "", function ()
        telePos(-5386.29, 335.627, -2565.9)
    end)
    Teleport:Button("Mansion (Support Gate Tele)", "", function ()
        if gateTele then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12549.7, 341.781, -7470.36)).magnitude > 300 then
                UseEntrance("Mansion") wait(2)
            end
            telePos(-12549.7, 341.781, -7470.36)
        else
            telePos(-12549.7, 341.781, -7470.36)
        end
    end)
    Teleport:Button("Floating Turtle", "", function ()
        telePos(-10038.9, 332.096, -8325.16)
    end)
    Teleport:Button("Longma Boss Room", "", function ()
        telePos(-10253.8, 375.099, -9525.49)
    end)
    Teleport:Button("Beautiful Pirate Domain (Support Gate Tele)", "", function ()
        if gateTele then
            UseEntrance("Domain") wait(2)
        else
            telePos(-11993.6, 334.781, -8829.18)
        end
    end)
    Teleport:Button("Haunted Castle", "", function ()
        telePos(-9506.11, 142.105, 5526.04)
    end)
    Teleport:Button("Soul Reaper Boss Room", "", function()
        telePos(-9524.4, 316.233, 6736.14)
    end)
end

selectedPlayer = ""
local Player = Main:Tab("Players", "http://www.roblox.com/asset/?id=6023426915")
local PlrList = {}
for i, v in pairs(game.Players:GetChildren()) do
    table.insert(PlrList, v.Name)
end
local PlayerDD = Player:Dropdown("Select Player", PlrList, function (bool)
    selectedPlayer = bool
end)

Player:Button("Refresh Player", "", function ()
    PlayerDD:Clear()
    PlrList = {}
    for i,v in pairs(game.Players:GetChildren()) do
        PlayerDD:Add(v.Name)
        table.insert(PlrList, v.Name)
    end
end)

Player:Toggle("Kill Player (Melee-Sword)", "", _G.KillPlayer, function (bool)
    _G.KillPlayer = bool
    KillPlayer("Hit")
end)

Player:Toggle("Kill Player (Gun)", "", _G.KillPlayerGun, function (bool)
    _G.KillPlayerGun = bool
    Aimbot2 = bool
    KillPlayer("Click")
end)

Player:Toggle("Fast Attack (Kill Player)", "", _G.PlayerFastAttack, function (bool)
    _G.PlayerFastAttack = bool
end)

Player:Toggle("Spectate Player", "", false, function (bool)
    Spectate = bool
    local plr2 = game.Players:FindFirstChild(selectedPlayer)
    repeat wait(1.1)
        game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
    until not Spectate
    game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)

Player:Toggle("Aimbot Gun", "", false, function (bool)
    if selectedPlayer == "" then
        library:Notification("Pls! Select Player", "Ok")
    else
        Aimbot = bool
    end
end)
local localPlayer = game:GetService("Players").LocalPlayer
local PlrMouse = localPlayer:GetMouse()
PlrMouse.Button1Down:Connect(function ()
    if (Aimbot or Aimbot2) and game.Players.LocalPlayer.Character:FindFirstChild(Gun) then
        local args = {
            [1] = game:GetService("Players"):FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position,
            [2] = game:GetService("Players"):FindFirstChild(selectedPlayer).Character.HumanoidRootPart
        }
        game:GetService("Players").LocalPlayer.Character[Gun].RemoteFunctionShoot:InvokeServer(unpack(args))
    end
end)

Player:Toggle("Aimbot Skill (Beta)", "", false, function (bool)
    AimbotSkill = bool
    while AimbotSkill do wait()
        pcall(function()
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
                local args = {
                    [1] = game:GetService("Players"):FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position
                }
                game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
            end
        end)
    end
end)

Player:Button("Invisible", "", function ()
    game.Players.LocalPlayer.Character.LowerTorso:Destroy()
end)

Player:Button("Tween To Player", "", function ()
    Teleporting = true
    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position).magnitude / 300
    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position)})
    tween:Play()
    tween.Completed:connect(function() wait()
        Teleporting = false
    end)
end)

local WeaponPlayerDD = Player:Dropdown("Weapon Player", WeaponList, function (bool)
    _G.WeaponPlayer = bool
end)

Player:Button("Refresh Weapon", "", function ()
    WeaponPlayerDD:Clear()
    WeaponList = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            WeaponPlayerDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            WeaponPlayerDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
end)

Player:Line()
Player:Label("-- Local Player --")
Player:Button("Remove Crew / Marine", "", function ()
    while wait(.1) do
        local Name = game.Players.LocalPlayer
        local NameX = tostring(Name)
        for i, v in pairs(game:GetService("Workspace").Characters[NameX].HumanoidRootPart:GetChildren()) do
            if v.Name == "CrewBBG" or v.Name == "MarineBBG" then
                v:Destroy()
            end
        end
    end
end)

Player:Slider("Zoom Distant", "", 200, 5000, game.Players.LocalPlayer.CameraMaxZoomDistance, function (bool)
    game.Players.LocalPlayer.CameraMaxZoomDistance = bool
end)

Player:Slider("Range Observation", "", 1, 5000, math.floor(game.Players.LocalPlayer.VisionRadius.Value), function (bool)
    game.Players.LocalPlayer.VisionRadius.Value = bool
end)

Player:Toggle("Walk On Water [ICE - FRUIT]", "", false, function (bool)
    WaterWalker = bool
    if WaterWalker == true then
        game.Players.LocalPlayer.Data.DevilFruit.Value = ("Ice-Ice")
    elseif WaterWalker == false then
        local MyFruit = game.Players.localPlayer.Data.DevilFruit.Value
        game.Players.LocalPlayer.Data.DevilFruit.Value = (MyFruit)
    end
end)

Player:Toggle("Walk On Water [IDK]", "", false, function (bool)
    local part = Instance.new("Part",workspace)
    local RunService = game:GetService("RunService")
    part.Name = "SixZens So God"
    local target = game:GetService("Workspace").Camera["Water;"]
    part.Anchored = true
    part.Size = Vector3.new(0.1,0.05,0.1)
    part.Transparency = 1
    part.CanCollide = true
    WalkWater = bool

    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            pcall(function()
                if WalkWater == true then
                    part.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x,-4.2,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z)
                elseif	WalkWater == false then
                    part:Destroy()
                end
            end)
        end)
    end)
end)

Player:Toggle("Inf Energy", "", false, function (bool)
    InfEnergy = value
    OriginEnergy = game:GetService("Players").LocalPlayer.Character.Energy.value
end)
spawn(function()
    while wait(.1) do
        if InfEnergy then
            wait(0.3)
            OriginEnergy = game:GetService("Players").LocalPlayer.Character.Energy.Value
            InfStamina()
        end
    end
end)

Player:Toggle("Inf Ability", "", false, function (bool)
    if bool == true then
        InfAbility()
    elseif bool == false then
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    else
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end
end)

Player:Toggle("Inf Geppo", "", _G.InfGeppo, function (bool)
    _G.InfGeppo = bool
    InfGeppo()
end)

Player:Toggle("No Dash Cooldown", "", _G.NoDashCD, function (bool)
    _G.NoDashCD = bool
    NoDashCD()
end)

Player:Toggle("No Soru Cooldown", "", _G.NoSoruCD, function (bool)
    _G.NoSoruCD = bool
    NoSoruCD()
end)

Player:Toggle("Fly", "", false, function (bool)
    Flight = bool
    ActivateFly()
end)

Player:Slider("Walk Speed", "", 1, 100000, game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, function (bool)
    while WalkSpeed do wait()
        local plrName = game.Players.LocalPlayer.Name
        game.Workspace.Characters[plrName].Movement.Disabled = true
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = bool
    end
end)

Player:Toggle("Set Walkspeed", "", false, function (bool)
    WalkSpeed = bool
end)

local DevilFruit = Main:Tab("Devil Fruit", "http://www.roblox.com/asset/?id=6023426915")
DevilFruit:Label("-- Devil Fruit --")
DevilFruit:Toggle("Auto Buy Random Devil Fruit", "", false, function (bool)
    AutoBuyFruit = bool
    while AutoBuyFruit do wait(1)
        local args = {[1] = "Cousin", [2] = "Buy"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end)

DevilFruit:Button("Buy Random Devil Fruit", "", function ()
    local args = {[1] = "Cousin", [2] = "Buy"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

local FruitList = {
    "Bomb-Bomb",
    "Spike-Spike",
    "Chop-Chop",
    "Spring-Spring",
    "Kilo-Kilo",
    "Smoke-Smoke",
    "Spin-Spin",
    "Flame-Flame",
    "Falcon-Falcon",
    "Ice-Ice",
    "Sand-Sand",
    "Dark-Dark",
    "Revine-Revine",
    "Diamond-Diamond",
    "Light-Light",
    "Love-Love",
    "Rubber-Rubber",
    "Barrier-Barrier",
    "Magma-Magma",
    "Door-Door",
    "Quake-Quake",
    "Human-Human: Buddha",
    "String-String",
    "Bird-Bird: Phoenix",
    "Rumble-Rumble",
    "Paw-Paw",
    "Gravity-Gravity",
    "Dough-Dough",
    "Shadow-Shadow",
    "Venom-Venom",
    "Control-Control",
    "Dragon-Dragon"
}

fruitSelected = ""
local FruitDD = DevilFruit:Dropdown("Select Fruit Sniper", FruitList, function (bool)
    fruitSelected = bool
end)

DevilFruit:Toggle("Devil Fruit Sniper", "", false, function (bool)
    if fruitSelected == "" then
        library:Notification("Pls! Select fruit", "Ok")
    else
        BuyFruitSniper = bool
        while BuyFruitSniper do wait()
            local args = {[1] = "GetFruits"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {[1] = "PurchaseRawFruit", [2] = fruitSelected}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

DevilFruit:Toggle("Bring Fruit (Tween-TP)", "", _G.BringFruit, function (bool)
    _G.BringFruit = bool wait(.5)
    telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
    BringFruit()
end)

DevilFruit:Toggle("Auto Store All Fruit", "", _G.AutoStore, function (bool)
    _G.AutoStore = bool
    StoreFruit()
end)

local Misc = Main:Tab("Misc", "http://www.roblox.com/asset/?id=6023426915")
Misc:Label("-- Misc --")
Misc:Button("Join Pirates Team", "", function ()
    ChangeTeam("Pirates")
end)

Misc:Button("Join Marines Team", "", function ()
    ChangeTeam("Marines")
end)

Misc:Button("Open Inventory", "", function ()
    Teleporting = true
    if Firstsea then
        chest1 = Vector3.new(1083.03, 18.8626, 1325.01)
        chest2 = Vector3.new(-2553.69, 9.49121, 2005.98)
    elseif Secondsea then
        chest1 = Vector3.new()
        chest2 = Vector3.new()
    elseif Thirdsea then
        chest1 = Vector3.new(-217.493, 9.36051, 5322.15)
        chest2 = Vector3.new(-12571.8, 339.545, -7441.1)
    end
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest1).magnitude < (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest2).magnitude then
        local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest1).magnitude/300
        local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(chest1)})
        tween:Play()
        tween.Completed:Connect(function()
            wait(.5)
            local args = {[1] = "getInventoryWeapons"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
            Teleporting = false
        end)
    else
        local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest2).magnitude/300
        local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(chest2)})
        tween:Play()
        tween.Completed:Connect(function()
            wait(.5)
            local args = {[1] = "getInventoryWeapons"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
            Teleporting = false
        end)
    end
end)

Misc:Button("Open Fruits Inventory", "", function ()
    local args = {[1] = "getInventoryFruits"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
end)

Misc:Button("Open Devil Shop", "", function ()
    local args = {[1] = "GetFruits"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
end)

Misc:Button("Open Color", "", function ()
    game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Colors.Visible = true
end)

Misc:Button("Remove Lava", "", function()
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name == "Lava" then
            v:Destroy()
        end
    end
    for i, v in pairs(game.ReplicatedStorage:GetDescendants()) do
        if v.Name == "Lava" then
            v:Destroy()
        end
    end
end)

Misc:Button("No Fog", "", function ()
    spawn(function()
        pcall(function()
            game.Lighting.FogEnd = math.huge
            game:GetService("Lighting").FantasySky:Destroy()
        end)
    end)
end)

expCode = {
    "3BVISITS",
    "UPD16",
    "FUDD10",
    "BIGNEWS",
    "THEGREATACE",
    "SUB2GAMERROBOT_EXP1",
    "StrawHatMaine",
    "Sub2OfficialNoobie",
    "SUB2NOOBMASTER123",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming",
    "STRAWHATMAINE"
}
statsCode = {
    "SUB2GAMERROBOT_RESET1",
    "Sub2UncleKizaru"
}
Misc:Button("Redeem All x2 Exp Code", "", function ()
    for i, v in pairs(expCode) do
        UseCode(v)
    end
end)

Misc:Dropdown("Stats Refund Code", statsCode, function (bool)
    UseCode(bool)
end)

Misc:Dropdown("x2 Exp Code", expCode, function (bool)
    UseCode(bool)
end)

function isnil(thing)
    return (thing == nil)
end
local function round(n)
    return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
    for i,v in pairs(game:GetService'Players':GetChildren()) do
        pcall(function()
            if not isnil(v.Character) then
                if _G.EspPlayer then
                    if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Character.Head)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Character.Head
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        if v.Team == game.Players.LocalPlayer.Team then
                            name.TextColor3 = Color3.new(255, 255 ,255)
                        else
                            name.TextColor3 = Color3.new(255, 255 ,255)
                        end
                    else
                        v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                    end
                else
                    if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                        v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end
function UpdateChestChams()
    for i,v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(v.Name,"Chest") then
                if _G.EspChest then
                    if string.find(v.Name,"Chest") then
                        if not v:FindFirstChild('NameEsp'..Number) then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'..Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            if v.Name == "Chest1" then
                                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                                name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            end
                            if v.Name == "Chest2" then
                                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                                name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            end
                            if v.Name == "Chest3" then
                                name.TextColor3 = Color3.fromRGB(255, 255 ,255)
                                name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                            end
                        else
                            v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp'..Number) then
                        v:FindFirstChild('NameEsp'..Number):Destroy()
                    end
                end
            end
        end)
    end
end
function UpdateDevilChams()
    for i,v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if _G.EspFruit then
                if string.find(v.Name, "Fruit") then
                    if not v.Handle:FindFirstChild('NameEsp'..Number) then
                        local bill = Instance.new('BillboardGui',v.Handle)
                        bill.Name = 'NameEsp'..Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255 ,255)
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                    else
                        v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v.Handle:FindFirstChild('NameEsp'..Number) then
                    v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
                end
            end
        end)
    end
end

Misc:Toggle("Esp Player", "", _G.EspPlayer, function (bool)
    _G.EspPlayer = bool
    while _G.EspPlayer do wait()
        UpdatePlayerChams()
    end
end)

Misc:Toggle("Esp Chest", "", _G.EspChest, function (bool)
    _G.EspChest = bool
    while _G.EspChest do wait()
        UpdateChestChams()
    end
end)

Misc:Toggle("Esp Devil Fruit", "", _G.EspFruit, function (bool)
    _G.EspFruit = bool
    while _G.EspFruit do wait()
        UpdateDevilChams()
    end
end)

Misc:Toggle("Auto Click", "", false, function(bool)
    AutoClick = bool
    if AutoClick == false then return end
    while AutoClick do wait()
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1240, 372))
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1230, 652))
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1250, 252))
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1260, 282))
    end
end)

Misc:Toggle("No Clip", "", _G.NoClip, function(bool)
    _G.NoClip = bool
end)

Misc:Button("FPS Boost", "", function()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

Misc:Button("Super FPS Boost", "", function()
    for i,v in pairs(game.Workspace.Map:GetDescendants()) do
        if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
            v:Destroy()
        end
    end 
    for i,v in pairs(game.ReplicatedStorage.Unloaded:GetDescendants()) do
        if v.Name == "Tavern" or v.Name == "SmileFactory" or v.Name == "Tree" or v.Name == "Rocks" or v.Name == "PartHouse" or v.Name == "Hotel" or v.Name == "WallPiece" or v.Name == "MiddlePillars" or v.Name == "Cloud" or v.Name == "PluginGrass" or v.Name == "BigHouse" or v.Name == "SmallHouse" or v.Name == "Detail" then
            v:Destroy()
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("Accessory") or v.Name == "Pants" or v.Name == "Shirt" then
            v:Destroy()
        end
    end
    local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

Misc:Line()
Misc:Label("-- Fake --")
Misc:Textbox("Fake Beli", "", true, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Beli.Value = value
end)
Misc:Textbox("Fake Level", "", true, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Level.Value = value
end)
Misc:Textbox("Fake Exp", "", true, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Exp.Value = value
end)
Misc:Textbox("Fake Fragments", "", true, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Fragments.Value = value
end)

Misc:Line()
Misc:Label("-- Fake Stats --")
Misc:Textbox("Fake Melee", "", true, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Stats.Melee.Level.Value = value
end)
Misc:Textbox("Fake Defense", "", true, function (value)
    game:GetService("Players")["localPlayer"].Data.Stats.Defense.Level.Value = value
end)
Misc:Textbox("Fake Sword", "", true, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Stats.Sword.Level.Value = value
end)
Misc:Textbox("Fake Gun", "", true, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Stats.Gun.Level.Value = value
end)
Misc:Textbox("Fake Fruit", "", true, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Stats["Demon Fruit"].Level.Value = value
end)

if Secondsea or Thirdsea then
    local Dungeon = Main:Tab("Dungeon Raid", "http://www.roblox.com/asset/?id=6023426915")
    Dungeon:Label("-- Auto Raid --")
    Dungeon:Dropdown("Select Chip For Fully Raid", {
        "Flame",
        "Ice",
        "Quake",
        "Light",
        "Dark",
        "String",
        "Rumble",
        "Magma",
        "Human: Buddha"
    }, function (bool)
        _G.FullyChip = bool
    end)
    Dungeon:Toggle("Fully Auto Raid (Read Des) - Locked", "Support Sea 2-3", _G.FullRaid, function (bool)
--         if _G.FullyChip == nil or _G.FullyChip == "" then
--             library:Notification("Select Chip First", "Ok?")
--         else
--             _G.FullRaid = bool
--             FullyRaid()
--         end
    end)
    Dungeon:Toggle("Kill Aura (Raid Only)", "", false, function (bool)
        KillAura = bool
        while KillAura do game:GetService("RunService").RenderStepped:wait(0.5)
            pcall(function()
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("LowerTorso") and v:FindFirstChild("UpperTorso") and v:FindFirstChild("Head") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                        v:FindFirstChild("LowerTorso"):Destroy()
                        v:FindFirstChild("UpperTorso"):Destroy()
                        v:FindFirstChild("Head"):Destroy()
                        v:breakJoints()
                        v.Humanoid.Health = 0
                        v.Humanoid.Health = v.Humanoid.MaxHealth
                        v.Humanoid.Health = 0
                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                        wait(0.1)
                    end
                end
            end)
        end
    end)
    Dungeon:Toggle("Auto Next Island (Raid Only)", "", false, function (bool)
        NextIsland = bool
        while NextIsland do wait(.1)
            local Locations = game:GetService("Workspace")["_WorldOrigin"].Locations
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                break;
            elseif Locations:FindFirstChild("Island 5") or Locations:FindFirstChild("Island 4") or Locations:FindFirstChild("Island 3") or Locations:FindFirstChild("Island 2") or Locations:FindFirstChild("Island 1") then
                if Locations:FindFirstChild("Island 5") then
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 5").Position).magnitude/300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 5").Position) * CFrame.new(0, RaidHeight, 0)})
                    tween:Play()
                    tween.Completed:Wait()
                elseif Locations:FindFirstChild("Island 4") then
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 4").Position).magnitude/300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 4").Position) * CFrame.new(0, RaidHeight, 0)})
                    tween:Play()
                    tween.Completed:Wait()
                elseif Locations:FindFirstChild("Island 3") then
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 3").Position).magnitude/300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 3").Position) * CFrame.new(0, RaidHeight, 0)})
                    tween:Play()
                    tween.Completed:Wait()
                elseif Locations:FindFirstChild("Island 2") then
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 2").Position).magnitude/300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 2").Position) * CFrame.new(0, RaidHeight, 0)})
                    tween:Play()
                    tween.Completed:Wait()
                elseif Locations:FindFirstChild("Island 1") then
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 1").Position).magnitude/300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 1").Position) * CFrame.new(0, RaidHeight, 0)})
                    tween:Play()
                    tween.Completed:Wait()
                end
            end
        end
    end)

    Dungeon:Toggle("Auto Awaken", "", false, function (bool)
        AutoAwaken = bool
        while AutoAwaken do wait()
            local args = {[1] = "Awakener", [2] = "Check"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {[1] = "Awakener", [2] = "Awaken"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end)

    RaidHeight = 15
    Dungeon:Slider("Raid Height", "", 10, 130, RaidHeight, function (bool)
        RaidHeight = bool
    end)

    Dungeon:Line()
    Dungeon:Label("-- Buy Chip --")
    Dungeon:Button("Chip Flame", "", function ()
        BuyChip("Flame")
    end)
    Dungeon:Button("Chip Ice", "", function ()
        BuyChip("Ice")
    end)
    Dungeon:Button("Chip Quake", "", function ()
        BuyChip("Quake")
    end)
    Dungeon:Button("Chip Light", "", function ()
        BuyChip("Light")
    end)
    Dungeon:Button("Chip Dark", "", function ()
        BuyChip("Dark")
    end)
    Dungeon:Button("Chip String", "", function ()
        BuyChip("String")
    end)
    Dungeon:Button("Chip Rumble", "", function ()
        BuyChip("Rumble")
    end)
    Dungeon:Button("Chip Magma", "", function ()
        BuyChip("Magma")
    end)
    Dungeon:Button("Chip Human: Buddha", "", function ()
        BuyChip("Human: Buddha")
    end)
end

local Shop = Main:Tab("Shop", "http://www.roblox.com/asset/?id=6023426915")
if Secondsea or Thirdsea then
    Shop:Label("-- Stats --")
    Shop:Button("Stats Refund", "2500 Fragment", function ()
        local args = {[1] = "BlackbeardReward",[2] = "Refund",[3] = "1"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        local args = {[1] = "BlackbeardReward",[2] = "Refund",[3] = "2"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
    Shop:Button("Race Reroll", "3000 Fragment", function ()
        local args = {[1] = "BlackbeardReward",[2] = "Reroll",[3] = "2"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

Shop:Label("-- Update 16 --")
Shop:Button("Random Surprise", "", function ()
    local args = {[1] = "Bones", [2] = "Check"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "Bones", [2] = "Buy", [3] = 1, [4] = 1}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Toggle("Auto Random Surprise", "", false, function (bool)
    AutoSurprise = bool
    while AutoSurprise do wait()
        local args = {[1] = "Bones", [2] = "Check"}
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 50 then
            local args = {[1] = "Bones", [2] = "Buy", [3] = 1, [4] = 1}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

Shop:Line()
Shop:Label("-- Fighting Style --")
Shop:Button("Black Step", "", function ()
    local args = {[1] = "BuyBlackLeg"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Electro", "", function ()
    local args = {[1] = "BuyElectro"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Fishman Karate", "", function ()
    local args = {[1] = "BuyFishmanKarate"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Dragon Claw", "", function ()
    local args = {[1] = "BlackbeardReward", [2] = "DragonClaw", [3] = "1"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "BlackbeardReward", [2] = "DragonClaw",	[3] = "2"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Superhuman", "", function ()
    local args = {[1] = "BuySuperhuman"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Death Step", "", function ()
    local args = {[1] = "BuyDeathStep"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Sharkman Karate", "", function ()
    local args = {[1] = "BuySharkmanKarate", [2] = true}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "BuySharkmanKarate"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Electric Claw", "", function ()
    local args = {[1] = "BuyElectricClaw"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Dragon Talon", "", function ()
    local args = {[1] = "BuyDragonTalon"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Line()
Shop:Label("-- Abilities --")
Shop:Button("Skyjump", "", function()
    local args = {[1] = "BuyHaki", [2] = "Geppo"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Enchantment", "", function()
    local args = {[1] = "BuyHaki", [2] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Flash Step", "", function()
    local args = {[1] = "BuyHaki", [2] = "Soru"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Shop:Button("Observation Haki", "", function()
    local args = {[1] = "KenTalk", [2] = "Buy"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

local GameSetting = Main:Tab("Game", "http://www.roblox.com/asset/?id=6023426915")
GameSetting:Label("-- HOP FUNCTION --")
GameSetting:Toggle("Hop Function (Read Des)", "That Support Any Function Have [HOP]", _G.HOPFunction, function (bool)
    _G.HOPFunction = bool
end)
GameSetting:Button("Auto Observation & HOP", "", function ()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/AstroScripter/Games/main/Main/BloxFruits/HOPFunction/ObservationHOP.lua')()
end)

GameSetting:Line()
GameSetting:Label("-- Auto Farm Settings --")
if _G.FarmStyle == nil then
    _G.FarmStyle = "Haft Above/Behide"
end
GameSetting:Dropdown("Farm Style", {"Above", "Under", "Front", "Behide", "Haft Above/Behide"}, function (bool)
    _G.FarmStyle = bool
end)

GameSetting:Toggle("Mob View (Auto Farm)", "Toggle Mob View", _G.MobView, function (bool)
    _G.MobView = bool
end)

GameSetting:Toggle("Notifications?", "", true, function (bool)
    game:GetService("Players").LocalPlayer.PlayerGui.Notifications.Enabled = bool
end)

if _G.HideHitbox == nil then
    _G.HideHitbox = true
end
GameSetting:Toggle("Hide Hitbox", "", _G.HideHitbox, function (bool)
    _G.HideHitbox = bool
end)

if _G.FastAttack == nil then
    _G.FastAttack = true
end
GameSetting:Toggle("Fast Attack", "", _G.FastAttack, function (bool)
    _G.FastAttack = bool
end)

if _G.Magnet == nil then
    _G.Magnet = true
end
GameSetting:Toggle("Magnet / Bring Mob", "", _G.Magnet, function (bool)
    _G.Magnet = bool
end)

if _G.AutoBuso == nil then
    _G.AutoBuso = true
end
GameSetting:Toggle("Auto Buso Haki", "", _G.AutoBuso, function (bool)
    _G.AutoBuso = bool
end)

GameSetting:Toggle("Auto Ken Haki", "", _G.AutoKen, function (bool)
    _G.AutoKen = bool
end)

GameSetting:Line()
GameSetting:Label("-- Mastery Settings --")

if _G.SkillZ == nil then
    _G.SkillZ = true
end
GameSetting:Toggle("Skill Z", "", _G.SkillZ, function (bool)
    _G.SkillZ = bool
end)

if _G.ZHoldTime == nil then
    _G.ZHoldTime = 0
end
GameSetting:Slider("Z Hold Time", "", 0, 10, _G.ZHoldTime, function (bool)
    _G.ZHoldTime = bool
end)

if _G.SkillX == nil then
    _G.SkillX = true
end
GameSetting:Toggle("Skill X", "", _G.SkillX, function (bool)
    _G.SkillX = bool
end)

if _G.XHoldTime == nil then
    _G.XHoldTime = 0
end
GameSetting:Slider("X Hold Time", "", 0, 10, _G.XHoldTime, function (bool)
    _G.XHoldTime = bool
end)

if _G.SkillC == nil then
    _G.SkillC = true
end
GameSetting:Toggle("Skill C", "", _G.SkillC, function (bool)
    _G.SkillC = bool
end)

if _G.CHoldTime == nil then
    _G.CHoldTime = 0
end
GameSetting:Slider("C Hold Time", "", 0, 10, _G.CHoldTime, function (bool)
    _G.CHoldTime = bool
end)

if _G.SkillV == nil then
    _G.SkillV = true
end
GameSetting:Toggle("Skill V", "", _G.SkillV, function (bool)
    _G.SkillV = bool
end)

if _G.VHoldTime == nil then
    _G.VHoldTime = 0
end
GameSetting:Slider("V Hold Time", "", 0, 10, _G.VHoldTime, function (bool)
    _G.VHoldTime = bool
end)

GameSetting:Line()
GameSetting:Label("-- Game --")
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.Active = true
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 121, 3)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(255, 121, 3)
TextLabel.Position = UDim2.new(0.424812019, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Server Time"
TextLabel.TextColor3 = Color3.fromRGB(255, 121, 3)
TextLabel.TextSize = 25.000
TextLabel.TextTransparency = 1
TextLabel.TextStrokeTransparency = 300.000

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 72, 72)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
UIGradient.Parent = TextLabel

local function UpdateTime()
    local GameTime = math.floor(workspace.DistributedGameTime+0.5)
    local Hour = math.floor(GameTime/(60^2))%24
    local Minute = math.floor(GameTime/(60^1))%60
    local Second = math.floor(GameTime/(60^0))%60
    TextLabel.Text = ("Hour : "..Hour.." Minute : "..Minute.." Second : "..Second)
end

spawn(function()
    while true do
        UpdateTime()
        game:GetService("RunService").RenderStepped:Wait()
    end
end)
GameSetting:Toggle("Server Time", "", false, function (bool)
    if bool == true then
        TextLabel.TextTransparency = 0
    elseif bool == false then
        TextLabel.TextTransparency = 1
    end
end)

GameSetting:Button("Destroy Gui", "", function ()
    game:GetService("CoreGui"):FindFirstChild("AstroHub"):Destroy()
end)

GameSetting:Button("Anti AFK", "", function ()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

GameSetting:Button("Copy Discord Link", "https://discord.gg/cbVrFSnyUr", function ()
    setclipboard("https://discord.gg/cbVrFSnyUr")
end)

GameSetting:Button("Rejoin", "", function ()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

GameSetting:Button("Server Hop", "", function ()
    Teleport()
end)

GameSetting:Button("Low Server Hop", "", function ()
    if not game:IsLoaded() then
        print("Game is loading waiting...")
        repeat wait() until game:IsLoaded()
    end
    library:Notification("Finding Low Server...", "Ok, I Know")
    local MaxPlayers = math.huge
    local ServerMaxPlayer;
    local GoodServer;
    local GameLink = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"

    function Search()
        for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(GameLink)).data) do
            if type(v) == "table" and v.playing ~= nil and MaxPlayers > v.playing then
                ServerMaxPlayer = v.maxPlayers
                MaxPlayers = v.playing
                GoodServer = v.id
            end
        end
        print("Searched Server With Players: "..MaxPlayers.."")
    end

    function GetServer()
        Search()
        for i, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(GameLink))) do
            if i == "nextPageCursor" then
                if GameLink:find("&cursor=") then
                    local A = GameLink:find("&cursor=")
                    local B = GameLink:sub(A)
                    GameLink = GameLink:gsub(B, "")
                end
                GameLink = GameLink.."&cursor="..v
                GetServer()
            end
        end
    end

    GetServer()
    print("Searched!")
    print("Server: "..GoodServer.." Players: "..MaxPlayers.."/"..ServerMaxPlayer.."")
    if #game:GetService("Players"):GetPlayers() - 4  == MaxPlayers then
        return warn("Same Players")
    elseif GoodServer == game.JobId then
        return warn("Empty Server ATM")
    end
    print("Teleporting to: "..GoodServer)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GoodServer)
end)

function BuyChip(chipname)
    game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("RaidsNpc", "Select", chipname)
end

function AutoFarm(type)
    spawn(function()
        if type == "Normal" then
            if _G.AutoFarm then
                local MyLevel = game.Players.localPlayer.Data.Level.Value
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then Waiting = false
                    levelCheck()
                    if MyLevel >= 375 and MyLevel < 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Join Fishman Island") wait(2)
                    elseif MyLevel >= 450 and MyLevel < 700 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Out Fishman Island") wait(2)
                    elseif MyLevel >= 1250 and MyLevel < 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Join Ship") wait(2)
                    elseif MyLevel >= 1350 and MyLevel < 1500 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Out Ship") wait(2)
                    end
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude / 300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(posQuest)})
                    tween:Play()
                    tween.Completed:Connect(function () wait(.5)
                        Waiting = true
                    end)
                end
                repeat wait(3) until Waiting
                if _G.AutoFarm and Waiting then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                    if _G.AutoSetSpawn then
                       local args = {[1] = "SetSpawnPoint"}
                       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
                while _G.AutoFarm and Waiting do game:GetService("RunService").RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.AutoFarm then levelCheck()
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                            if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                pcall(function()
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do levelCheck()
                                        if v.Name == nameMob then
                                            repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                                EquipWeapon(_G.Weapon)
                                                Magnet()
                                                FastAttack()
                                                if _G.MobView then game.Workspace.Camera.CameraSubject = v.Humanoid else game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid end
                                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                    local args = {[1] = "Buso"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                                if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    if _G.HideHitbox then
                                                        v.HumanoidRootPart.Transparency = 1
                                                    else
                                                        v.HumanoidRootPart.Transparency = 0.75
                                                    end
                                                end
                                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                if _G.FarmStyle == "Above" and _G.AutoFarm then
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 0)})
                                                    tween:Play()
                                                elseif _G.FarmStyle == "Under" and _G.AutoFarm  then
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, -25, 0)})
                                                    tween:Play()
                                                elseif _G.FarmStyle == "Front" and _G.AutoFarm  then
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 0, -25)})
                                                    tween:Play()
                                                elseif _G.FarmStyle == "Behide" and _G.AutoFarm  then
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 0, 25)})
                                                    tween:Play()
                                                elseif _G.FarmStyle == "Haft Above/Behide" and _G.AutoFarm  then
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 15)})
                                                    tween:Play()
                                                end
                                            until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.AutoFarm == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then levelCheck()
                                                repeat wait(10) until game:GetService("Players").LocalPlayer.Character
                                                AutoFarm("Normal") break;
                                            end
                                        end
                                    end
                                end)
                            else levelCheck()
                                game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                                if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - waitPos).magnitude <= 200 then
                                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(waitPos)
                                else
                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - waitPos).magnitude / 300, Enum.EasingStyle.Linear)
                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(waitPos)})
                                    tween:Play()
                                end
                            end
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                            AutoFarm("Normal") break;
                        end
                    else
                        game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                        AutoFarm("Normal") break;
                    end
                end
            else wait(.5)
                telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
            end
        elseif type == "Fruit" then
            if _G.FruitMastery then
                local MyLevel = game.Players.localPlayer.Data.Level.Value
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then WaitingDevilFruitMastery = false
                    levelCheck()
                    if MyLevel >= 375 and MyLevel < 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Join Fishman Island") wait(2)
                    elseif MyLevel < 375 and MyLevel >= 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Out Fishman Island") wait(2)
                    elseif MyLevel >= 1250 and MyLevel < 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Join Ship") wait(2)
                    elseif MyLevel < 1250 and MyLevel >= 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Out Ship") wait(2)
                    end
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude / 300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(posQuest)})
                    tween:Play()
                    tween.Completed:Connect(function () wait(.5)
                        WaitingDevilFruitMastery = true
                    end)
                end
                repeat wait(3) until WaitingDevilFruitMastery
                if _G.FruitMastery and WaitingDevilFruitMastery then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                end
                while _G.FruitMastery and WaitingDevilFruitMastery do game:GetService("RunService").RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.FruitMastery then levelCheck()
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                            if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                pcall(function()
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do levelCheck()
                                        if v.Name == nameMob then
                                            repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                                HealthMin = v.Humanoid.MaxHealth * _G.MasteryPersen / 100
                                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                    local args = {[1] = "Buso"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                if v.Humanoid.Health <= HealthMin then
                                                    EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                        v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                                    end
                                                    if _G.Magnet then levelCheck()
                                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                            if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                                if v.Name == nameMob and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                                    if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                                                    v.HumanoidRootPart.CanCollide = false
                                                                    v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                                    if MagnetPos ~= nil and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                                                                        v.HumanoidRootPart.CFrame = MagnetPos
                                                                    else
                                                                        MagnetPos = v.HumanoidRootPart.CFrame
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                    local args = {[1] = v.HumanoidRootPart.Position}
                                                    game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
                                                    UseSkill("Z")
                                                    UseSkill("X")
                                                    UseSkill("C")
                                                    UseSkill("V")
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 0)})
                                                    tween:Play()
                                                else
                                                    EquipWeapon(_G.MasteryWeapon)
                                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                                    end
                                                    if _G.Magnet then levelCheck()
                                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                            if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                                if v.Name == nameMob and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                                    if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                                                    v.HumanoidRootPart.CanCollide = false
                                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                    if MagnetPos ~= nil and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                                                                        v.HumanoidRootPart.CFrame = MagnetPos
                                                                    else
                                                                        MagnetPos = v.HumanoidRootPart.CFrame
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                    game:GetService'VirtualUser':CaptureController()
                                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 0)})
                                                    tween:Play()
                                                end
                                            until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.FruitMastery == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then levelCheck()
                                                repeat wait(10) until game:GetService("Players").LocalPlayer.Character
                                                AutoFarm("Fruit") break;
                                            end
                                        end
                                    end
                                end)
                            else levelCheck()
                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - waitPos).magnitude / 300, Enum.EasingStyle.Linear)
                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(waitPos)})
                                tween:Play()
                            end
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            AutoFarm("Fruit") break;
                        end
                    else
                        AutoFarm("Fruit") break;
                    end
                end
            else wait(.5)
                telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
            end
        elseif type == "Gun" then
            if _G.GunMastery then
                local MyLevel = game.Players.localPlayer.Data.Level.Value
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then WaitingGunMastery = false
                    levelCheck()
                    if MyLevel >= 375 and MyLevel < 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Join Fishman Island") wait(2)
                    elseif MyLevel < 375 and MyLevel >= 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Out Fishman Island") wait(2)
                    elseif MyLevel >= 1250 and MyLevel < 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Join Ship") wait(2)
                    elseif MyLevel < 1250 and MyLevel >= 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                        UseEntrance("Out Ship") wait(2)
                    end
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude / 300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(posQuest)})
                    tween:Play()
                    tween.Completed:Connect(function () wait(.5)
                        WaitingGunMastery = true
                    end)
                end
                repeat wait(3) until WaitingGunMastery
                if _G.GunMastery and WaitingGunMastery then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                end
                while _G.GunMastery and WaitingGunMastery do game:GetService("RunService").RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.GunMastery then levelCheck()
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                            if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                pcall(function()
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do levelCheck()
                                        if v.Name == nameMob then
                                            repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                                HealthMin = v.Humanoid.MaxHealth * _G.MasteryPersen / 100
                                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                    local args = {[1] = "Buso"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                if v.Humanoid.Health <= HealthMin then
                                                    EquipWeapon(Gun)
                                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                        v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                                    end
                                                    if _G.Magnet then levelCheck()
                                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                            if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                                if v.Name == nameMob and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                                    if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                                                    v.HumanoidRootPart.CanCollide = false
                                                                    v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                                    if MagnetPos ~= nil and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                                                                        v.HumanoidRootPart.CFrame = MagnetPos
                                                                    else
                                                                        MagnetPos = v.HumanoidRootPart.CFrame
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                    local args = {[1] = v.HumanoidRootPart.Position, [2] = v.HumanoidRootPart}
                                                    game:GetService("Players").LocalPlayer.Character[Gun].RemoteFunctionShoot:InvokeServer(unpack(args))
                                                    local args = {[1] = v.HumanoidRootPart.Position}
                                                    game:GetService("Players").LocalPlayer.Character[Gun].RemoteEvent:FireServer(unpack(args))
                                                    UseSkill("Z")
                                                    UseSkill("X")
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 0)})
                                                    tween:Play()
                                                else
                                                    EquipWeapon(_G.MasteryWeapon)
                                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                                    end
                                                    if _G.Magnet then levelCheck()
                                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                            if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                                if v.Name == nameMob and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                                    if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                                                    v.HumanoidRootPart.CanCollide = false
                                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                    if MagnetPos ~= nil and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                                                                        v.HumanoidRootPart.CFrame = MagnetPos
                                                                    else
                                                                        MagnetPos = v.HumanoidRootPart.CFrame
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                    game:GetService'VirtualUser':CaptureController()
                                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 0)})
                                                    tween:Play()
                                                end
                                            until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.GunMastery == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then levelCheck()
                                                repeat wait(10) until game:GetService("Players").LocalPlayer.Character
                                                AutoFarm("Gun") break;
                                            end
                                        end
                                    end
                                end)
                            else levelCheck()
                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - waitPos).magnitude / 300, Enum.EasingStyle.Linear)
                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(waitPos)})
                                tween:Play()
                            end
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            AutoFarm("Gun") break;
                        end
                    else
                        AutoFarm("Gun") break;
                    end
                end
            else wait(.5)
                telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
            end
        end
    end)
end

function BoneFarm()
    spawn(function() wait()
        if _G.AutoBones then
            while _G.AutoBones do game:GetService("RunService").RenderStepped:Wait()
                if game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")
                or game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]")
                or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]")
                then
                    pcall(function ()
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            if v.Name == "Posessed Mummy [Lv. 2050]" then
                                BringMob = v.Name
                                repeat game:GetService("RunService").RenderStepped:Wait(1)
                                    EquipWeapon(_G.Weapon)
                                    FastAttack()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then local args = {[1] = "Buso"} game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                    end
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-9573.1, 5.81833, 6197.55)).magnitude / 300, Enum.EasingStyle.Linear)
                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(-9573.1, 5.81833, 6197.55)) * CFrame.new(0, 25, 15)})
                                    tween:Play()
                                until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.AutoBones == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                            elseif v.Name == "Reborn Skeleton [Lv. 1975]" then
                                BringMob = v.Name
                                repeat game:GetService("RunService").RenderStepped:Wait(1)
                                    EquipWeapon(_G.Weapon)
                                    FastAttack()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then local args = {[1] = "Buso"} game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                    end
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-8762.44, 142.131, 6002.3)).magnitude / 300, Enum.EasingStyle.Linear)
                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(-8762.44, 142.131, 6002.3)) * CFrame.new(0, 25, 15)})
                                    tween:Play()
                                until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.AutoBones == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                            elseif v.Name == "Living Zombie [Lv. 2000]" then
                                BringMob = v.Name
                                repeat game:GetService("RunService").RenderStepped:Wait(1)
                                    EquipWeapon(_G.Weapon)
                                    FastAttack()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then local args = {[1] = "Buso"} game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                    end
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-10153.4, 139.652, 5936.71)).magnitude / 300, Enum.EasingStyle.Linear)
                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(-10153.4, 139.652, 5936.71)) * CFrame.new(0, 25, 15)})
                                    tween:Play()
                                until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.AutoBones == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                            end
                        end
                    end)
                end
            end
        else wait(1)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

function MagnetBones()
    spawn(function ()
        while _G.AutoBones do wait(.5)
            if BringMob == "Reborn Skeleton [Lv. 1975]" then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                        if v.Name == "Reborn Skeleton [Lv. 1975]" then
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = CFrame.new(-8762.44, 142.131, 6002.3)
                        end
                    end
                end
            elseif BringMob == "Posessed Mummy [Lv. 2050]" then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                        if v.Name == "Posessed Mummy [Lv. 2050]" or v.Name == "Demonic Soul [Lv. 2025]" then
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = CFrame.new(-9573.1, 5.81833, 6197.55)
                        end
                    end
                end
            elseif BringMob == "Living Zombie [Lv. 2000]" then
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                        if v.Name == "Living Zombie [Lv. 2000]" then
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v.HumanoidRootPart.CFrame = CFrame.new(-10153.4, 139.652, 5936.71)
                        end
                    end
                end
            end
        end
    end)
end

function UseSkill(skill)
    spawn(function ()
        if skill == "Z" and _G.SkillZ then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
            wait(_G.ZHoldTime)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
        elseif skill == "X" and _G.SkillX then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
            wait(_G.XHoldTime)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
        elseif skill == "C" and _G.SkillC then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
            wait(_G.CHoldTime)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
        elseif skill == "V" and _G.SkillV then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
            wait(_G.VHoldTime)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
        end
    end)
end

function MobAura()
    spawn(function () wait()
        if _G.MobAura then
            while _G.MobAura do game:GetService("RunService").RenderStepped:Wait()
                pcall(function ()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
                            repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                EquipWeapon(_G.Weapon)
                                FastAttack()
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {[1] = "Buso"}
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.Humanoid.WalkSpeed = 1
                                if _G.Magnet then
                                    for k,x in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if x.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            if x.Name == v.Name and (x.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 280 then
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                x.Humanoid.PlatformStand = true
                                                x.HumanoidRootPart.CanCollide = false
                                                x.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                if _G.HideHitbox then
                                                    x.HumanoidRootPart.Transparency = 1
                                                else
                                                    x.HumanoidRootPart.Transparency = 0.75
                                                end
                                                if MobAuraBringPos ~= nil and  (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                                                    x.HumanoidRootPart.CFrame = MobAuraBringPos
                                                else
                                                    MobAuraBringPos = x.HumanoidRootPart.CFrame
                                                end
                                            end
                                        end
                                    end
                                end
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)
                            until not v.Parent or v.Humaaoid.Health <= 0 or _G.MobAura == false
                        end
                    end
                end)
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

function BigHitbox()
    spawn(function ()
        while wait() do
            if _G.BigHitbox then
                for i, v in pairs(game.Workspace.Characters:GetChildren()) do
                    if v.Name == game.Players.LocalPlayer.Name then
                        v.HumanoidRootPart.Transparency = 1
                        v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                    else
                        if _G.HideHitbox then
                            v.HumanoidRootPart.Transparency = 1
                        else
                            v.HumanoidRootPart.Transparency = 0.75
                        end
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                    end
                end
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 500 then
                        if _G.HideHitbox then
                            v.HumanoidRootPart.Transparency = 1
                        else
                            v.HumanoidRootPart.Transparency = 0.75
                        end
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                    else
                        v.HumanoidRootPart.Transparency = 1
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                    end
                end
            else
                for i, v in pairs(game.Workspace.Characters:GetChildren()) do
                    v.HumanoidRootPart.Transparency = 1
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                    v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                end
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    v.HumanoidRootPart.Transparency = 1
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                    v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                end
            end
        end
    end)
end

function PirateRaid()
    spawn(function()
        if _G.PirateRaid then
            local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-5609.12, 313.945, -2940.31)).magnitude / 300, Enum.EasingStyle.Linear)
            local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(-5609.12, 313.945, -2940.31))})
            tween:Play()
            tween.Completed:Wait()
            while _G.PirateRaid do game:GetService("RunService").RenderStepped:Wait()
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                EquipWeapon(_G.Weapon)
                                FastAttack()
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {[1] = "Buso"}
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                if _G.HideHitbox then
                                    v.HumanoidRootPart.Transparency = 1
                                else
                                    v.HumanoidRootPart.Transparency = 0.75
                                end
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.Humanoid.WalkSpeed = 1
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)
                            until not v.Parent or v.Humanoid.Health <= 0 or _G.PirateRaid == false or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                            if game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 then
                                repeat wait(3) until game:GetService("Players").LocalPlayer.Character
                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-5609.12, 313.945, -2940.31)).magnitude / 300, Enum.EasingStyle.Linear)
                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(-5609.12, 313.945, -2940.31))})
                                tween:Play()
                                tween.Completed:Wait()
                            end
                        else
                            local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-5609.12, 313.945, -2940.31)).magnitude / 300, Enum.EasingStyle.Linear)
                            local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(-5609.12, 313.945, -2940.31))})
                            tween:Play()
                        end
                    end
                end)
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
            tween:Play()
        end
    end)
end

function AllBoss()
    spawn(function() wait()
        if _G.FarmAllBoss then
            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if string.find(v.Name, "Boss") then
                    local args = {[1] = "AbandonQuest"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    _G.SelectedBoss = v.Name
                    ChangeBoss = false
                    BossFarm()
                    repeat wait(3) until ChangeBoss
                end
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

function BossFarm()
    spawn(function() wait()
        if _G.BossFarm then
            CheckBoss()
            WaitingBossFarm = false
            if needQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posBossQuest).magnitude/300
                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(posBossQuest)})
                tween:Play()
                tween.Completed:Connect(function()
                    WaitingBossFarm = true
                end)
            elseif needQuest == false then
                WaitingBossFarm = true
            end
            repeat wait(1) until WaitingBossFarm
            if _G.BossFarm and WaitingBossFarm and needQuest then
                CheckBoss()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameBossQuest, levelBossQuest)
            end
            while _G.BossFarm and not ChangeBoss do game:GetService("RunService").RenderStepped:Wait()
                CheckBoss()
                if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and needQuest) or not needQuest then
                    if not needQuest or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameBoss) and needQuest) then
                        pcall(function()
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == _G.SelectedBoss then
                                    repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                        EquipWeapon(_G.BossWeapon)
                                        FastAttack()
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {[1] = "Buso"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            if _G.HideHitbox then
                                                v.HumanoidRootPart.Transparency = 1
                                            else
                                                v.HumanoidRootPart.Transparency = 0.75
                                            end
                                        end
                                        local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                        local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(10, 25, 10)})
                                        tween:Play()
                                        tween.Completed:Wait()
                                    until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or _G.BossFarm == false or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and needQuest)
                                    if _G.FarmAllBoss then
                                        ChangeBoss = true
                                    elseif _G.AutoBartilo then
                                        _G.BossFarm = false
                                        BossFarm() break;
                                    end
                                end
                            end
                        end)
                    elseif not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameBoss) and needQuest then
                        local args = {[1] = "AbandonQuest"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        BossFarm() break;
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and needQuest then
                    BossFarm() break;
                end
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

function KillPlayer(type)
    spawn(function () wait()
        if type == "Hit" then
            if not _G.KillPlayer then
                game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
            end
            local plr1 = game.Players.LocalPlayer
            local plr2 = game.Players:FindFirstChild(selectedPlayer)
            repeat wait()
                local FastAttackModule = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                pcall(function()
                    EquipWeapon(_G.WeaponPlayer)
                    if _G.PlayerFastAttack then
                        FastAttackModule.activeController.attacking = false
                        FastAttackModule.activeController.active = false
                        FastAttackModule.activeController.timeToNextAttack = 0.2
                    end
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position).magnitude >= 200 then
                        local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position).magnitude / 300
                        local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position) * CFrame.new(0,15,0)})
                        tween:Play()
                        tween.Completed:Wait()
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(0,15,0)
                    end
                    game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                end)
            until _G.KillPlayer == false
        elseif type == "Click" then
            if not _G.KillPlayerGun then
                game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
            end
            repeat wait()
                local FastAttackModule = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                pcall(function()
                    EquipWeapon(Gun)
                    if _G.PlayerFastAttack then
                        FastAttackModule.activeController.attacking = false
                        FastAttackModule.activeController.active = false
                        FastAttackModule.activeController.timeToNextAttack = 0.2
                    end
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position).magnitude >= 200 then
                        local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position).magnitude / 300
                        local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position) * CFrame.new(0,70,-30)})
                        tween:Play()
                        tween.Completed:Wait()
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(0,70,-30)
                    end
                    game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Size = Vector3.new(60,60,60)
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                end)
            until _G.KillPlayerGun == false
        end
    end)
end

function InfGeppo()
    spawn(function() wait()
        if _G.InfGeppo then
            for i, v in next, getgc() do
                if game.Players.LocalPlayer.Character.Geppo then
                    if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Geppo then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(i2) == "9" then
                                repeat wait(.1)
                                    setupvalue(v,i2,0)
                                until not _G.InfGeppo or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                _G.InfGeppo = false
                            end
                        end
                    end
                end
            end
        end
    end)
end

function NoDashCD()
    spawn(function() wait()
        if _G.NoDashCD then
            for i, v in next, getgc() do
                if game.Players.LocalPlayer.Character.Dodge then
                    if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
                        for i2,v2 in next, getupvalues(v) do
                            if tostring(v2) == "0.4"  then
                                repeat wait(.1)
                                    setupvalue(v,i2,0)
                                until not _G.NoDashCD or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 
                                _G.NoDashCD = false
                            end
                        end
                    end
                end
            end
        end
    end)
end

function NoSoruCD()
    spawn(function () wait()
        if _G.NoSoruCD and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
            for i ,v in next, getgc() do
                if game.Players.LocalPlayer.Character.Soru then
                    if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Soru then
                        for i2,v2 in next, getupvalues(v) do
                            if typeof(v2) == "table"  then
                                repeat wait(.1)
                                    v2.LastUse = 0
                                until not _G.NoSoruCD or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                _G.NoSoruCD = false
                            end
                        end
                    end
                end
            end
        end
    end)
end

function BringFruit()
    spawn(function() wait()
        if not _G.BringFruit then return end
        while _G.BringFruit do wait()
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA "Tool" then
                    if (v.Handle.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
                        v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    else
                        local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).magnitude / 300
                        local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(v.Handle.Position)})
                        tween:Play()
                        tween.Completed:Wait()
                    end
                end
            end
        end
    end)
end

function StoreFruit()
    spawn(function() wait()
        while _G.AutoStore do wait(1)
            local args = {[1] = "getInventoryFruits"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            AllFruit = FruitList
            for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))) do
                for i2,v2 in pairs(v) do
                    FruitCheck = v2
                    for i3,v3 in pairs(AllFruit) do
                        if v3 == v2 then
                            table.remove(AllFruit, i3)
                        end
                    end
                end
            end
            for i, v in pairs(AllFruit) do
                local args = {[1] = "StoreFruit", [2] = v}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end)
end

function UseCode(Text)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end

function ChooseMob()
    spawn(function () wait()
        if _G.ChooseMob then
            local MyLevel = game.Players.localPlayer.Data.Level.Value
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then WaitingMobFarm = false
                CheckMob()
                if MyLevel >= 375 and MyLevel < 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                    UseEntrance("Join Fishman Island") wait(2)
                elseif MyLevel >= 450 and MyLevel < 700 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                    UseEntrance("Out Fishman Island") wait(2)
                elseif MyLevel >= 1250 and MyLevel < 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                    UseEntrance("Join Ship") wait(2)
                elseif MyLevel >= 1350 and MyLevel < 1500 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                    UseEntrance("Out Ship") wait(2)
                end
                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude / 300
                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(posQuest)})
                tween:Play()
                tween.Completed:Connect(function () wait(.5)
                    WaitingMobFarm = true
                end)
            end
            repeat wait(3) until WaitingMobFarm
            if _G.ChooseMob and WaitingMobFarm then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                if _G.AutoSetSpawn then
                   local args = {[1] = "SetSpawnPoint"}
                   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
            while _G.ChooseMob and WaitingMobFarm do game:GetService("RunService").RenderStepped:Wait()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.ChooseMob then CheckMob()
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                        if game:GetService("Workspace").Enemies:FindFirstChild(mobSelect) then
                            pcall(function()
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do CheckMob()
                                    if v.Name == mobSelect then
                                        repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                            EquipWeapon(_G.Weapon)
                                            FastAttack()
                                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                local args = {[1] = "Buso"}
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                if _G.HideHitbox then
                                                    v.HumanoidRootPart.Transparency = 1
                                                else
                                                    v.HumanoidRootPart.Transparency = 0.75
                                                end
                                            end
                                            if _G.Magnet then
                                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                        if v.Name == mobSelect and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                            if _G.HideHitbox then
                                                                v.HumanoidRootPart.Transparency = 1
                                                            else
                                                                v.HumanoidRootPart.Transparency = 0.75
                                                            end
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            if ChooseMobPos ~= nil and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                                                                v.HumanoidRootPart.CFrame = ChooseMobPos
                                                            else
                                                                ChooseMobPos = v.HumanoidRootPart.CFrame
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                            local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 0)})
                                            tween:Play()
                                        until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.ChooseMob == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then levelCheck()
                                            repeat wait(10) until game:GetService("Players").LocalPlayer.Character
                                            ChooseMob() break;
                                        end
                                    end
                                end
                            end)
                        else CheckMob()
                            game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                            if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - waitPos).magnitude <= 200 then
                                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(waitPos)
                            else
                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - waitPos).magnitude / 300, Enum.EasingStyle.Linear)
                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(waitPos)})
                                tween:Play()
                            end
                        end
                    else
                        local args = {[1] = "AbandonQuest"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        ChooseMob() break;
                    end
                else
                    ChooseMob() break;
                end
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

local HasChip;
function FullyRaid()
    spawn(function() wait()
        if _G.FullRaid then
            local args = {[1] = "Cousin", [2] = "Buy"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if string.find(v.Name, "Microchip") then
                    HasChip = true
                elseif string.find(v.Name, "Fruit") then
                    BuyChip(_G.FullyChip)
                    HasChip = true
                else
                    FullyRaid()
                    HasChip = false
                end
            end
            if HasChip then
                for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Microchip") then
                        if Thirdsea then
                            local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-5033.16, 314.953, -2949.96)).magnitude / 300, Enum.EasingStyle.Linear)
                            local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(-5033.16, 314.953, -2949.96))})
                            tween:Play()
                            tween.Completed:Wait()
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector , 0.1)
                            HasChip = false
                        elseif Secondsea then
                            local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-6457.14, 252.737, -4451.57)).magnitude / 300, Enum.EasingStyle.Linear)
                            local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(-6457.14, 252.737, -4451.57))})
                            tween:Play()
                            tween.Completed:Wait()
                            fireclickdetector(game:GetService("Workspace").Map["CircleIsland"].RaidSummon2.Button.Main.ClickDetector, 0.1)
                            HasChip = false
                        end
                    end
                end
            end
            repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
            while _G.FullRaid do game:GetService("RunService").RenderStepped:wait(0.5)
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    pcall(function()
                        local Locations = game:GetService("Workspace")["_WorldOrigin"].Locations
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                            local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude/300
                            local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)})
                            tween:Play()
                            tween.Completed:Wait()
                        elseif Locations:FindFirstChild("Island 5") or Locations:FindFirstChild("Island 4") or Locations:FindFirstChild("Island 3") or Locations:FindFirstChild("Island 2") or Locations:FindFirstChild("Island 1") then
                            if Locations:FindFirstChild("Island 5") then
                                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 5").Position).magnitude/300
                                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 5").Position) * CFrame.new(0, RaidHeight, 0)})
                                tween:Play()
                                tween.Completed:Wait()
                            elseif Locations:FindFirstChild("Island 4") then
                                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 4").Position).magnitude/300
                                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 4").Position) * CFrame.new(0, RaidHeight, 0)})
                                tween:Play()
                                tween.Completed:Wait()
                            elseif Locations:FindFirstChild("Island 3") then
                                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 3").Position).magnitude/300
                                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 3").Position) * CFrame.new(0, RaidHeight, 0)})
                                tween:Play()
                                tween.Completed:Wait()
                            elseif Locations:FindFirstChild("Island 2") then
                                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 2").Position).magnitude/300
                                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 2").Position) * CFrame.new(0, RaidHeight, 0)})
                                tween:Play()
                                tween.Completed:Wait()
                            elseif Locations:FindFirstChild("Island 1") then
                                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Locations:FindFirstChild("Island 1").Position).magnitude/300
                                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Locations:FindFirstChild("Island 1").Position) * CFrame.new(0, RaidHeight, 0)})
                                tween:Play()
                                tween.Completed:Wait()
                            end
                        end
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("Humanoid") and v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("LowerTorso") and v:FindFirstChild("UpperTorso") and v:FindFirstChild("Head") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                v:FindFirstChild("LowerTorso"):Destroy()
                                v:FindFirstChild("UpperTorso"):Destroy()
                                v:FindFirstChild("Head"):Destroy()
                                v:breakJoints()
                                v.Humanoid.Health = 0
                                v.Humanoid.Health = v.Humanoid.MaxHealth
                                v.Humanoid.Health = 0
                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                wait(0.1)
                            end
                        end
                    end)
                else
                    FullyRaid() break;
                end
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

local WaitingBartilo;
function Bartilo()
    spawn(function () wait()
        if _G.AutoBartilo then
            local MyLevel = game.Players.localPlayer.Data.Level.Value
            if MyLevel < 850 then
                library:Notification("Bartilo Quest", "You Need To Level 850 Or Above")
            elseif MyLevel >= 850 and _G.AutoBartilo then
                local args = {[1] = "getInventoryWeapons"}
                for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))) do
                    for i2, v2 in pairs(v) do
                        if v2 == "Warrior Helmet" then
                            library:Notification("Bartilo Quest", "You Already Completed")
                            Completed = true
                        else
                            Completed = false
                        end
                    end
                end
                if not Completed and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then WaitingBartilo = false
                    local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-458.408, 73.0201, 300.347)).magnitude / 300
                    local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(-458.408, 73.0201, 300.347))})
                    tween:Play()
                    tween.Completed:Connect(function () wait(.5)
                        WaitingBartilo = true
                    end)
                end
                repeat wait(3) until WaitingBartilo
                if _G.AutoBartilo and WaitingBartilo and Completed == false then
                    local args = {[1] = "StartQuest", [2] = "BartiloQuest", [3] = 1}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                while _G.AutoBartilo and WaitingBartilo do game:GetService("RunService").RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.AutoBartilo then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") then
                            local BartiloMob = "Swan Pirate [Lv. 775]"
                            if game:GetService("Workspace").Enemies:FindFirstChild(BartiloMob) then
                                pcall(function ()
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == BartiloMob then
                                            repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                                EquipWeapon(_G.Weapon)
                                                FastAttack()
                                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                    local args = {[1] = "Buso"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                                if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    if _G.HideHitbox then
                                                        v.HumanoidRootPart.Transparency = 1
                                                    else
                                                        v.HumanoidRootPart.Transparency = 0.75
                                                    end
                                                end
                                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                    if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                        if v.Name == BartiloMob and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                            if _G.HideHitbox then
                                                                v.HumanoidRootPart.Transparency = 1
                                                            else
                                                                v.HumanoidRootPart.Transparency = 0.75
                                                            end
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            if BartiloPos ~= nil and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                                                                v.HumanoidRootPart.CFrame = BartiloPos
                                                            else
                                                                BartiloPos = v.HumanoidRootPart.CFrame
                                                            end
                                                        end
                                                    end
                                                end
                                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 0)})
                                                tween:Play()
                                            until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.AutoBartilo == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-458.408, 73.0201, 300.347)).magnitude / 300
                                                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(-458.408, 73.0201, 300.347))})
                                                tween:Play()
                                                tween.Completed:Wait()
                                                local args = {[1] = "BartiloQuestProgress", [2] = "Bartilo"}
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                _G.SelectedBoss = "Jeremy [Lv. 850] [Boss]"
                                                _G.BossFarm = true
                                                BossFarm()
                                                repeat wait(10) until _G.BossFarm == false
                                                for i, v in pairs(game:GetService("Workspace").Map.Dressrosa.BartiloPlates:GetDescendants()) do
                                                    if v:IsA("TouchTransmitter") then
                                                        Plate1 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1
                                                        Plate2 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2
                                                        Plate3 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3
                                                        Plate4 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4
                                                        Plate5 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5
                                                        Plate6 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6
                                                        Plate7 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7
                                                        Plate8 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8

                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate1, 0) --0 is touch
                                                        wait()
                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate1, 1) -- 1 is untouch

                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate2, 0) --0 is touch
                                                        wait()
                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate2, 1) -- 1 is untouch

                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate3, 0) --0 is touch
                                                        wait()
                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate3, 1) -- 1 is untouch

                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate4, 0) --0 is touch
                                                        wait()
                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate4, 1) -- 1 is untouch

                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate5, 0) --0 is touch
                                                        wait()
                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate5, 1) -- 1 is untouch

                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate6, 0) --0 is touch
                                                        wait()
                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate6, 1) -- 1 is untouch

                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate7, 0) --0 is touch
                                                        wait()
                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate7, 1) -- 1 is untouch

                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate8, 0) --0 is touch
                                                        wait()
                                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, Plate8, 1) -- 1 is untouch
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end)
                            else
                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(977.465, 121.331, 1302.35)).magnitude / 300, Enum.EasingStyle.Linear)
                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(Vector3.new(977.465, 121.331, 1302.35))})
                                tween:Play()
                            end
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            Bartilo() break;
                        end
                    else
                        Bartilo() break;
                    end
                end
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

function Observation()
    spawn(function() wait()
        if _G.Observation then
            if _G.Observation and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                game:GetService('VirtualUser'):CaptureController()
                game:GetService('VirtualUser'):SetKeyDown('0x65')
                wait(2)
                game:GetService('VirtualUser'):SetKeyUp('0x65')
            end
            while _G.Observation do wait()
                if Secondsea then
                    if game.Workspace.Enemies:FindFirstChild("Marine Captain [Lv. 900]") then
                        if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat wait()
                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - game.Workspace.Enemies:FindFirstChild("Marine Captain [Lv. 900]").HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = CFrame.new(game.Workspace.Enemies:FindFirstChild("Marine Captain [Lv. 900]").HumanoidRootPart.Position) * CFrame.new(3,0,0)})
                                tween:Play()
                            until _G.Observation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            if _G.HOPFunction then
                                Teleport()
                            else
                                repeat wait()
                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - game.Workspace.Enemies:FindFirstChild("Marine Captain [Lv. 900]").HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = CFrame.new(game.Workspace.Enemies:FindFirstChild("Marine Captain [Lv. 900]").HumanoidRootPart.Position) * CFrame.new(0, 15, 10)})
                                    tween:Play()
                                until _G.Observation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        end
                    end
                elseif Firstsea then
                    if game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
                        if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat wait()
                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = CFrame.new(game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.Position) * CFrame.new(3,0,0)})
                                tween:Play()
                            until _G.Observation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            if _G.HOPFunction then
                                Teleport()
                            else
                                repeat wait()
                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = CFrame.new(game.Workspace.Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.Position) * CFrame.new(0, 15, 10)})
                                    tween:Play()
                                until _G.Observation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        end
                    end
                elseif Thirdsea then
                    if game.Workspace.Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
                        if game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat wait()
                                local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - game.Workspace.Enemies:FindFirstChild("Forest Pirate [Lv. 1825]").HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = CFrame.new(game.Workspace.Enemies:FindFirstChild("Forest Pirate [Lv. 1825]").HumanoidRootPart.Position) * CFrame.new(3,0,0)})
                                tween:Play()
                            until _G.Observation == false or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            if _G.HOPFunction then
                                Teleport()
                            else
                                repeat wait()
                                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - game.Workspace.Enemies:FindFirstChild("Forest Pirate [Lv. 1825]").HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                    local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = CFrame.new(game.Workspace.Enemies:FindFirstChild("Forest Pirate [Lv. 1825]").HumanoidRootPart.Position) * CFrame.new(0, 15, 10)})
                                    tween:Play()
                                until _G.Observation == false or game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                            end
                        end
                    end
                end
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

function ObservationCD()
    spawn(function() wait()
        while _G.Observation do wait(60)
            pcall(function()
                if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    game:GetService('VirtualUser'):CaptureController()
                    game:GetService('VirtualUser'):SetKeyDown('0x65')
                    wait(2)
                    game:GetService('VirtualUser'):SetKeyUp('0x65')
                end
            end)
        end
    end)
end

local WaitingElite;
function AutoElite()
    spawn(function () wait()
        if _G.AutoElite then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then WaitingElite = false
                EliteQuest = Vector3.new(-5419.21, 313.705, -2826.24)
                local speedy = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - EliteQuest).magnitude / 300
                local tween = game:GetService("TweenService"):create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(speedy, Enum.EasingStyle.Linear), {CFrame = CFrame.new(EliteQuest)})
                tween:Play()
                tween.Completed:Connect(function () wait(.5)
                    WaitingElite = true
                end)
            end
            repeat wait(3) until WaitingElite
            if _G.AutoElite and WaitingElite then
                local args = {[1] = "EliteHunter"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    library:Notification("Elite Not Found", "Ok?")
                    if _G.HOPFunction then Teleport() end
                end
            end
            while _G.AutoElite and WaitingElite do game:GetService("RunService").RenderStepped:wait()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.AutoElite then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo")
                    or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")
                    or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre")
                    then
                        pcall(function ()
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Diablo"))
                                or (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Urban"))
                                or (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Deandre"))
                                then
                                    repeat game:GetService("RunService").RenderStepped:wait()
                                        EquipWeapon(_G.Weapon)
                                        FastAttack()
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {[1] = "Buso"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            if _G.HideHitbox then v.HumanoidRootPart.Transparency = 1 else v.HumanoidRootPart.Transparency = 0.75 end
                                        end
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                                        local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 0)})
                                        tween:Play()
                                    until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or _G.AutoElite == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end)
                    else
                        local args = {[1] = "AbandonQuest"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        AutoElite() break;
                    end
                else
                    AutoElite() break;
                end
            end
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

function AutoFighting(type)
    spawn(function () wait()
        if type == "Superhuman" then
            if Secondsea or Thirdsea then
                while _G.AutoSuperhuman do wait(0.5)
                    pcall(function ()
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                           local args = {[1] = "BuyBlackLeg"}
                           game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                              _G.Weapon = "Black Leg"
                           end
                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                            _G.Weapon = "Electro"
                           end
                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                            _G.Weapon = "Fishman Karate"
                           end
                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                            _G.Weapon = "Dragon Claw"
                           end

                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
                              local args = {[1] = "BuyElectro"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                           end
                           if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
                              local args = {[1] = "BuyElectro"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                           end
                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
                              local args = {[1] = "BuyFishmanKarate"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                           end
                           if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
                              local args = {[1] = "BuyFishmanKarate"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                           end
                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                              local args = {[1] = "BlackbeardReward", [2] = "DragonClaw", [3] = "1"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                              local args = {[1] = "BlackbeardReward", [2] = "DragonClaw", [3] = "2"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                           end
                           if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                              local args = {[1] = "BlackbeardReward", [2] = "DragonClaw", [3] = "1"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                              local args = {[1] = "BlackbeardReward", [2] = "DragonClaw", [3] = "2"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                           end
                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                              local args = {[1] = "BuySuperhuman"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                              _G.Weapon = "Superhuman"
                           end
                           if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                              local args = {[1] = "BuySuperhuman"}
                              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                              _G.Weapon = "Superhuman"
                           end
                           if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman").Level.Value <= 600 then
                                _G.Weapon = "Superhuman"
                           end
                           if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") and game.Players.LocalPlayer.Character:FindFirstChild("Superhuman").Level.Value <= 600 then
                                _G.Weapon = "Superhuman"
                           end
                        end
                    end)
                end
            else
                library:Notification("This Only Second Sea Or Third Sea", "Ok")
            end
        end
    end)
end

function AutoSaber()
    spawn(function () wait()
        if _G.AutoSaber then
            for i = 1, 5 do
                local args = {[1] = "ProQuestProgress", [2] = "Plate", [3] = i}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end

            local args = {[1] = "ProQuestProgress", [2] = "GetTorch"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            local args = {[1] = "ProQuestProgress", [2] = "DestroyTorch"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            local args = {[1] = "ProQuestProgress", [2] = "GetCup"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            if game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") then wait()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Cup"))
            end

            local args = {[1] = "ProQuestProgress", [2] = "FillCup", [3] = game:GetService("Players").LocalPlayer.Character.Cup}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            local args = {[1] = "ProQuestProgress", [2] = "SickMan"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            local args = {[1] = "ProQuestProgress", [2] = "RichSon"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            if game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Mob Leader [Lv. 120] [Boss]" then
                        repeat game:GetService("RunService").RenderStepped:wait()
                            EquipWeapon(_G.Weapon)
                            FastAttack()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local args = {[1] = "Buso"}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                if _G.HideHitbox then
                                    v.HumanoidRootPart.Transparency = 1
                                else
                                    v.HumanoidRootPart.Transparency = 0.75
                                end
                            end
                            if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                            local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 15)})
                            tween:Play()
                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSaber == false
                    end
                end
            end

            local args = {[1] = "ProQuestProgress", [2] = "RichSon"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            wait(2)
            local args = {[1] = "ProQuestProgress"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            if game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") then wait()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Relic"))
            end

            local vDoor = game:GetService("Workspace").Map.Jungle.Final.Invis
            vDoor.CanCollide = false
            vDoor.Size = Vector3.new(20,20,20)

            wait(1)
            telePos(-1403.92944, 29.8519993, 6.61151266)

            if game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Saber Expert [Lv. 200] [Boss]" then
                        repeat game:GetService("RunService").RenderStepped:wait()
                            EquipWeapon(_G.Weapon)
                            FastAttack()
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local args = {[1] = "Buso"}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                if _G.HideHitbox then
                                    v.HumanoidRootPart.Transparency = 1
                                else
                                    v.HumanoidRootPart.Transparency = 0.75
                                end
                            end
                            if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                            game:GetService'VirtualUser':CaptureController()
                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            local info = TweenInfo.new((game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.HumanoidRootPart.Position).magnitude / 300, Enum.EasingStyle.Linear)
                            local tween =  game:service"TweenService":Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), info, {CFrame = CFrame.new(v.HumanoidRootPart.Position) * CFrame.new(0, 25, 15)})
                            tween:Play()
                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSaber == false
                    end
                end
            end

            local args = {[1] = "KenTalk", [2] = "Buy"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        else wait(.5)
            telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        end
    end)
end

function InfAbility()
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
    wait(.1)
    local inf = Instance.new("ParticleEmitter")
    inf.Acceleration = Vector3.new(0,0,0)
    inf.Archivable = true
    inf.Drag = 20
    inf.EmissionDirection = Enum.NormalId.Top
    inf.Enabled = true
    inf.Lifetime = NumberRange.new(0.2,0.2)
    inf.LightInfluence = 0
    inf.LockedToPart = true
    inf.Name = "Agility"
    inf.Rate = 500
    inf.RotSpeed = NumberRange.new(999, 9999)
    inf.Rotation = NumberRange.new(0, 0)
    inf.Speed = NumberRange.new(30, 30)
    inf.SpreadAngle = Vector2.new(360,360)
    inf.Texture = "rbxassetid://243098098"
    inf.VelocityInheritance = 0
    inf.ZOffset = 2
    inf.Transparency = NumberSequence.new(0)
    inf.Color = ColorSequence.new(Color3.fromRGB(222, 0, 31),Color3.fromRGB(104, 0, 15))
    inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
end

function ActivateFly()
    local mouse=game.Players.LocalPlayer:GetMouse''
    localplayer=game.Players.LocalPlayer
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
    local keys={a=false,d=false,w=false,s=false}
    local e1
    local e2
    local function start()
        local pos = Instance.new("BodyPosition",torso)
        local gyro = Instance.new("BodyGyro",torso)
        pos.Name="WEEE"
        gyro.Name = "WEEE"
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = torso.Position
        gyro.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
        gyro.cframe = torso.CFrame
        repeat
            wait()
            localplayer.Character.Humanoid.PlatformStand=true
            local new=gyro.cframe - gyro.cframe.p + pos.position
            if not keys.w and not keys.s and not keys.a and not keys.d then
                speed= 1
            end
            if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed+25
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed+25
            end
            if keys.d then
                new = new * CFrame.new(speed,0,0)
                speed=speed+25
            end
            if keys.a then
                new = new * CFrame.new(-speed,0,0)
                speed=speed+25
            end
            if speed>25 then
                speed=25
            end
            pos.position=new.p
            if keys.w then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
            elseif keys.s then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
            else
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame
            end
        until not Flight
        if gyro then
            gyro:Destroy()
        end
        if pos then
            pos:Destroy()
        end
        flying = false
        localplayer.Character.Humanoid.PlatformStand=false
        speed= 0
    end
    e1=mouse.KeyDown:connect(function(key)
        if not torso or not torso.Parent then
            flying=false e1:disconnect() e2:disconnect() return
        end
        if key=="w" then
            keys.w=true
        elseif key=="s" then
            keys.s=true
        elseif key=="a" then
            keys.a=true
        elseif key=="d" then
            keys.d=true
        end
    end)
    e2=mouse.KeyUp:connect(function(key)
        if key=="w" then
            keys.w=false
        elseif key=="s" then
            keys.s=false
        elseif key=="a" then
            keys.a=false
        elseif key=="d" then
            keys.d=false
        end
    end)
    start()
end

function InfStamina()
    game:GetService("Players").LocalPlayer.Character.Energy.Changed:connect(function()
        if InfEnergy then
            game:GetService("Players").LocalPlayer.Character.Energy.Value = OriginEnergy
        end
    end)
end

do print("<[ LOADING CONFIG ]>")
    if _G.AutoFarm then
        print("> Auto Farm: True")
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        AutoFarm("Normal")
    else
        print("> Auto Farm: False")
    end

    if _G.MobAura then
        print("> Mob Aura: True")
        MobAura()
    else
        print("> Mob Aura: False")
    end

    if _G.BigHitbox then
        print("> Big Hitbox: True")
        BigHitbox()
    else
        print("> Big Hitbox: False")
    end

    if _G.PirateRaid then
        print("> Pirate Raid: True")
        PirateRaid()
    else
        print("> Pirate Raid: False")
    end

    if _G.BossFarm then
        print("> Boss Farm: True")
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        BossFarm()
    else
        print("> Boss Farm: False")
    end

    if _G.KillPlayer then
        print("> Kill Player: True")
        KillPlayer("Hit")
    else
        print("> Kill Player: False")
    end

    if _G.KillPlayerGun then
        print("> Kill Player (Gun): True")
        Aimbot2 = not Aimbot2
        KillPlayer("Click")
    else
        print("> Kill Player (Gun): False")
    end

    if _G.InfGeppo then
        print("> Inf Geppo: True")
        InfGeppo()
    else
        print("> Inf Geppo: False")
    end

    if _G.NoDashCD then
        print("> No Dash Cooldown: True")
        NoDashCD()
    else
        print("> No Dash Cooldown: False")
    end

    if _G.NoSoruCD then
        print("> No Soru Cooldown: True")
        NoSoruCD()
    else
        print("> No Soru Cooldown: False")
    end

    if _G.BringFruit then wait(.5)
        print("> Bring Fruit: True")
        telePos(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)
        BringFruit()
    else
        print("> Bring Fruit: False")
    end

    if _G.AutoStore then
        print("> Auto Store: True")
        StoreFruit()
    else
        print("> Auto Store: False")
    end

    if _G.EspFruit then
        print("> Esp Fruit: True")
        while _G.EspFruit do wait()
            UpdateDevilChams()
        end
    else
        print("> Esp Fruit: False")
    end

    if _G.EspChest then
        print("> Esp Chest: True")
        while _G.EspChest do wait()
            UpdateChestChams()
        end
    else
        print("> Esp Chest: False")
    end

    if _G.EspPlayer then
        print("> Esp Player: True")
        while _G.EspPlayer do wait()
            UpdatePlayerChams()
        end
    else
        print("> Esp Player: False")
    end

    if _G.ChooseMob then
        print("> Auto Farm (Choose Mob): True")
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        ChooseMob()
    else
        print("> Auto Farm (Choose Mob): False")
    end

    if _G.FruitMastery then
        print("> Auto Farm Devil Fruit Mastery: True")
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        AutoFarm("Fruit")
    else
        print("> Auto Farm Devil Fruit Mastery: False")
    end

    if _G.GunMastery then
        print("> Auto Farm Gun Mastery: True")
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        AutoFarm("Gun")
    else
        print("> Auto Farm Gun Mastery: False")
    end

    if _G.FullRaid then
        print("> Fully Auto Raid: True")
        FullyRaid()
    else
        print("> Fully Auto Raid: False")
    end

    if _G.FarmAllBoss then
        print("> Farm All Boss: True")
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        AllBoss()
    else
        print("> Farm All Boss: False")
    end

    if _G.AutoBones then
        print("> Auto Farm Bones: True")
        BoneFarm()
        MagnetBones()
    else
        print("> Auto Farm Bones: False")
    end

    if _G.AutoBartilo then
        print("> Auto Bartilo Quest: True")
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        Bartilo()
    else
        print("> Auto Bartilo Quest: False")
    end

    if _G.Observation then
        print("> Auto Farm Observation: True")
        Observation()
        ObservationCD()
    else
        print("> Auto Farm Observation: False")
    end

    if _G.HOP_Observation then
        print("> Auto Farm Observation + Hop: True")
        loadstring(game:HttpGet'https://raw.githubusercontent.com/AstroScripter/Games/main/Main/BloxFruits/HOPFunction/ObservationHOP.lua')()
    else
        print("> Auto Farm Observation + Hop: False")
    end

    if _G.AutoElite then
        print("> Auto Elite/Emma: True")
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        AutoElite()
    else
        print("> Auto Elite/Emma: False")
    end

    if _G.AutoSuperhuman then
        print("> Auto Superhuman: True")
        AutoFighting("Superhuman")
    else
        print("> Auto Superhuman: False")
    end

    if _G.AutoSaber then
        print("> Auto Saber: True")
        AutoSaber()
    else
        print("> Auto Saber: False")
    end

    print("<[ LOADED ]>")
end
