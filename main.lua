-- Создаем ScreenGui в PlayerGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Создаем фон панели (неоновый стиль)
local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(0, 300, 0, 400)
Panel.Position = UDim2.new(0.5, -150, 0.5, -200)
Panel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Panel.BorderSizePixel = 0
Panel.Parent = ScreenGui

-- Добавляем неоновую обводку
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 255, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = Panel

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "SNAKE CLIENT"
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.BackgroundTransparency = 1
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Panel

-- Кнопки

-- Функция для создания кнопок
local function createButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0, 50)
    button.Position = UDim2.new(0.1, 0, 0, position)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextScaled = true
    button.MouseButton1Click:Connect(callback)
    button.Parent = Panel
end

-- Функции для кнопок (можно заменить на свои)
local function toggleESP()
    print("[SNAKE CLIENT] ESP toggled!")
end

local function toggleSilentAim()
    print("[SNAKE CLIENT] Silent Aim toggled!")
end

local function toggleTriggerBot()
    print("[SNAKE CLIENT] Trigger Bot toggled!")
end

-- Создаем кнопки
createButton("Toggle ESP", 60, toggleESP)
createButton("Toggle Silent Aim", 120, toggleSilentAim)
createButton("Toggle Trigger Bot", 180, toggleTriggerBot)

-- Уведомление при загрузке
game.StarterGui:SetCore("SendNotification", {
    Title = "SNAKE CLIENT Loaded",
    Text = "Добро пожаловать в SNAKE CLIENT!",
    Duration = 5
})
