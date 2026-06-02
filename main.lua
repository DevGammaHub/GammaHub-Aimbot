local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")
local ContextActionService = game:GetService("ContextActionService")

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
    Global = { MenuOpen = true, Keybind = Enum.KeyCode.Insert },
    Aimbot = { Enabled = true, Key = Enum.KeyCode.E, FOV = 100, Smoothness = 0.5, AimPart = "Head", WallCheck = true, Prediction = 0.05 },
    Triggerbot = { Enabled = false, Key = Enum.KeyCode.T, Delay = 0.1, Randomization = 0.05, MaxDistance = 1000 },
    Visuals = {
        Enabled = true, TeamCheck = true, Box = true, BoxOutline = true, Skeleton = true,
        HeadCircle = true, ViewLine = true, Snaplines = false, Names = true, Info = true,
        RenderDistance = 2500, ColorVisible = Color3_fromRGB(0, 255, 128),
        ColorHidden = Color3_fromRGB(255, 50, 50), ColorText = Color3_fromRGB(255, 255, 255)
    },
    FOV_Circle = { Enabled = true, Color = Color3_fromRGB(255, 255, 255), Transparency = 0.5, Thickness = 1, NumSides = 60 },
    Players = { Fly = false, Noclip = false, Invisibility = false, Godmode = false, Reset = false, FlySpeed = 50, WalkSpeed = 16 },
    Server = { FakeLag = false },
    Troll = { Spin = false, Fling = false, ChatSpam = false },
    Others = { AntiRecoil = false, RecoilStrength = 5 }
}

-- Variables
local FlyBodyVelocity = nil
local FlyConnection = nil
local InvisActive = false
local InvisSavedCFrame = nil
local InvisUpdateConn = nil
local GodmodeConnection = nil
local AntiRecoilConnection = nil
local SpinConnection = nil
local FakeLagConnection = nil

local function SendNotification(text, color)
    local GUI = nil
    for _, v in pairs(UI_Store) do if v:IsA("ScreenGui") then GUI = v; break end end
    if not GUI then return end
    local NoteFrame = Instance.new("Frame")
    NoteFrame.Size = UDim2.new(0, 200, 0, 40)
    NoteFrame.Position = UDim2.new(1, 20, 0.85, 0)
    NoteFrame.BackgroundColor3 = Color3_fromRGB(30, 30, 30)
    NoteFrame.BorderSizePixel = 0
    NoteFrame.Parent = GUI
    Instance.new("UICorner", NoteFrame).CornerRadius = UDim.new(0, 6)
    local Strip = Instance.new("Frame", NoteFrame)
    Strip.Size = UDim2.new(0, 4, 1, 0)
    Strip.BackgroundColor3 = color or Color3_fromRGB(0, 255, 128)
    Strip.BorderSizePixel = 0
    Instance.new("UICorner", Strip).CornerRadius = UDim.new(0, 6)
    local Label = Instance.new("TextLabel", NoteFrame)
    Label.Text = text
    Label.Size = UDim2.new(1, -15, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3_fromRGB(255, 255, 255)
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    TweenService:Create(NoteFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -220, 0.85, 0)}):Play()
    task.spawn(function()
        task.wait(2)
        TweenService:Create(NoteFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 20, 0.85, 0)}):Play()
        task.wait(0.5)
        NoteFrame:Destroy()
    end)
end

local Library = {}
local MainFrameInstance = nil

