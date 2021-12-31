---@diagnostic disable: undefined-global
repeat wait() until game:IsLoaded()
local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function() VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)
require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker).CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}

-- Checking...
local Firstsea = false
local Secondsea = false
local Thirdsea = false

if game.PlaceId == 2753915549 then
    Firstsea = true
elseif game.PlaceId == 4442272183 then
    Secondsea = true
elseif game.PlaceId == 7449423635 then
    Thirdsea = true
else
    setclipboard("https://discord.gg/cbVrFSnyUr")
    game.Players.LocalPlayer:Kick("Game Not Support :( | Join My Discord For More ! | Link Copied In Clipboard")
end

-- HOP FUNCTION
local IDs = {}
local FoundAny = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function Teleport()
    while wait() do
        pcall(function ()
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
            if FoundAny ~= "" then
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
        end)
    end
end

-- GUI
local UI = game:GetService("CoreGui"):FindFirstChild("AstroHub") if UI then UI:Destroy() end
local library = loadstring(game:HttpGet'https://raw.githubusercontent.com/AstroStorage/Main-Games/main/FluxLib-Remake.lua')()
local Main = library:Window("ASTRO HUB", "TIME | N/A", Color3.fromRGB(20, 137, 227), Enum.KeyCode.RightControl)
spawn(function () wait()
    while wait(.1) do
        library:WinUpdate("ASTRO HUB", "TIME | "..os.date("%H")..":"..os.date("%M")..":"..os.date("%S"), Color3.fromRGB(20, 137, 227), Enum.KeyCode.RightControl)
    end
end)

local Part = nil;
local GodModeIsDone;
game:GetService("RunService").Stepped:Connect(function ()
    if Float
    or _G.AutoFarm
    or _G.MobAura
    or _G.ChooseMob
    or _G.BoneFarm
    or _G.AutoElite
    or _G.AutoRainbow
    or AutoElectric
    or _G.BossFarm
    or _G.AllBoss
    or KillPlr
    or KillPlr2
    or _G.BringFruit
    or NoClip
    or NextIsland
    or AutoJoinRaid
    then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
        if not Part then
            Part = Instance.new("Part", game.Workspace)
            Part.Name = "TweenWalk"
            Part.Anchored = true
            Part.CanCollide = true
            Part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4.3, 0)
            Part.Size = Vector3.new(2,1.3,2)
            Part.Transparency = 1
            while game.Workspace:FindFirstChild("TweenWalk") do
                game.Workspace:FindFirstChild("TweenWalk").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4.3, 0) wait()
            end
        end
    elseif Part then
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v:IsA("Part") and v.Name == "TweenWalk" then
                v:Destroy()
            end
        end
        Part = nil
    end
end)

local localPlayer = game:GetService("Players").LocalPlayer
local PlrMouse = localPlayer:GetMouse()
PlrMouse.Button1Down:Connect(function ()
    if (Aimbot or KillPlr2) and game.Players.LocalPlayer.Character:FindFirstChild(Gun) then
        local args = {
            [1] = game:GetService("Players"):FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position,
            [2] = game:GetService("Players"):FindFirstChild(selectedPlayer).Character.HumanoidRootPart
        }
        game:GetService("Players").LocalPlayer.Character[Gun].RemoteFunctionShoot:InvokeServer(unpack(args))
    end
end)

local Gun;
local ListMelee = {
    "Combat",
    "Black Leg",
    "Electro",
    "Fishman Karate",
    "Dragon Claw",
    "Superhuman",
    "DeathStep",
    "SharkmanKarate",
    "Electric Claw",
    "Dragon Talon"
}

spawn(function ()
    while game:GetService("RunService").RenderStepped:Wait() do
        pcall(function ()
            game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
            for i, v in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
                if v.Name == "Shared" and v:IsA("Folder") then
                else
                    v:Destroy()
                end
            end
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
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("RemoteFunctionShoot") then
                    Gun = v.Name
                end
            end
            if _G.EspFruit then
                ESP("Fruit")
            end
            if _G.EspChest then
                ESP("Chest")
            end
            if _G.EspPlayer then
                ESP("Players")
            end
            if _G.AutoStore then
                repeat wait(1)
                    local args = {[1] = "getInventoryFruits"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    AllFruit = FruitList
                    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))) do
                        for i2, v2 in pairs(v) do
                            FruitCheck = v2
                            for i3, v3 in pairs(AllFruit) do
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
                until not _G.AutoStore
            end
            if _G.AutoSword then
                local args = {[1] = "LegendarySwordDealer", [2] = "1"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {[1] = "LegendarySwordDealer", [2] = "2"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {[1] = "LegendarySwordDealer", [2] = "3"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if _G.HOP and Secondsea then
                    wait(10)
                    Teleport()
                end
            end
            if _G.HakiColor then
                local args = {[1] = "ColorsDealer", [2] = "2"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if _G.HOP and not Firstsea then
                    wait(10)
                    Teleport()
                end
            end
            if _G.AutoKen and not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                game:GetService('VirtualUser'):CaptureController()
                game:GetService('VirtualUser'):SetKeyDown('0x65')
                wait(1)
                game:GetService('VirtualUser'):SetKeyUp('0x65')
            end
            if _G.FastAttack then
                local FastAttackModule = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                pcall(function ()
                    FastAttackModule.activeController.attacking = false
                    FastAttackModule.activeController.active = false
                    FastAttackModule.activeController.timeToNextAttack = 0.2
                end)
            end
            if AutoAwaken then
                local args = {[1] = "Awakener", [2] = "Check"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {[1] = "Awakener", [2] = "Awaken"}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if KillAura then
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
            if _G.AutoEmma then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                    repeat wait(.1)
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector, 0.1)
                    until game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoEmma
                end
            end
            if NextIsland then
                local Locations = game:GetService("Workspace")["_WorldOrigin"].Locations
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                    TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
                elseif Locations:FindFirstChild("Island 5")
                or Locations:FindFirstChild("Island 4")
                or Locations:FindFirstChild("Island 3")
                or Locations:FindFirstChild("Island 2")
                or Locations:FindFirstChild("Island 1")
                then
                    if Locations:FindFirstChild("Island 5") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 5").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 5").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    elseif Locations:FindFirstChild("Island 4") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 4").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 4").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    elseif Locations:FindFirstChild("Island 3") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 3").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 3").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    elseif Locations:FindFirstChild("Island 2") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 2").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 2").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    elseif Locations:FindFirstChild("Island 1") then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Locations:FindFirstChild("Island 1").Position) * CFrame.new(0, _G.RaidHeight, 0)
                        else
                            TweenTo(Locations:FindFirstChild("Island 1").Position + Vector3.new(0, _G.RaidHeight, 0), 300)
                        end
                    end
                end
            end
            if AutoJoinRaid then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Microchip") then
                        if Thirdsea and not JoinedRaid then
                            RaidPortal = Vector3.new(-5033.16, 314.953, -2949.96)
                            if GodModeIsDone then
                                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(RaidPortal)
                            else
                                repeat wait()
                                    TweenTo(RaidPortal, 300)
                                until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - RaidPortal).magnitude <= 5
                            end
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector , 0.1)
                            HasChip = false
                            JoinedRaid = true
                            repeat wait(3) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                            repeat wait(3) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
                            JoinedRaid = false
                        elseif Secondsea and not JoinedRaid then
                            RaidPortal = Vector3.new(-6457.14, 252.737, -4451.57)
                            if GodModeIsDone then
                                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(RaidPortal)
                            else
                                repeat wait()
                                    TweenTo(RaidPortal, 300)
                                until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - RaidPortal).magnitude <= 5
                            end
                            fireclickdetector(game:GetService("Workspace").Map["CircleIsland"].RaidSummon2.Button.Main.ClickDetector, 0.1)
                            HasChip = false
                            JoinedRaid = true
                            repeat wait(3) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                            repeat wait(3) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
                            JoinedRaid = false
                        end
                    end
                end
            end
            if _G.AutoBuso and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end)
    end
end)

-- Function
function Click()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

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
        elseif MyLevel >= 2050 and MyLevel <= 2074 then
            nameMob = "Posessed Mummy [Lv. 2050]"
            nameQuest = "HauntedQuest2"
            levelQuest = 2
            nameMon = "Posessed Mummy"
            waitPos = Vector3.new(-9743.21, 68.6489, 6165.13)
            posQuest = Vector3.new(-9516.99, 172.017, 6078.47)
        elseif MyLevel >= 2075 and MyLevel <= 2099 then
            nameMob = "Peanut Scout [Lv. 2075]"
            nameQuest = "NutsIslandQuest"
            levelQuest = 1
            nameMon = "Peanut Scout"
            waitPos = Vector3.new(-2166.72, 90.5295, -10179.9)
            posQuest = Vector3.new(-2102.57, 38.1038, -10192.5)            
        elseif MyLevel >= 2100 and MyLevel <= 2124 then
            nameMob = "Peanut President [Lv. 2100]"
            nameQuest = "NutsIslandQuest"
            levelQuest = 2
            nameMon = "Peanut President"
            waitPos = Vector3.new(-2379.61, 140.666, -10427.6)
            posQuest = Vector3.new(-2102.57, 38.1038, -10192.5)
        elseif MyLevel >= 2125 and MyLevel <= 2149 then
            nameMob = "Ice Cream Chef [Lv. 2125]"
            nameQuest = "IceCreamIslandQuest"
            levelQuest = 1
            nameMon = "Ice Cream Chef"
            waitPos = Vector3.new(-901.45, 120.715, -10942.8)
            posQuest = Vector3.new(-821.255, 65.8195, -10965.2)
        elseif MyLevel >= 2150 then
            nameMob = "Ice Cream Commander [Lv. 2150]"
            nameQuest = "IceCreamIslandQuest"
            levelQuest = 2
            nameMon = "Ice Cream Commander"
            waitPos = Vector3.new(-653.074, 143.481, -11347.5)
            posQuest = Vector3.new(-821.255, 65.8195, -10965.2)
        end
    end
end

function BossCheck() -- Check Boss
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
    elseif _G.SelectedBoss == "Fajita [Lv. 925] [Boss]" then
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
    elseif _G.SelectedBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
        needQuest = false
    elseif _G.SelectedBoss == "Law" then
        needQuest = false
    elseif _G.SelectedBoss == "Stone [Lv. 1550] [Boss]" then
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

function MobCheck() -- Check Mob
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

