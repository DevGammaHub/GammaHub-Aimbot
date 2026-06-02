-- Universal FPS GUI (cleaned & restyled) - Emotes removed
-- Place/Use as client script with a Drawing-capable executor

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

if not Drawing then
    warn("This script requires a Drawing-capable executor")
    return
end

local mouse1press = mouse1press or function() end
local mouse1release = mouse1release or function() end

local WTVP = Camera.WorldToViewportPoint
local Vector2_new = Vector2.new
local Color3_fromRGB = Color3.fromRGB
local Math_floor = math.floor

local ScriptRunning = true
local ESP_Store = {}
local Connections = {}
local UI_Store = {}

-- Configuration
local Config = {
    Global = { MenuOpen = true, Keybind = Enum.KeyCode.Insert },
    Aimbot = { Enabled = true, Key = Enum.KeyCode.E, FOV = 100, Smoothness = 0.5, AimPart = "Head", WallCheck = true, Prediction = 0.05 },
    Triggerbot = { Enabled = false, Key = Enum.KeyCode.T, Delay = 0.1, Randomization = 0.05, MaxDistance = 1000 },
    Visuals = { Enabled = true, TeamCheck = true, Box = true, BoxOutline = true, Skeleton = true, HeadCircle = true, ViewLine = true, Snaplines = false, Names = true, Info = true, RenderDistance = 2500, ColorVisible = Color3_fromRGB(0,255,128), ColorHidden = Color3_fromRGB(255,50,50), ColorText = Color3_fromRGB(255,255,255) },
    FOV_Circle = { Enabled = true, Color = Color3_fromRGB(255,255,255), Transparency = 0.5, Thickness = 1, NumSides = 60 },
    Players = { Fly = false, Noclip = false, Invisibility = false, Godmode = false, FlySpeed = 50, WalkSpeed = 16 },
    Others = { AntiRecoil = false, RecoilStrength = 5 },
    Troll = { Spin = false, SpinSpeed = 20, AttachEnabled = false, AttachTarget = "", OrbitEnabled = false, OrbitSpeed = 10 }
}

-- Notifications
local function SendNotification(text, color)
    local gui = nil
    for _, v in pairs(UI_Store) do if v:IsA("ScreenGui") then gui = v; break end end
    if not gui then return end
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 260, 0, 36)
    frame.Position = UDim2.new(1, -280, 0.85, 0)
    frame.BackgroundColor3 = Color3_fromRGB(30,30,30)
    frame.Parent = gui
    local corner = Instance.new("UICorner", frame); corner.CornerRadius = UDim.new(0,6)
    local bar = Instance.new("Frame", frame); bar.Size = UDim2.new(0,6,1,0); bar.BackgroundColor3 = color or Color3_fromRGB(0,255,128)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -12, 1, 0); label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1; label.Text = text; label.TextColor3 = Color3.fromRGB(230,230,230); label.Font = Enum.Font.GothamBold; label.TextSize = 14; label.TextXAlignment = Enum.TextXAlignment.Left
    TweenService:Create(frame, TweenInfo.new(0.35), {Position = UDim2.new(1, -300, 0.85, 0)}):Play()
    task.spawn(function() task.wait(2.5); TweenService:Create(frame, TweenInfo.new(0.35), {Position = UDim2.new(1, -20, 0.85, 0)}):Play(); task.wait(0.4); frame:Destroy() end)
end