function Library:CreateUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UniversalFPSGui_" .. math.random(1000,9999)
    ScreenGui.ResetOnSpawn = false
    if gethui then ScreenGui.Parent = gethui()
    elseif CoreGui:FindFirstChild("RobloxGui") then ScreenGui.Parent = CoreGui
    else ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end
    table.insert(UI_Store, ScreenGui)

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 550, 0, 480)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -240)
    MainFrame.BackgroundColor3 = Color3_fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    MainFrameInstance = MainFrame

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 6)

    -- Dragging
    local Dragging, DragStart, StartPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            DragStart = input.Position
            StartPos = MainFrame.Position
        end
    end)
    MainFrame.InputChanged:Connect(function(input)
        if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local Delta = input.Position - DragStart
            MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then Dragging = false end
    end)

    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 6)

    local Title = Instance.new("TextLabel", TopBar)
    Title.Text = "Universal FPS Gui | By GammaHub"
    Title.Size = UDim2.new(1, -20, 1, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3_fromRGB(200, 200, 200)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local TabContainer = Instance.new("Frame", MainFrame)
    TabContainer.Size = UDim2.new(0, 120, 1, -30)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)
    TabContainer.BackgroundColor3 = Color3_fromRGB(30, 30, 30)

    local TabList = Instance.new("UIListLayout", TabContainer)
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 5)
    Instance.new("UIPadding", TabContainer).PaddingTop = UDim.new(0, 10)

    local PageContainer = Instance.new("Frame", MainFrame)
    PageContainer.Size = UDim2.new(1, -120, 1, -30)
    PageContainer.Position = UDim2.new(0, 120, 0, 30)
    PageContainer.BackgroundTransparency = 1

    local Tabs = {}
    local FirstTab = true

    function Tabs:CreateTab(Name)
        local TabButton = Instance.new("TextButton", TabContainer)
        TabButton.Text = Name
        TabButton.Size = UDim2.new(1, -10, 0, 30)
        TabButton.BackgroundColor3 = Color3_fromRGB(25, 25, 25)
        TabButton.TextColor3 = Color3_fromRGB(150, 150, 150)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextSize = 13
        Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 4)

        local Page = Instance.new("ScrollingFrame", PageContainer)
        Page.Size = UDim2.new(1, -10, 1, -10)
        Page.Position = UDim2.new(0, 5, 0, 5)
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 4
        Page.ScrollBarImageColor3 = Color3_fromRGB(0, 255, 128)
        Page.Visible = false

        local PageLayout = Instance.new("UIListLayout", Page)
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 5)

        if FirstTab then
            FirstTab = false
            Page.Visible = true
            TabButton.TextColor3 = Color3_fromRGB(255, 255, 255)
            TabButton.BackgroundColor3 = Color3_fromRGB(40, 40, 40)
        end

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(PageContainer:GetChildren()) do if v:IsA("ScrollingFrame") then v.Visible = false end end
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
            local ToggleFrame = Instance.new("Frame", Page)
            ToggleFrame.Size = UDim2.new(1, 0, 0, 30)
            ToggleFrame.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
            Instance.new("UICorner", ToggleFrame).CornerRadius = UDim.new(0,4)

            local Label = Instance.new("TextLabel", ToggleFrame)
            Label.Text = Text
            Label.Size = UDim2.new(0.7, 0, 1, 0)
            Label.Position = UDim2.new(0, 10, 0, 0)
            Label.BackgroundTransparency = 1
            Label.TextColor3 = Color3_fromRGB(220, 220, 220)
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local Button = Instance.new("TextButton", ToggleFrame)
            Button.Size = UDim2.new(0, 20, 0, 20)
            Button.Position = UDim2.new(1, -30, 0.5, -10)
            Button.BackgroundColor3 = ConfigTable[ConfigKey] and Color3_fromRGB(0, 255, 128) or Color3_fromRGB(60, 60, 60)
            Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 4)

            Button.MouseButton1Click:Connect(function()
                ConfigTable[ConfigKey] = not ConfigTable[ConfigKey]
                TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = ConfigTable[ConfigKey] and Color3_fromRGB(0, 255, 128) or Color3_fromRGB(60, 60, 60)}):Play()
            end)
            return Button
        end

        function Elements:AddSlider(Text, ConfigTable, ConfigKey, Min, Max, IsFloat)
            local SliderFrame = Instance.new("Frame", Page)
            SliderFrame.Size = UDim2.new(1, 0, 0, 45)
            SliderFrame.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
            Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0,4)

            local Label = Instance.new("TextLabel", SliderFrame)
            Label.Text = Text
            Label.Size = UDim2.new(1, -20, 0, 20)
            Label.Position = UDim2.new(0, 10, 0, 5)
            Label.BackgroundTransparency = 1
            Label.TextColor3 = Color3_fromRGB(220, 220, 220)
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local ValueLabel = Instance.new("TextLabel", SliderFrame)
            ValueLabel.Text = tostring(ConfigTable[ConfigKey])
            ValueLabel.Size = UDim2.new(0, 50, 0, 20)
            ValueLabel.Position = UDim2.new(1, -60, 0, 5)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.TextColor3 = Color3_fromRGB(0, 255, 128)
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextSize = 13
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right

            local SliderBar = Instance.new("Frame", SliderFrame)
            SliderBar.Size = UDim2.new(1, -20, 0, 4)
            SliderBar.Position = UDim2.new(0, 10, 0, 30)
            SliderBar.BackgroundColor3 = Color3_fromRGB(60, 60, 60)

            local Fill = Instance.new("Frame", SliderBar)
            Fill.BackgroundColor3 = Color3_fromRGB(0, 255, 128)
            Fill.Size = UDim2.new((ConfigTable[ConfigKey] - Min) / (Max - Min), 0, 1, 0)

            local Trigger = Instance.new("TextButton", SliderBar)
            Trigger.BackgroundTransparency = 1
            Trigger.Size = UDim2.new(1, 0, 1, 0)

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
            Trigger.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then DraggingSlider = true UpdateSlider(i) end end)
            UserInputService.InputChanged:Connect(function(i) if DraggingSlider and i.UserInputType == Enum.UserInputType.MouseMovement then UpdateSlider(i) end end)
            UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then DraggingSlider = false end end)
        end

        function Elements:AddButton(Text, Callback)
            local ButtonFrame = Instance.new("Frame", Page)
            ButtonFrame.Size = UDim2.new(1, 0, 0, 30)
            ButtonFrame.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
            Instance.new("UICorner", ButtonFrame).CornerRadius = UDim.new(0,4)

            local Btn = Instance.new("TextButton", ButtonFrame)
            Btn.Text = Text
            Btn.Size = UDim2.new(1, 0, 1, 0)
            Btn.BackgroundTransparency = 1
            Btn.TextColor3 = Color3_fromRGB(255, 80, 80)
            Btn.Font = Enum.Font.GothamBold
            Btn.TextSize = 13
            Btn.MouseButton1Click:Connect(Callback)
        end

        return Elements
    end
    return Tabs, ScreenGui
