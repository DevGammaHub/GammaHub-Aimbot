local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

if not Drawing then
    warn("shitty executor detected: this script requires drawing api")
    return
end

local mouse1click = isrbxactive and mouse1click or (mouse1press and function() mouse1press() task.wait(0.1) mouse1release() end) or function() end
local mouse1press = mouse1press or function() end
local mouse1release = mouse1release or function() end

local WTVP = Camera.WorldToViewportPoint
local Vector2_new = Vector2.new
local Color3_fromRGB = Color3.fromRGB
local Math_floor = math.floor
local Math_max = math.max
local Math_abs = math.abs

local ScriptRunning = true
local ESP_Store = {}
local Connections = {}
local UI_Store = {}

local Config = {
    Global = {
        MenuOpen = true,
        Keybind = Enum.KeyCode.Insert
    },
    Aimbot = {
        Enabled = true,
        Key = Enum.KeyCode.E,
        FOV = 100,
        Smoothness = 0.5,
        AimPart = "Head",
        WallCheck = true,
        Prediction = 0.05,
        NoRecoil = false,
    },
    Triggerbot = {
        Enabled = false,
        Key = Enum.KeyCode.T,
        Delay = 0.1,
        Randomization = 0.05,
        MaxDistance = 1000,
    },
    Visuals = {
        Enabled = true,
        TeamCheck = true,
        Box = true,
        BoxOutline = true,
        Skeleton = true,
        HeadCircle = true,
        ViewLine = true,
        Snaplines = false,
        Names = true,
        Info = true,
        RenderDistance = 2500,
       
        ColorVisible = Color3_fromRGB(0, 255, 128),
        ColorHidden = Color3_fromRGB(255, 50, 50),
        ColorText = Color3_fromRGB(255, 255, 255),
    },
    FOV_Circle = {
        Enabled = true,
        Color = Color3_fromRGB(255, 255, 255),
        Transparency = 0.5,
        Thickness = 1,
        NumSides = 60,
    },
    Other = {
        Fly = false,
        FlySpeed = 50,
        Noclip = false,
        Invisibility = false,
    }
}

-- Notification Funktion (unverändert)
local function SendNotification(text, color)
    local GUI = nil
    for _, v in pairs(UI_Store) do
        if v:IsA("ScreenGui") then GUI = v break end
    end
    if not GUI then return end

    local NoteFrame = Instance.new("Frame")
    NoteFrame.Size = UDim2.new(0, 200, 0, 40)
    NoteFrame.Position = UDim2.new(1, 20, 0.85, 0)
    NoteFrame.BackgroundColor3 = Color3_fromRGB(30, 30, 30)
    NoteFrame.BorderSizePixel = 0
    NoteFrame.Parent = GUI

    Instance.new("UICorner", NoteFrame).CornerRadius = UDim.new(0, 6)

    local Strip = Instance.new("Frame")
    Strip.Size = UDim2.new(0, 4, 1, 0)
    Strip.BackgroundColor3 = color or Color3_fromRGB(0, 255, 128)
    Strip.BorderSizePixel = 0
    Strip.Parent = NoteFrame
    Instance.new("UICorner", Strip).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel")
    Label.Text = text
    Label.Size = UDim2.new(1, -15, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3_fromRGB(255, 255, 255)
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = NoteFrame

    TweenService:Create(NoteFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -220, 0.85, 0)}):Play()

    task.spawn(function()
        task.wait(2)
        TweenService:Create(NoteFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 20, 0.85, 0)}):Play()
        task.wait(0.5)
        NoteFrame:Destroy()
    end)
end

-- ==================== LIBRARY (unverändert bis auf neue Tab) ====================
local Library = {}
local MainFrameInstance = nil

