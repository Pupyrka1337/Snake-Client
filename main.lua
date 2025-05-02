-- Snake Client by @ClassicZoombie (USE ONLY DEV AND FRIEND)

-- ESP (Drawing API)
local function createESP(player)
    local box = Drawing.new("Text")
    box.Text = player.Name
    box.Size = 16
    box.Color = Color3.new(0, 1, 1)
    box.Center = true
    box.Outline = true

    game:GetService("RunService").RenderStepped:Connect(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            box.Visible = onScreen
            if onScreen then
                box.Position = Vector2.new(pos.X, pos.Y)
            end
        else
            box.Visible = false
        end
    end)
end

-- Silent Aim + Trigger Bot (простой Raycast-перехват)
local function aimbotTriggerBot()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local RunService = game:GetService("RunService")

    local function getClosestTarget()
        local shortestDistance = math.huge
        local closestPlayer = nil

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                local screenPoint, onScreen = workspace.CurrentCamera:WorldToViewportPoint(player.Character.Head.Position)
                local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude

                if onScreen and dist < shortestDistance and dist < 150 then
                    shortestDistance = dist
                    closestPlayer = player
                end
            end
        end

        return closestPlayer
    end

    RunService.RenderStepped:Connect(function()
        local target = getClosestTarget()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            -- Trigger Bot
            if game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                Mouse1Click()
            end
            -- Silent Aim
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.Head.Position)
        end
    end)
end

-- GUI for Neon Menu
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "NeonMenu"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0, 30, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0

local uiStroke = Instance.new("UIStroke", frame)
uiStroke.Color = Color3.fromRGB(0, 255, 255)
uiStroke.Thickness = 2

local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Text = "Neon Cheats"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamSemibold
title.TextSize = 20

-- Call Functions
createESP(game.Players.LocalPlayer)
aimbotTriggerBot()