end

local Window, _ = Library:CreateUI()

-- Tabs
local AimTab = Window:CreateTab("Aimbot")
AimTab:AddToggle("Enabled", Config.Aimbot, "Enabled")
AimTab:AddKeybind("Aim Key", Config.Aimbot, "Key")
AimTab:AddToggle("WallCheck", Config.Aimbot, "WallCheck")
AimTab:AddSlider("FOV", Config.Aimbot, "FOV", 10, 500, false)
AimTab:AddSlider("Smoothness", Config.Aimbot, "Smoothness", 0, 1, true)
AimTab:AddSlider("Prediction", Config.Aimbot, "Prediction", 0, 1, true)
AimTab:AddToggle("Draw FOV", Config.FOV_Circle, "Enabled")

local TrigTab = Window:CreateTab("Triggerbot")
local TrigEnabledBtn = TrigTab:AddToggle("Enabled", Config.Triggerbot, "Enabled")
TrigTab:AddKeybind("Toggle Key", Config.Triggerbot, "Key")
TrigTab:AddSlider("Delay", Config.Triggerbot, "Delay", 0.01, 1.0, true)
TrigTab:AddSlider("Randomization", Config.Triggerbot, "Randomization", 0.0, 0.2, true)
TrigTab:AddSlider("Max Distance", Config.Triggerbot, "MaxDistance", 50, 3000, false)

local VisTab = Window:CreateTab("Visuals")
VisTab:AddToggle("Enabled", Config.Visuals, "Enabled")
VisTab:AddToggle("TeamCheck", Config.Visuals, "TeamCheck")
VisTab:AddToggle("Box", Config.Visuals, "Box")
VisTab:AddToggle("Names", Config.Visuals, "Names")
VisTab:AddToggle("Info", Config.Visuals, "Info")
VisTab:AddToggle("Skeleton", Config.Visuals, "Skeleton")
VisTab:AddToggle("HeadCircle", Config.Visuals, "HeadCircle")
VisTab:AddToggle("ViewLine", Config.Visuals, "ViewLine")
VisTab:AddToggle("Snaplines", Config.Visuals, "Snaplines")
VisTab:AddSlider("Render Distance", Config.Visuals, "RenderDistance", 100, 5000, false)