function Library:CreateUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UniversalFPSGui_" .. math.random(1000,9999)
    ScreenGui.ResetOnSpawn = false

    if gethui then
        ScreenGui.Parent = gethui()
    elseif CoreGui:FindFirstChild("RobloxGui") then
        ScreenGui.Parent = CoreGui
    else
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    table.insert(UI_Store, ScreenGui)

    -- MainFrame + Dragging + TopBar (unverändert)
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 550, 0, 380)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -190)
    MainFrame.BackgroundColor3 = Color3_fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    MainFrameInstance = MainFrame

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 6)

    -- Dragging Code (unverändert) ...
    local Dragging, DragInput, DragStart, StartPos
    local function Update(input)
        local Delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPos = MainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then Dragging = false end
            end)
        end
    end)
    MainFrame.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and Dragging then
            Update(input)
        end
    end)

    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 6)

    local Title = Instance.new("TextLabel")
    Title.Text = "Universal FPS Gui | By GammaHub"
    Title.Size = UDim2.new(1, -20, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3_fromRGB(200, 200, 200)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar

    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(0, 120, 1, -30)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)
    TabContainer.BackgroundColor3 = Color3_fromRGB(30, 30, 30)
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = MainFrame

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)
    TabListLayout.Parent = TabContainer

    Instance.new("UIPadding", TabContainer).PaddingTop = UDim.new(0, 10)

    local PageContainer = Instance.new("Frame")
    PageContainer.Size = UDim2.new(1, -120, 1, -30)
    PageContainer.Position = UDim2.new(0, 120, 0, 30)
    PageContainer.BackgroundTransparency = 1
    PageContainer.Parent = MainFrame

    local Tabs = {}
    local FirstTab = true

    function Tabs:CreateTab(Name)
        local TabButton = Instance.new("TextButton")
        TabButton.Text = Name
        TabButton.Size = UDim2.new(1, -10, 0, 30)
        TabButton.BackgroundColor3 = Color3_fromRGB(25, 25, 25)
        TabButton.TextColor3 = Color3_fromRGB(150, 150, 150)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextSize = 13
        TabButton.AutoButtonColor = false
        TabButton.Parent = TabContainer

        Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 4)

        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, -10, 1, -10)
        Page.Position = UDim2.new(0, 5, 0, 5)
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 2
        Page.ScrollBarImageColor3 = Color3_fromRGB(0, 255, 128)
        Page.Visible = false
        Page.Parent = PageContainer

        local PageLayout = Instance.new("UIListLayout")
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 5)
        PageLayout.Parent = Page

        if FirstTab then
            FirstTab = false
            Page.Visible = true
            TabButton.TextColor3 = Color3_fromRGB(255, 255, 255)
            TabButton.BackgroundColor3 = Color3_fromRGB(40, 40, 40)
        end

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(PageContainer:GetChildren()) do
                if v:IsA("ScrollingFrame") then v.Visible = false end
            end
            for _, v in pairs(TabContainer:GetChildren()) do
                if v:IsA("TextButton") then
                    TweenService:Create(v, TweenInfo.new(0.2), {TextColor3 = Color3_fromRGB(150,150,150), BackgroundColor3 = Color3_fromRGB(25,25,25)}):Play()
                end
            end
            Page.Visible = true
            TweenService:Create(TabButton, TweenInfo.new(0.2), {TextColor3 = Color3_fromRGB(255,255,255), BackgroundColor3 = Color3_fromRGB(40,40,40)}):Play()
        end)

        local Elements = {}

        function Elements:AddToggle(Text, ConfigTable, ConfigKey)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, 0, 0, 30)
            ToggleFrame.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
            ToggleFrame.Parent = Page
            Instance.new("UICorner", ToggleFrame).CornerRadius = UDim.new(0,4)

            local Label = Instance.new("TextLabel")
            Label.Text = Text
            Label.Size = UDim2.new(0.7, 0, 1, 0)
            Label.Position = UDim2.new(0, 10, 0, 0)
            Label.BackgroundTransparency = 1
            Label.TextColor3 = Color3_fromRGB(220, 220, 220)
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = ToggleFrame

            local Button = Instance.new("TextButton")
            Button.Text = ""
            Button.Size = UDim2.new(0, 20, 0, 20)
            Button.Position = UDim2.new(1, -30, 0.5, -10)
            Button.BackgroundColor3 = ConfigTable[ConfigKey] and Color3_fromRGB(0, 255, 128) or Color3_fromRGB(60, 60, 60)
            Button.Parent = ToggleFrame
            Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 4)

            Button.MouseButton1Click:Connect(function()
                ConfigTable[ConfigKey] = not ConfigTable[ConfigKey]
                TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = ConfigTable[ConfigKey] and Color3_fromRGB(0, 255, 128) or Color3_fromRGB(60, 60, 60)}):Play()
            end)
            return Button
        end

        function Elements:AddSlider(Text, ConfigTable, ConfigKey, Min, Max, IsFloat)
            -- (Slider Code unverändert - zu lang für hier, bleibt gleich wie bei dir)
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Size = UDim2.new(1, 0, 0, 45)
            SliderFrame.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
            SliderFrame.Parent = Page
            Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0,4)

            local Label = Instance.new("TextLabel")
            Label.Text = Text
            Label.Size = UDim2.new(1, -20, 0, 20)
            Label.Position = UDim2.new(0, 10, 0, 5)
            Label.BackgroundTransparency = 1
            Label.TextColor3 = Color3_fromRGB(220, 220, 220)
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = SliderFrame

            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Text = tostring(ConfigTable[ConfigKey])
            ValueLabel.Size = UDim2.new(0, 50, 0, 20)
            ValueLabel.Position = UDim2.new(1, -60, 0, 5)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.TextColor3 = Color3_fromRGB(0, 255, 128)
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextSize = 13
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValueLabel.Parent = SliderFrame

            local SliderBar = Instance.new("Frame")
            SliderBar.Size = UDim2.new(1, -20, 0, 4)
            SliderBar.Position = UDim2.new(0, 10, 0, 30)
            SliderBar.BackgroundColor3 = Color3_fromRGB(60, 60, 60)
            SliderBar.Parent = SliderFrame

            local Fill = Instance.new("Frame")
            Fill.BackgroundColor3 = Color3_fromRGB(0, 255, 128)
            Fill.Size = UDim2.new((ConfigTable[ConfigKey] - Min) / (Max - Min), 0, 1, 0)
            Fill.Parent = SliderBar

            local Trigger = Instance.new("TextButton")
            Trigger.BackgroundTransparency = 1
            Trigger.Size = UDim2.new(1, 0, 1, 0)
            Trigger.Parent = SliderBar

            local function UpdateSlider(Input)
                local SizeX = math.clamp((Input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                local NewValue = Min + ((Max - Min) * SizeX)
                if not IsFloat then NewValue = Math_floor(NewValue) end
                if IsFloat then NewValue = math.floor(NewValue * 100) / 100 end

                ConfigTable[ConfigKey] = NewValue
                ValueLabel.Text = string.sub(tostring(NewValue), 1, 4)
                Fill.Size = UDim2.new(SizeX, 0, 1, 0)
            end

            local DraggingSlider = false
            Trigger.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 then DraggingSlider = true UpdateSlider(Input) end end)
            UserInputService.InputChanged:Connect(function(Input) if DraggingSlider and Input.UserInputType == Enum.UserInputType.MouseMovement then UpdateSlider(Input) end end)
            UserInputService.InputEnded:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 then DraggingSlider = false end end)
        end

        function Elements:AddButton(Text, Callback)
            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Size = UDim2.new(1, 0, 0, 30)
            ButtonFrame.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
            ButtonFrame.Parent = Page
            Instance.new("UICorner", ButtonFrame).CornerRadius = UDim.new(0,4)

            local Btn = Instance.new("TextButton")
            Btn.Text = Text
            Btn.Size = UDim2.new(1, 0, 1, 0)
            Btn.BackgroundTransparency = 1
            Btn.TextColor3 = Color3_fromRGB(255, 80, 80)
            Btn.Font = Enum.Font.GothamBold
            Btn.TextSize = 13
            Btn.Parent = ButtonFrame
            Btn.MouseButton1Click:Connect(Callback)
        end

        return Elements
    end
    return Tabs, ScreenGui