--[ GUI ]--
local WeaponList = {}
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA("Tool") then table.insert(WeaponList, v.Name) end end
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") then table.insert(WeaponList, v.Name) end end
local AutoFarm = Main:Tab("Main", "http://www.roblox.com/asset/?id=1291127432")
AutoFarm:Label("--[ Server Status ]--")
local ServerTime = AutoFarm:Label("Server Time | N/A ")
local ClientStatus = AutoFarm:Label("Client Status | N/A ")
spawn(function ()
    while wait(.1) do
        local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
        local Hour = math.floor(GameTime/(60^2))%24
        local Min = math.floor(GameTime/(60^1))%60
        local Sec = math.floor(GameTime/(60^0))%60
        ServerTime:Update("Server Time   | Hour: "..Hour.." Minute: "..Min.." Second: "..Sec, Color3.fromRGB(38, 226, 255))
        ClientStatus:Update("Client Status | FPS: "..tostring(workspace:GetRealPhysicsFPS()).." Ping: "..tostring(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()).."", Color3.fromRGB(38, 226, 255))
    end
end)

AutoFarm:Line()
AutoFarm:Label("--[ Auto Farm ]--")
AutoFarm:Toggle("Auto Farm", "Ez To Use", _G.AutoFarm, function (bool)
    local args = {[1] = "AbandonQuest"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    _G.AutoFarm = bool
    All("Auto Farm")
    if _G.AutoFarm == false then wait(.5)
        TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
    end
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
    AutoFarm:Dropdown("Select Mob Here", mobList, function (bool)
        mobSelect = bool
    end)

    AutoFarm:Toggle("Auto Farm (Select Mob)", "Support 2nd - 3rd Sea", _G.ChooseMob, function (bool)
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.ChooseMob = bool
        All("Choose Mob")
        if _G.ChooseMob == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)
end

AutoFarm:Toggle("Mob Aura", "Kill Every Mob Near You", _G.MobAura, function (bool)
    _G.MobAura = bool
    All("Mob Aura")
    if _G.MobAura == false then wait(.5)
        TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
    end
end)

if Firstsea then
    AutoFarm:Toggle("Auto Second Sea", "Fast :3", _G.Auto2nd, function (bool)
        _G.Auto2nd = bool
        All("Second Sea")
        if _G.Auto2nd == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)

    AutoFarm:Toggle("Auto Saber", "", _G.AutoSaber, function (bool)
        _G.AutoSaber = bool
        All("Auto Saber")
        if _G.AutoSaber == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)
elseif Secondsea then
    AutoFarm:Toggle("Auto Third Sea", "IDK ;-;", _G.Auto3rd, function (bool)
        _G.Auto3rd = bool
        All("Third Sea")
        if _G.Auto3rd == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)

    AutoFarm:Toggle("Auto Lengend Sword [HOP]", "", _G.AutoSword, function (bool)
        _G.AutoSword = bool
    end)

    AutoFarm:Toggle("Auto Haki Colour [HOP]", "", _G.HakiColor, function (bool)
        _G.HakiColor = bool
    end)

    AutoFarm:Toggle("Auto Bartilo Quest", "", _G.AutoBartilo, function (bool)
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.AutoBartilo = bool
        All("Bartilo")
        if _G.AutoBartilo == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)
elseif Thirdsea then
    AutoFarm:Toggle("Auto Bone Farm", "Third Sea Only [OP!]", _G.BoneFarm, function (bool)
        _G.BoneFarm = bool
        All("Bone Farm")
        MagnetBone()
        if _G.BoneFarm == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)

    AutoFarm:Toggle("Auto Elite Boss [HOP]", "Hmm...", _G.AutoElite, function (bool)
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.AutoElite = bool
        All("Auto Elite")
        if _G.AutoElite == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)

	local EliteChecker = AutoFarm:Label("N/A")
    spawn(function ()
        while wait(.1) do
            local TotalElite = tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"))
            EliteChecker:Update("Total Elites: "..TotalElite, Color3.fromRGB(38, 226, 255))
        end
    end)

	AutoFarm:Toggle("Auto Emma / Yama", "", _G.AutoEmma, function (bool)
		_G.AutoEmma = bool
	end)

    AutoFarm:Toggle("Auto Rainbow Haki [HOP]", "", _G.AutoRainbow, function (bool)
        local args = {[1] = "AbandonQuest"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        _G.AutoRainbow = bool
        All("Rainbow Haki")
        if _G.AutoRainbow == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)

    AutoFarm:Toggle("Auto Haki Color [HOP]", "", _G.HakiColor, function (bool)
        _G.HakiColor = bool
    end)

    AutoFarm:Toggle("Auto Electric Claw [Beta]", "", false, function (bool)
        AutoElectric = bool
        if AutoElectric == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)
end

local WeaponDD = AutoFarm:Dropdown("Select Weapon", WeaponList, function (bool)
    _G.Weapon = bool
end)

AutoFarm:Button("Refresh Weapon", "Refresh Dropdown List", function ()
    WeaponDD:Clear() WeaponList = {}
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if v:IsA("Tool") then WeaponDD:Add(v.Name) table.insert(WeaponList, v.Name) end end
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") then WeaponDD:Add(v.Name) table.insert(WeaponList, v.Name) end end
end)

AutoFarm:Line()
AutoFarm:Label("--[ Boss Farm ]--")
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

AutoFarm:Toggle("Farm All Boss", "", _G.AllBoss, function (bool)
    local args = {[1] = "AbandonQuest"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    _G.AllBoss = bool
    All("All Boss")
    if _G.AllBoss == false then wait(.5)
        TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
    end
end)

AutoFarm:Toggle("Boss Farm", "", _G.BossFarm, function (bool)
    local args = {[1] = "AbandonQuest"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    _G.BossFarm = bool
    All("Farm Boss")
    if _G.BossFarm == false then wait(.5)
        TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
    end
end)

local BossWeaponDD = AutoFarm:Dropdown("Select Weapon Boss", WeaponList, function (bool)
    _G.BossWeapon = bool
end)

AutoFarm:Button("Refresh Boss Weapon", "", function ()
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

local Stats = Main:Tab("Status", "http://www.roblox.com/asset/?id=1291127432")
Stats:Label("--[ Auto Stats ]--")
Stats:Toggle("Melee", "Add Point To Melee", _G.StatsMelee, function (bool)
    _G.StatsMelee = bool
end)
Stats:Toggle("Defense", "Add Point To Defense", _G.StatsDefense, function (bool)
    _G.StatsDefense = bool
end)
Stats:Toggle("Sword", "Add Point To Sword", _G.StatsSword, function (bool)
    _G.StatsSword = bool
end)
Stats:Toggle("Gun", "Add Point To Gun", _G.StatsGun, function (bool)
    _G.StatsGun = bool
end)
Stats:Toggle("Devil Fruit", "Add Point To Fruit", _G.StatsDevilFruit, function (bool)
    _G.StatsDevilFruit = bool
end)

Stats:Label("--[ Point Stats ]--")
if _G.PointStats == nil then
    _G.PointStats = 1
end
Stats:Slider("Point Stats", "How Many Point Add / Times", 1, 100, _G.PointStats, function (bool)
    _G.PointStats = bool
end)

Stats:Line()
Stats:Label("--[ Player Stats ]--")

local Level = Stats:Label("")
local Point = Stats:Label("")
local StatMelee = Stats:Label("")
local StatDefense = Stats:Label("")
local StatSword = Stats:Label("")
local StatGun = Stats:Label("")
local StatFruit = Stats:Label("")

spawn(function ()
    while wait(.1) do
		Level:Update("Level : "..tostring(game:GetService("Players").LocalPlayer.Data.Level.Value), Color3.fromRGB(38, 226, 255))
		Point:Update("Point : "..tostring(game:GetService("Players").LocalPlayer.Data.Points.Value), Color3.fromRGB(38, 226, 255))
		StatMelee:Update("Melee : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value), Color3.fromRGB(38, 226, 255))
		StatDefense:Update("Defense : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Defense.Level.Value), Color3.fromRGB(38, 226, 255))
		StatSword:Update("Sword : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Sword.Level.Value), Color3.fromRGB(38, 226, 255))
		StatGun:Update("Gun : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats.Gun.Level.Value), Color3.fromRGB(38, 226, 255))
		StatFruit:Update("Devil Fruit : "..tostring(game:GetService("Players").LocalPlayer.Data.Stats["Demon Fruit"].Level.Value), Color3.fromRGB(38, 226, 255))
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

local Teleport = Main:Tab("Teleport", "http://www.roblox.com/asset/?id=1472442230")
Teleport:Label("--[ Misc ]--")
Teleport:Toggle("Ctrl + Click TP-Tween", "", _G.CTRL, function (bool)
    _G.CTRL = bool
end)

local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:Connect(function ()
    if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
    if not Mouse.Target then return end
    if _G.CTRL then
        if GodModeIsDone then
            Plr.Character:MoveTo(Mouse.Hit.p)
        elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Mouse.Hit.p).magnitude <= 350 then
            Plr.Character:MoveTo(Mouse.Hit.p)
        else
            TweenTo(Mouse.Hit.p)
        end
    end
end)

if Firstsea then
    Teleport:Button("Teleport To Second Sea", "", function ()
        local args = {[1] = "TravelDressrosa"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
elseif Secondsea then
    Teleport:Button("Teleport To First Sea", "", function ()
        local args = {[1] = "TravelMain"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
    Teleport:Button("Teleport To Third Sea", "", function ()
        local args = {[1] = "TravelZou"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
elseif Thirdsea then
    Teleport:Button("Teleport To Second Sea", "", function()
        local args = {[1] = "TravelDressrosa"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

Teleport:Button("Stop Tween", "", function ()
    wait(.5)
    TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
end)

if _G.TweenSpeed == nil then _G.TweenSpeed = 250 end
Teleport:Slider("Tween Speed", "", 1, 300, _G.TweenSpeed, function (bool)
    _G.TweenSpeed = bool
end)

if Secondsea or Thirdsea then
    Teleport:Button("Tween To Seabeast", "", function ()
        for i, v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                if GodModeIsDone then
                    game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 100, 0))
                else
                    repeat wait()
                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 100, 0))
                    until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= 5 or not v.Parent
                end
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
Teleport:Label("--[ World ]--")
if Firstsea then
    Teleport:Button("Pirate Start Island", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(1027.59, 19.3245, 1367.29)
        else
            TweenTo(Vector3.new(1027.59, 19.3245, 1367.29), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Marine Start Island", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-2684.3, 26.327, 1985.23)
        else
            TweenTo(Vector3.new(-2684.3, 26.327, 1985.23), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Middle Town", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-655.824, 7.85204, 1436.68)
        else
            TweenTo(Vector3.new(-655.824, 7.85204, 1436.68), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Jungle", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-1249.77, 11.852, 341.356)
        else
            TweenTo(Vector3.new(-1249.77, 11.852, 341.356), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Pirate Village", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-1122.35, 4.75205, 3855.92)
        else
            TweenTo(Vector3.new(-1122.35, 4.75205, 3855.92), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Desert", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(1094.15, 6.43847, 4192.89)
        else
            TweenTo(Vector3.new(1094.15, 6.43847, 4192.89), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Frozen Village", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(1198.01, 26.9725, -1211.73)
        else
            TweenTo(Vector3.new(1198.01, 26.9725, -1211.73), _G.TweenSpeed)
        end
    end)
    Teleport:Button("MarineFord", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-4505.38, 20.6523, 4260.56)
        else
            TweenTo(Vector3.new(-4505.38, 20.6523, 4260.56), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Magma Village", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-5231.76, 8.59013, 8467.88)
        else
            TweenTo(Vector3.new(-5231.76, 8.59013, 8467.88), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Sky 1st Floor", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-4970.22, 717.672, -2622.35)
        else
            TweenTo(Vector3.new(-4970.22, 717.672, -2622.35), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Sky 2nd Floor", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-4720.46, 854.517, -1943.15)
        else
            TweenTo(Vector3.new(-4720.46, 854.517, -1943.15), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Sky 3rd Floor", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-7886.96, 5545.53, -394.544)
        else
            TweenTo(Vector3.new(-7886.96, 5545.53, -394.544), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Colosseum", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-1428.35, 7.38934, -3014.37)
        else
            TweenTo(Vector3.new(-1428.35, 7.38934, -3014.37), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Prison", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(4874.81, 5.65199, 735.57)
        else
            TweenTo(Vector3.new(4874.81, 5.65199, 735.57), _G.TweenSpeed)
        end
    end)
    Teleport:Button("In UnderWater City", "", function ()
        Entrance("Go to Underwater")
    end)
    Teleport:Button("Out UnderWater City", "", function ()
        Entrance("Out Underwater")
    end)
    Teleport:Button("Fountain City", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(5213.1, 38.5011, 4095.69)
        else
            TweenTo(Vector3.new(5213.1, 38.5011, 4095.69), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Mob Island", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-2850.2, 7.39225, 5354.99)
        else
            TweenTo(Vector3.new(-2850.2, 7.39225, 5354.99), _G.TweenSpeed)
        end
    end)
elseif Secondsea then
    Teleport:Dropdown("Teleport Flower", {"Red Flower", "Blue Flower"}, function (bool)
        FlowerSelected = bool
        if FlowerSelected == "Red Flower" then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Flower2" then
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.Humanoid.CFrame = v.CFrame * CFrame.new(0, 0, 5)
                    else
                        TweenTo(v.Position, _G.TweenSpeed)
                    end
                end
            end
        end
        if FlowerSelected == "Blue Flower" then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "Flower1" then
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.Humanoid.CFrame = v.CFrame * CFrame.new(0, 0, 5)
                    else
                        TweenTo(v.Position, _G.TweenSpeed)
                    end
                end
            end
        end
    end)
    Teleport:Button("First Spot", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-2850.2, 7.39225, 5354.99)
        else
            TweenTo(Vector3.new(82.9491, 19.2667, 2834.99), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Cafe", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-385.251, 73.0201, 297.388)
        else
            TweenTo(Vector3.new(-385.251, 73.0201, 297.388), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Kingdom Of Rose", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-195.1, 121.579, 279.9)
        else
            TweenTo(Vector3.new(-195.1, 121.579, 279.9), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Factory", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(427.452, 211.494, -429.336)
        else
            TweenTo(Vector3.new(427.452, 211.494, -429.336), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Mansion", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-390.096, 331.861, 673.465)
        else
            TweenTo(Vector3.new(-390.096, 331.861, 673.465), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Swan Room", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(2302.19, 15.152, 663.811)
        else
            TweenTo(Vector3.new(2302.19, 15.152, 663.811), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Dark Arena", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(3807.1, 14.6502, -3452.2)
        else
            TweenTo(Vector3.new(3807.1, 14.6502, -3452.2), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Green Bit", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-2372.15, 72.9661, -3166.51)
        else
            TweenTo(Vector3.new(-2372.15, 72.9661, -3166.51), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Colosseum", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-1836.58, 45.7947, 1360.31)
        else
            TweenTo(Vector3.new(-1836.58, 45.7947, 1360.31), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Ghost Island", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-5571.84, 196.388, -795.433)
        else
            TweenTo(Vector3.new(-5571.84, 196.388, -795.433), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Ghost Island 2nd", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-5930.73, 6.4027, -1189.42)
        else
            TweenTo(Vector3.new(-5930.73, 6.4027, -1189.42), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Snow Mountain", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(1384.68, 453.512, -4990.1)
        else
            TweenTo(Vector3.new(1384.68, 453.512, -4990.1), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Cold Slide", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-6026.96, 15.9518, -5071.96)
        else
            TweenTo(Vector3.new(-6026.96, 15.9518, -5071.96), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Magma Slide", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-5478.39, 15.9518, -5246.91)
        else
            TweenTo(Vector3.new(-5478.39, 15.9518, -5246.91), _G.TweenSpeed)
        end
    end)
    Teleport:Button("In Cursed Ship", "", function ()
        Entrance("Go to Ship")
    end)
    Teleport:Button("Out Cursed Ship", "", function ()
        Entrance("Out Ship")
    end)
    Teleport:Button("Ice Castle", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(5400.40381, 28.21698, -6236.99219)
        else
            TweenTo(Vector3.new(5400.40381, 28.21698, -6236.99219), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Forgotten Island", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-3043.31543, 238.881271, -10191.5791)
        else
            TweenTo(Vector3.new(-3043.31543, 238.881271, -10191.5791), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Usoapp Island", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(4748.78857, 8.35370827, 2849.57959)
        else
            TweenTo(Vector3.new(4748.78857, 8.35370827, 2849.57959), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Minisky Island", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-260.358917, 49325.7031, -35259.3008)
        else
            TweenTo(Vector3.new(-260.358917, 49325.7031, -35259.3008), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Indra Island", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-26698, 7.06173, 425.623)
        else
            TweenTo(Vector3.new(-26698, 7.06173, 425.623), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Lap Room", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(-6436.61, 250.62, -4500.64)
        else
            TweenTo(Vector3.new(-6436.61, 250.62, -4500.64), _G.TweenSpeed)
        end
    end)
    Teleport:Button("l'Église de Prophétie", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.Humanoid.CFrame = CFrame.new(239.79, -58.382, 1824.44)
        else
            TweenTo(Vector3.new(239.79, -58.382, 1824.44), _G.TweenSpeed)
        end
    end)
elseif Thirdsea then
    Teleport:Button("Port Town", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-269.081, 6.72994, 5313.31)
        else
            TweenTo(Vector3.new(-269.081, 6.72994, 5313.31), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Hydra Island (Support Gate Tele)", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5317.27, 643.111, 336.468)
        elseif gateTele and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(5317.27, 643.111, 336.468)).magnitude > 500 then
            Entrance("Hydra")
        else
            TweenTo(Vector3.new(5317.27, 643.111, 336.468), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Secret Temple", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5226.1, 6.87257, 1111.05)
        else
            TweenTo(Vector3.new(5226.1, 6.87257, 1111.05), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Friendly Arena", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5227.64, 68.1246, -1453.46)
        else
            TweenTo(Vector3.new(5227.64, 68.1246, -1453.46), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Great Tree", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2267.83, 25.8876, -6600.01)
        else
            TweenTo(Vector3.new(2267.83, 25.8876, -6600.01), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Castle on the Sea (Support Gate Tele)", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4999.45, 318.181, -3010.54)
        elseif gateTele and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-4999.45, 318.181, -3010.54)).magnitude > 500 then
            Entrance("Castle")
        else
            TweenTo(Vector3.new(-4999.45, 318.181, -3010.54), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Rip Indra Boss Room", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5386.29, 335.627, -2565.9)
        else
            TweenTo(Vector3.new(-5386.29, 335.627, -2565.9), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Mansion (Support Gate Tele)", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12549.7, 341.781, -7470.36)
        elseif gateTele and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12549.7, 341.781, -7470.36)).magnitude > 500 then
            Entrance("Mansion")
        else
            TweenTo(Vector3.new(-12549.7, 341.781, -7470.36), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Floating Turtle", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10038.9, 332.096, -8325.16)
        else
            TweenTo(Vector3.new(-10038.9, 332.096, -8325.16), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Longma Boss Room", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10253.8, 375.099, -9525.49)
        else
            TweenTo(Vector3.new(-10253.8, 375.099, -9525.49), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Beautiful Pirate Domain (Support Gate Tele)", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5314.58203125, 25.419387817383, -125.94227600098)
        elseif gateTele then
            Entrance("Domain")
        else
            TweenTo(Vector3.new(5314.58203125, 25.419387817383, -125.94227600098), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Haunted Castle", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9506.11, 142.105, 5526.04)
        else
            TweenTo(Vector3.new(-9506.11, 142.105, 5526.04), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Soul Reaper Boss Room", "", function()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9524.4, 316.233, 6736.14)
        else
            TweenTo(Vector3.new(-9524.4, 316.233, 6736.14), _G.TweenSpeed)
        end
    end)
    Teleport:Button("Sea Of Treats", "", function ()
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-891.166, 65.8195, -10901.7)
        else
            TweenTo(Vector3.new(-891.166, 65.8195, -10901.7), _G.TweenSpeed)
        end
    end)
end

selectedPlayer = ""
local Player = Main:Tab("Players", "http://www.roblox.com/asset/?id=1188759634")
Player:Label("--[ Players Farm ]--")
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
    for i, v in pairs(game.Players:GetChildren()) do
        PlayerDD:Add(v.Name)
        table.insert(PlrList, v.Name)
    end
end)

Player:Toggle("Kill Player (Melee-Sword)", "", KillPlr, function (bool)
    KillPlr = bool
    All("Kill Player Melee")
    if KillPlr == false then wait(.5)
        TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
    end
end)

Player:Toggle("Kill Player (Gun)", "", KillPlr2, function (bool)
    KillPlr2 = bool
    All("Kill Player Gun")
    if KillPlr2 == false then wait(.5)
        TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
    end
end)

Player:Toggle("Spectate Player", "", false, function (bool)
    Spectate = bool
    repeat wait(.5)
        game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(selectedPlayer).Character.Humanoid
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

Player:Toggle("Aimbot Skill (Beta)", "", false, function (bool)
    if selectedPlayer == "" then
        library:Notification("Pls! Select Player", "Ok")
    else
        AimbotSkill = bool
        while AimbotSkill do game:GetService("RunService").RenderStepped:Wait()
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
                    local args = {
                        [1] = game:GetService("Players"):FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position
                    }
                    game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                end
            end)
        end
    end
end)

Player:Button("Tween To Player", "", function ()
    if GodModeIsDone then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(5, 0, 5)
    else
        repeat wait()
            TweenTo(game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position, 300)
        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Players:FindFirstChild(selectedPlayer).Character.HumanoidRootPart.Position).magnitude <= 5 or not game.Players:FindFirstChild(selectedPlayer).Character
    end
end)

local WeaponPlayerDD = Player:Dropdown("Weapon Player", WeaponList, function (bool)
    WeaponPlayerFarm = bool
end)

Player:Button("Refresh Weapon", "", function ()
    WeaponPlayerDD:Clear()
    WeaponList = {}
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            WeaponPlayerDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            WeaponPlayerDD:Add(v.Name)
            table.insert(WeaponList, v.Name)
        end
    end
end)

Player:Line()
Player:Label("--[ Local Player ]--")
Player:Toggle("Auto God Mode [OP!] (Read Des - Beta)", "Make Sure You Have 1 Defense Point (100 HP)", false, function (bool)
    GodMode = bool
    GodModeIsDone = false
    StartGodMode()
    while GodMode do wait(1)
        if GodModeIsDone then
            repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health > 10
            game.Players.LocalPlayer.Character:BreakJoints()
            repeat wait() until game.Players.LocalPLayer.Character
            GodModeIsDone = false
            StartGodMode()
        end
    end
end)

Player:Button("God Mode [OP!] (Read Des)", "Make Sure You Have Defense Point = 1 (100 HP)", function ()
    GodModeIsDone = false
    StartGodMode()
    repeat wait(3) until game.Players.LocalPlayer.Character.Humanoid.Health <= 0
    library:Notification("Player Has God Mode xD", "Ok Thanks")
end)

Player:Button("Disable God Mode", "", function ()
    GodModeIsDone = false
    game.Players.LocalPlayer.Character:BreakJoints()
end)

Player:Button("Invisible", "", function ()
    game.Players.LocalPlayer.Character.LowerTorso:Destroy()
end)

Player:Button("Remove Crew / Marine", "", function ()
    while wait(.1) do
        for i, v in pairs(game:GetService("Workspace").Characters[tostring(game.Players.LocalPlayer)].HumanoidRootPart:GetChildren()) do
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

local MyFruit = game.Players.localPlayer.Data.DevilFruit.Value
Player:Toggle("Walk On Water [ICE - FRUIT]", "", false, function (bool)
    WaterWalker = bool
    if WaterWalker == true then
        game.Players.LocalPlayer.Data.DevilFruit.Value = ("Ice-Ice")
    elseif WaterWalker == false then
        game.Players.LocalPlayer.Data.DevilFruit.Value = (MyFruit)
    end
end)

Player:Toggle("Walk On Water [IDK]", "", false, function (bool)
    local part = Instance.new("Part", game.Workspace)
    local RunService = game:GetService("RunService")
    part.Name = "SixZens So God"
    local target = game:GetService("Workspace").Camera["Water;"]
    part.Anchored = true
    part.Size = Vector3.new(0.1, 0.05, 0.1)
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
    InfEnergy = bool
    OriginEnergy = game:GetService("Players").LocalPlayer.Character.Energy.value
    while wait(.1) do
        if InfEnergy then wait(0.3)
            OriginEnergy = game:GetService("Players").LocalPlayer.Character.Energy.Value
            game:GetService("Players").LocalPlayer.Character.Energy.Changed:connect(function()
                if InfEnergy then
                    game:GetService("Players").LocalPlayer.Character.Energy.Value = OriginEnergy
                end
            end)
        end
    end
end)

Player:Toggle("Inf Ability", "", false, function (bool)
    if bool == true then
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
    elseif bool == false then
        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end
end)

Player:Toggle("Inf Geppo", "", false, function (bool)
    InfiniteGeppo = bool
    if InfiniteGeppo and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        for i, v in next, getgc() do
            if game.Players.LocalPlayer.Character.Geppo then
                if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Geppo then
                    for i2,v2 in next, getupvalues(v) do
                        if tostring(i2) == "9" then
                            repeat wait(.1)
                                setupvalue(v,i2,0)
                            until not InfiniteGeppo or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                            InfiniteGeppo = false
                        end
                    end
                end
            end
        end
    end
end)

Player:Toggle("No Dash Cooldown", "", false, function (bool)
    DashNoCooldown = bool
    if DashNoCooldown and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        for i, v in next, getgc() do
            if game.Players.LocalPlayer.Character.Dodge then
                if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
                    for i2,v2 in next, getupvalues(v) do
                        if tostring(v2) == "0.4"  then
                            repeat wait(.1)
                                setupvalue(v,i2,0)
                            until not DashNoCooldown or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 
                            DashNoCooldown = false
                        end
                    end
                end
            end
        end
    end
end)

Player:Toggle("No Soru Cooldown", "", false, function (bool)
    SoruNoCooldown = bool
    if SoruNoCooldown and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        for i ,v in next, getgc() do
            if game.Players.LocalPlayer.Character.Soru then
                if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Soru then
                    for i2,v2 in next, getupvalues(v) do
                        if typeof(v2) == "table"  then
                            repeat wait(.1)
                                v2.LastUse = 0
                            until not SoruNoCooldown or game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                            SoruNoCooldown = false
                        end
                    end
                end
            end
        end
    end
end)

Player:Toggle("Fly", "", false, function (bool)
    Flight = bool
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
        pos.Name = "WEEE"
        gyro.Name = "WEEE"
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = torso.Position
        gyro.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
        gyro.cframe = torso.CFrame
        repeat
            wait()
            localplayer.Character.Humanoid.PlatformStand = true
            local new = gyro.cframe - gyro.cframe.p + pos.position
            if not keys.w and not keys.s and not keys.a and not keys.d then
                speed = 1
            end
            if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + 25
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed = speed + 25
            end
            if keys.d then
                new = new * CFrame.new(speed, 0, 0)
                speed = speed + 25
            end
            if keys.a then
                new = new * CFrame.new(-speed, 0, 0)
                speed = speed + 25
            end
            if speed > 25 then
                speed = 25
            end
            pos.position = new.p
            if keys.w then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 15), 0, 0)
            elseif keys.s then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15), 0, 0)
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
        localplayer.Character.Humanoid.PlatformStand = false
        speed = 0
    end
    e1 = mouse.KeyDown:connect(function (key)
        if not torso or not torso.Parent then
            flying=false e1:disconnect() e2:disconnect() return
        end
        if key == "w" then
            keys.w = true
        elseif key == "s" then
            keys.s = true
        elseif key == "a" then
            keys.a = true
        elseif key == "d" then
            keys.d = true
        end
    end)
    e2 = mouse.KeyUp:connect(function (key)
        if key == "w" then
            keys.w = false
        elseif key == "s" then
            keys.s = false
        elseif key == "a" then
            keys.a = false
        elseif key == "d" then
            keys.d = false
        end
    end)
    start()
end)

Player:Slider("Walk Speed", "", 1, 1000, game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, function (bool)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = bool
    while bool do wait(1)
        game:GetService("Players").LocalPlayer.Character.Movement.Disabled = true
    end
end)

Player:Slider("Jump Height", "", 1, 1000, game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower, function (bool)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = bool
end)

local Misc = Main:Tab("Misc", "http://www.roblox.com/asset/?id=1291127785")
Misc:Label("--[ Devil Fruits ]--")
Misc:Button("Buy Random Devil Fruit", "", function ()
    local args = {[1] = "Cousin", [2] = "Buy"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Misc:Toggle("Auto Buy Random Devil Fruit", "", false, function (bool)
    AutoBuyFruit = bool
    while AutoBuyFruit do wait(1)
        local args = {[1] = "Cousin", [2] = "Buy"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
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
Misc:Dropdown("Select Fruit Sniper", FruitList, function (bool)
    fruitSelected = bool
end)

Misc:Toggle("Devil Fruit Sniper", "", false, function (bool)
    if fruitSelected == "" then
        library:Notification("Pls! Select fruit", "Ok")
    else
        BuyFruitSniper = bool
        while BuyFruitSniper do wait(1)
            local args = {[1] = "GetFruits"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {[1] = "PurchaseRawFruit", [2] = fruitSelected}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

Misc:Toggle("Bring Fruit (Tween-TP)", "", _G.BringFruit, function (bool)
    _G.BringFruit = bool
    All("Bring Fruit")
    if _G.BringFruit == false then wait(.5)
        TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
    end
end)

Misc:Toggle("Bring Fruit [Risk]", "", false, function (bool)
    BringFruitRisk = bool
    while BringFruitRisk do wait(.1)
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if string.find(v.Name, "Fruit") then
                if v:IsA("Tool") then
                    v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                    wait(.2)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
                end
            end
        end
    end
end)

Misc:Toggle("Auto Store All Fruit", "", _G.AutoStore, function (bool)
    _G.AutoStore = bool
end)

Misc:Line()
Misc:Label("--[ Misc ]--")
Misc:Button("Change To Pirates Team", "", function ()
    local args = {[1] = "SetTeam", [2] = "Pirates"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Misc:Button("Change To Marines Team", "", function ()
    local args = {[1] = "SetTeam", [2] = "Marines"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "Buso"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Misc:Button("Open Inventory", "", function ()
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
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest1)
        else
            repeat wait()
                TweenTo(chest1, 300)
            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest1).magnitude <= 5
        end
        wait(.5)
        local args = {[1] = "getInventoryWeapons"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
    else
        if GodModeIsDone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest2)
        else
            repeat wait()
                TweenTo(chest2, 300)
            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - chest2).magnitude <= 5
        end
        wait(.5)
        local args = {[1] = "getInventoryWeapons"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
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
        Funny("Code", v)
    end
end)

Misc:Dropdown("x2 Exp Code", expCode, function (bool)
    Funny("Code", bool)
end)

Misc:Dropdown("Stats Refund Code", statsCode, function (bool)
    Funny("Code", bool)
end)

Misc:Toggle("Esp Player", "", _G.EspPlayer, function (bool)
    _G.EspPlayer = bool
end)

Misc:Toggle("Esp Chest", "", _G.EspChest, function (bool)
    _G.EspChest = bool
end)

Misc:Toggle("Esp Devil Fruit", "", _G.EspFruit, function (bool)
    _G.EspFruit = bool
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

Misc:Toggle("No Clip", "Fake Clip ;-;", false, function(bool)
    NoClip = bool
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
Misc:Label("--[ Fake Data ]--")
Misc:Textbox("Fake Beli", "", false, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Beli.Value = value
end)
Misc:Textbox("Fake Level", "", false, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Level.Value = value
end)
Misc:Textbox("Fake Exp", "", false, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Exp.Value = value
end)
Misc:Textbox("Fake Fragments", "", false, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Fragments.Value = value
end)

Misc:Label("-- Fake Stats --")
Misc:Textbox("Fake Melee", "", false, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Stats.Melee.Level.Value = value
end)
Misc:Textbox("Fake Defense", "", false, function (value)
    game:GetService("Players")["localPlayer"].Data.Stats.Defense.Level.Value = value
end)
Misc:Textbox("Fake Sword", "", false, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Stats.Sword.Level.Value = value
end)
Misc:Textbox("Fake Gun", "", false, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Stats.Gun.Level.Value = value
end)
Misc:Textbox("Fake Fruit", "", false, function (value)
    game:GetService("Players")["LocalPlayer"].Data.Stats["Demon Fruit"].Level.Value = value
end)

if Secondsea or Thirdsea then
    local Dungeon = Main:Tab("Dungeon Raid", "http://www.roblox.com/asset/?id=1188758537")
    Dungeon:Label("--[ Auto Raid ]--")
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

    Dungeon:Toggle("Fully Auto Raid [OP!]", "Support Sea 2-3 [Auto Spawnpoint]", _G.FullyRaid, function (bool)
        -- library:Notification("This Function Has Locked", "Uh Oh o_o")
        if _G.FullyChip == nil or _G.FullyChip == "" then
            library:Notification("Select Chip First", "Ok I Know")
        else
            _G.FullyRaid = bool
            FullyRaid()
            if _G.FullyRaid == false then wait(.5)
                TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
            end
        end
    end)

    Dungeon:Toggle("Kill Aura (Raid Only)", "", false, function (bool)
        KillAura = bool
    end)

    Dungeon:Toggle("Auto Next Island", "", false, function (bool)
        NextIsland = bool
        if NextIsland == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)

    Dungeon:Toggle("Auto Awakener", "", false, function (bool)
        AutoAwaken = bool
    end)

    Dungeon:Toggle("Auto Join Raid (Tween)", "", false, function (bool)
        AutoJoinRaid = bool
        if AutoJoinRaid == false then wait(.5)
            TweenTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, 300)
        end
    end)

    if _G.RaidHeight == nil then _G.RaidHeight = 28 end
    Dungeon:Slider("Raid Height", "", 10, 130, _G.RaidHeight, function (bool)
        _G.RaidHeight = bool
    end)

    Dungeon:Label("-- Buy Chip --")
    Dungeon:Dropdown("Select Chip", {
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
        SelectChip = bool
    end)
    Dungeon:Button("Buy Selected Chip", "", function ()
        if SelectChip == nil or SelectChip == "" then
            library:Notification("Select Chip First", "Ok?")
        else
            Funny("Buy Chip", SelectChip)
        end
    end)
end

local Shop = Main:Tab("Shop", "http://www.roblox.com/asset/?id=1291128077")
Shop:Label("--[ Update 16 ]--")
local Bone = Shop:Label("N/A")
spawn(function ()
    while wait(.1) do
        Bone:Update("Total Bone: "..tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")), Color3.fromRGB(38, 226, 255))
    end
end)

Shop:Button("Buy Surprise", "", function ()
    local args = {[1] = "Bones", [2] = "Check"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {[1] = "Bones", [2] = "Buy", [3] = 1, [4] = 1}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Shop:Button("Buy Reroll Race [Bone]", "", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 3)
end)

Shop:Button("Buy Refund Stats [Bone]", "", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 2)
end)

Shop:Toggle("Auto Buy Surprise", "", false, function (bool)
    AutoSurprise = bool
    while AutoSurprise do wait()
        local args = {[1] = "Bones", [2] = "Check"}
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) >= 50 then
            local args = {[1] = "Bones", [2] = "Buy", [3] = 1, [4] = 1}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

Shop:Toggle("Auto x2 Exp [Bone]", "", false, function (bool)
    AutoDupeExp = bool
    while AutoDupeExp do wait(.1)
        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Exp.Text, "2x") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
    end
end)

if Secondsea or Thirdsea then
    Shop:Label("--[ Status ]--")
    Shop:Button("Stats Refund [2500 Fragment]", "", function ()
        local args = {[1] = "BlackbeardReward",[2] = "Refund",[3] = "1"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        local args = {[1] = "BlackbeardReward",[2] = "Refund",[3] = "2"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)

    Shop:Button("Race Reroll [3000 Fragment]", "", function ()
        local args = {[1] = "BlackbeardReward",[2] = "Reroll",[3] = "2"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

Shop:Label("--[ Fighting Styles ]--")
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

Shop:Label("--[ Sword ]--")
Shop:Button("Katana", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
end)

Shop:Button("Cutlass", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
end)

Shop:Button("Duel Katana", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
end)

Shop:Button("Iron Mace", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
end)

Shop:Button("Pipe", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
end)

Shop:Button("Triple Katana", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
end)

Shop:Button("Dual-Headed Blade", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
end)

Shop:Button("Bisento", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
end)

Shop:Button("Soul Cane", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
end)

Shop:Label("--[ Gun ]--")
Shop:Button("Slingshot", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
end)

Shop:Button("Musket", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
end)

Shop:Button("Flintlock", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
end)

Shop:Button("Refined Flintlock", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
end)

Shop:Button("Cannon", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
end)

Shop:Button("Kabucha", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot","1")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot","2")
end)

Shop:Label("--[ Accesories ]--")
Shop:Button("Black Cape", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
end)

Shop:Button("Toemo Ring", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
end)

Shop:Button("Swordsman Hat", "", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
end)

Shop:Label("--[ Abilities ]--")
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

Shop:Toggle("Auto Abilities", "", false, function (bool)
    AutoAbilities = bool
    while AutoAbilities do wait(.1)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    end
end)

local GameSetting = Main:Tab("Game", "http://www.roblox.com/asset/?id=1185031129")
GameSetting:Label("--[ HOP Function ]--")
GameSetting:Toggle("HOP Function", "(Support Function [HOP])", _G.HOP, function (bool)
    _G.HOP = bool
end)

GameSetting:Line()
GameSetting:Label("--[ Settings ]--")
if _G.AutoSetSpawn == nil then _G.AutoSetSpawn = true end
GameSetting:Toggle("Auto Set Spawn (Auto Farm)", "Set Spawn When You Auto Farm", _G.AutoSetSpawn, function (bool)
    _G.AutoSetSpawn = bool
end)

if _G.FastAttack == nil then _G.FastAttack = true end
GameSetting:Toggle("Fast Attack", "Really Fast", _G.FastAttack, function (bool)
    _G.FastAttack = bool
end)

if _G.Magnet == nil then _G.Magnet = true end
GameSetting:Toggle("Bring Mob", "For Auto Farm, Mob Aura", _G.Magnet, function (bool)
    _G.Magnet = bool
end)

if _G.AutoBuso == nil then _G.AutoBuso = true end
GameSetting:Toggle("Auto Buso Haki", "", _G.AutoBuso, function (bool)
    _G.AutoBuso = bool
end)

GameSetting:Toggle("Auto Ken Haki", "", _G.AutoKen, function (bool)
    _G.AutoKen = bool
end)

GameSetting:Line()
GameSetting:Label("--[ FUN ]--")
GameSetting:Toggle("Light Mode", "", LightMode, function (bool)
    LightMode = bool
    if LightMode then
        while LightMode do wait()
            pcall(function ()
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight") then
                    local PointLight = Instance.new("PointLight")
                    PointLight.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    PointLight.Range = 16
                    PointLight.Color = Color3.fromRGB(255, 167, 31)
                end
            end)
        end
    else
        PointLight:Destroy()
    end
end)

GameSetting:Line()
GameSetting:Label("--[ Game ]--")

GameSetting:Button("Destroy Gui", "", function ()
    game:GetService("CoreGui"):FindFirstChild("AstroHub"):Destroy()
end)

GameSetting:Button("Copy Discord Link", "https://discord.gg/cbVrFSnyUr", function ()
    setclipboard("https://discord.gg/cbVrFSnyUr")
end)

GameSetting:Button("Rejoin", "", function ()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
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

--[ FUNCTION ]--
function Funny(type, value)
    if type == "Code" then
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
    elseif type == "Buy Chip" then
        game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("RaidsNpc", "Select", value)
    end
end

Number = math.random(1, 1000000)
function ESP(type)
    function isnil(thing)
        return (thing == nil)
    end

    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end

    if type == "Players" then
        for i, v in pairs(game:GetService'Players':GetChildren()) do
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

    if type == "Chest" then
        for i, v in pairs(game.Workspace:GetChildren()) do
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

    if type == "Fruit" then
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
end

function Entrance(type)
    local args = {[1] = "GetUnlockables"}
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    if type == "Go to Underwater" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)}
    elseif type == "Out Underwater" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(3864.6884765625, 6.7369503974915, -1926.2141113281)}
    elseif type == "Go to Ship" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)}
    elseif type == "Out Ship" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)}
    elseif type == "Castle" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-12463.602539063, 378.32705688477, -7566.0830078125)}
    elseif type == "Mansion" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-5089.6645507813, 318.50231933594, -3146.1267089844)}
    elseif type == "Hydra" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(-5099.0244140625, 318.50231933594, -3169.3083496094)}
    elseif type == "Domain" then
        local args = {[1] = "requestEntrance", [2] = Vector3.new(5314.58203125, 25.419387817383, -125.94227600098)}
    end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function TweenTo(Pos, Speed)
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude <= 400 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Pos)
    else
        if not _G.AutoFarm
        or not _G.MobAura
        or not _G.ChooseMob
        or not _G.BoneFarm
        or not _G.AutoElite
        or not _G.AutoRainbow
        or not AutoElectric
        or not _G.BossFarm
        or not _G.AllBoss
        or not KillPlr
        or not KillPlr2
        or not _G.BringFruit
        or not NoClip
        or not NextIsland
        or not AutoJoinRaid
        or not Float
        then
            Float = true
        end
        local TS = game:GetService("TweenService")
        local Info = TweenInfo.new((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude / Speed, Enum.EasingStyle.Linear)
        local Tween, Err = pcall(function ()
            Tween = TS:Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, Info, {CFrame = CFrame.new(Pos)})
            Tween:Play()
            repeat wait() until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude <= 400
            Tween:Pause()
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Pos).magnitude <= 400 then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Pos) end
            if not Tween then return Err end
            if Float then Float = false end
        end)
    end
end

function Equip(toolName)
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolName) then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(toolName))
    end
end

function All(type)
    spawn(function ()
        pcall(function ()
            if type == "Auto Farm" and _G.AutoFarm then
                while _G.AutoFarm do game:GetService'RunService'.RenderStepped:Wait()
                    while _G.AutoFarm do game:GetService("RunService").RenderStepped:Wait()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            levelCheck()
                            local MyLevel = game.Players.localPlayer.Data.Level.Value
                            if MyLevel >= 375 and MyLevel < 450 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                                if GodModeIsDone then
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(61163.8515625, 11.6796875, 1819.7841796875)
                                else
                                    Entrance("Go to Underwater")
                                end
                            elseif MyLevel >= 450 and MyLevel < 700 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                                if GodModeIsDone then
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3864.6884765625, 6.7369503974915, -1926.2141113281)
                                else
                                    Entrance("Out Underwater")
                                end
                            elseif MyLevel >= 1250 and MyLevel < 1350 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                                if GodModeIsDone then
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(923.21252441406, 126.9760055542, 32852.83203125)
                                else
                                    Entrance("Go to Ship")
                                end
                            elseif MyLevel >= 1350 and MyLevel < 1500 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude > 10000 then
                                if GodModeIsDone then
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6508.5581054688, 89.034996032715, -132.83953857422)
                                else
                                    Entrance("Out Ship")
                                end
                            end
                            repeat wait() until game:IsLoaded()
                            if GodModeIsDone then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posQuest)
                            else
                                repeat wait()
                                    TweenTo(posQuest, 300)
                                until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5
                            end
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                            if _G.AutoSetSpawn then
                               local args = {[1] = "SetSpawnPoint"}
                               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.AutoFarm then levelCheck()
                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                                if game:GetService("Workspace").Enemies:FindFirstChild(nameMob) then
                                    pcall(function ()
                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do levelCheck()
                                            if v.Name == nameMob then
                                                repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                    if _G.Weapon == "" or _G.Weapon == nil then
                                                        for i, v in pairs(ListMelee) do
                                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                _G.Weapon = v
                                                            end
                                                        end
                                                    end
                                                    Equip(_G.Weapon)
                                                    Click()
                                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                        local args = {[1] = "Buso"}
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                    end
                                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                        v.Humanoid.WalkSpeed = 1
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                        v.HumanoidRootPart.Transparency = 1
                                                        PosMon = v.HumanoidRootPart.CFrame
                                                    end
                                                    if GodModeIsDone then
                                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                                    else
                                                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                    end
                                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or _G.AutoFarm == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                if (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) then
                                                    repeat wait(10) until game:GetService("Players").LocalPlayer.Character
                                                    local args = {[1] = "AbandonQuest"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                            end
                                        end
                                    end)
                                else levelCheck()
                                    if GodModeIsDone then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waitPos)
                                    else
                                        TweenTo(waitPos, 300)
                                    end
                                end
                            else
                                local args = {[1] = "AbandonQuest"}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        end
                    end
                end
            elseif type == "Bone Farm" and _G.BoneFarm and Thirdsea then
                while _G.BoneFarm do game:GetService'RunService'.RenderStepped:Wait()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")
                    or game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]")
                    or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]")
                    then
                        RandomMob = math.random(1, 3)
                        if RandomMob == 1 then
                            BoneMob = "Posessed Mummy [Lv. 2050]"
                            Position = Vector3.new(-9573.1, 5.81833, 6197.55)
                        elseif RandomMob == 2 then
                            BoneMob = "Reborn Skeleton [Lv. 1975]"
                            Position = Vector3.new(-8762.44, 142.131, 6002.3)
                        elseif RandomMob == 3 then
                            BoneMob = "Living Zombie [Lv. 2000]"
                            Position = Vector3.new(-10153.4, 139.652, 5936.71)
                        end
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == BoneMob then
                                repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    if _G.Weapon == "" or _G.Weapon == nil then
                                        for i, v in pairs(ListMelee) do
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                _G.Weapon = v
                                            end
                                        end
                                    end
                                    Equip(_G.Weapon)
                                    Click()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then local args = {[1] = "Buso"} game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.Humanoid.WalkSpeed = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                    end
                                    if GodModeIsDone then
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Position + Vector3.new(0, 25, 0))
                                    else
                                        TweenTo(Position + Vector3.new(0, 25, 0), 300)
                                    end
                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or _G.BoneFarm == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                            end
                        end
                    end
                end
            elseif type == "Mob Aura" and _G.MobAura then
                while _G.MobAura do game:GetService'RunService'.RenderStepped:Wait()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                if _G.Weapon == "" or _G.Weapon == nil then
                                    for i, v in pairs(ListMelee) do
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                            _G.Weapon = v
                                        end
                                    end
                                end
                                Equip(_G.Weapon)
                                Click()
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {[1] = "Buso"}
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                    v.Humanoid.WalkSpeed = 1
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.Transparency = 1
                                    AuraBringPos = v.HumanoidRootPart.CFrame
                                end
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                            until v.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or _G.MobAura == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                        end
                    end
                end
            elseif type == "Choose Mob" and _G.ChooseMob and not Firstsea then
                while _G.ChooseMob do game:GetService'RunService'.RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        MobCheck()
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posQuest)
                        else
                            repeat wait()
                                TweenTo(posQuest, 300)
                            until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - posQuest).magnitude <= 5
                        end
                        wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameQuest, levelQuest)
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.ChooseMob then
                        MobCheck()
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameMon) then
                            if game:GetService("Workspace").Enemies:FindFirstChild(mobSelect) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == mobSelect then
                                        repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                            if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                            if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                            if _G.Weapon == "" or _G.Weapon == nil then
                                                for i, v in pairs(ListMelee) do
                                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                        _G.Weapon = v
                                                    end
                                                end
                                            end
                                            Equip(_G.Weapon)
                                            Click()
                                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                local args = {[1] = "Buso"}
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                v.Humanoid.WalkSpeed = 1
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v.HumanoidRootPart.Transparency = 1
                                                MobChoosedPos = v.HumanoidRootPart.CFrame
                                            end
                                            if GodModeIsDone then
                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                            else
                                                TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                            end
                                            require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                        until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or _G.ChooseMob == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    end
                                end
                            else MobCheck()
                                if GodModeIsDone then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waitPos)
                                else
                                    TweenTo(waitPos, 300)
                                end
                            end
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end
            elseif type == "Bring Fruit" and _G.BringFruit then
                while _G.BringFruit do wait(.1)
                    repeat wait()
                        for i, v in pairs(game.Workspace:GetChildren()) do
                            if v:IsA "Tool" then
                                if (v.Handle.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
                                    v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                else
                                    TweenTo(v.Handle.Position, 300)
                                end
                            end
                        end
                    until not _G.BringFruit
                end
            elseif type == "Farm Boss" and _G.BossFarm then
                while _G.BossFarm do game:GetService'RunService'.RenderStepped:Wait()
                    BossCheck()
                    if needQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posBossQuest)
                        else
                            repeat wait()
                                TweenTo(posBossQuest, 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posBossQuest).magnitude <= 5
                        end
                        wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameBossQuest, levelBossQuest)
                    elseif not needQuest or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and needQuest) then BossCheck()
                        if not needQuest or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameBoss) and needQuest) then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == _G.SelectedBoss then
                                    repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        if _G.BossWeapon == "" or _G.BossWeapon == nil then
                                            for i, v in pairs(ListMelee) do
                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                    _G.BossWeapon = v
                                                end
                                            end
                                        end
                                        Equip(_G.BossWeapon)
                                        Click()
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {[1] = "Buso"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                        if GodModeIsDone then
                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(15, 25, 0)
                                        else
                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(15, 25, 0), 300)
                                        end
                                    until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or _G.BossFarm == false or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and needQuest)
                                end
                            end
                        elseif needQuest then
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end
            elseif type == "All Boss" and _G.AllBoss then
                while _G.AllBoss do game:GetService'RunService'.RenderStepped:Wait()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if string.find(v.Name, "Boss") then
                            _G.SelectedBoss = v.Name
                            BossCheck()
                            if needQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                if GodModeIsDone then
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(posBossQuest)
                                else
                                    repeat wait()
                                        TweenTo(posBossQuest, 300)
                                    until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - posBossQuest).magnitude <= 5
                                end
                                wait(.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nameBossQuest, levelBossQuest)
                            elseif not needQuest or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and needQuest) then BossCheck()
                                if not needQuest or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, nameBoss) and needQuest) then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == _G.SelectedBoss then
                                            repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                                if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                if _G.BossWeapon == "" or _G.BossWeapon == nil then
                                                    for i, v in pairs(ListMelee) do
                                                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                            _G.BossWeapon = v
                                                        end
                                                    end
                                                end
                                                Equip(_G.BossWeapon)
                                                Click()
                                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                    local args = {[1] = "Buso"}
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                end
                                                if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                    v.Humanoid.WalkSpeed = 1
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    v.HumanoidRootPart.Transparency = 1
                                                end
                                                if GodModeIsDone then
                                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(15, 25, 0)
                                                else
                                                    TweenTo(v.HumanoidRootPart.Position + Vector3.new(15, 25, 0), 300)
                                                end
                                                require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                            until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or _G.AllBoss == false or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false and needQuest)
                                        end
                                    end
                                elseif needQuest then
                                    local args = {[1] = "AbandonQuest"}
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                            end
                        end
                    end
                end
            elseif type == "Kill Player Gun" and KillPlr2 then
                local Plr1 = game.Players.LocalPlayer
                local Plr2 = game.Players:FindFirstChild(selectedPlayer)
                repeat wait()
                    Equip(Gun)
                    if GodModeIsDone then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 70, -30)
                    else
                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 70, -30), 300)
                    end
                    Plr2.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    Click()
                until KillPlr2 == false
            elseif type == "Kill Player Melee" and KillPlr then
                local Plr1 = game.Players.LocalPlayer
                local Plr2 = game.Players:FindFirstChild(selectedPlayer)
                repeat wait()
                    Equip(WeaponPlayerFarm)
                    if GodModeIsDone then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                    else
                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 15, 0), 300)
                    end
                    Plr2.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    Click()
                until KillPlr == false
            elseif type == "Auto Elite" and _G.AutoElite and Thirdsea then
                while _G.AutoElite do game:GetService("RunService").RenderStepped:Wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        EliteQuest = Vector3.new(-5419.21, 313.705, -2826.24)
                        if GodModeIsDone then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(EliteQuest)
                        else
                            repeat wait()
                                TweenTo(EliteQuest, 300)
                            until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - EliteQuest).magnitude <= 5
                        end
                        wait(.5)
                        local args = {[1] = "EliteHunter"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and _G.AutoElite then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo")
                        or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")
                        or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre")
                        then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Diablo"))
                                or (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Urban"))
                                or (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:IsA("Model") and string.find(v.Name, "Deandre"))
                                then
                                    repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        if _G.Weapon == "" or _G.Weapon == nil then
                                            for i, v in pairs(ListMelee) do
                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                    _G.Weapon = v
                                                end
                                            end
                                        end
                                        Equip(_G.Weapon)
                                        Click()
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {[1] = "Buso"}
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                            v.Humanoid.WalkSpeed = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                        if GodModeIsDone then
                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                        else
                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                        end
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                    until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or _G.AutoElite == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    if _G.HOP and Thirdsea then
                                        wait(1.5)
                                        Teleport() break;
                                    end
                                end
                            end
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                    end
                end
            elseif type == "Second Sea" and _G.Auto2nd and Firstsea then
                while _G.Auto2nd do wait(.1)
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4849.29883, 5.65138149, 719.611877)
                    else
                        repeat wait()
                            TweenTo(Vector3.new(4849.29883, 5.65138149, 719.611877), 300)
                        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(4849.29883, 5.65138149, 719.611877)).magnitude <= 5
                    end

                    wait(.5)

                    local args = {[1] = "DressrosaQuestProgress", [2] = "Detective"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    Equip("Key")
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                    else
                        repeat wait()
                            TweenTo(Vector3.new(1347.7124, 37.3751602, -1325.6488), 300)
                        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1347.7124, 37.3751602, -1325.6488)).magnitude <= 5
                    end

                    wait(.5)
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                    for i, v in pairs(ListMelee) do
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                            Equip(v)
                        end
                    end

                    wait(3)
                    if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]")
                    and game.Workspace.Map.Ice.Door.CanCollide == false
                    and game.Workspace.Map.Ice.Door.Transparency == 1
                    then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    if _G.Weapon == "" or _G.Weapon == nil then
                                        for i, v in pairs(ListMelee) do
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                _G.Weapon = v
                                            end
                                        end
                                    end
                                    Equip(_G.Weapon)
                                    Click()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        local args = {[1] = "Buso"}
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.Humanoid.WalkSpeed = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                    end
                                    if GodModeIsDone then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0))
                                    else
                                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                    end
                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or _G.Auto2nd == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil
                                wait(.5)
                                local args = {[1] = "TravelDressrosa"}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                _G.Auto2nd = false
                            end
                        end
                    else
                        Equip("Key")
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                        else
                            repeat wait()
                                TweenTo(Vector3.new(1347.7124, 37.3751602, -1325.6488), 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(1347.7124, 37.3751602, -1325.6488)).magnitude <= 5
                        end
                    end
                end
            elseif type == "Third Sea" and _G.Auto3rd and Secondsea then
                while _G.Auto3rd do wait(.1)
                    if game.Workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "rip_indra [Lv. 1500] [Boss]" then
                                repeat game:GetService("RunService").RenderStepped:Wait(.5)
                                    Equip(_G.Weapon)
                                    Click()
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.HumanoidRootPart.Transparency = 1
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.Humanoid.WalkSpeed = 1
                                        v.HumanoidRootPart.CanCollide = false
                                    end
                                    if GodModeIsDone then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(10, 25, 0)
                                    else
                                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(10, 25, 0), 300)
                                    end
                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                until not v.Parent or v.Humanoid.Health <= 55000 or _G.Auto3rd == false or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone)
                            end
                        end

                        wait(.5)
                        for i = 1, 3 do wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    else wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                    end
                end
            elseif type == "Bartilo" and _G.AutoBartilo and Secondsea then
                while _G.AutoBartilo do wait(.1)
                    local MyLevel = game.Players.localPlayer.Data.Level.Value
                    if MyLevel < 850 then
                        library:Notification("Bartilo Quest", "You Need To Level 850 Or Above")
                    elseif MyLevel >= 850 and _G.AutoBartilo then
                        if not Completed then
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
                        end

                        if not Completed and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            BartiloQuest = Vector3.new(-458.408, 73.0201, 300.347)
                            if GodModeIsDone then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(BartiloQuest)
                            else
                                repeat wait()
                                    TweenTo(BartiloQuest, 300)
                                until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - BartiloQuest).magnitude <= 5
                            end
                            wait(.5)
                            local args = {[1] = "StartQuest", [2] = "BartiloQuest", [3] = 1}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        elseif not Completed and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            BartiloMob = "Swan Pirate [Lv. 775]"
                            BartiloBoss = "Jeremy [Lv. 850] [Boss]"
                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") then
                                if game:GetService("Workspace").Enemies:FindFirstChild(BartiloMob) then
                                    pcall(function ()
                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == BartiloMob then
                                                repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                    if _G.Weapon == "" or _G.Weapon == nil then
                                                        for i, v in pairs(ListMelee) do
                                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                _G.Weapon = v
                                                            end
                                                        end
                                                    end
                                                    Equip(_G.Weapon)
                                                    Click()
                                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                        local args = {[1] = "Buso"}
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                    end
                                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                        v.Humanoid.WalkSpeed = 1
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                        v.HumanoidRootPart.Transparency = 1
                                                        BartiloBringPos = v.HumanoidRootPart.CFrame
                                                    end
                                                    if GodModeIsDone then
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0))
                                                    else
                                                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 35, 0), 300)
                                                    end
                                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or _G.AutoBartilo == false or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                wait(.5)
                                                if GodModeIsDone then
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(BartiloQuest)
                                                else
                                                    repeat wait()
                                                        TweenTo(BartiloQuest, 300)
                                                    until (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - BartiloQuest).magnitude <= 5
                                                end
                                                wait(.5)
                                                local args = {[1] = "BartiloQuestProgress", [2] = "Bartilo"}
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Jeremy") then
                                                    pcall(function ()
                                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                            if v.Name == BartiloBoss then
                                                                repeat game:GetService("RunService").RenderStepped:Wait(0.5)
                                                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                                                    if _G.Weapon == "" or _G.Weapon == nil then
                                                                        for i, v in pairs(ListMelee) do
                                                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                                                _G.Weapon = v
                                                                            end
                                                                        end
                                                                    end
                                                                    Equip(_G.Weapon)
                                                                    Click()
                                                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                                        local args = {[1] = "Buso"}
                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                    end
                                                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                                                        v.Humanoid.WalkSpeed = 1
                                                                        v.HumanoidRootPart.CanCollide = false
                                                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                        v.HumanoidRootPart.Transparency = 1
                                                                    end
                                                                    if GodModeIsDone then
                                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(15, 25, 0))
                                                                    else
                                                                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(15, 25, 0), 300)
                                                                    end
                                                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                                                until v.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or not v.Parent or v:FindFirstChild("HumanoidRootPart") == nil or _G.AutoBartilo == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                                                wait(.5)
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
                                                    end)
                                                end
                                            end
                                        end
                                    end)
                                else
                                    BartiloWaitPos = Vector3.new(977.465, 121.331, 1302.35)
                                    if GodModeIsDone then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(BartiloWaitPos)
                                    else
                                        TweenTo(BartiloWaitPos, 300)
                                    end
                                end
                            else
                                local args = {[1] = "AbandonQuest"}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        end
                    end
                end
            elseif type == "Rainbow Haki" and _G.AutoRainbow and Thirdsea then
                while _G.AutoRainbow do wait(.1)
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                        else
                            TweenTo(Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875), 300)
                        end
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                        end
                    elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                            AutoRainbow_Boss = "Stone [Lv. 1550] [Boss]"
                        elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
                            AutoRainbow_Boss = "Island Empress [Lv. 1675] [Boss]"
                        elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                            AutoRainbow_Boss = "Kilo Admiral [Lv. 1750] [Boss]"
                        elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                            AutoRainbow_Boss = "Captain Elephant [Lv. 1875] [Boss]"
                        elseif string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                            AutoRainbow_Boss = "Beautiful Pirate [Lv. 1950] [Boss]"
                        else
                            local args = {[1] = "AbandonQuest"}
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end

                        if game:GetService("Workspace").Enemies:FindFirstChild(AutoRainbow_Boss) then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == AutoRainbow_Boss then
                                    repeat game:GetService("RunService").Heartbeat:wait()
                                        if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                        if _G.Weapon == "" or _G.Weapon == nil then
                                            for i, v in pairs(ListMelee) do
                                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                    _G.Weapon = v
                                                end
                                            end
                                        end
                                        Equip(_G.Weapon)
                                        Click()
                                        if GodModeIsDone then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 25, 0))
                                        else
                                            TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 25, 0), 300)
                                        end
                                        require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                    until _G.AutoRainbow == false or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone) or v.Humanoid.Health <= 0 or not v.Parent or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        elseif _G.HOP and Thirdsea then
                            wait(1.5)
                            Teleport() break;
                        end
                    end
                end
            elseif type == "Auto Saber" and _G.AutoSaber and Firstsea then
                while _G.AutoSaber do wait(.1)
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

                    Equip("Cup")

                    local args = {[1] = "ProQuestProgress", [2] = "FillCup", [3] = game:GetService("Players").LocalPlayer.Character.Cup}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    local args = {[1] = "ProQuestProgress", [2] = "SickMan"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    local args = {[1] = "ProQuestProgress", [2] = "RichSon"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    if game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Mob Leader [Lv. 120] [Boss]" then
                                repeat game:GetService("RunService").RenderStepped:wait(.5)
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    if _G.Weapon == "" or _G.Weapon == nil then
                                        for i, v in pairs(ListMelee) do
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                _G.Weapon = v
                                            end
                                        end
                                    end
                                    Equip(_G.Weapon)
                                    Click()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        local args = {[1] = "Buso"}
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.Humanoid.WalkSpeed = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                    end
                                    if GodModeIsDone then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 25, 15))
                                    else
                                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 25, 15), 300)
                                    end
                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSaber == false or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone)
                            end
                        end
                    end

                    local args = {[1] = "ProQuestProgress", [2] = "RichSon"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    wait(2)
                    local args = {[1] = "ProQuestProgress"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    Equip("Relic")

                    local vDoor = game:GetService("Workspace").Map.Jungle.Final.Invis
                    vDoor.CanCollide = false
                    vDoor.Size = Vector3.new(20,20,20)

                    wait(1)
                    if GodModeIsDone then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1403.92944, 29.8519993, 6.61151266)
                    else
                        repeat wait()
                            TweenTo(Vector3.new(-1403.92944, 29.8519993, 6.61151266), 300)
                        until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1403.92944, 29.8519993, 6.61151266)).magnitude <= 5
                    end
                    wait(.5)

                    if game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Saber Expert [Lv. 200] [Boss]" then
                                repeat game:GetService("RunService").RenderStepped:wait(.5)
                                    if sethiddenproperty then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000) end
                                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                                    if _G.Weapon == "" or _G.Weapon == nil then
                                        for i, v in pairs(ListMelee) do
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v) ~= nil and game.Players.LocalPlayer.Character:FindFirstChild(v) == nil then
                                                _G.Weapon = v
                                            end
                                        end
                                    end
                                    Equip(_G.Weapon)
                                    Click()
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        local args = {[1] = "Buso"}
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                        v.Humanoid.WalkSpeed = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.HumanoidRootPart.Transparency = 1
                                    end
                                    if GodModeIsDone then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, 25, 15))
                                    else
                                        TweenTo(v.HumanoidRootPart.Position + Vector3.new(0, 25, 15), 300)
                                    end
                                    require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework).activeController.hitboxMagnitude = 1000
                                until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSaber == false or (game.Players.LocalPlayer.Character.Humanoid.Health <= 0 and not GodModeIsDone)
                            end
                        end
                    end

                    local args = {[1] = "KenTalk", [2] = "Buy"}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end)