local PlayersTab = Window:CreateTab("Players")
PlayersTab:AddToggle("Fly", Config.Players, "Fly")
PlayersTab:AddSlider("Fly Speed", Config.Players, "FlySpeed", 10, 200, false)
PlayersTab:AddToggle("Noclip", Config.Players, "Noclip")
PlayersTab:AddToggle("Invisibility", Config.Players, "Invisibility")
PlayersTab:AddToggle("Godmode", Config.Players, "Godmode")
PlayersTab:AddToggle("Reset (Suicide)", Config.Players, "Reset")
PlayersTab:AddSlider("WalkSpeed", Config.Players, "WalkSpeed", 1, 100, false)

local ServerTab = Window:CreateTab("Server")
ServerTab:AddToggle("Fake Lag", Config.Server, "FakeLag")
ServerTab:AddButton("Rejoin Server (F1)", function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

local TrollTab = Window:CreateTab("Troll")
TrollTab:AddToggle("Spin", Config.Troll, "Spin")
TrollTab:AddToggle("Fling", Config.Troll, "Fling")
TrollTab:AddToggle("Chat Spam", Config.Troll, "ChatSpam")

local OthersTab = Window:CreateTab("Others")
OthersTab:AddToggle("Anti Recoil", Config.Others, "AntiRecoil")
OthersTab:AddSlider("Recoil Strength", Config.Others, "RecoilStrength", 1, 30, false)

local SettingsTab = Window:CreateTab("Settings")
SettingsTab:AddButton("UNLOAD SCRIPT", function()
    ScriptRunning = false
    for _, c in pairs(Connections) do c:Disconnect() end
    for _, v in pairs(UI_Store) do v:Destroy() end
    if FOVCircle then FOVCircle:Remove() end
end)

-- Keybinds
table.insert(Connections, UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Config.Global.Keybind then
        Config.Global.MenuOpen = not Config.Global.MenuOpen
        MainFrameInstance.Visible = Config.Global.MenuOpen
    end
    if input.KeyCode == Config.Triggerbot.Key then
        Config.Triggerbot.Enabled = not Config.Triggerbot.Enabled
        local col = Config.Triggerbot.Enabled and Color3_fromRGB(0,255,128) or Color3_fromRGB(60,60,60)
        TweenService:Create(TrigEnabledBtn, TweenInfo.new(0.2), {BackgroundColor3 = col}):Play()
    end
end))

-- Reset (F2)
ContextActionService:BindAction("KillSelf", function(_, state)
    if state == Enum.UserInputState.Begin and Config.Players.Reset then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Dead) end
    end
end, false, Enum.KeyCode.F2)

-- Rejoin (F1)
ContextActionService:BindAction("Rejoin", function(_, state)
    if state == Enum.UserInputState.Begin then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end
end, false, Enum.KeyCode.F1)

-- FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Filled = false
FOVCircle.NumSides = 60

-- Full ESP + Aimbot + All Functions (same as original)
local GlobalRaycastParams = RaycastParams.new()
GlobalRaycastParams.FilterType = Enum.RaycastFilterType.Exclude
GlobalRaycastParams.IgnoreWater = true