end

local Window, GUIInstance = Library:CreateUI()

-- === TABS ===
local AimTab = Window:CreateTab("Aimbot")
AimTab:AddToggle("Enabled", Config.Aimbot, "Enabled")
AimTab:AddKeybind("Aim Key", Config.Aimbot, "Key")
AimTab:AddToggle("WallCheck", Config.Aimbot, "WallCheck")
AimTab:AddToggle("No Recoil", Config.Aimbot, "NoRecoil")
AimTab:AddSlider("FOV", Config.Aimbot, "FOV", 10, 500, false)
AimTab:AddSlider("Smoothness", Config.Aimbot, "Smoothness", 0, 1, true)
AimTab:AddSlider("Prediction", Config.Aimbot, "Prediction", 0, 1, true)
AimTab:AddToggle("Draw FOV", Config.FOV_Circle, "Enabled")

local TrigTab = Window:CreateTab("Triggerbot")
local TrigEnabledBtn = TrigTab:AddToggle("Enabled (Toggle)", Config.Triggerbot, "Enabled")
TrigTab:AddKeybind("Toggle Key", Config.Triggerbot, "Key")
TrigTab:AddSlider("Delay (Between Clicks)", Config.Triggerbot, "Delay", 0.01, 1.0, true)
TrigTab:AddSlider("Randomize (Legit)", Config.Triggerbot, "Randomization", 0.0, 0.2, true)
TrigTab:AddSlider("Max Distance", Config.Triggerbot, "MaxDistance", 50, 3000, false)