end

function StartGodMode()
    spawn(function ()
        if not GodModeIsDone then
            local Players = game:GetService'Players'.LocalPlayer
            local OldFrame;
            local Holding = false
            local Nearest = nil
            Players.Character.Humanoid:SetStateEnabled(15, false)
            Players.Character.Humanoid:SetStateEnabled(16, false)
            Players.CharacterRemoving:Connect(function ()
                if Players.Character then
                    local Torso = Players.Character:FindFirstChild'Torso'
                    if Torso ~= nil then OldFrame = Torso.CFrame end
                    if Players.Character:FindFirstChild'Foil' then Holding = true end
                end
            end)
            Players.CharacterAdded:Connect(function ()
                while Players.Character == nil do wait() end
                while Players.Character.Parent == nil do wait() end
                local Hum = Players.Character:FindFirstChild'Humanoid'
                local HumRP = Players.Character:FindFirstChild'HumanoidRootPart'
                if Hum ~= nil and HumRP ~= nil then
                    Hum:SetStateEnabled(15, false)
                    Hum:SetStateEnabled(16, false)
                    for i = 1, 10 do
                        HumRP.CFrame = OldFrame
                    end
                    if Holding then
                        Holding = false
                        local Foil = Players.Backpack:FindFirstChild'Foil'
                        if Foil ~= nil then
                            Foil.Parent = Players.Character
                        end
                    end
                end
            end)

            wait(1)
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if not Nearest then Nearest = v.HumanoidRootPart.Position end
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Nearest).magnitude then
                    Nearest = v.HumanoidRootPart.Position
                end
            end

            repeat wait()
                TweenTo(Nearest + Vector3.new(5, 0, 0), 300)
            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Nearest).magnitude <= 25
            wait(3)
            if game.Players.LocalPlayer.Character.Humanoid.Health < -1 then
                GodModeIsDone = true
            else
                StartGodMode()
            end
        end
    end)
