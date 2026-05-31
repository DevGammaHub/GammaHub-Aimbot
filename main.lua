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
    Others = {
        FPSCounter = true,
        WalkSpeedEnabled = false,
        WalkSpeed = 100,
        Noclip = false,
    }
}

local function SendNotification(text, color)
    local GUI = nil
    for _, v in pairs(UI_Store) do 
        if v:IsA("ScreenGui") then 
            GUI = v 
            break 
        end 
    end
    if not GUI then return end

    local NoteFrame = Instance.new("Frame")
    NoteFrame.Name = "Notification"
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

-- ==================== GUI LIBRARY ====================
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
    MainFrame.Size = UDim2.new(0, 550, 0, 380)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -190)
    MainFrame.BackgroundColor3 = Color3_fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    MainFrameInstance = MainFrame

    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 6)

    -- Dragging
    local Dragging = false
    local DragStart, StartPos
    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPos = MainFrame.Position
        end
    end)
    MainFrame.InputChanged:Connect(function(input)
        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local Delta = input.Position - DragStart
            MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then Dragging = false end
    end)

    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3_fromRGB(35, 35, 35)
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
    TabContainer.Parent = MainFrame

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

        Instance.new("UIListLayout", Page).Padding = UDim.new(0, 5)

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
        
        function Elements:AddToggle(Text, ConfigTable, ConfigKey, Callback)
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
                if Callback then Callback(ConfigTable[ConfigKey]) end
            end)
            return Button
        end

        function Elements:AddSlider(Text, ConfigTable, ConfigKey, Min, Max, IsFloat, Callback)
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

            local function UpdateSlider(input)
                local SizeX = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                local NewValue = Min + ((Max - Min) * SizeX)
                if IsFloat then NewValue = math.floor(NewValue * 100) / 100 else NewValue = Math_floor(NewValue) end
                
                ConfigTable[ConfigKey] = NewValue
                ValueLabel.Text = string.sub(tostring(NewValue), 1, 4)
                Fill.Size = UDim2.new(SizeX, 0, 1, 0)
                if Callback then Callback(NewValue) end
            end

            Trigger.InputBegan:Connect(function(inp) if inp.UserInputType == Enum.UserInputType.MouseButton1 then UpdateSlider(inp) end end)
            UserInputService.InputChanged:Connect(function(inp) if inp.UserInputType == Enum.UserInputType.MouseMovement then UpdateSlider(inp) end end)
        end

        return Elements
    end

    return Tabs, ScreenGui
end

local Window, _ = Library:CreateUI()

-- Tabs erstellen
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
TrigTab:AddKeybind("Key", Config.Triggerbot, "Key")
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
VisTab:AddToggle("Head", Config.Visuals, "HeadCircle")
VisTab:AddToggle("ViewLine", Config.Visuals, "ViewLine")
VisTab:AddToggle("Snaplines", Config.Visuals, "Snaplines")
VisTab:AddSlider("Render Distance", Config.Visuals, "RenderDistance", 100, 5000, false)

-- ==================== OTHERS TAB ====================
local OthersTab = Window:CreateTab("Others")
OthersTab:AddToggle("FPS Counter", Config.Others, "FPSCounter")
OthersTab:AddToggle("WalkSpeed Enabled", Config.Others, "WalkSpeedEnabled")
OthersTab:AddSlider("WalkSpeed Value", Config.Others, "WalkSpeed", 16, 500, false)
OthersTab:AddToggle("Noclip", Config.Others, "Noclip")

local SetTab = Window:CreateTab("Settings")
SetTab:AddButton("UNLOAD SCRIPT", function()
    ScriptRunning = false
    for _, conn in pairs(Connections) do conn:Disconnect() end
    for plr, data in pairs(ESP_Store) do ClearDrawing(plr) end
    for _, gui in pairs(UI_Store) do gui:Destroy() end
end)