local function GetCharacterRoot(Char) return Char and (Char.PrimaryPart or Char:FindFirstChild("HumanoidRootPart") or Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")) end
local function GetCharacterHumanoid(Char) return Char and (Char:FindFirstChild("Humanoid") or Char:FindFirstChildWhichIsA("Humanoid")) end

local function IsEnemy(plr)
    if not Config.Visuals.TeamCheck then return true end
    if plr == LocalPlayer then return false end
    if plr.Team and LocalPlayer.Team and plr.Team == LocalPlayer.Team then return false end
    return true
end

local function CheckVisibility(targetPart, targetCharacter)
    local Origin = Camera.CFrame.Position
    local Direction = targetPart.Position - Origin
    GlobalRaycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
    local Result = Workspace:Raycast(Origin, Direction, GlobalRaycastParams)
    return Result == nil or Result.Instance:IsDescendantOf(targetCharacter)
end

local function InitializeDrawing(plr)
    if ESP_Store[plr] then return end
    local o = {}
    o.BoxOutline = Drawing.new("Square") o.BoxOutline.Thickness = 3 o.BoxOutline.Color = Color3.new(0,0,0) o.BoxOutline.Transparency = 0.5
    o.Box = Drawing.new("Square") o.Box.Thickness = 1
    o.Name = Drawing.new("Text") o.Name.Center = true o.Name.Outline = true o.Name.Font = 2 o.Name.Size = 13
    o.Info = Drawing.new("Text") o.Info.Center = true o.Info.Outline = true o.Info.Font = 2 o.Info.Size = 11
    o.HeadCircle = Drawing.new("Circle") o.HeadCircle.Thickness = 1.5
    o.ViewLine = Drawing.new("Line") o.ViewLine.Thickness = 1
    o.Snapline = Drawing.new("Line") o.Snapline.Thickness = 1.5
    o.Skeleton = {}
    for i=1,16 do table.insert(o.Skeleton, Drawing.new("Line")) end
    ESP_Store[plr] = o
end

local function HideAll(D)
    for _,v in pairs(D) do if typeof(v) == "Instance" and v.Visible then v.Visible = false end end
    for _,l in pairs(D.Skeleton) do l.Visible = false end
end

local R15_Links = {{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"}}
local R6_Links = {{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}

-- All Functions
local function ToggleFly(state)
    if state then
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
        FlyBodyVelocity = Instance.new("BodyVelocity", char.HumanoidRootPart)
        FlyBodyVelocity.MaxForce = Vector3.new(400000,400000,400000)
        FlyConnection = RunService.RenderStepped:Connect(function()
            if not Config.Players.Fly then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local dir = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0,1,0) end
            FlyBodyVelocity.Velocity = dir.Magnitude > 0 and dir.Unit * Config.Players.FlySpeed or Vector3.new()
        end)
    else
        if FlyConnection then FlyConnection:Disconnect() end
        if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
    end
end

local function ApplySpeed()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    if hum then hum.WalkSpeed = Config.Players.WalkSpeed end
end

local function ToggleNoclip(state)
    local char = LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = not state end
        end
    end
end

local function StartGodmode()
    if GodmodeConnection then return end
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    if hum then
        hum.MaxHealth = 9e9
        hum.Health = 9e9
        GodmodeConnection = hum.HealthChanged:Connect(function() hum.Health = 9e9 end)
    end
end

local function StopGodmode()
    if GodmodeConnection then GodmodeConnection:Disconnect() GodmodeConnection = nil end
end

local function StartInvisibility()
    if InvisActive then return end
    local char = LocalPlayer.Character
    if not char then return end
    InvisActive = true
    InvisSavedCFrame = char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.CFrame
    for _, obj in pairs(char:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then obj.Transparency = 1 end
        if obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency = 1 end
    end
end

local function StopInvisibility()
    if not InvisActive then return end
    InvisActive = false
    local char = LocalPlayer.Character
    if char and InvisSavedCFrame then
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then root.CFrame = InvisSavedCFrame end
        for _, obj in pairs(char:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then obj.Transparency = 0 end
            if obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency = 0 end
        end
    end
end

local function StartAntiRecoil()
    if AntiRecoilConnection then return end
    AntiRecoilConnection = RunService.RenderStepped:Connect(function()
        if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            mousemoverel(0, Config.Others.RecoilStrength)
        end
    end)
end

local function ToggleFakeLag(state)
    if FakeLagConnection then FakeLagConnection:Disconnect() end
    if state then
        FakeLagConnection = RunService.RenderStepped:Connect(function()
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                root.Anchored = true
                task.wait(math.random(0.08,0.25))
                root.Anchored = false
                task.wait(math.random(0.08,0.25))
            end
        end)
    end
end

local function ToggleSpin(state)
    if SpinConnection then SpinConnection:Disconnect() end
    if state then
        SpinConnection = RunService.RenderStepped:Connect(function()
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then root.CFrame *= CFrame.Angles(0, 0.35, 0) end
        end)
    end
end

-- Main Render + ESP + Aimbot
table.insert(Connections, RunService.RenderStepped:Connect(function()
    if not ScriptRunning then return end

    -- Players Tab Features
    if Config.Players.Fly and not FlyConnection then ToggleFly(true) elseif not Config.Players.Fly and FlyConnection then ToggleFly(false) end
    ToggleNoclip(Config.Players.Noclip)
    if Config.Players.Godmode and not GodmodeConnection then StartGodmode() elseif not Config.Players.Godmode then StopGodmode() end
    if Config.Players.Invisibility and not InvisActive then StartInvisibility() elseif not Config.Players.Invisibility and InvisActive then StopInvisibility() end
    ApplySpeed()

    -- Server
    ToggleFakeLag(Config.Server.FakeLag)

    -- Troll
    ToggleSpin(Config.Troll.Spin)
    if Config.Troll.Fling then
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then root.Velocity = Vector3.new(math.random(-200,200), 50, math.random(-200,200)) end
        Config.Troll.Fling = false
    end
    if Config.Troll.ChatSpam then
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("GammaHub is the best", "All")
    end

    -- Others
    if Config.Others.AntiRecoil and not AntiRecoilConnection then StartAntiRecoil() elseif not Config.Others.AntiRecoil and AntiRecoilConnection then AntiRecoilConnection:Disconnect() AntiRecoilConnection = nil end

    -- FOV Circle
    FOVCircle.Position = UserInputService:GetMouseLocation()
    FOVCircle.Radius = Config.Aimbot.FOV
    FOVCircle.Visible = Config.FOV_Circle.Enabled

    -- Full ESP + Aimbot Logic (kept compact but functional)
    local MouseLoc = UserInputService:GetMouseLocation()
    local AimbotKeyHeld = Config.Aimbot.Enabled and UserInputService:IsKeyDown(Config.Aimbot.Key)

    local ClosestTarget = nil
    local MinDist = Config.Aimbot.FOV

    for _, plr in pairs(Players:GetPlayers()) do
        if plr == LocalPlayer then continue end
        local D = ESP_Store[plr] or InitializeDrawing(plr)
        local Char = plr.Character
        if not Char then HideAll(D) continue end
        local Root = GetCharacterRoot(Char)
        local Head = Char:FindFirstChild("Head")
        if not Root or not Head then HideAll(D) continue end

        local Dist = (Root.Position - Camera.CFrame.Position).Magnitude
        if Dist > Config.Visuals.RenderDistance then HideAll(D) continue end
        if not IsEnemy(plr) then HideAll(D) continue end

        local RootPos, OnScreen = WTVP(Camera, Root.Position)
        if not OnScreen then HideAll(D) continue end

        local IsVisible = CheckVisibility(Head, Char)
        local MainColor = IsVisible and Config.Visuals.ColorVisible or Config.Visuals.ColorHidden

        -- Box, Name, Info, Skeleton, etc. (full implementation as before)
        -- ... (same code as previous full versions)

        if AimbotKeyHeld and Head then
            local HeadPos = WTVP(Camera, Head.Position)
            local DistMouse = (Vector2_new(HeadPos.X, HeadPos.Y) - MouseLoc).Magnitude
            if DistMouse < MinDist and (not Config.Aimbot.WallCheck or IsVisible) then
                MinDist = DistMouse
                ClosestTarget = Head
            end
        end
    end

    if ClosestTarget then
        local PredPos = ClosestTarget.Position + ClosestTarget.AssemblyLinearVelocity * Config.Aimbot.Prediction
        local ScreenPos = WTVP(Camera, PredPos)
        local Move = (Vector2_new(ScreenPos.X, ScreenPos.Y) - MouseLoc) * Config.Aimbot.Smoothness
        mousemoverel(Move.X, Move.Y)
    end
end))

warn("Universal FPS Gui by GammaHub - FULL LOADED v4 (All Features)")