end

local HasChip = false
local JoinedRaid = false
local FruitCheck = false
local JoiningRaid = false
function FullyRaid()
    spawn(function ()
        pcall(function ()
            while _G.FullyRaid do wait(.1)
                -- Doing Raid Check
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    JoinedRaid = true
                end

                -- Backpack Check
                if not HasChip and JoinedRaid == false and JoiningRaid == false then
                    -- Buy Chip & Check
                    if not FruitCheck then
                        Funny("Buy Chip", _G.FullyChip)
                        FruitCheck = true
                    else
                        local args = {[1] = "Cousin", [2] = "Buy"}
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Microchip") then
                            HasChip = true
                        elseif string.find(v.Name, "Fruit") then
                            Funny("Buy Chip", _G.FullyChip)
                            HasChip = true
                        end
                    end
                end

                -- Workspace Check
                if not HasChip and JoinedRaid == false and JoiningRaid == false then
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA "Tool" then
                            if (v.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
                                v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            else
                                TweenTo(v.Handle.Position, 300)
                            end
                        end
                    end
                end

                -- Found Chip
                if HasChip and JoinedRaid == false and JoiningRaid == false then
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Microchip") then
                            if Thirdsea then
                                RaidPortal = Vector3.new(-5033.16, 314.953, -2949.96)
                                if GodModeIsDone then
                                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(RaidPortal)
                                else
                                    repeat wait()
                                        TweenTo(RaidPortal, 300)
                                    until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - RaidPortal).magnitude <= 5
                                end
                                if _G.AutoSetSpawn then
                                   local args = {[1] = "SetSpawnPoint"}
                                   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector , 0.1)
                                HasChip = false
                                JoiningRaid = true
                            elseif Secondsea then
                                RaidPortal = Vector3.new(-6457.14, 252.737, -4451.57)
                                if GodModeIsDone then
                                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(RaidPortal)
                                else
                                    repeat wait()
                                        TweenTo(RaidPortal, 300)
                                    until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - RaidPortal).magnitude <= 5
                                end
                                if _G.AutoSetSpawn then
                                   local args = {[1] = "SetSpawnPoint"}
                                   game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                fireclickdetector(game:GetService("Workspace").Map["CircleIsland"].RaidSummon2.Button.Main.ClickDetector, 0.1)
                                HasChip = false
                                JoiningRaid = true
                            end
                        end
                    end
                end

                -- Wait TP To Raids Area
                if JoiningRaid then
                    repeat wait(1) until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                    JoiningRaid = false
                    JoinedRaid = true
                end

                -- Doing Raid
                if JoinedRaid then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                        KillAura = true
                        NextIsland = true
                        AutoAwaken = true
                    else
                        KillAura = false
                        NextIsland = false
                        AutoAwaken = false
                        JoinedRaid = false
                    end
                end
            end
        end)
    end)