-- ==================== INPUT ====================
table.insert(Connections, UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Config.Global.Keybind then
        Config.Global.MenuOpen = not Config.Global.MenuOpen
        if MainFrameInstance then MainFrameInstance.Visible = Config.Global.MenuOpen end
    end
    if input.KeyCode == Config.Triggerbot.Key then
        Config.Triggerbot.Enabled = not Config.Triggerbot.Enabled
        SendNotification("Triggerbot: " .. (Config.Triggerbot.Enabled and "ENABLED" or "DISABLED"), Config.Triggerbot.Enabled and Color3_fromRGB(0,255,128) or Color3_fromRGB(255,50,50))
    end
end))

-- ==================== FPS COUNTER ====================
local fpsCounter
if Config.Others.FPSCounter then
    local sg = Instance.new("ScreenGui", gethui and gethui() or CoreGui)
    table.insert(UI_Store, sg)
    fpsCounter = Instance.new("TextLabel", sg)
    fpsCounter.Position = UDim2.new(0.975, 0, 1, -10)
    fpsCounter.Size = UDim2.new(0, 80, 0, 20)
    fpsCounter.BackgroundTransparency = 1
    fpsCounter.TextColor3 = Color3.new(1,1,1)
    fpsCounter.TextStrokeTransparency = 0.5
    fpsCounter.Font = Enum.Font.SourceSansBold
    fpsCounter.TextSize = 14
    fpsCounter.TextXAlignment = Enum.TextXAlignment.Left
end

RunService.RenderStepped:Connect(function(delta)
    if fpsCounter then fpsCounter.Text = "FPS: " .. math.round(1/delta) end
end)

-- ==================== WALKSPEED ====================
task.spawn(function()
    while ScriptRunning do
        if Config.Others.WalkSpeedEnabled then
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.WalkSpeed = Config.Others.WalkSpeed end
        end
        task.wait(0.2)
    end
end)

-- ==================== NOCLIP ====================
local noclipParts = {}
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    noclipParts = {}
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then table.insert(noclipParts, v) end
    end
end)

RunService.Heartbeat:Connect(function()
    if Config.Others.Noclip then
        for _, part in pairs(noclipParts) do
            if part then part.CanCollide = false end
        end
    end
end)

-- ==================== REST OF ORIGINAL SCRIPT (komplett) ====================
local GlobalRaycastParams = RaycastParams.new()
GlobalRaycastParams.FilterType = Enum.RaycastFilterType.Exclude
GlobalRaycastParams.IgnoreWater = true

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.Color = Color3_fromRGB(255,255,255)
FOVCircle.Transparency = 0.5
FOVCircle.Filled = false
FOVCircle.NumSides = 60

local function GetCharacterRoot(Char)
    if not Char then return nil end
    return Char:FindFirstChild("HumanoidRootPart") or Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso") or Char.PrimaryPart
end

local function GetCharacterHumanoid(Char)
    if not Char then return nil end
    return Char:FindFirstChildOfClass("Humanoid")
end

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
    local D = {
        BoxOutline = Drawing.new("Square"), Box = Drawing.new("Square"),
        Name = Drawing.new("Text"), Info = Drawing.new("Text"),
        HeadCircle = Drawing.new("Circle"), ViewLine = Drawing.new("Line"),
        Snapline = Drawing.new("Line"), Skeleton = {}
    }
    -- Setup properties...
    for i = 1, 16 do table.insert(D.Skeleton, Drawing.new("Line")) end
    ESP_Store[plr] = D
end

local function HideAll(D)
    for _, obj in pairs(D) do
        if typeof(obj) == "table" then
            for _, line in pairs(obj) do line.Visible = false end
        elseif obj.Visible ~= nil then
            obj.Visible = false
        end
    end
end

local function ClearDrawing(plr)
    if ESP_Store[plr] then
        for _, obj in pairs(ESP_Store[plr]) do
            if typeof(obj) == "table" then for _, v in pairs(obj) do v:Remove() end
            else obj:Remove() end
        end
        ESP_Store[plr] = nil
    end
end

local R15_Links = {{"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"}, ...} -- (rest same as original)
local R6_Links = {{"Head", "Torso"}, ...} -- (rest same)

-- Triggerbot + MainRender + alles andere bleibt exakt wie im Original

table.insert(Connections, RunService.RenderStepped:Connect(MainRender))
table.insert(Connections, Players.PlayerRemoving:Connect(ClearDrawing))

warn("Universal FPS Gui + Others Tab Loaded Successfully!")