-- UI Library (stylish)
local Library = {}
local MainFrameInstance
function Library:CreateUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "GammaHub_UI_"..math.random(1000,9999)
    ScreenGui.ResetOnSpawn = false
    if gethui then ScreenGui.Parent = gethui() elseif CoreGui:FindFirstChild("RobloxGui") then ScreenGui.Parent = CoreGui else ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end
    table.insert(UI_Store, ScreenGui)

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 560, 0, 420)
    Main.Position = UDim2.new(0.5, -280, 0.5, -210)
    Main.BackgroundColor3 = Color3_fromRGB(18,18,18)
    Main.BorderSizePixel = 0
    Main.Parent = ScreenGui
    MainFrameInstance = Main
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0,10)

    -- Left navigation
    local Nav = Instance.new("Frame", Main)
    Nav.Size = UDim2.new(0,140,1, -40); Nav.Position = UDim2.new(0,0,0,40); Nav.BackgroundColor3 = Color3_fromRGB(24,24,24)
    Instance.new("UICorner", Nav).CornerRadius = UDim.new(0,8)
    local navLayout = Instance.new("UIListLayout", Nav); navLayout.SortOrder = Enum.SortOrder.LayoutOrder; navLayout.Padding = UDim.new(0,8)
    local navPad = Instance.new("UIPadding", Nav); navPad.PaddingTop = UDim.new(0,10); navPad.PaddingLeft = UDim.new(0,8)

    -- Top bar
    local Top = Instance.new("Frame", Main); Top.Size = UDim2.new(1,0,0,40); Top.BackgroundTransparency = 1
    local Title = Instance.new("TextLabel", Top); Title.Text = "GammaHub · Universal FPS"; Title.Size = UDim2.new(1, -20,1,0); Title.Position = UDim2.new(0,10,0,0); Title.BackgroundTransparency = 1; Title.TextColor3 = Color3_fromRGB(220,220,220); Title.Font = Enum.Font.GothamBold; Title.TextSize = 16; Title.TextXAlignment = Enum.TextXAlignment.Left
    local CloseBtn = Instance.new("TextButton", Top); CloseBtn.Size = UDim2.new(0,28,0,28); CloseBtn.Position = UDim2.new(1, -36, 0.5, -14); CloseBtn.Text = "X"; CloseBtn.BackgroundColor3 = Color3_fromRGB(35,35,35); CloseBtn.TextColor3 = Color3_fromRGB(200,200,200); CloseBtn.Font = Enum.Font.GothamBold; CloseBtn.TextSize = 14; Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0,6)
    CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false; Config.Global.MenuOpen = false end)

    -- Page container
    local PageContainer = Instance.new("Frame", Main); PageContainer.Size = UDim2.new(1, -150, 1, -50); PageContainer.Position = UDim2.new(0,150,0,40); PageContainer.BackgroundTransparency = 1

    local Tabs = {}
    local first = true
    function Tabs:CreateTab(name)
        local btn = Instance.new("TextButton", Nav)
        btn.Size = UDim2.new(1, -16, 0, 34); btn.Text = name; btn.BackgroundColor3 = Color3_fromRGB(28,28,28); btn.TextColor3 = Color3_fromRGB(160,160,160); btn.Font = Enum.Font.GothamSemibold; btn.TextSize = 14; btn.AutoButtonColor = false
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
        local page = Instance.new("ScrollingFrame", PageContainer)
        page.Size = UDim2.new(1, -20, 1, -20); page.Position = UDim2.new(0,10,0,10); page.CanvasSize = UDim2.new(0,0,0,0); page.ScrollBarThickness = 6; page.BackgroundTransparency = 1; page.Visible = false
        local layout = Instance.new("UIListLayout", page); layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0,8)
        if first then first = false; page.Visible = true; btn.BackgroundColor3 = Color3_fromRGB(40,40,40); btn.TextColor3 = Color3_fromRGB(255,255,255) end
        btn.MouseButton1Click:Connect(function()
            for _, c in pairs(PageContainer:GetChildren()) do if c:IsA("ScrollingFrame") then c.Visible = false end end
            for _, n in pairs(Nav:GetChildren()) do if n:IsA("TextButton") then TweenService:Create(n, TweenInfo.new(0.15), {BackgroundColor3 = Color3_fromRGB(28,28,28), TextColor3 = Color3_fromRGB(160,160,160)}):Play() end end
            page.Visible = true
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3_fromRGB(40,40,40), TextColor3 = Color3_fromRGB(255,255,255)}):Play()
        end)

        local Elements = {}
        function Elements:AddToggle(text, tbl, key)
            local frame = Instance.new("Frame", page); frame.Size = UDim2.new(1,0,0,34); frame.BackgroundTransparency = 1
            local label = Instance.new("TextLabel", frame); label.Text = text; label.Size = UDim2.new(0.7,0,1,0); label.BackgroundTransparency = 1; label.TextColor3 = Color3_fromRGB(220,220,220); label.Font = Enum.Font.Gotham; label.TextSize = 13; label.TextXAlignment = Enum.TextXAlignment.Left
            local btn = Instance.new("TextButton", frame); btn.Size = UDim2.new(0,28,0,22); btn.Position = UDim2.new(1,-36,0.5,-11); btn.BackgroundColor3 = tbl[key] and Color3_fromRGB(0,200,120) or Color3_fromRGB(70,70,70); btn.Text = ""; Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
            btn.MouseButton1Click:Connect(function() tbl[key] = not tbl[key]; TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = tbl[key] and Color3_fromRGB(0,200,120) or Color3_fromRGB(70,70,70)}):Play() end)
            return btn
        end
        function Elements:AddSlider(text, tbl, key, min, max, isFloat)
            local frame = Instance.new("Frame", page); frame.Size = UDim2.new(1,0,0,46); frame.BackgroundTransparency = 1
            local label = Instance.new("TextLabel", frame); label.Text = text; label.Size = UDim2.new(1,-80,0,20); label.Position = UDim2.new(0,6,0,4); label.BackgroundTransparency = 1; label.TextColor3 = Color3_fromRGB(220,220,220); label.Font = Enum.Font.Gotham; label.TextSize = 13; label.TextXAlignment = Enum.TextXAlignment.Left
            local value = Instance.new("TextLabel", frame); value.Text = tostring(tbl[key]); value.Size = UDim2.new(0,66,0,20); value.Position = UDim2.new(1,-74,0,4); value.BackgroundTransparency = 1; value.TextColor3 = Color3_fromRGB(120,240,160); value.Font = Enum.Font.GothamBold; value.TextSize = 13
            local bar = Instance.new("Frame", frame); bar.Size = UDim2.new(1,-12,0,8); bar.Position = UDim2.new(0,6,0,28); bar.BackgroundColor3 = Color3_fromRGB(60,60,60); Instance.new("UICorner", bar).CornerRadius = UDim.new(0,6)
            local fill = Instance.new("Frame", bar); fill.Size = UDim2.new((tbl[key]-min)/(max-min),0,1,0); fill.BackgroundColor3 = Color3_fromRGB(0,200,120)
            local btn = Instance.new("TextButton", bar); btn.Size = UDim2.new(1,0,1,0); btn.BackgroundTransparency = 1; btn.Text = ""
            local dragging = false
            btn.InputBegan:Connect(function(inp) if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
            btn.InputEnded:Connect(function(inp) if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
            UserInputService.InputChanged:Connect(function(inp) if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
                local x = math.clamp((inp.Position.X - bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
                fill.Size = UDim2.new(x,0,1,0)
                local val = min + (max-min)*x
                if not isFloat then val = Math_floor(val) end
                tbl[key] = val; value.Text = tostring(val)
            end end)
        end
        function Elements:AddButton(text, cb)
            local frame = Instance.new("Frame", page); frame.Size = UDim2.new(1,0,0,34); frame.BackgroundTransparency = 1
            local btn = Instance.new("TextButton", frame); btn.Size = UDim2.new(1,0,0,34); btn.Text = text; btn.Font = Enum.Font.GothamBold; btn.TextSize = 14; btn.BackgroundColor3 = Color3_fromRGB(40,40,40); btn.TextColor3 = Color3_fromRGB(230,100,100); Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
            btn.MouseButton1Click:Connect(function() pcall(cb) end)
        end
        function Elements:AddKeybind(text, tbl, key)
            local frame = Instance.new("Frame", page); frame.Size = UDim2.new(1,0,0,34); frame.BackgroundTransparency = 1
            local label = Instance.new("TextLabel", frame); label.Text = text; label.Size = UDim2.new(0.6,0,1,0); label.BackgroundTransparency = 1; label.TextColor3 = Color3_fromRGB(220,220,220); label.Font = Enum.Font.Gotham; label.TextSize = 13; label.TextXAlignment = Enum.TextXAlignment.Left
            local kb = Instance.new("TextButton", frame); kb.Size = UDim2.new(0,84,0,22); kb.Position = UDim2.new(1,-92,0.5,-11); kb.Text = tbl[key].Name or tostring(tbl[key]); kb.BackgroundColor3 = Color3_fromRGB(60,60,60); kb.TextColor3 = Color3_fromRGB(230,230,230); Instance.new("UICorner", kb).CornerRadius = UDim.new(0,6)
            kb.MouseButton1Click:Connect(function()
                kb.Text = "..."
                local conn
                conn = UserInputService.InputBegan:Connect(function(inp)
                    if inp.UserInputType == Enum.UserInputType.Keyboard then tbl[key] = inp.KeyCode; kb.Text = inp.KeyCode.Name; conn:Disconnect() end
                end)
            end)
        end
        function Elements:AddTextbox(text, placeholder, cb)
            local frame = Instance.new("Frame", page); frame.Size = UDim2.new(1,0,0,36); frame.BackgroundTransparency = 1
            local label = Instance.new("TextLabel", frame); label.Text = text; label.Size = UDim2.new(0.45,0,1,0); label.BackgroundTransparency = 1; label.TextColor3 = Color3_fromRGB(220,220,220); label.Font = Enum.Font.Gotham; label.TextSize = 13; label.TextXAlignment = Enum.TextXAlignment.Left
            local box = Instance.new("TextBox", frame); box.Size = UDim2.new(0.45,0,0,22); box.Position = UDim2.new(0.45,6,0.5,-11); box.Text = placeholder or ""; box.ClearTextOnFocus = false; box.BackgroundColor3 = Color3_fromRGB(60,60,60); box.TextColor3 = Color3_fromRGB(230,230,230); Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)
            local btn = Instance.new("TextButton", frame); btn.Size = UDim2.new(0,56,0,22); btn.Position = UDim2.new(1,-64,0.5,-11); btn.Text = "Set"; btn.BackgroundColor3 = Color3_fromRGB(60,60,60); btn.TextColor3 = Color3_fromRGB(230,230,230); Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
            btn.MouseButton1Click:Connect(function() pcall(function() cb(box.Text) end) end)
            return box, btn
        end
        return Elements
    end
    return Tabs, ScreenGui
end

local Window, GUIInstance = Library:CreateUI()

-- Build tabs and controls
local AimTab = Window:CreateTab("Aimbot")
AimTab:AddToggle("Enabled", Config.Aimbot, "Enabled")
AimTab:AddKeybind("Aim Key", Config.Aimbot, "Key")
AimTab:AddToggle("WallCheck", Config.Aimbot, "WallCheck")
AimTab:AddSlider("FOV", Config.Aimbot, "FOV", 10, 600, false)
AimTab:AddSlider("Smoothness", Config.Aimbot, "Smoothness", 0, 1, true)
AimTab:AddSlider("Prediction", Config.Aimbot, "Prediction", 0, 1, true)
AimTab:AddToggle("Draw FOV", Config.FOV_Circle, "Enabled")

local TrigTab = Window:CreateTab("Triggerbot")
local TrigEnabledBtn = TrigTab:AddToggle("Enabled (Toggle)", Config.Triggerbot, "Enabled")
TrigTab:AddKeybind("Toggle Key", Config.Triggerbot, "Key")
TrigTab:AddSlider("Delay", Config.Triggerbot, "Delay", 0.01, 1.0, true)
TrigTab:AddSlider("Randomize", Config.Triggerbot, "Randomization", 0.0, 0.2, true)
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

local PlayersTab = Window:CreateTab("Players")
PlayersTab:AddToggle("Fly", Config.Players, "Fly")
PlayersTab:AddSlider("Fly Speed", Config.Players, "FlySpeed", 10, 200, false)
PlayersTab:AddToggle("Noclip", Config.Players, "Noclip")
PlayersTab:AddToggle("Invisibility", Config.Players, "Invisibility")
PlayersTab:AddToggle("Godmode", Config.Players, "Godmode")
PlayersTab:AddSlider("Walk Speed", Config.Players, "WalkSpeed", 1, 100, false)

local TrollTab = Window:CreateTab("Troll")
TrollTab:AddToggle("Spin", Config.Troll, "Spin")
TrollTab:AddSlider("Spin Speed", Config.Troll, "SpinSpeed", 1, 100, false)
local _tb, _btn = TrollTab:AddTextbox("Attach Target", "PlayerName", function(txt) Config.Troll.AttachTarget = txt end)
TrollTab:AddToggle("Attach To Head", Config.Troll, "AttachEnabled")
TrollTab:AddToggle("Orbit Part", Config.Troll, "OrbitEnabled")
TrollTab:AddSlider("Orbit Speed", Config.Troll, "OrbitSpeed", 1, 50, false)

local OthersTab = Window:CreateTab("Others")
OthersTab:AddToggle("Anti Recoil", Config.Others, "AntiRecoil")
OthersTab:AddSlider("Recoil Strength", Config.Others, "RecoilStrength", 1, 30, false)

local SetTab = Window:CreateTab("Settings")
SetTab:AddButton("UNLOAD SCRIPT", function()
    ScriptRunning = false
    for _, conn in pairs(Connections) do pcall(function() conn:Disconnect() end) end
    for _, ui in pairs(UI_Store) do pcall(function() ui:Destroy() end) end
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end
end)

-- Utility functions (ESP)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = Config.FOV_Circle.Enabled
FOVCircle.Thickness = Config.FOV_Circle.Thickness
FOVCircle.Color = Config.FOV_Circle.Color
FOVCircle.Transparency = Config.FOV_Circle.Transparency
FOVCircle.Filled = false
FOVCircle.NumSides = Config.FOV_Circle.NumSides

local function GetCharacterRoot(Char)
    if not Char then return nil end
    return Char.PrimaryPart or Char:FindFirstChild("HumanoidRootPart") or Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")
end
local function GetCharacterHumanoid(Char)
    if not Char then return nil end
    return Char:FindFirstChildWhichIsA("Humanoid")
end

local CommonAttributes = {"Team","team","Side","side","Faction","faction","Squad","squad"}
local function IsEnemy(plr)
    if not Config.Visuals.TeamCheck then return true end
    if plr == LocalPlayer then return false end
    if plr.Team and LocalPlayer.Team and plr.Team == LocalPlayer.Team then return false end
    return true
end

-- Drawing store helpers
local function InitializeDrawing(plr)
    if ESP_Store[plr] then return end
    local objs = {Box = Drawing.new("Square"), BoxOutline = Drawing.new("Square"), Name = Drawing.new("Text"), Info = Drawing.new("Text"), HeadCircle = Drawing.new("Circle"), ViewLine = Drawing.new("Line"), Snapline = Drawing.new("Line"), Skeleton = {}}
    objs.BoxOutline.Visible = false; objs.BoxOutline.Filled = false; objs.BoxOutline.Thickness = 3; objs.BoxOutline.Color = Color3.new(0,0,0)
    objs.Box.Visible = false; objs.Box.Filled = false; objs.Box.Thickness = 1
    objs.Name.Visible = false; objs.Name.Center = true; objs.Name.Outline = true; objs.Name.Font = 2
    objs.Info.Visible = false; objs.Info.Center = true; objs.Info.Outline = true; objs.Info.Font = 2
    objs.HeadCircle.Visible = false; objs.HeadCircle.Filled = false; objs.HeadCircle.Thickness = 1.5
    objs.ViewLine.Visible = false; objs.ViewLine.Thickness = 1
    objs.Snapline.Visible = false; objs.Snapline.Thickness = 1.5
    for i=1,16 do table.insert(objs.Skeleton, Drawing.new("Line")) end
    ESP_Store[plr] = objs
end
local function HideAll(d)
    d.Box.Visible = false; d.BoxOutline.Visible = false; d.Name.Visible = false; d.Info.Visible = false; d.HeadCircle.Visible = false; d.ViewLine.Visible = false; d.Snapline.Visible = false
    for _, l in pairs(d.Skeleton) do l.Visible = false end
end
local function ClearDrawing(plr)
    if not ESP_Store[plr] then return end
    local d = ESP_Store[plr]
    pcall(function()
        d.Box:Remove(); d.BoxOutline:Remove(); d.Name:Remove(); d.Info:Remove(); d.HeadCircle:Remove(); d.ViewLine:Remove(); d.Snapline:Remove()
        for _, line in pairs(d.Skeleton) do line:Remove() end
    end)
    ESP_Store[plr] = nil
end

-- Player features
local FlyBodyVelocity, FlyConnection
local InvisActive, InvisSavedCFrame, InvisUpdateConn = false, nil, nil
local GodmodeConnection
local AntiRecoilConnection

local function ToggleFly(state)
    if state then
        local char = LocalPlayer.Character; if not char then return end
        if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
        FlyBodyVelocity = Instance.new("BodyVelocity", char:WaitForChild("HumanoidRootPart"))
        FlyBodyVelocity.MaxForce = Vector3.new(0,0,0)
        FlyBodyVelocity.Velocity = Vector3.new(0,0,0)
        FlyConnection = RunService.RenderStepped:Connect(function()
            if not Config.Players.Fly then return end
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local move = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
            if move.Magnitude > 0 then move = move.Unit end
            FlyBodyVelocity.Velocity = move * Config.Players.FlySpeed; FlyBodyVelocity.MaxForce = Vector3.new(4e5,4e5,4e5)
        end)
    else
        if FlyConnection then FlyConnection:Disconnect(); FlyConnection = nil end
        if FlyBodyVelocity then FlyBodyVelocity:Destroy(); FlyBodyVelocity = nil end
    end
end

local function ApplySpeed()
    local char = LocalPlayer.Character; if not char then return end
    local hum = char:FindFirstChildWhichIsA("Humanoid")
    if hum then hum.WalkSpeed = Config.Players.WalkSpeed end
end

local function ToggleNoclip(state)
    local char = LocalPlayer.Character; if not char then return end
    for _, part in pairs(char:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = not state end end
end

local function StartGodmode()
    if GodmodeConnection then return end
    local char = LocalPlayer.Character; if not char then return end
    local hum = char:FindFirstChildWhichIsA("Humanoid"); if not hum then return end
    hum.MaxHealth = 9e9; hum.Health = 9e9
    GodmodeConnection = hum.HealthChanged:Connect(function()
        if hum.Health < 9e9 then hum.MaxHealth = 9e9; hum.Health = 9e9 end
    end)
end
local function StopGodmode()
    if GodmodeConnection then GodmodeConnection:Disconnect(); GodmodeConnection = nil end
    local char = LocalPlayer.Character; if char then local hum = char:FindFirstChildWhichIsA("Humanoid") if hum then hum.MaxHealth = 100; hum.Health = 100 end end
end

local function StartInvisibility()
    if InvisActive then return end
    local char = LocalPlayer.Character; if not char then return end
    InvisActive = true; InvisSavedCFrame = char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.CFrame
    for _, obj in pairs(char:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and obj.Name ~= "HumanoidRootPart" then obj.Transparency = 1 end
        if obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency = 1 end
    end
    if char:FindFirstChild("HumanoidRootPart") then char.HumanoidRootPart.CFrame = (char.HumanoidRootPart.CFrame * CFrame.new(0,-5000,0)) end
    InvisUpdateConn = RunService.RenderStepped:Connect(function() if not InvisActive or not Config.Players.Invisibility then return end end)
end
local function StopInvisibility()
    if not InvisActive then return end
    InvisActive = false
    if InvisUpdateConn then InvisUpdateConn:Disconnect(); InvisUpdateConn = nil end
    local char = LocalPlayer.Character; if not char then return end
    for _, obj in pairs(char:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and obj.Name ~= "HumanoidRootPart" then obj.Transparency = 0 end
        if obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency = 0 end
    end
    if char:FindFirstChild("HumanoidRootPart") and InvisSavedCFrame then char.HumanoidRootPart.CFrame = InvisSavedCFrame * CFrame.new(0,3,0) end
    InvisSavedCFrame = nil
end

local function StartAntiRecoil()
    if AntiRecoilConnection then return end
    AntiRecoilConnection = RunService.RenderStepped:Connect(function()
        if not Config.Others.AntiRecoil then return end
        if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then pcall(function() mousemoverel(0, Config.Others.RecoilStrength) end) end
    end)
end
local function StopAntiRecoil() if AntiRecoilConnection then AntiRecoilConnection:Disconnect(); AntiRecoilConnection = nil end end

-- Troll features
local TrollSpinConn, TrollAttachConn, TrollOrbitConn, TrollOrbitPart
local function StartSpin()
    if TrollSpinConn then return end
    local char = LocalPlayer.Character; if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
    if not hrp then return end
    TrollSpinConn = RunService.RenderStepped:Connect(function(dt)
        if not Config.Troll.Spin then return end
        if hrp and hrp.Parent then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(Config.Troll.SpinSpeed) * dt, 0) end
    end)
end
local function StopSpin() if TrollSpinConn then TrollSpinConn:Disconnect(); TrollSpinConn = nil end end

local function StartAttach()
    if TrollAttachConn then return end
    TrollAttachConn = RunService.RenderStepped:Connect(function()
        if not Config.Troll.AttachEnabled then return end
        local targetName = Config.Troll.AttachTarget
        if not targetName or targetName == "" then return end
        local targetPlayer
        for _, p in ipairs(Players:GetPlayers()) do if string.lower(p.Name) == string.lower(targetName) or (p.DisplayName and string.lower(p.DisplayName) == string.lower(targetName)) then targetPlayer = p; break end end
        if not targetPlayer or not targetPlayer.Character then return end
        local targetHead = targetPlayer.Character:FindFirstChild("Head")
        local myChar = LocalPlayer.Character
        if targetHead and myChar and myChar:FindFirstChild("HumanoidRootPart") then myChar.HumanoidRootPart.CFrame = targetHead.CFrame * CFrame.new(0,1.5,0) end
    end)
end
local function StopAttach() if TrollAttachConn then TrollAttachConn:Disconnect(); TrollAttachConn = nil end end

local function StartOrbit()
    if TrollOrbitConn then return end
    local targetName = Config.Troll.AttachTarget
    local targetPlayer
    for _, p in ipairs(Players:GetPlayers()) do if string.lower(p.Name) == string.lower(targetName) or (p.DisplayName and string.lower(p.DisplayName) == string.lower(targetName)) then targetPlayer = p; break end end
    local center = targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head"))
    if not center then return end
    if not TrollOrbitPart then TrollOrbitPart = Instance.new("Part", Workspace); TrollOrbitPart.Size = Vector3.new(0.4,0.4,0.4); TrollOrbitPart.Anchored = true; TrollOrbitPart.CanCollide = false; TrollOrbitPart.Material = Enum.Material.Neon; TrollOrbitPart.Color = Color3_fromRGB(0,200,120) end
    local angle = 0
    TrollOrbitConn = RunService.RenderStepped:Connect(function(dt)
        if not Config.Troll.OrbitEnabled then return end
        if not center or not center.Parent then return end
        angle = angle + (Config.Troll.OrbitSpeed * dt)
        local x = math.cos(angle) * 1.5; local z = math.sin(angle) * 1.5
        TrollOrbitPart.CFrame = center.CFrame * CFrame.new(x, 0.8, z)
    end)
end
local function StopOrbit() if TrollOrbitConn then TrollOrbitConn:Disconnect(); TrollOrbitConn = nil end if TrollOrbitPart then TrollOrbitPart:Destroy(); TrollOrbitPart = nil end end

-- Main render / logic
local PrevNoclip, PrevInvis, PrevFly, PrevGodmode = false, false, false, false

table.insert(Connections, RunService.RenderStepped:Connect(function()
    if not ScriptRunning then return end
    -- Fly
    if Config.Players.Fly and not FlyConnection then ToggleFly(true) elseif not Config.Players.Fly and FlyConnection then ToggleFly(false) end
    -- Noclip
    if Config.Players.Noclip then ToggleNoclip(true) elseif PrevNoclip and not Config.Players.Noclip then ToggleNoclip(false) end
    PrevNoclip = Config.Players.Noclip
    -- speed
    ApplySpeed()
    -- godmode
    if Config.Players.Godmode and not GodmodeConnection then StartGodmode() elseif not Config.Players.Godmode and GodmodeConnection then StopGodmode() end
    -- invis
    if Config.Players.Invisibility and not InvisActive then StartInvisibility() elseif not Config.Players.Invisibility and InvisActive then StopInvisibility() end
    -- anti recoil
    if Config.Others.AntiRecoil and not AntiRecoilConnection then StartAntiRecoil() elseif not Config.Others.AntiRecoil and AntiRecoilConnection then StopAntiRecoil() end
    -- Troll features
    if Config.Troll.Spin and not TrollSpinConn then StartSpin() elseif not Config.Troll.Spin and TrollSpinConn then StopSpin() end
    if Config.Troll.AttachEnabled and not TrollAttachConn then StartAttach() elseif not Config.Troll.AttachEnabled and TrollAttachConn then StopAttach() end
    if Config.Troll.OrbitEnabled and not TrollOrbitConn then StartOrbit() elseif not Config.Troll.OrbitEnabled and TrollOrbitConn then StopOrbit() end
end))

-- Character cleanup on respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    InvisActive = false; InvisSavedCFrame = nil
    if InvisUpdateConn then InvisUpdateConn:Disconnect(); InvisUpdateConn = nil end
    Config.Players.Invisibility = false; Config.Players.Fly = false
    if FlyConnection then FlyConnection:Disconnect(); FlyConnection = nil end
    if FlyBodyVelocity then FlyBodyVelocity:Destroy(); FlyBodyVelocity = nil end
    if GodmodeConnection then GodmodeConnection:Disconnect(); GodmodeConnection = nil end
end)

-- Triggerbot loop
task.spawn(function()
    while ScriptRunning do
        local DidFire = false
        if Config.Triggerbot.Enabled then
            local Origin = Camera.CFrame.Position
            local Direction = Camera.CFrame.LookVector * Config.Triggerbot.MaxDistance
            local params = RaycastParams.new(); params.FilterDescendantsInstances = {LocalPlayer.Character, Camera}; params.FilterType = Enum.RaycastFilterType.Exclude; params.IgnoreWater = true
            local Result = Workspace:Raycast(Origin, Direction, params)
            if Result and Result.Instance then
                local HitModel = Result.Instance:FindFirstAncestorOfClass("Model")
                if HitModel then
                    local Plr = Players:GetPlayerFromCharacter(HitModel)
                    if Plr and IsEnemy(Plr) then
                        local Hum = GetCharacterHumanoid(HitModel)
                        if Hum and Hum.Health > 0 then
                            mouse1press(); task.wait(0.03); mouse1release()
                            local ShotDelay = Config.Triggerbot.Delay + (math.random() * Config.Triggerbot.Randomization)
                            task.wait(ShotDelay); DidFire = true
                        end
                    end
                end
            end
        end
        if not DidFire then task.wait(0.05) end
    end
end)

-- Main aimbot/render function
local function MainRender()
    if not ScriptRunning then return end
    local MouseLoc = UserInputService:GetMouseLocation()
    local ViewportSize = Camera.ViewportSize
    local ScreenBottom = Vector2_new(ViewportSize.X/2, ViewportSize.Y)
    FOVCircle.Position = MouseLoc
    FOVCircle.Radius = Config.Aimbot.FOV
    FOVCircle.Visible = Config.FOV_Circle.Enabled

    local AimbotKeyHeld = false
    if Config.Aimbot.Enabled then local K = Config.Aimbot.Key if typeof(K) == "EnumItem" then if K.EnumType == Enum.KeyCode then AimbotKeyHeld = UserInputService:IsKeyDown(K) elseif K.EnumType == Enum.UserInputType then AimbotKeyHeld = UserInputService:IsMouseButtonPressed(K) end end end

    local ClosestTarget = nil; local MinDist = Config.Aimbot.FOV
    local AllPlayers = Players:GetPlayers()
    for i=1,#AllPlayers do
        local plr = AllPlayers[i]
        if plr == LocalPlayer then continue end
        local D = ESP_Store[plr]
        if not D then InitializeDrawing(plr); D = ESP_Store[plr] end
        local Char = plr.Character
        if not Char then HideAll(D); continue end
        local Root = GetCharacterRoot(Char)
        local Head = Char:FindFirstChild("Head")
        if not Root or not Head then HideAll(D); continue end
        local Dist = (Root.Position - Camera.CFrame.Position).Magnitude
        if Dist > Config.Visuals.RenderDistance then HideAll(D); continue end
        if not IsEnemy(plr) then HideAll(D); continue end
        local RootPos, RootVis = WTVP(Camera, Root.Position)
        if not RootVis then HideAll(D); continue end

        if Config.Visuals.Enabled then
            local MainColor = Config.Visuals.ColorVisible
            if Config.Visuals.Box then
                local ScaleFactor = 1000/Dist
                local BoxSizeY = 5 * ScaleFactor; local BoxSizeX = 3.2 * ScaleFactor
                local BoxPos = Vector2_new(RootPos.X - BoxSizeX/2, RootPos.Y - BoxSizeY/2)
                D.Box.Size = Vector2_new(BoxSizeX, BoxSizeY); D.Box.Position = BoxPos; D.Box.Color = MainColor; D.Box.Visible = true
            else D.Box.Visible = false end
            if Config.Visuals.Names then D.Name.Text = plr.Name; D.Name.Position = Vector2_new(RootPos.X, RootPos.Y - 40); D.Name.Size = 14; D.Name.Color = Config.Visuals.ColorText; D.Name.Visible = true else D.Name.Visible = false end
            if Config.Visuals.Info then D.Info.Text = tostring(math.floor(Dist)) .. "m"; D.Info.Position = Vector2_new(RootPos.X, RootPos.Y + 40); D.Info.Size = 12; D.Info.Color = Config.Visuals.ColorText; D.Info.Visible = true else D.Info.Visible = false end
        else HideAll(D) end

        if AimbotKeyHeld then
            local HeadScreen = WTVP(Camera, Head.Position)
            local ScreenPos = Vector2_new(HeadScreen.X, HeadScreen.Y)
            local DistToMouse = (ScreenPos - MouseLoc).Magnitude
            if DistToMouse < MinDist then
                if Config.Aimbot.WallCheck then MinDist = DistToMouse; ClosestTarget = Head else MinDist = DistToMouse; ClosestTarget = Head end
            end
        end
    end

    if ClosestTarget then
        local CurrentPos = ClosestTarget.Position
        local Velocity = ClosestTarget.AssemblyLinearVelocity
        local PredictedPos = CurrentPos + (Velocity * Config.Aimbot.Prediction)
        local ScreenPos = WTVP(Camera, PredictedPos)
        local Move = (Vector2_new(ScreenPos.X, ScreenPos.Y) - UserInputService:GetMouseLocation()) * Config.Aimbot.Smoothness
        pcall(function() mousemoverel(Move.X, Move.Y) end)
    end
end

table.insert(Connections, RunService.RenderStepped:Connect(MainRender))

warn("GammaHub Universal FPS (clean) loaded")