end

do wait()
    if _G.AutoSaber then
        All("Auto Saber")
    end
    if _G.AutoFarm then
        All("Auto Farm")
    end
    if _G.BoneFarm then
        All("Bone Farm")
        MagnetBone()
    end
    if _G.MobAura then
        All("Mob Aura")
    end
    if _G.ChooseMob then
        All("Choose Mob")
    end
    if _G.BringFruit then
        All("Bring Fruit")
    end
    if _G.BossFarm then
        All("Farm Boss")
    end
    if _G.AllBoss then
        All("All Boss")
    end
    if KillPlr then
        All("Kill Player Melee")
    end
    if KillPlr2 then
        All("Kill Player Gun")
    end
    if _G.AutoElite then
        All("Auto Elite")
    end
    if _G.Auto2nd then
        All("Second Sea")
    end
    if _G.Auto3rd then
        All("Third Sea")
    end
    if _G.AutoBartilo then
        All("Bartilo")
    end
    if _G.AutoRainbow then
        All("Rainbow Haki")
    end
end

--[ SPAWN ]--
spawn(function () -- Auto Electric Claw
    pcall(function ()
        while wait(.1) do
            if AutoElectric and Thirdsea then
                if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                elseif (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399) or (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value <= 399) then
                    _G.Weapon = "Electro"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Electric Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Electric Claw") then
                    _G.Weapon = "Electric Claw"
                end

                if (game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400) or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400) then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw") == "..." and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start") == 4 then
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12550.4, 332.378, -7597.89)
                        else
                            TweenTo(Vector3.new(-12550.4, 332.378, -7597.89), 300)
                        end
                    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 4 then
                        if GodModeIsDone then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10370.1, 331.654, -10129.5)
                        else
                            repeat wait()
                                TweenTo(Vector3.new(-10370.1, 331.654, -10129.5), 300)
                            until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10370.1, 331.654, -10129.5)).magnitude <= 5
                        end
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw","Start")
                    end
                end
            end
        end
    end)