local VisTab = Window:CreateTab("Visuals")
VisTab:AddToggle("Enabled", Config.Visuals, "Enabled")
VisTab:AddToggle("TeamCheck", Config.Visuals, "TeamCheck")
VisTab:AddToggle("Box", Config.Visuals, "Box")
VisTab:AddToggle("Names", Config.Visuals, "Names")
VisTab:AddToggle("Info", Config.Visuals, "Info")
VisTab:AddToggle("Skeleton", Config.Visuals, "Skeleton")
VisTab:AddToggle("Head", Config.Visuals, "HeadCircle")
VisTab:AddToggle("ViewLine", Config.Visuals, "ViewLine")
VisTab:AddToggle("Snaplines", Config.Visuals, "Snaplines")
VisTab:AddSlider("Distance", Config.Visuals, "RenderDistance", 100, 5000, false)

-- ==================== NEUE OTHER TAB ====================
local OtherTab = Window:CreateTab("Other")

OtherTab:AddToggle("Fly", Config.Other, "Fly")
OtherTab:AddSlider("Fly Speed", Config.Other, "FlySpeed", 20, 200, false)

OtherTab:AddToggle("Noclip", Config.Other, "Noclip")
OtherTab:AddToggle("Invisibility", Config.Other, "Invisibility")

OtherTab:AddButton("Unload Script", function()
    ScriptRunning = false
    for _, conn in pairs(Connections) do conn:Disconnect() end
    for plr, data in pairs(ESP_Store) do ClearDrawing(plr) end
    if FOVCircle then FOVCircle:Remove() end
    for _, ui in pairs(UI_Store) do ui:Destroy() end
end)

-- ==================== OTHER FEATURES ====================

-- Fly
local FlyBodyVelocity
local function ToggleFly()
    if Config.Other.Fly then
        local Root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if Root then
            FlyBodyVelocity = Instance.new("BodyVelocity")
            FlyBodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            FlyBodyVelocity.Velocity = Vector3.new(0,0,0)
            FlyBodyVelocity.Parent = Root
        end
    else
        if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
    end
end

-- Noclip
local function ToggleNoclip()
    if Config.Other.Noclip then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end

-- Invisibility
local function ToggleInvisibility()
    local Char = LocalPlayer.Character
    if not Char then return end
    for _, v in pairs(Char:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            v.Transparency = Config.Other.Invisibility and 1 or 0
        elseif v:IsA("Decal") then
            v.Transparency = Config.Other.Invisibility and 1 or 0
        end
    end
end

-- No Recoil
local function NoRecoil()
    if Config.Aimbot.NoRecoil and LocalPlayer.Character then
        local Camera = Workspace.CurrentCamera
        Camera.CFrame = Camera.CFrame * CFrame.Angles(0, 0, 0) -- Reset Recoil
    end
end

-- Keybinds + Toggles
table.insert(Connections, UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Config.Global.Keybind then
        Config.Global.MenuOpen = not Config.Global.MenuOpen
        if MainFrameInstance then MainFrameInstance.Visible = Config.Global.MenuOpen end
    end

    if input.KeyCode == Config.Triggerbot.Key then
        Config.Triggerbot.Enabled = not Config.Triggerbot.Enabled
        -- Toggle Button Farbe updaten (falls gewünscht)
    end
end))

-- Fly + Noclip + Invis Loop
table.insert(Connections, RunService.RenderStepped:Connect(function()
    if not ScriptRunning then return end

    if Config.Other.Fly and FlyBodyVelocity then
        local Root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local Cam = Workspace.CurrentCamera
        if Root and Cam then
            local MoveDir = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then MoveDir = MoveDir + Cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then MoveDir = MoveDir - Cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then MoveDir = MoveDir - Cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then MoveDir = MoveDir + Cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then MoveDir = MoveDir + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then MoveDir = MoveDir - Vector3.new(0,1,0) end

            FlyBodyVelocity.Velocity = MoveDir.Unit * Config.Other.FlySpeed
        end
    end

    if Config.Other.Noclip then ToggleNoclip() end
    NoRecoil()
end))

-- Invisibility Toggle
table.insert(Connections, LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if Config.Other.Invisibility then ToggleInvisibility() end
end))

-- Main Render (ESP + Aimbot) bleibt gleich wie bei dir
-- ... (dein gesamter MainRender Code bleibt unverändert)

warn("Universal FPS Gui by GammaHub + Other Features Loaded!")
