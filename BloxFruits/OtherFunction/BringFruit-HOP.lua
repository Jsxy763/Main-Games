repeat wait() until game:IsLoaded()

local Stored = false
local FruitList = {
    "Bomb-Bomb",
    "Spike-Spike",
    "Chop-Chop",
    "Spring-Spring",
    "Kilo-Kilo",
    "Smoke-Smoke",
    "Spin-Spin",
    "Flame-Flame",
    "Bird-Bird: Falcon",
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
    "Soul-Soul",
    "Dragon-Dragon"
}

spawn(function ()
    while wait() do
        if _G.BringFruitHOP then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v:IsA "Tool" then
                    repeat wait(.1)
                        TweenTo(v.Handle.Position, 300)
                    until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Handle.Position).magnitude <= 5
                end
            end
            repeat wait(1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
                for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
                    for i2, v2 in pairs(v) do
                        FruitCheck = v2
                        for i3, v3 in pairs(FruitList) do
                            if v3 == v2 then
                                table.remove(FruitList, i3)
                            end
                        end
                    end
                end
                for i, v in pairs(FruitList) do
                    local args = {[1] = "StoreFruit", [2] = v}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            if not Stored then Stored = true else Stored = false end
            until Stored
            _G.BringFruitHOP = false
        end
    end
end)