end)

function MagnetBone()
    spawn(function ()
        while _G.BoneFarm do wait(.5)
            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                    if v.Name == BoneMob
                    or (v.Name == "Demonic Soul [Lv. 2025]" and BoneMob == "Posessed Mummy [Lv. 2050]")
                    then
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                        v.HumanoidRootPart.Transparency = 1
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.CFrame = CFrame.new(Position)
                    end
                end
            end
        end
    end)
end

spawn(function () -- Magnet
    while wait(.5) do
        if _G.AutoFarm and _G.Magnet and PosMon ~= nil then
            levelCheck()
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Name == nameMob and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                    v.Humanoid.WalkSpeed = 1
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v.HumanoidRootPart.Transparency = 1
                    v.HumanoidRootPart.CFrame = PosMon
                end
            end
        elseif _G.MobAura and _G.Magnet and AuraBringPos ~= nil then
            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Parent and v:FindFirstChild("HumanoidRootPart") ~= nil then
                    if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                        if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                        v.Humanoid.WalkSpeed = 1
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v.HumanoidRootPart.Transparency = 1
                        v.HumanoidRootPart.CFrame = AuraBringPos
                    end
                end
            end
        elseif _G.ChooseMob and _G.Magnet and MobChoosedPos ~= nil then
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v.Name == mobSelect and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 10000) end
                    if setsimulationradius then sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge) end
                    v.Humanoid.WalkSpeed = 1
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v.HumanoidRootPart.Transparency = 1
                    v.HumanoidRootPart.CFrame = MobChoosedPos
                end
            end
        end
    end
end)
