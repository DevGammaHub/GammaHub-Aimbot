-- Gui to Lua
-- Version: 3.2

-- Instances:

local HexagonGui = Instance.new("ScreenGui")
local DynamicIsland = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ClientName = Instance.new("TextLabel")
local Circle = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Time = Instance.new("TextLabel")
local Ping = Instance.new("TextLabel")
local Hotkeys = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local ElementName = Instance.new("TextLabel")
local Keys = Instance.new("TextLabel")
local Keys_2 = Instance.new("TextLabel")
local ClickGui = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local AimButton = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local AimFovButton = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local RaycastButton = Instance.new("TextButton")
local UICorner_16 = Instance.new("UICorner")
local AimModeButton = Instance.new("TextButton")
local UICorner_17 = Instance.new("UICorner")
local AimKeyButton = Instance.new("TextButton")
local UICorner_21 = Instance.new("UICorner")
local AutoPredictButton = Instance.new("TextButton")
local UICorner_AutoPredict = Instance.new("UICorner")
local ESPButton = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local FlightButton = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local NoclipButton = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local PhaseButton = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local TracersButton = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local FakeLagButton = Instance.new("TextButton")
local UICorner_18 = Instance.new("UICorner")
local ViewmodelButton = Instance.new("TextButton")
local UICorner_19 = Instance.new("UICorner")
local ViewmodelTextBox = Instance.new("TextBox")
local UICorner_20 = Instance.new("UICorner")
local Panel = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local ClientLink = Instance.new("TextLabel")
local ClientID = Instance.new("TextLabel")
local FlightSpeedTextBox = Instance.new("TextBox")
local UICorner_13 = Instance.new("UICorner")
local SpeedTextBox = Instance.new("TextBox")
local UICorner_14 = Instance.new("UICorner")
local FOVTextBox = Instance.new("TextBox")
local UICorner_15 = Instance.new("UICorner")
local PredictTextBox = Instance.new("TextBox")
local UICorner_Predict = Instance.new("UICorner")
local SmoothTextBox = Instance.new("TextBox")
local UICorner_Smooth = Instance.new("UICorner")
local AimTypeButton = Instance.new("TextButton")
local UICorner_AimType = Instance.new("UICorner")
local SaveConfigButton = Instance.new("TextButton")
local LoadConfigButton = Instance.new("TextButton")
local UICorner_SaveConfig = Instance.new("UICorner")
local UICorner_LoadConfig = Instance.new("UICorner")

-- Binds Panel
local BindsPanel = Instance.new("Frame")
local UICorner_BindsPanel = Instance.new("UICorner")
local BindsPanelTitle = Instance.new("TextLabel")

--Properties:

HexagonGui.Name = "HexagonGui"
HexagonGui.Parent = game:GetService("CoreGui")
HexagonGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HexagonGui.IgnoreGuiInset = true

DynamicIsland.Name = "DynamicIsland"
DynamicIsland.Parent = HexagonGui
DynamicIsland.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DynamicIsland.BackgroundTransparency = 0.100
DynamicIsland.BorderColor3 = Color3.fromRGB(0, 0, 0)
DynamicIsland.BorderSizePixel = 0
DynamicIsland.Position = UDim2.new(0.476163179, 0, 0.0214065518, 0)
DynamicIsland.Size = UDim2.new(0, 107, 0, 33)

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = DynamicIsland

ClientName.Name = "ClientName"
ClientName.Parent = DynamicIsland
ClientName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClientName.BackgroundTransparency = 1.000
ClientName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClientName.BorderSizePixel = 0
ClientName.Position = UDim2.new(0.2869654, 0, 0, 0)
ClientName.Size = UDim2.new(0, 74, 0, 32)
ClientName.Font = Enum.Font.SourceSansSemibold
ClientName.Text = "Hexagon"
ClientName.TextColor3 = Color3.fromRGB(255, 255, 255)
ClientName.TextSize = 16.000

Circle.Name = "Circle"
Circle.Parent = DynamicIsland
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Circle.BorderSizePixel = 0
Circle.Position = UDim2.new(0, 9, 0.201000005, 0)
Circle.Size = UDim2.new(0, 26, 0, 19)

UICorner_2.CornerRadius = UDim.new(5, 0)
UICorner_2.Parent = Circle

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(138, 138, 138)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(206, 206, 206))}
UIGradient.Rotation = 180
UIGradient.Parent = Circle

UIAspectRatioConstraint.Parent = DynamicIsland
UIAspectRatioConstraint.AspectRatio = 3.290

Time.Name = "Time"
Time.Parent = DynamicIsland
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.BorderColor3 = Color3.fromRGB(0, 0, 0)
Time.BorderSizePixel = 0
Time.Position = UDim2.new(-0.572847426, 0, 0, 0)
Time.Size = UDim2.new(0, 61, 0, 32)
Time.Font = Enum.Font.SourceSansSemibold
Time.Text = "Time"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextSize = 18.000
Time.TextStrokeTransparency = 0.000

Ping.Name = "Ping"
Ping.Parent = DynamicIsland
Ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ping.BackgroundTransparency = 1.000
Ping.BorderColor3 = Color3.fromRGB(0, 0, 0)
Ping.BorderSizePixel = 0
Ping.Position = UDim2.new(0.997246563, 0, 0, 0)
Ping.Size = UDim2.new(0, 49, 0, 32)
Ping.Font = Enum.Font.SourceSansSemibold
Ping.Text = "Ping"
Ping.TextColor3 = Color3.fromRGB(255, 255, 255)
Ping.TextSize = 18.000
Ping.TextStrokeTransparency = 0.000

Hotkeys.Name = "Hotkeys"
Hotkeys.Parent = HexagonGui
Hotkeys.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Hotkeys.BackgroundTransparency = 0.100
Hotkeys.BorderColor3 = Color3.fromRGB(0, 0, 0)
Hotkeys.BorderSizePixel = 0
Hotkeys.Position = UDim2.new(0.862729013, 2, 0.372000784, -4)
Hotkeys.Size = UDim2.new(0, 147, 0, 89)

UICorner_3.CornerRadius = UDim.new(0.200000003, 0)
UICorner_3.Parent = Hotkeys

ElementName.Name = "ElementName"
ElementName.Parent = Hotkeys
ElementName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementName.BackgroundTransparency = 1.000
ElementName.BorderColor3 = Color3.fromRGB(0, 0, 0)
ElementName.BorderSizePixel = 0
ElementName.Position = UDim2.new(0.246149391, 0, 0, 0)
ElementName.Size = UDim2.new(0, 74, 0, 32)
ElementName.Font = Enum.Font.SourceSansSemibold
ElementName.Text = "Hotkeys"
ElementName.TextColor3 = Color3.fromRGB(255, 255, 255)
ElementName.TextSize = 18.000

Keys.Name = "Keys"
Keys.Parent = Hotkeys
Keys.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Keys.BackgroundTransparency = 1.000
Keys.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keys.BorderSizePixel = 0
Keys.Position = UDim2.new(-0.00554880174, 0, 0.26794228, 0)
Keys.Size = UDim2.new(0, 147, 0, 32)
Keys.Font = Enum.Font.SourceSansSemibold
Keys.Text = "Flight - - - - - - - - [X]"
Keys.TextColor3 = Color3.fromRGB(255, 255, 255)
Keys.TextSize = 16.000

Keys_2.Name = "Keys"
Keys_2.Parent = Hotkeys
Keys_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Keys_2.BackgroundTransparency = 1.000
Keys_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Keys_2.BorderSizePixel = 0
Keys_2.Position = UDim2.new(-0.00599971414, 0, 0.562359393, 0)
Keys_2.Size = UDim2.new(0, 147, 0, 32)
Keys_2.Font = Enum.Font.SourceSansSemibold
Keys_2.Text = "Phase - - - - - - - - - [Z]"
Keys_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Keys_2.TextSize = 16.000

ClickGui.Name = "ClickGui"
ClickGui.Parent = HexagonGui
ClickGui.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ClickGui.BackgroundTransparency = 0.100
ClickGui.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClickGui.BorderSizePixel = 0
ClickGui.Position = UDim2.new(0.346085399, 17, 0.33022067, 8)
ClickGui.Size = UDim2.new(0, 700, 0, 430)

UICorner_4.CornerRadius = UDim.new(0, 21)
UICorner_4.Parent = ClickGui

AimButton.Name = "AimButton"
AimButton.Parent = ClickGui
AimButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AimButton.BackgroundTransparency = 0.750
AimButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimButton.BorderSizePixel = 0
AimButton.Position = UDim2.new(0.0437875018, 0, 0.0700000003, 0)
AimButton.Size = UDim2.new(0, 180, 0, 41)
AimButton.Font = Enum.Font.SourceSansSemibold
AimButton.Text = "Aimbot"
AimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimButton.TextSize = 18.000

UICorner_5.CornerRadius = UDim.new(0, 9)
UICorner_5.Parent = AimButton

AimFovButton.Name = "AimFovButton"
AimFovButton.Parent = ClickGui
AimFovButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AimFovButton.BackgroundTransparency = 0.750
AimFovButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimFovButton.BorderSizePixel = 0
AimFovButton.Position = UDim2.new(0.0437875018, 0, 0.204999998, 0)
AimFovButton.Size = UDim2.new(0, 180, 0, 41)
AimFovButton.Font = Enum.Font.SourceSansSemibold
AimFovButton.Text = "Aimbot FOV"
AimFovButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimFovButton.TextSize = 18.000

UICorner_6.CornerRadius = UDim.new(0, 9)
UICorner_6.Parent = AimFovButton

RaycastButton.Name = "RaycastButton"
RaycastButton.Parent = ClickGui
RaycastButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
RaycastButton.BackgroundTransparency = 0.750
RaycastButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
RaycastButton.BorderSizePixel = 0
RaycastButton.Position = UDim2.new(0.0437875018, 0, 0.340000004, 0)
RaycastButton.Size = UDim2.new(0, 180, 0, 41)
RaycastButton.Font = Enum.Font.SourceSansSemibold
RaycastButton.Text = "Raycast"
RaycastButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RaycastButton.TextSize = 18.000

UICorner_16.CornerRadius = UDim.new(0, 9)
UICorner_16.Parent = RaycastButton

AimModeButton.Name = "AimModeButton"
AimModeButton.Parent = ClickGui
AimModeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AimModeButton.BackgroundTransparency = 0.750
AimModeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimModeButton.BorderSizePixel = 0
AimModeButton.Position = UDim2.new(0.673349977, 0, 0.475, 0)
AimModeButton.Size = UDim2.new(0, 180, 0, 41)
AimModeButton.Font = Enum.Font.SourceSansSemibold
AimModeButton.Text = "Aim Mode: Hold"
AimModeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimModeButton.TextSize = 18.000

UICorner_17.CornerRadius = UDim.new(0, 9)
UICorner_17.Parent = AimModeButton

AimTypeButton.Name = "AimTypeButton"
AimTypeButton.Parent = ClickGui
AimTypeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AimTypeButton.BackgroundTransparency = 0.750
AimTypeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimTypeButton.BorderSizePixel = 0
AimTypeButton.Position = UDim2.new(0.357712507, 0, 0.475, 0)
AimTypeButton.Size = UDim2.new(0, 180, 0, 41)
AimTypeButton.Font = Enum.Font.SourceSansSemibold
AimTypeButton.Text = "Aim Type: Camera"
AimTypeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimTypeButton.TextSize = 18.000

UICorner_AimType.CornerRadius = UDim.new(0, 9)
UICorner_AimType.Parent = AimTypeButton

AimKeyButton.Name = "AimKeyButton"
AimKeyButton.Parent = ClickGui
AimKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AimKeyButton.BackgroundTransparency = 0.750
AimKeyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimKeyButton.BorderSizePixel = 0
AimKeyButton.Position = UDim2.new(0.0437875018, 0, 0.475, 0)
AimKeyButton.Size = UDim2.new(0, 180, 0, 41)
AimKeyButton.Font = Enum.Font.SourceSansSemibold
AimKeyButton.Text = "Aim Key: LMB"
AimKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimKeyButton.TextSize = 18.000

UICorner_21.CornerRadius = UDim.new(0, 9)
UICorner_21.Parent = AimKeyButton

AutoPredictButton.Name = "AutoPredictButton"
AutoPredictButton.Parent = ClickGui
AutoPredictButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AutoPredictButton.BackgroundTransparency = 0.750
AutoPredictButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutoPredictButton.BorderSizePixel = 0
AutoPredictButton.Position = UDim2.new(0.0437875018, 0, 0.610000014, 0)
AutoPredictButton.Size = UDim2.new(0, 180, 0, 41)
AutoPredictButton.Font = Enum.Font.SourceSansSemibold
AutoPredictButton.Text = "AutoPredict [ВКЛ]"
AutoPredictButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoPredictButton.TextSize = 18.000

UICorner_AutoPredict.CornerRadius = UDim.new(0, 9)
UICorner_AutoPredict.Parent = AutoPredictButton

ESPButton.Name = "ESPButton"
ESPButton.Parent = ClickGui
ESPButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ESPButton.BackgroundTransparency = 0.750
ESPButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ESPButton.BorderSizePixel = 0
ESPButton.Position = UDim2.new(0.357712507, 0, 0.0724999979, 0)
ESPButton.Size = UDim2.new(0, 180, 0, 41)
ESPButton.Font = Enum.Font.SourceSansSemibold
ESPButton.Text = "ESP"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.TextSize = 18.000

UICorner_7.CornerRadius = UDim.new(0, 9)
UICorner_7.Parent = ESPButton

FlightButton.Name = "FlightButton"
FlightButton.Parent = ClickGui
FlightButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FlightButton.BackgroundTransparency = 0.750
FlightButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlightButton.BorderSizePixel = 0
FlightButton.Position = UDim2.new(0.673349977, 0, 0.0724999979, 0)
FlightButton.Size = UDim2.new(0, 180, 0, 41)
FlightButton.Font = Enum.Font.SourceSansSemibold
FlightButton.Text = "Flight"
FlightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlightButton.TextSize = 18.000

UICorner_8.CornerRadius = UDim.new(0, 9)
UICorner_8.Parent = FlightButton

NoclipButton.Name = "NoclipButton"
NoclipButton.Parent = ClickGui
NoclipButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NoclipButton.BackgroundTransparency = 0.750
NoclipButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
NoclipButton.BorderSizePixel = 0
NoclipButton.Position = UDim2.new(0.673349977, 0, 0.209999993, 0)
NoclipButton.Size = UDim2.new(0, 180, 0, 41)
NoclipButton.Font = Enum.Font.SourceSansSemibold
NoclipButton.Text = "Noclip"
NoclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipButton.TextSize = 18.000

UICorner_9.CornerRadius = UDim.new(0, 9)
UICorner_9.Parent = NoclipButton

PhaseButton.Name = "PhaseButton"
PhaseButton.Parent = ClickGui
PhaseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PhaseButton.BackgroundTransparency = 0.750
PhaseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
PhaseButton.BorderSizePixel = 0
PhaseButton.Position = UDim2.new(0.673349977, 0, 0.354999989, 0)
PhaseButton.Size = UDim2.new(0, 180, 0, 41)
PhaseButton.Font = Enum.Font.SourceSansSemibold
PhaseButton.Text = "Phase"
PhaseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PhaseButton.TextSize = 18.000

UICorner_10.CornerRadius = UDim.new(0, 9)
UICorner_10.Parent = PhaseButton

TracersButton.Name = "TracersButton"
TracersButton.Parent = ClickGui
TracersButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TracersButton.BackgroundTransparency = 0.750
TracersButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TracersButton.BorderSizePixel = 0
TracersButton.Position = UDim2.new(0.357712507, 0, 0.209999993, 0)
TracersButton.Size = UDim2.new(0, 180, 0, 41)
TracersButton.Font = Enum.Font.SourceSansSemibold
TracersButton.Text = "Tracers"
TracersButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TracersButton.TextSize = 18.000

UICorner_11.CornerRadius = UDim.new(0, 9)
UICorner_11.Parent = TracersButton

ViewmodelButton.Name = "ViewmodelButton"
ViewmodelButton.Parent = ClickGui
ViewmodelButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ViewmodelButton.BackgroundTransparency = 0.750
ViewmodelButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewmodelButton.BorderSizePixel = 0
ViewmodelButton.Position = UDim2.new(0.357712507, 0, 0.354999989, 0)
ViewmodelButton.Size = UDim2.new(0, 180, 0, 41)
ViewmodelButton.Font = Enum.Font.SourceSansSemibold
ViewmodelButton.Text = "Viewmodel"
ViewmodelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ViewmodelButton.TextSize = 18.000

UICorner_19.CornerRadius = UDim.new(0, 9)
UICorner_19.Parent = ViewmodelButton

Panel.Name = "Panel"
Panel.Parent = ClickGui
Panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Panel.BackgroundTransparency = 0.100
Panel.BorderColor3 = Color3.fromRGB(0, 0, 0)
Panel.BorderSizePixel = 0
Panel.Position = UDim2.new(0, 0, 0.887499988, 0)
Panel.Size = UDim2.new(0, 700, 0, 45)

UICorner_12.CornerRadius = UDim.new(0, 21)
UICorner_12.Parent = Panel

ClientLink.Name = "ClientLink"
ClientLink.Parent = Panel
ClientLink.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClientLink.BackgroundTransparency = 1.000
ClientLink.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClientLink.BorderSizePixel = 0
ClientLink.Position = UDim2.new(0, 0, 0.13333334, 0)
ClientLink.Size = UDim2.new(0, 327, 0, 32)
ClientLink.Font = Enum.Font.SourceSansSemibold
ClientLink.Text = "Hexagon Free - https://discord.gg/FreBGmdu9C"
ClientLink.TextColor3 = Color3.fromRGB(255, 255, 255)
ClientLink.TextSize = 16.000
ClientLink.TextTransparency = 0.800

ClientID.Name = "ClientID"
ClientID.Parent = Panel
ClientID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClientID.BackgroundTransparency = 1.000
ClientID.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClientID.BorderSizePixel = 0
ClientID.Position = UDim2.new(0.750400007, 0, 0.13333334, 0)
ClientID.Size = UDim2.new(0, 156, 0, 32)
ClientID.Font = Enum.Font.SourceSansSemibold
ClientID.Text = "Text"
ClientID.TextColor3 = Color3.fromRGB(255, 255, 255)
ClientID.TextSize = 16.000
ClientID.TextTransparency = 0.420

SaveConfigButton.Name = "SaveConfigButton"
SaveConfigButton.Parent = Panel
SaveConfigButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SaveConfigButton.BackgroundTransparency = 0.750
SaveConfigButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveConfigButton.BorderSizePixel = 0
SaveConfigButton.Position = UDim2.new(0.48, 0, 0.13333334, 0)
SaveConfigButton.Size = UDim2.new(0, 72, 0, 28)
SaveConfigButton.Font = Enum.Font.SourceSansSemibold
SaveConfigButton.Text = "Сохранить"
SaveConfigButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveConfigButton.TextSize = 14.000

UICorner_SaveConfig.CornerRadius = UDim.new(0, 6)
UICorner_SaveConfig.Parent = SaveConfigButton

LoadConfigButton.Name = "LoadConfigButton"
LoadConfigButton.Parent = Panel
LoadConfigButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadConfigButton.BackgroundTransparency = 0.750
LoadConfigButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
LoadConfigButton.BorderSizePixel = 0
LoadConfigButton.Position = UDim2.new(0.60, 0, 0.13333334, 0)
LoadConfigButton.Size = UDim2.new(0, 72, 0, 28)
LoadConfigButton.Font = Enum.Font.SourceSansSemibold
LoadConfigButton.Text = "Загрузить"
LoadConfigButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadConfigButton.TextSize = 14.000

UICorner_LoadConfig.CornerRadius = UDim.new(0, 6)
UICorner_LoadConfig.Parent = LoadConfigButton

-- Binds Panel (справа от ClickGui)
BindsPanel.Name = "BindsPanel"
BindsPanel.Parent = HexagonGui
BindsPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BindsPanel.BackgroundTransparency = 0.100
BindsPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
BindsPanel.BorderSizePixel = 0
BindsPanel.Position = UDim2.new(0.346085399, 737, 0.33022067, 8)
BindsPanel.Size = UDim2.new(0, 200, 0, 320)
BindsPanel.Visible = false

UICorner_BindsPanel.CornerRadius = UDim.new(0, 21)
UICorner_BindsPanel.Parent = BindsPanel

BindsPanelTitle.Name = "BindsPanelTitle"
BindsPanelTitle.Parent = BindsPanel
BindsPanelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BindsPanelTitle.BackgroundTransparency = 1.000
BindsPanelTitle.BorderSizePixel = 0
BindsPanelTitle.Position = UDim2.new(0, 0, 0, 0)
BindsPanelTitle.Size = UDim2.new(1, 0, 0, 36)
BindsPanelTitle.Font = Enum.Font.SourceSansSemibold
BindsPanelTitle.Text = "Бинды"
BindsPanelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
BindsPanelTitle.TextSize = 18.000

FlightSpeedTextBox.Name = "FlightSpeedTextBox"
FlightSpeedTextBox.Parent = ClickGui
FlightSpeedTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FlightSpeedTextBox.BackgroundTransparency = 0.750
FlightSpeedTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlightSpeedTextBox.BorderSizePixel = 0
FlightSpeedTextBox.Position = UDim2.new(0.0432000011, 0, 0.745000005, 0)
FlightSpeedTextBox.Size = UDim2.new(0, 176, 0, 37)
FlightSpeedTextBox.Font = Enum.Font.SourceSans
FlightSpeedTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
FlightSpeedTextBox.Text = "Flight Speed: 50"
FlightSpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FlightSpeedTextBox.TextSize = 16.000

UICorner_13.CornerRadius = UDim.new(0, 9)
UICorner_13.Parent = FlightSpeedTextBox

SpeedTextBox.Name = "SpeedTextBox"
SpeedTextBox.Parent = ClickGui
SpeedTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpeedTextBox.BackgroundTransparency = 0.750
SpeedTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpeedTextBox.BorderSizePixel = 0
SpeedTextBox.Position = UDim2.new(0.35679999, 0, 0.745000005, 0)
SpeedTextBox.Size = UDim2.new(0, 176, 0, 37)
SpeedTextBox.Font = Enum.Font.SourceSans
SpeedTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SpeedTextBox.Text = "Speed: 16"
SpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedTextBox.TextSize = 16.000

UICorner_14.CornerRadius = UDim.new(0, 9)
UICorner_14.Parent = SpeedTextBox

FOVTextBox.Name = "FOVTextBox"
FOVTextBox.Parent = ClickGui
FOVTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FOVTextBox.BackgroundTransparency = 0.750
FOVTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
FOVTextBox.BorderSizePixel = 0
FOVTextBox.Position = UDim2.new(0.671999991, 0, 0.745000005, 0)
FOVTextBox.Size = UDim2.new(0, 176, 0, 37)
FOVTextBox.Font = Enum.Font.SourceSans
FOVTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
FOVTextBox.Text = "FOV: 100"
FOVTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVTextBox.TextSize = 16.000

UICorner_15.CornerRadius = UDim.new(0, 9)
UICorner_15.Parent = FOVTextBox

PredictTextBox.Name = "PredictTextBox"
PredictTextBox.Parent = ClickGui
PredictTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PredictTextBox.BackgroundTransparency = 0.750
PredictTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
PredictTextBox.BorderSizePixel = 0
PredictTextBox.Position = UDim2.new(0.357712507, 0, 0.610000014, 0)
PredictTextBox.Size = UDim2.new(0, 176, 0, 37)
PredictTextBox.Font = Enum.Font.SourceSans
PredictTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
PredictTextBox.Text = "Predict: 0.1"
PredictTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PredictTextBox.TextSize = 16.000
PredictTextBox.Visible = false

UICorner_Predict.CornerRadius = UDim.new(0, 9)
UICorner_Predict.Parent = PredictTextBox

SmoothTextBox.Name = "SmoothTextBox"
SmoothTextBox.Parent = ClickGui
SmoothTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SmoothTextBox.BackgroundTransparency = 0.750
SmoothTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
SmoothTextBox.BorderSizePixel = 0
SmoothTextBox.Position = UDim2.new(0.671999991, 0, 0.610000014, 0)
SmoothTextBox.Size = UDim2.new(0, 176, 0, 37)
SmoothTextBox.Font = Enum.Font.SourceSans
SmoothTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SmoothTextBox.Text = "Smooth: 0.25"
SmoothTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothTextBox.TextSize = 16.000

UICorner_Smooth.CornerRadius = UDim.new(0, 9)
UICorner_Smooth.Parent = SmoothTextBox

-- Scripts:

local function NBFQY_fake_script() -- UIGradient.RotateScript 
	local script = Instance.new('LocalScript', UIGradient)

	local UICorner = script.Parent
	local RunService = game:GetService("RunService")
	
	-- Настройки анимации
	local config = {
		rotationSpeed = 360,    -- градусов в секунду
		maxRotation = 180,      -- максимальное вращение
		minRotation = -180      -- минимальное вращение
	}
	
	local currentRotation = config.minRotation
	
	RunService.Heartbeat:Connect(function(deltaTime)
		-- Увеличиваем вращение
		currentRotation = currentRotation + (config.rotationSpeed * deltaTime)
	
		-- Проверяем границы
		if currentRotation >= config.maxRotation then
			currentRotation = config.minRotation
		end
	
		-- Применяем вращение
		UICorner.Rotation = currentRotation
	end)
end
coroutine.wrap(NBFQY_fake_script)()
local function LCLUZ_fake_script() -- Time.TimeScript 
	local script = Instance.new('LocalScript', Time)

	local TextLabel = script.Parent -- Предполагаем, что скрипт находится внутри TextLabel
	
	local function updateTime()
		-- Получаем текущее время
		local currentTime = os.date("*t")
	
		-- Форматируем время: добавляем ведущий ноль если нужно
		local hours = currentTime.hour
		local minutes = currentTime.min
	
		-- Преобразуем в строки и добавляем ведущие нули
		local hoursStr = string.format("%02d", hours)
		local minutesStr = string.format("%02d", minutes)
	
		-- Устанавливаем текст в формате "ЧЧ:ММ"
		TextLabel.Text = hoursStr .. ":" .. minutesStr
	end
	
	-- Обновляем время сразу при запуске
	updateTime()
	
	-- Создаем цикл для обновления времени каждую минуту
	while true do
		wait(60) -- Ждем 60 секунд (1 минуту)
		updateTime()
	end
end
coroutine.wrap(LCLUZ_fake_script)()
local function HBEJ_fake_script() -- Ping.PingScript 
	local script = Instance.new('LocalScript', Ping)

	local TextLabel = script.Parent
	local RunService = game:GetService("RunService")
	
	local function getPing()
		local success, ping = pcall(function()
			return math.floor(game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
		end)
	
		return success and ping or 0
	end
	
	local function updatePing()
		local ping = getPing()
	
		-- Цветовая индикация
		local color
		if ping < 60 then
			color = Color3.fromRGB(76, 255, 0)    -- Отлично
		elseif ping < 120 then
			color = Color3.fromRGB(255, 255, 0)   -- Хорошо
		elseif ping < 180 then
			color = Color3.fromRGB(255, 165, 0)   -- Средне
		else
			color = Color3.fromRGB(255, 0, 0)     -- Плохо
		end
	
		TextLabel.Text = "" .. ping .. " ms"
	end
	
	-- Плавное обновление
	RunService.Heartbeat:Connect(function()
		updatePing()
	end)
end
coroutine.wrap(HBEJ_fake_script)()
local function ZQNNIZB_fake_script() -- ClientID.ClientIDGenerate 
	local script = Instance.new('LocalScript', ClientID)

	local textLabel = script.Parent -- Замените на путь к вашему TextLabel
	
	-- Функция для генерации случайного ID
	local function generateRandomID()
		local length = math.random(10, 20) -- Длина от 10 до 20 символов
		local characters = "0123456789"
		local result = ""
	
		for i = 1, length do
			local randomIndex = math.random(1, #characters)
			result = result .. string.sub(characters, randomIndex, randomIndex)
		end
	
		return "ID: " .. result
	end
	
	-- Устанавливаем текст
	textLabel.Text = generateRandomID()
end
coroutine.wrap(ZQNNIZB_fake_script)()
local function KJPX_fake_script() -- ClickGui.OpenGUI 
	local script = Instance.new('LocalScript', ClickGui)

	local clickGui = script.Parent
	local UserInputService = game:GetService("UserInputService")
	
	-- Начальное состояние (скрыто)
	clickGui.Visible = false
	
	-- Функция для обработки нажатия клавиши
	local function onInput(input, gameProcessed)
		if gameProcessed then return end -- Игнорируем, если игра обрабатывает ввод
	
		-- Проверяем нажатие Right Shift
		if input.KeyCode == Enum.KeyCode.RightShift then
			-- Переключаем видимость
			local newVisibility = not clickGui.Visible
			clickGui.Visible = newVisibility
			-- Обновляем видимость панели друзей (ищем напрямую в HexagonGui)
			local friendsPanel = HexagonGui:FindFirstChild("FriendsPanel")
			if friendsPanel then
				friendsPanel.Visible = newVisibility
			end
			-- Обновляем видимость панели биндов
			local bindsPanel = HexagonGui:FindFirstChild("BindsPanel")
			if bindsPanel then
				bindsPanel.Visible = newVisibility
			end
		end
	end
	
	-- Подключаем обработчик ввода
	UserInputService.InputBegan:Connect(onInput)
end
coroutine.wrap(KJPX_fake_script)()

-- Friends Panel (will be initialized in main features)
local friendsPanelData = nil

-- Main features script (Aimbot, ESP, Flight, Noclip, Phase, Tracers, FOV)
local function HEXAGON_MainFeatures()
    -- Services
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    -- Shortcuts
    local localPlayer = Players.LocalPlayer
    local camera = workspace.CurrentCamera
    local defaultCameraFov = (camera and camera.FieldOfView) or 120
    local screenGui = HexagonGui

    -- ============================
    -- Friends Panel
    -- ============================
    local function createFriendsPanel()
        -- Создание панели друзей
        local FriendsPanel = Instance.new("Frame")
        FriendsPanel.Name = "FriendsPanel"
        FriendsPanel.Parent = screenGui
        FriendsPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        FriendsPanel.BackgroundTransparency = 0.1
        FriendsPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        FriendsPanel.BorderSizePixel = 0
        FriendsPanel.Size = UDim2.new(0, 240, 0, 430)
        FriendsPanel.Position = UDim2.new(0.346085399, -257, 0.33022067, 8)
        FriendsPanel.Visible = false
        FriendsPanel.ZIndex = 2
        
        local FriendsPanelCorner = Instance.new("UICorner")
        FriendsPanelCorner.CornerRadius = UDim.new(0, 21)
        FriendsPanelCorner.Parent = FriendsPanel
        
        -- Заголовок панели
        local FriendsTitle = Instance.new("TextLabel")
        FriendsTitle.Name = "FriendsTitle"
        FriendsTitle.Parent = FriendsPanel
        FriendsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FriendsTitle.BackgroundTransparency = 1.000
        FriendsTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        FriendsTitle.BorderSizePixel = 0
        FriendsTitle.Position = UDim2.new(0, 0, 0, 0)
        FriendsTitle.Size = UDim2.new(1, 0, 0, 38)
        FriendsTitle.Font = Enum.Font.SourceSansSemibold
        FriendsTitle.Text = "Друзья"
        FriendsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        FriendsTitle.TextSize = 18.000
        
        -- Список друзей (ScrollingFrame)
        local FriendsList = Instance.new("ScrollingFrame")
        FriendsList.Name = "FriendsList"
        FriendsList.Parent = FriendsPanel
        FriendsList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        FriendsList.BackgroundTransparency = 0.2
        FriendsList.BorderSizePixel = 0
        FriendsList.Position = UDim2.new(0, 10, 0, 42)
        FriendsList.Size = UDim2.new(1, -20, 0, 240)
        FriendsList.CanvasSize = UDim2.new(0, 0, 0, 0)
        FriendsList.ScrollBarThickness = 4
        
        local FriendsListCorner = Instance.new("UICorner")
        FriendsListCorner.CornerRadius = UDim.new(0, 8)
        FriendsListCorner.Parent = FriendsList
        
        -- Поле для добавления друга
        local AddFriendFrame = Instance.new("Frame")
        AddFriendFrame.Name = "AddFriendFrame"
        AddFriendFrame.Parent = FriendsPanel
        AddFriendFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        AddFriendFrame.BackgroundTransparency = 0.2
        AddFriendFrame.BorderSizePixel = 0
        AddFriendFrame.Position = UDim2.new(0, 10, 0, 292)
        AddFriendFrame.Size = UDim2.new(1, -20, 0, 128)
        
        local AddFriendCorner = Instance.new("UICorner")
        AddFriendCorner.CornerRadius = UDim.new(0, 8)
        AddFriendCorner.Parent = AddFriendFrame
        
        local AddFriendTextBox = Instance.new("TextBox")
        AddFriendTextBox.Name = "AddFriendTextBox"
        AddFriendTextBox.Parent = AddFriendFrame
        AddFriendTextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        AddFriendTextBox.BackgroundTransparency = 0.4
        AddFriendTextBox.BorderSizePixel = 0
        AddFriendTextBox.Position = UDim2.new(0, 8, 0, 8)
        AddFriendTextBox.Size = UDim2.new(1, -16, 0, 32)
        AddFriendTextBox.Font = Enum.Font.SourceSans
        AddFriendTextBox.PlaceholderText = "Имя игрока"
        AddFriendTextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
        AddFriendTextBox.Text = ""
        AddFriendTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        AddFriendTextBox.TextSize = 15
        
        local AddFriendTextBoxCorner = Instance.new("UICorner")
        AddFriendTextBoxCorner.CornerRadius = UDim.new(0, 6)
        AddFriendTextBoxCorner.Parent = AddFriendTextBox
        
        local AddFriendButton = Instance.new("TextButton")
        AddFriendButton.Name = "AddFriendButton"
        AddFriendButton.Parent = AddFriendFrame
        AddFriendButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        AddFriendButton.BorderSizePixel = 0
        AddFriendButton.Position = UDim2.new(0, 8, 0, 48)
        AddFriendButton.Size = UDim2.new(1, -16, 0, 32)
        AddFriendButton.Font = Enum.Font.SourceSansSemibold
        AddFriendButton.Text = "Добавить"
        AddFriendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        AddFriendButton.TextSize = 15
        
        local AddFriendButtonCorner = Instance.new("UICorner")
        AddFriendButtonCorner.CornerRadius = UDim.new(0, 6)
        AddFriendButtonCorner.Parent = AddFriendButton
        
        local ColorPickerButton = Instance.new("TextButton")
        ColorPickerButton.Name = "ColorPickerButton"
        ColorPickerButton.Parent = AddFriendFrame
        ColorPickerButton.BackgroundColor3 = Color3.fromRGB(120, 0, 215)
        ColorPickerButton.BorderSizePixel = 0
        ColorPickerButton.Position = UDim2.new(0, 8, 0, 88)
        ColorPickerButton.Size = UDim2.new(1, -16, 0, 32)
        ColorPickerButton.Font = Enum.Font.SourceSansSemibold
        ColorPickerButton.Text = "Выбрать цвет ESP"
        ColorPickerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ColorPickerButton.TextSize = 15
        
        local ColorPickerButtonCorner = Instance.new("UICorner")
        ColorPickerButtonCorner.CornerRadius = UDim.new(0, 6)
        ColorPickerButtonCorner.Parent = ColorPickerButton
        
        -- Переменные
        local friendsList = {}
        local selectedFriendColor = Color3.fromRGB(0, 255, 0) -- Зеленый по умолчанию
        local onFriendsChanged = nil -- callback при изменении списка
        
        -- Функция для обновления списка друзей
        local function updateFriendsList()
            local yOffset = 0
            local itemHeight = 30
            
            -- Очищаем текущий список
            for _, child in ipairs(FriendsList:GetChildren()) do
                if child:IsA("Frame") then
                    child:Destroy()
                end
            end
            
            -- Добавляем друзей в список
            for friendName, friendData in pairs(friendsList) do
                local friendItem = Instance.new("Frame")
                friendItem.Name = friendName
                friendItem.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                friendItem.BackgroundTransparency = 0.3
                friendItem.BorderSizePixel = 0
                friendItem.Position = UDim2.new(0, 0, 0, yOffset)
                friendItem.Size = UDim2.new(1, 0, 0, itemHeight)
                
                local friendItemCorner = Instance.new("UICorner")
                friendItemCorner.CornerRadius = UDim.new(0, 4)
                friendItemCorner.Parent = friendItem
                
                local friendNameLabel = Instance.new("TextLabel")
                friendNameLabel.Name = "Name"
                friendNameLabel.Parent = friendItem
                friendNameLabel.BackgroundTransparency = 1
                friendNameLabel.Position = UDim2.new(0.05, 0, 0, 0)
                friendNameLabel.Size = UDim2.new(0.6, 0, 1, 0)
                friendNameLabel.Font = Enum.Font.SourceSans
                friendNameLabel.Text = friendName
                friendNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                friendNameLabel.TextSize = 14
                friendNameLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                local colorPreview = Instance.new("Frame")
                colorPreview.Name = "ColorPreview"
                colorPreview.Parent = friendItem
                colorPreview.BackgroundColor3 = friendData.color
                colorPreview.BorderSizePixel = 0
                colorPreview.Position = UDim2.new(0.68, 0, 0.2, 0)
                colorPreview.Size = UDim2.new(0.1, 0, 0.6, 0)
                
                local colorPreviewCorner = Instance.new("UICorner")
                colorPreviewCorner.CornerRadius = UDim.new(0, 2)
                colorPreviewCorner.Parent = colorPreview
                
                local removeButton = Instance.new("TextButton")
                removeButton.Name = "Remove"
                removeButton.Parent = friendItem
                removeButton.BackgroundColor3 = Color3.fromRGB(215, 0, 0)
                removeButton.BorderSizePixel = 0
                removeButton.Position = UDim2.new(0.82, 0, 0.2, 0)
                removeButton.Size = UDim2.new(0.15, 0, 0.6, 0)
                removeButton.Font = Enum.Font.SourceSansSemibold
                removeButton.Text = "✕"
                removeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                removeButton.TextSize = 14
                
                local removeButtonCorner = Instance.new("UICorner")
                removeButtonCorner.CornerRadius = UDim.new(0, 2)
                removeButtonCorner.Parent = removeButton
                
                -- Обработчик удаления друга
                removeButton.MouseButton1Click:Connect(function()
                    friendsList[friendName] = nil
                    updateFriendsList()
                    -- ESP будет обновлен автоматически через функцию updateESP, которая использует getTeamColor
                end)
                
                friendItem.Parent = FriendsList
                yOffset = yOffset + itemHeight + 5
            end
            
            -- Обновляем размер канваса
            FriendsList.CanvasSize = UDim2.new(0, 0, 0, yOffset)
            -- Уведомляем об изменении
            if onFriendsChanged then
                onFriendsChanged()
            end
        end
        
        -- Функция для добавления друга
        local function addFriend(playerName)
            if friendsList[playerName] then
                return -- Уже добавлен
            end
            
            -- Проверяем, существует ли игрок
            local playerExists = false
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Name == playerName then
                    playerExists = true
                    break
                end
            end
            
            if playerExists then
                friendsList[playerName] = {
                    color = selectedFriendColor
                }
                updateFriendsList()
                -- ESP будет обновлен автоматически через функцию updateESP, которая использует getTeamColor
                AddFriendTextBox.Text = ""
            else
                AddFriendTextBox.Text = "Игрок не найден"
                task.wait(1)
                AddFriendTextBox.Text = ""
            end
        end
        
        -- Обработчик кнопки добавления
        AddFriendButton.MouseButton1Click:Connect(function()
            local playerName = AddFriendTextBox.Text
            if playerName and #playerName > 0 then
                addFriend(playerName)
            end
        end)
        
        -- Обработчик Enter в текстовом поле
        AddFriendTextBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                local playerName = AddFriendTextBox.Text
                if playerName and #playerName > 0 then
                    addFriend(playerName)
                end
            end
        end)
        
        -- Выбор цвета
        ColorPickerButton.MouseButton1Click:Connect(function()
            local colorPicker = Instance.new("Frame")
            colorPicker.Name = "ColorPicker"
            colorPicker.Parent = FriendsPanel
            colorPicker.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            colorPicker.BackgroundTransparency = 0.1
            colorPicker.BorderSizePixel = 0
            colorPicker.Position = UDim2.new(1.1, 0, 0, 0)
            colorPicker.Size = UDim2.new(0, 150, 0, 150)
            colorPicker.ZIndex = 10
            
            local colorPickerCorner = Instance.new("UICorner")
            colorPickerCorner.CornerRadius = UDim.new(0, 8)
            colorPickerCorner.Parent = colorPicker
            
            -- Предопределенные цвета
            local colors = {
                Color3.fromRGB(0, 255, 0),    -- Зеленый
                Color3.fromRGB(0, 200, 255),  -- Голубой
                Color3.fromRGB(255, 255, 0),  -- Желтый
                Color3.fromRGB(255, 150, 0),  -- Оранжевый
                Color3.fromRGB(255, 0, 255),  -- Розовый
                Color3.fromRGB(150, 0, 255),  -- Фиолетовый
                Color3.fromRGB(255, 0, 0),    -- Красный
                Color3.fromRGB(0, 255, 255)   -- Бирюзовый
            }
            
            -- Создание цветных кнопок
            local buttonSize = 30
            local spacing = 5
            local columns = 3
            
            for i, color in ipairs(colors) do
                local colorButton = Instance.new("TextButton")
                colorButton.Name = "Color_" .. i
                colorButton.Parent = colorPicker
                colorButton.BackgroundColor3 = color
                colorButton.BorderSizePixel = 0
                colorButton.Position = UDim2.new(
                    0, spacing + ((i-1) % columns) * (buttonSize + spacing),
                    0, spacing + math.floor((i-1) / columns) * (buttonSize + spacing)
                )
                colorButton.Size = UDim2.new(0, buttonSize, 0, buttonSize)
                colorButton.Text = ""
                
                local colorButtonCorner = Instance.new("UICorner")
                colorButtonCorner.CornerRadius = UDim.new(0, 4)
                colorButtonCorner.Parent = colorButton
                
                -- Выделение выбранного цвета
                if color == selectedFriendColor then
                    local selection = Instance.new("Frame")
                    selection.Name = "Selection"
                    selection.Parent = colorButton
                    selection.BackgroundTransparency = 1
                    selection.BorderColor3 = Color3.fromRGB(255, 255, 255)
                    selection.BorderSizePixel = 2
                    selection.Size = UDim2.new(1, 4, 1, 4)
                    selection.Position = UDim2.new(-0.15, 0, -0.15, 0)
                    
                    local selectionCorner = Instance.new("UICorner")
                    selectionCorner.CornerRadius = UDim.new(0, 6)
                    selectionCorner.Parent = selection
                end
                
                -- Обработчик выбора цвета
                colorButton.MouseButton1Click:Connect(function()
                    selectedFriendColor = color
                    
                    -- Обновляем цвет всех существующих друзей
                    for name, data in pairs(friendsList) do
                        data.color = selectedFriendColor
                    end
                    
                    -- Обновляем выделение
                    for _, child in ipairs(colorPicker:GetChildren()) do
                        if child:IsA("TextButton") then
                            local selection = child:FindFirstChild("Selection")
                            if selection then
                                selection:Destroy()
                            end
                            
                            if child.BackgroundColor3 == selectedFriendColor then
                                local newSelection = Instance.new("Frame")
                                newSelection.Name = "Selection"
                                newSelection.Parent = child
                                newSelection.BackgroundTransparency = 1
                                newSelection.BorderColor3 = Color3.fromRGB(255, 255, 255)
                                newSelection.BorderSizePixel = 2
                                newSelection.Size = UDim2.new(1, 4, 1, 4)
                                newSelection.Position = UDim2.new(-0.15, 0, -0.15, 0)
                                
                                local selectionCorner = Instance.new("UICorner")
                                selectionCorner.CornerRadius = UDim.new(0, 6)
                                selectionCorner.Parent = newSelection
                            end
                        end
                    end
                    
                    -- Обновляем кнопку выбора цвета
                    ColorPickerButton.BackgroundColor3 = selectedFriendColor
                    
                    -- Обновляем список и триггерим ESP refresh
                    updateFriendsList()
                end)
            end
            
            -- Кнопка закрытия
            local closeButton = Instance.new("TextButton")
            closeButton.Name = "CloseButton"
            closeButton.Parent = colorPicker
            closeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            closeButton.BorderSizePixel = 0
            closeButton.Position = UDim2.new(0, spacing, 1, -buttonSize - spacing)
            closeButton.Size = UDim2.new(1, -spacing*2, 0, buttonSize)
            closeButton.Font = Enum.Font.SourceSansSemibold
            closeButton.Text = "Закрыть"
            closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            closeButton.TextSize = 14
            
            local closeButtonCorner = Instance.new("UICorner")
            closeButtonCorner.CornerRadius = UDim.new(0, 4)
            closeButtonCorner.Parent = closeButton
            
            -- Функция закрытия
            local function closeColorPicker()
                colorPicker:Destroy()
            end
            
            closeButton.MouseButton1Click:Connect(closeColorPicker)
            
            -- Закрытие при клике вне панели
            local connection
            connection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local mousePos = UserInputService:GetMouseLocation()
                    local pickerPos = colorPicker.AbsolutePosition
                    local pickerSize = colorPicker.AbsoluteSize
                    
                    if not (mousePos.X >= pickerPos.X and mousePos.X <= pickerPos.X + pickerSize.X and
                           mousePos.Y >= pickerPos.Y and mousePos.Y <= pickerPos.Y + pickerSize.Y) then
                        closeColorPicker()
                        connection:Disconnect()
                    end
                end
            end)
        end)
        
        -- Функция проверки, является ли игрок другом
        local function isPlayerFriend(player)
            return friendsList[player.Name] ~= nil
        end
        
        -- Функция получения цвета для друга
        local function getFriendColor(player)
            local friendData = friendsList[player.Name]
            if friendData then
                return friendData.color
            end
            return nil
        end
        
        -- Возвращаем функции для использования в основном скрипте
        return {
            panel = FriendsPanel,
            isPlayerFriend = isPlayerFriend,
            getFriendColor = getFriendColor,
            friendsList = friendsList,
            setOnFriendsChanged = function(cb) onFriendsChanged = cb end
        }
    end

    -- UI references created above
    local aimButton = AimButton
    local aimFovButton = AimFovButton
    local raycastButton = RaycastButton
    local aimModeButton = AimModeButton
    local aimTypeButton = AimTypeButton
    local aimKeyButton = AimKeyButton
    local autoPredictButton = AutoPredictButton
    local predictTextBox = PredictTextBox
    local smoothTextBox = SmoothTextBox
    local espButton = ESPButton
    local flightButton = FlightButton
    local noclipButton = NoclipButton
    local phaseButton = PhaseButton
    local tracersButton = TracersButton
    local fakeLagButton = FakeLagButton
    local viewmodelButton = ViewmodelButton
    local viewmodelTextBox = ViewmodelTextBox
    local flightSpeedTextBox = FlightSpeedTextBox
    local speedTextBox = SpeedTextBox
    local fovTextBox = FOVTextBox

    -- Helpers
    local function parseNumber(text, defaultValue)
        local numberText = tostring(text or "")
        local value = tonumber(string.match(numberText, "[-%d%.]+"))
        if value == nil then return defaultValue end
        return value
    end

    local function getMousePosition()
        local pos = UserInputService:GetMouseLocation()
        return Vector2.new(pos.X, pos.Y)
    end

    local function getAimOrigin()
        if not camera then return Vector2.new(0, 0) end
        return getMousePosition()
    end

    -- ============================
    -- FOV Circle
    -- ============================
    local fovEnabled = false
    local fovRadius = parseNumber(fovTextBox.Text, 100)

    local fovCircle = Instance.new("Frame")
    fovCircle.Name = "FOVCircle"
    fovCircle.BackgroundTransparency = 1
    fovCircle.Size = UDim2.fromOffset(fovRadius * 2, fovRadius * 2)
    fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
    fovCircle.Position = UDim2.fromScale(0.5, 0.5)
    fovCircle.Visible = false
    fovCircle.Parent = screenGui

    local fovCorner = Instance.new("UICorner")
    fovCorner.CornerRadius = UDim.new(1, 0)
    fovCorner.Parent = fovCircle

    local fovStroke = Instance.new("UIStroke")
    fovStroke.Thickness = 1
    fovStroke.Color = Color3.fromRGB(255, 255, 255)
    fovStroke.Transparency = 0
    fovStroke.Parent = fovCircle

    local function updateFovRadius(newRadius)
        fovRadius = math.clamp(tonumber(newRadius) or 100, 10, 1000)
        fovCircle.Size = UDim2.fromOffset(fovRadius * 2, fovRadius * 2)
    end

    fovTextBox.FocusLost:Connect(function()
        local newVal = parseNumber(fovTextBox.Text, fovRadius)
        updateFovRadius(newVal)
        fovTextBox.Text = "FOV: " .. tostring(fovRadius)
    end)

    local function toggleFOV()
        fovEnabled = not fovEnabled
        fovCircle.Visible = fovEnabled
        aimFovButton.Text = fovEnabled and "Aimbot FOV [ВКЛ]" or "Aimbot FOV [ВЫКЛ]"
    end

    aimFovButton.MouseButton1Click:Connect(toggleFOV)

    RunService.RenderStepped:Connect(function()
        if fovEnabled then
            local pos = getMousePosition()
            fovCircle.Position = UDim2.fromOffset(pos.X, pos.Y)
        end
    end)

    -- ============================
    -- Speed (WalkSpeed) with constant tracking
    -- ============================
    local desiredWalkSpeed = parseNumber(speedTextBox.Text, 16)
    speedTextBox.Text = "Speed: " .. tostring(desiredWalkSpeed)
    local speedConnection

    local function applyWalkSpeedToCharacter(character)
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = desiredWalkSpeed
        end
    end

    local function setSpeed(speed)
        desiredWalkSpeed = speed
        applyWalkSpeedToCharacter(localPlayer.Character)
        if speedConnection then speedConnection:Disconnect() end
        speedConnection = RunService.Heartbeat:Connect(function()
            local character = localPlayer.Character
            if not character then return end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.WalkSpeed ~= desiredWalkSpeed then
                humanoid.WalkSpeed = desiredWalkSpeed
            end
        end)
    end

    speedTextBox.FocusLost:Connect(function()
        local newVal = parseNumber(speedTextBox.Text, desiredWalkSpeed)
        setSpeed(newVal)
        speedTextBox.Text = "Speed: " .. tostring(desiredWalkSpeed)
    end)

    localPlayer.CharacterAdded:Connect(function(char)
        task.wait(1)
        applyWalkSpeedToCharacter(char)
    end)

    -- ============================
    -- Flight
    -- ============================
    local flyEnabled = false
    local flySpeed = parseNumber(flightSpeedTextBox.Text, 50)
    flightSpeedTextBox.Text = "Flight Speed: " .. tostring(flySpeed)
    local flyConnection

    local function toggleFly()
        flyEnabled = not flyEnabled
        flightButton.Text = flyEnabled and "Flight [ВКЛ]" or "Flight [ВЫКЛ]"

        local character = localPlayer.Character
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not rootPart then return end

        if flyEnabled then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "Hex_FlyVelocity"
            bv.Parent = rootPart
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 0, 0)

            local bg = Instance.new("BodyGyro")
            bg.Name = "Hex_FlyGyro"
            bg.Parent = rootPart
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.P = 9e4
            bg.D = 100

            if flyConnection then flyConnection:Disconnect() end
            flyConnection = RunService.Heartbeat:Connect(function()
                local cam = workspace.CurrentCamera
                bg.CFrame = cam.CFrame
                local velocity = Vector3.new()
                local s = flySpeed
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    velocity += cam.CFrame.LookVector * s
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    velocity -= cam.CFrame.LookVector * s
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    velocity -= cam.CFrame.RightVector * s
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    velocity += cam.CFrame.RightVector * s
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    velocity += Vector3.new(0, s, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    velocity -= Vector3.new(0, s, 0)
                end
                bv.Velocity = velocity
            end)
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        else
            if flyConnection then flyConnection:Disconnect() flyConnection = nil end
            for _, child in ipairs((localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character.HumanoidRootPart:GetChildren()) or {}) do
                if child:IsA("BodyVelocity") or child:IsA("BodyGyro") then
                    child:Destroy()
                end
            end
            local humanoid2 = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid2 then humanoid2:ChangeState(Enum.HumanoidStateType.Running) end
        end
    end

    flightSpeedTextBox.FocusLost:Connect(function()
        local newVal = parseNumber(flightSpeedTextBox.Text, flySpeed)
        flySpeed = math.clamp(newVal, 5, 10000)
        flightSpeedTextBox.Text = "Flight Speed: " .. tostring(flySpeed)
    end)

    flightButton.MouseButton1Click:Connect(toggleFly)

    -- Hotkey: X toggles Flight
    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Enum.KeyCode.X then
            toggleFly()
        end
    end)

    -- ============================
    -- Noclip
    -- ============================
    local noclipEnabled = false
    local originalCollideStates = {}

    local function applyNoclipToCharacter(character)
        if not character then return end
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                if originalCollideStates[part] == nil then
                    originalCollideStates[part] = part.CanCollide
                end
                part.CanCollide = false
            end
        end
    end

    local function restoreCollideStates()
        for part, state in pairs(originalCollideStates) do
            if part and part.Parent then
                part.CanCollide = state
            end
        end
        originalCollideStates = {}
    end

    local function toggleNoclip()
        noclipEnabled = not noclipEnabled
        noclipButton.Text = noclipEnabled and "Noclip [ВКЛ]" or "Noclip [ВЫКЛ]"
        if not noclipEnabled then
            restoreCollideStates()
        else
            if localPlayer.Character then applyNoclipToCharacter(localPlayer.Character) end
        end
    end

    noclipButton.MouseButton1Click:Connect(toggleNoclip)

    RunService.Stepped:Connect(function()
        if noclipEnabled and localPlayer.Character then
            applyNoclipToCharacter(localPlayer.Character)
        end
    end)

    -- ============================
    -- ESP
    -- ============================
    local function getTeamColor(plr)
        -- Проверяем, является ли игрок другом
        if friendsPanel and friendsPanel.isPlayerFriend(plr) then
            local friendColor = friendsPanel.getFriendColor(plr)
            if friendColor then
                return friendColor
            end
        end
        -- Обычный цвет команды
        if plr and plr.Team and plr.Team.TeamColor then
            return plr.Team.TeamColor.Color
        end
        return Color3.fromRGB(255, 0, 0)
    end

    local function getDistance(otherPlayer)
        local lc = localPlayer.Character
        local tc = otherPlayer and otherPlayer.Character
        if lc and tc and lc:FindFirstChild("HumanoidRootPart") and tc:FindFirstChild("HumanoidRootPart") then
            return math.floor((lc.HumanoidRootPart.Position - tc.HumanoidRootPart.Position).Magnitude)
        end
        return 0
    end

    local function getHealth(otherPlayer)
        local c = otherPlayer and otherPlayer.Character
        if c then
            local h = c:FindFirstChildOfClass("Humanoid")
            if h then return math.floor(h.Health) end
        end
        return 0
    end

    local espEnabled = false
    local espUpdateConnection
    local espFolders = {}

    -- Создаем панель друзей после определения espFolders
    local friendsPanel = createFriendsPanel()
    friendsPanelData = friendsPanel

    -- Пересоздаём ESP для всех игроков при изменении списка друзей
    friendsPanel.setOnFriendsChanged(function()
        if not espEnabled then return end
        for plr, folder in pairs(espFolders) do
            folder:Destroy()
            espFolders[plr] = nil
        end
        espFolders = {}
        for _, other in ipairs(Players:GetPlayers()) do
            if other ~= localPlayer and other.Character then
                createESP(other)
            end
        end
    end)

    local function createESP(targetPlayer)
        if not targetPlayer or not targetPlayer.Character then return end
        if espFolders[targetPlayer] then
            espFolders[targetPlayer]:Destroy()
            espFolders[targetPlayer] = nil
        end

        local folder = Instance.new("Folder")
        folder.Name = "ESP_" .. targetPlayer.Name
        folder.Parent = screenGui
        espFolders[targetPlayer] = folder

        local highlight = Instance.new("Highlight")
        highlight.Name = "Highlight"
        highlight.FillColor = getTeamColor(targetPlayer)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.Parent = folder

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESPInfo"
        billboard.Size = UDim2.new(0, 200, 0, 100)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = folder

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "Name"
        nameLabel.Size = UDim2.new(1, 0, 0.3, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = targetPlayer.Name
        nameLabel.TextColor3 = getTeamColor(targetPlayer)
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Parent = billboard

        local healthLabel = Instance.new("TextLabel")
        healthLabel.Name = "Health"
        healthLabel.Size = UDim2.new(1, 0, 0.3, 0)
        healthLabel.Position = UDim2.new(0, 0, 0.3, 0)
        healthLabel.BackgroundTransparency = 1
        healthLabel.Text = "HP: " .. getHealth(targetPlayer)
        healthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        healthLabel.TextSize = 14
        healthLabel.Font = Enum.Font.Gotham
        healthLabel.Parent = billboard

        local distanceLabel = Instance.new("TextLabel")
        distanceLabel.Name = "Distance"
        distanceLabel.Size = UDim2.new(1, 0, 0.3, 0)
        distanceLabel.Position = UDim2.new(0, 0, 0.6, 0)
        distanceLabel.BackgroundTransparency = 1
        distanceLabel.Text = tostring(getDistance(targetPlayer)) .. "m"
        distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        distanceLabel.TextSize = 14
        distanceLabel.Font = Enum.Font.Gotham
        distanceLabel.Parent = billboard

        local teamLabel = Instance.new("TextLabel")
        teamLabel.Name = "Team"
        teamLabel.Size = UDim2.new(1, 0, 0.3, 0)
        teamLabel.Position = UDim2.new(0, 0, 0.9, 0)
        teamLabel.BackgroundTransparency = 1
        teamLabel.Text = (targetPlayer.Team and targetPlayer.Team.Name) or "No Team"
        teamLabel.TextColor3 = getTeamColor(targetPlayer)
        teamLabel.TextSize = 14
        teamLabel.Font = Enum.Font.Gotham
        teamLabel.Parent = billboard

        highlight.Adornee = targetPlayer.Character
        billboard.Adornee = targetPlayer.Character:FindFirstChild("Head") or targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    end

    local function updateESP()
        for plr, folder in pairs(espFolders) do
            if plr.Character and folder:FindFirstChild("ESPInfo") then
                local espInfo = folder.ESPInfo
                local healthLabel = espInfo:FindFirstChild("Health")
                local distanceLabel = espInfo:FindFirstChild("Distance")
                local teamLabel = espInfo:FindFirstChild("Team")
                local nameLabel = espInfo:FindFirstChild("Name") -- Добавляем обновление имени
                local highlight = folder:FindFirstChild("Highlight")
                if healthLabel then healthLabel.Text = "HP: " .. getHealth(plr) end
                if distanceLabel then distanceLabel.Text = tostring(getDistance(plr)) .. "m" end
                if nameLabel then nameLabel.TextColor3 = getTeamColor(plr) end -- Обновляем цвет имени
                if teamLabel then
                    teamLabel.Text = (plr.Team and plr.Team.Name) or "No Team"
                    teamLabel.TextColor3 = getTeamColor(plr)
                end
                if highlight then highlight.FillColor = getTeamColor(plr) end
                if espInfo.Adornee and not espInfo.Adornee.Parent then
                    espInfo.Adornee = plr.Character:FindFirstChild("Head") or plr.Character:FindFirstChild("HumanoidRootPart")
                end
            elseif not plr.Character then
                folder:Destroy()
                espFolders[plr] = nil
            end
        end
    end

    local function toggleESP()
        espEnabled = not espEnabled
        espButton.Text = espEnabled and "ESP [ВКЛ]" or "ESP [ВЫКЛ]"
        if espEnabled then
            for _, other in ipairs(Players:GetPlayers()) do
                if other ~= localPlayer and other.Character then
                    createESP(other)
                    other.CharacterAdded:Connect(function()
                        task.wait(0.5)
                        if espEnabled then createESP(other) end
                    end)
                end
            end
            if espUpdateConnection then espUpdateConnection:Disconnect() end
            espUpdateConnection = RunService.Heartbeat:Connect(function()
                updateESP()
            end)
        else
            if espUpdateConnection then espUpdateConnection:Disconnect() espUpdateConnection = nil end
            for _, folder in pairs(espFolders) do
                folder:Destroy()
            end
            espFolders = {}
        end
    end

    espButton.MouseButton1Click:Connect(toggleESP)

    Players.PlayerAdded:Connect(function(newPlr)
        if not espEnabled then return end
        newPlr.CharacterAdded:Connect(function()
            task.wait(0.5)
            if espEnabled then createESP(newPlr) end
        end)
    end)

    Players.PlayerRemoving:Connect(function(remPlr)
        if espFolders[remPlr] then
            espFolders[remPlr]:Destroy()
            espFolders[remPlr] = nil
        end
    end)

    -- ============================
    -- Raycast visibility + best target part + Aimbot
    -- ============================
    local aimEnabled = false
    local aimMode = "hold" -- "hold", "always" или "mouse"
    local aimOnlyVisible = true
    local aimPrediction = 0.1
    local autoPredictEnabled = true -- Новая переменная для автопредикта
    local aimSmoothness = math.clamp(parseNumber(smoothTextBox.Text, 0.25), 0.01, 1)
    local aimMethod = "camera" -- "camera" (поворот камеры) или "mouse" (движение мыши)
    local aimHoldButton = "MouseButton1" -- или "MouseButton2"

    -- Функции для обновления интерфейса
    local function refreshAimModeButton()
        if aimModeButton then
            local modeText = "Hold"
            if aimMode == "always" then
                modeText = "Always"
            elseif aimMode == "mouse" then
                modeText = "Mouse"
            end
            aimModeButton.Text = "Aim Mode: " .. modeText
        end
    end

    local function refreshAimTypeButton()
        if aimTypeButton then
            local t = (aimMethod == "mouse") and "Mouse" or "Camera"
            aimTypeButton.Text = "Aim Type: " .. t
        end
    end

    local function refreshRaycastButton()
        if raycastButton then
            raycastButton.Text = aimOnlyVisible and "Raycast [ВКЛ]" or "Raycast [ВЫКЛ]"
        end
    end

    local function refreshAutoPredictButton()
        if autoPredictButton then
            autoPredictButton.Text = autoPredictEnabled and "AutoPredict [ВКЛ]" or "AutoPredict [ВЫКЛ]"
        end
    end

    local function refreshPredictTextBox()
        if predictTextBox then
            predictTextBox.Text = "Predict: " .. tostring(aimPrediction)
            predictTextBox.Visible = not autoPredictEnabled
        end
    end

    local function refreshSmoothTextBox()
        if smoothTextBox then
            smoothTextBox.Text = "Smooth: " .. tostring(aimSmoothness)
        end
    end

    local function refreshAimKeyButton()
        if aimKeyButton then
            aimKeyButton.Text = (aimHoldButton == "MouseButton1") and "Aim Key: LMB" or "Aim Key: RMB"
        end
    end

    -- Инициализация интерфейса
    refreshAimModeButton()
    refreshRaycastButton()
    refreshAutoPredictButton()
    refreshPredictTextBox()
    refreshSmoothTextBox()
    refreshAimKeyButton()
    refreshAimTypeButton()

    -- Функция для автоматического расчета предикта на основе пинга
    local function calculateAutoPrediction()
        local success, ping = pcall(function()
            return game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
        end)
        
        if success and ping then
            return math.clamp(ping * 0.8, 0.05, 0.3) -- Базовая формула, можно настроить
        else
            return 0.1 -- Значение по умолчанию
        end
    end

    -- Функция для получения текущего предикта
    local function getCurrentPrediction()
        if autoPredictEnabled then
            return calculateAutoPrediction()
        else
            return aimPrediction
        end
    end

    local function isVisibleFromCamera(worldPosition, ignoreList)
        if not camera then return false end
        local origin = camera.CFrame.Position
        local direction = (worldPosition - origin)
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = ignoreList or {}
        local result = workspace:Raycast(origin, direction, params)
        if not result then return true end
        return (result.Position - worldPosition).Magnitude < 1.0
    end

    -- Функция для получения лучшей части тела для прицеливания
    local function getBestTargetPart(character)
        if not character then return nil end
        local head = character:FindFirstChild("Head")
        
        -- Всегда целиться только в голову
        return head or character:FindFirstChild("HumanoidRootPart")
    end

    local function getClosestPlayer()
        local closestPlayer
        local shortestDistance = math.huge
        local originPos = getAimOrigin()
        
        for _, other in ipairs(Players:GetPlayers()) do
            -- Пропускаем друзей
            if friendsPanel and friendsPanel.isPlayerFriend(other) then
                -- Продолжаем цикл (игнорируем друзей)
            elseif other ~= localPlayer and other.Character then
                local humanoid = other.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    local targetPart = getBestTargetPart(other.Character)
                    if targetPart then
                        local screenVec, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                        if onScreen then
                            local distance = (originPos - Vector2.new(screenVec.X, screenVec.Y)).Magnitude
                            
                            -- Правильная проверка FOV
                            local inFovRange = true
                            if fovEnabled then
                                inFovRange = (distance <= fovRadius)
                            end

                            -- В режиме "mouse" прицельная зона берётся вокруг курсора,
                            -- а не по большому FOV кругу
                            if aimMode == "mouse" then
                                local mouseRadius = 50
                                inFovRange = (distance <= mouseRadius)
                            end
                            
                            if inFovRange then
                                local visibleOk = true
                                if aimOnlyVisible then
                                    visibleOk = isVisibleFromCamera(targetPart.Position, { localPlayer.Character })
                                end
                                if visibleOk and distance < shortestDistance then
                                    shortestDistance = distance
                                    closestPlayer = other
                                end
                            end
                        end
                    end
                end
            end
        end
        return closestPlayer
    end

    local aimActive = false
    local AIM_RENDERSTEP_NAME = "Hexagon_AimLoop"
    local aimLoopBound = false

    -- Mouse events for hold mode
    local aimMouseDownConn
    local aimMouseUpConn

    local function rebindAimHoldMouse()
        if aimMouseDownConn then aimMouseDownConn:Disconnect() end
        if aimMouseUpConn then aimMouseUpConn:Disconnect() end

        local mouse = localPlayer:GetMouse()
        if aimHoldButton == "MouseButton2" then
            aimMouseDownConn = mouse.Button2Down:Connect(function()
                if aimEnabled and (aimMode == "hold" or aimMode == "mouse") then
                    aimActive = true
                end
            end)
            aimMouseUpConn = mouse.Button2Up:Connect(function()
                if aimMode == "hold" or aimMode == "mouse" then
                    aimActive = false
                end
            end)
        else
            aimMouseDownConn = mouse.Button1Down:Connect(function()
                if aimEnabled and (aimMode == "hold" or aimMode == "mouse") then
                    aimActive = true
                end
            end)
            aimMouseUpConn = mouse.Button1Up:Connect(function()
                if aimMode == "hold" or aimMode == "mouse" then
                    aimActive = false
                end
            end)
        end
    end

    rebindAimHoldMouse()

    local function startAimLoop()
        if aimLoopBound then
            RunService:UnbindFromRenderStep(AIM_RENDERSTEP_NAME)
            aimLoopBound = false
        end

        aimLoopBound = true
        RunService:BindToRenderStep(AIM_RENDERSTEP_NAME, Enum.RenderPriority.Camera.Value + 1, function(dt)
            if not aimEnabled then return end
            local needAim = (aimMode == "always") or ((aimMode == "hold" or aimMode == "mouse") and aimActive)
            if not needAim then return end
            
            local targetPlayer = getClosestPlayer()
            if not targetPlayer or not targetPlayer.Character then return end
            
            local targetPart = getBestTargetPart(targetPlayer.Character)
            if not targetPart then return end
            
            local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")

            -- Используем текущий предикт (авто или ручной)
            local currentPrediction = getCurrentPrediction()
            local predicted = targetPart.Position + ((hrp and hrp.Velocity or Vector3.new()) * currentPrediction)

            local baseAlpha = math.clamp(aimSmoothness, 0.01, 1)
            local dtScaled = math.clamp((dt or (1 / 60)) * 60, 0, 5)
            local lerpAlpha = 1 - ((1 - baseAlpha) ^ dtScaled)
            lerpAlpha = math.clamp(lerpAlpha, 0.001, 1)

            if aimMethod == "mouse" and typeof(mousemoverel) == "function" then
                -- Aimbot через движение мыши
                local screenPos = camera:WorldToViewportPoint(predicted)
                local targetVec = Vector2.new(screenPos.X, screenPos.Y)
                local mousePos = UserInputService:GetMouseLocation()
                local currentVec = Vector2.new(mousePos.X, mousePos.Y)

                local distance = (targetVec - currentVec).Magnitude
                if distance < 3 then return end

                local smoothVec = currentVec:Lerp(targetVec, lerpAlpha)
                local delta = smoothVec - currentVec

                mousemoverel(delta.X, delta.Y)
            else
                -- Классический aimbot через поворот камеры
                local currentCFrame = camera.CFrame
                local targetCFrame = CFrame.lookAt(currentCFrame.Position, predicted)
                local dot = currentCFrame.LookVector:Dot(targetCFrame.LookVector)
                if dot > 0.999995 then
                    camera.CFrame = targetCFrame
                else
                    camera.CFrame = currentCFrame:Lerp(targetCFrame, lerpAlpha)
                end
            end
        end)
    end

    local function stopAimLoop()
        if aimLoopBound then
            RunService:UnbindFromRenderStep(AIM_RENDERSTEP_NAME)
            aimLoopBound = false
        end
    end

    local function toggleAim()
        aimEnabled = not aimEnabled
        aimButton.Text = aimEnabled and "Aimbot [ВКЛ]" or "Aimbot [ВЫКЛ]"
        if aimEnabled then startAimLoop() else stopAimLoop() aimActive = false end
    end

    aimButton.MouseButton1Click:Connect(toggleAim)

    -- Обработчики для кнопок
    if raycastButton then
        raycastButton.MouseButton1Click:Connect(function()
            aimOnlyVisible = not aimOnlyVisible
            refreshRaycastButton()
        end)
    end

    if aimModeButton then
        aimModeButton.MouseButton1Click:Connect(function()
            -- Цикл режимов: Hold -> Always -> Mouse -> Hold
            if aimMode == "hold" then
                aimMode = "always"
            elseif aimMode == "always" then
                aimMode = "mouse"
            else
                aimMode = "hold"
            end
            -- При смене режима сбрасываем активность удержания
            aimActive = false
            refreshAimModeButton()
        end)
    end

    if aimTypeButton then
        aimTypeButton.MouseButton1Click:Connect(function()
            aimMethod = (aimMethod == "camera") and "mouse" or "camera"
            refreshAimTypeButton()
        end)
    end

    if aimKeyButton then
        aimKeyButton.MouseButton1Click:Connect(function()
            aimHoldButton = (aimHoldButton == "MouseButton1") and "MouseButton2" or "MouseButton1"
            aimActive = false
            refreshAimKeyButton()
            rebindAimHoldMouse()
        end)
    end

    -- Обработчик для AutoPredict кнопки
    if autoPredictButton then
        autoPredictButton.MouseButton1Click:Connect(function()
            autoPredictEnabled = not autoPredictEnabled
            refreshAutoPredictButton()
            refreshPredictTextBox()
        end)
    end

    -- Обработчик для ручного ввода предикта
    if predictTextBox then
        predictTextBox.FocusLost:Connect(function()
            local newVal = parseNumber(predictTextBox.Text, aimPrediction)
            aimPrediction = math.clamp(tonumber(newVal) or 0.1, 0, 1) -- Ограничение от 0 до 1
            refreshPredictTextBox()
        end)
    end

    if smoothTextBox then
        smoothTextBox.FocusLost:Connect(function()
            local newVal = parseNumber(smoothTextBox.Text, aimSmoothness)
            aimSmoothness = math.clamp(tonumber(newVal) or aimSmoothness, 0.01, 1)
            refreshSmoothTextBox()
        end)
    end

-- ============================
-- Viewmodel - ЖЕСТКАЯ БЛОКИРОВКА
-- ============================
local viewmodelEnabled = false
local viewmodelFov = 120
local defaultCameraFov = camera and camera.FieldOfView or 70
local cameraMeta = nil

viewmodelTextBox.Text = "Viewmodel FOV: " .. tostring(viewmodelFov)
viewmodelTextBox.Visible = false

local function toggleViewmodel()
    viewmodelEnabled = not viewmodelEnabled
    viewmodelButton.Text = viewmodelEnabled and "Viewmodel [ВКЛ]" or "Viewmodel [ВЫКЛ]"
    
    if not camera then return end
    
    if viewmodelEnabled then
        -- Получаем метатаблицу
        cameraMeta = debug.getmetatable(camera) or {}
        
        -- Сохраняем оригинальные методы
        local oldNamecall = cameraMeta.__namecall
        local oldIndex = cameraMeta.__index
        local oldNewIndex = cameraMeta.__newindex
        
        -- Перехватываем все вызовы методов
        cameraMeta.__namecall = function(self, ...)
            local method = getnamecallmethod()
            if method == "SetFieldOfView" or method == "ChangeFieldOfView" then
                return -- Игнорируем
            end
            return oldNamecall and oldNamecall(self, ...) or nil
        end
        
        -- Перехватываем доступ к свойствам
        cameraMeta.__index = function(self, key)
            if key == "FieldOfView" then
                return viewmodelFov
            end
            return oldIndex and oldIndex(self, key) or rawget(self, key)
        end
        
        cameraMeta.__newindex = function(self, key, value)
            if key == "FieldOfView" then
                return -- Игнорируем
            end
            if oldNewIndex then
                oldNewIndex(self, key, value)
            else
                rawset(self, key, value)
            end
        end
        
        -- Устанавливаем метатаблицу
        debug.setmetatable(camera, cameraMeta)
        
        -- Устанавливаем начальное значение
        rawset(camera, "FieldOfView", viewmodelFov)
        
    else
        -- Восстанавливаем (просто сбрасываем метатаблицу)
        debug.setmetatable(camera, nil)
        camera.FieldOfView = defaultCameraFov
    end
end

viewmodelButton.MouseButton1Click:Connect(toggleViewmodel)

-- Очистка
screenGui.Destroying:Connect(function()
    if viewmodelEnabled and camera then
        debug.setmetatable(camera, nil)
        camera.FieldOfView = defaultCameraFov
    end
end)

-- ============================
-- Phase (Client-Side Free Camera Mode) - FIXED
-- ============================
local phaseEnabled = false
local phaseConnection
local phaseGhostModel
local phaseOriginalCFrame
local prevCameraType
local mouseSensitivity = 0.004
local baseMoveSpeed = 200
local moveSpeed = baseMoveSpeed
local sprintMultiplier = 3

-- Переменные для свободной камеры (клиентская)
local freeCam = {
    position = Vector3.new(),
    yaw = 0,
    pitch = 0
}

-- Создаем независимую камеру
local function setupFreeCamera()
    local currentCFrame = camera.CFrame
    freeCam.position = currentCFrame.Position
    
    local lookVector = currentCFrame.LookVector
    freeCam.yaw = math.atan2(-lookVector.X, -lookVector.Z)
    freeCam.pitch = math.asin(-lookVector.Y)
end

local function makeGhostFromCharacter(character)
    if not character then return nil end
    local ghost = Instance.new("Model")
    ghost.Name = "Hex_PhaseGhost"
    
    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            local clone = part:Clone()
            clone.Name = part.Name
            clone.Anchored = true
            clone.CanCollide = false
            clone.Transparency = 0.4
            clone.Material = Enum.Material.Neon
            clone.Color = Color3.fromRGB(100, 150, 255)
            
            local pointLight = Instance.new("PointLight")
            pointLight.Brightness = 0.8
            pointLight.Range = 8
            pointLight.Color = Color3.fromRGB(100, 150, 255)
            pointLight.Parent = clone
            
            clone.Parent = ghost
        end
    end
    
    ghost.Parent = workspace
    return ghost
end

local function positionGhost(ghost, targetCFrame)
    if not ghost then return end
    
    local character = localPlayer.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    for _, part in ipairs(ghost:GetChildren()) do
        if part:IsA("BasePart") then
            local realPart = character:FindFirstChild(part.Name)
            if realPart then
                local offset = realPart.CFrame:ToObjectSpace(rootPart.CFrame)
                part.CFrame = targetCFrame * offset
            else
                part.CFrame = targetCFrame
            end
        end
    end
end

local function updateGhostPulse(ghost)
    if not ghost then return end
    
    local pulse = tick() % 2
    local transparency = 0.3 + (math.sin(pulse * math.pi) * 0.2)
    
    for _, part in ipairs(ghost:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = transparency
            local light = part:FindFirstChildOfClass("PointLight")
            if light then
                light.Brightness = 0.5 + (math.sin(pulse * math.pi) * 0.3)
            end
        end
    end
end

-- ОСНОВНОЕ ИСПРАВЛЕНИЕ: Только клиентская камера, без движения персонажа
local function updateClientCamera(dt)
    -- Обновляем скорость
    moveSpeed = baseMoveSpeed
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        moveSpeed = baseMoveSpeed * sprintMultiplier
    end
    
    -- Вращение камеры мышью (только клиентская камера)
    local mouseDelta = UserInputService:GetMouseDelta()
    
    if mouseDelta.Magnitude > 0 then
        freeCam.yaw = freeCam.yaw - (mouseDelta.X * mouseSensitivity)
        freeCam.pitch = freeCam.pitch - (mouseDelta.Y * mouseSensitivity)
        
        freeCam.pitch = math.clamp(freeCam.pitch, math.rad(-89), math.rad(89))
    end
    
    -- Создаем CFrame для вращения камеры
    local rotation = CFrame.fromOrientation(freeCam.pitch, freeCam.yaw, 0)
    local lookVector = rotation.LookVector
    local rightVector = rotation.RightVector
    local upVector = Vector3.new(0, 1, 0)
    
    -- Движение камеры (только клиентская камера)
    local moveX = 0
    local moveY = 0
    local moveZ = 0
    
    -- Клавиши движения для КАМЕРЫ (не персонажа)
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        moveZ = moveZ + 1
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        moveZ = moveZ - 1
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        moveX = moveX - 1
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        moveX = moveX + 1
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        moveY = moveY + 1
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        moveY = moveY - 1
    end
    
    -- Преобразуем и применяем движение к КАМЕРЕ
    local moveVector = (lookVector * moveZ) + (rightVector * moveX) + (upVector * moveY)
    
    if moveVector.Magnitude > 0 then
        moveVector = moveVector.Unit * (moveSpeed * dt)
        freeCam.position = freeCam.position + moveVector
    end
    
    -- Устанавливаем камеру (только клиентская)
    camera.CFrame = CFrame.new(freeCam.position) * rotation
    
    -- ВОЗВРАЩАЕМ ТОЛЬКО ПОЗИЦИЮ КАМЕРЫ (не персонажа!)
    return freeCam.position
end

local function togglePhase()
    phaseEnabled = not phaseEnabled
    phaseButton.Text = phaseEnabled and "Phase [ВКЛ]" or "Phase [ВЫКЛ]"
    
    local character = localPlayer.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    if phaseEnabled then
        -- Сохраняем состояние
        phaseOriginalCFrame = rootPart.CFrame
        prevCameraType = camera.CameraType
        
        -- Настраиваем свободную камеру (клиентскую)
        setupFreeCamera()
        
        -- Создаем призрака
        if phaseGhostModel then 
            phaseGhostModel:Destroy() 
        end
        phaseGhostModel = makeGhostFromCharacter(character)
        positionGhost(phaseGhostModel, phaseOriginalCFrame)
        
        -- Фиксируем персонажа на сервере
        rootPart.Anchored = true
        rootPart.CanCollide = false
        
        -- Отключаем коллизии у всех частей
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        
        -- Отключаем физику персонажа
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end
        
        -- Останавливаем все BodyMovers
        for _, mover in ipairs(rootPart:GetChildren()) do
            if mover:IsA("BodyVelocity") or mover:IsA("BodyGyro") or mover:IsA("BodyForce") then
                mover:Destroy()
            end
        end
        
        -- Включаем скриптовую камеру (ТОЛЬКО КЛИЕНТ)
        camera.CameraType = Enum.CameraType.Scriptable
        
        -- Захватываем мышь для управления КАМЕРОЙ
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        UserInputService.MouseIconEnabled = false
        
        -- Сбрасываем скорость
        moveSpeed = baseMoveSpeed
        
        -- Запускаем цикл обновления КЛИЕНТСКОЙ КАМЕРЫ
        if phaseConnection then phaseConnection:Disconnect() end
        phaseConnection = RunService.Heartbeat:Connect(function(dt)
            -- Обновляем КЛИЕНТСКУЮ камеру (двигается только камера)
            updateClientCamera(dt)
            
            -- Обновляем призрака (на месте)
            if phaseGhostModel then
                updateGhostPulse(phaseGhostModel)
                positionGhost(phaseGhostModel, phaseOriginalCFrame)
            end
            
            -- Удерживаем персонажа на месте (на сервере)
            if rootPart and rootPart.Parent then
                rootPart.CFrame = phaseOriginalCFrame
                rootPart.Velocity = Vector3.new(0, 0, 0)
                rootPart.RotVelocity = Vector3.new(0, 0, 0)
            end
        end)
        
    else
        -- Выходим из режима Phase
        if phaseConnection then 
            phaseConnection:Disconnect() 
            phaseConnection = nil 
        end
        
        -- Восстанавливаем управление мышью
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        UserInputService.MouseIconEnabled = true
        
        -- Восстанавливаем персонажа
        local character = localPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.Anchored = false
                rootPart.CanCollide = true
                
                -- Восстанавливаем коллизии
                for _, part in ipairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
                
                -- Восстанавливаем humanoid
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = false
                    humanoid:ChangeState(Enum.HumanoidStateType.Running)
                end
                
                -- Телепортируем к текущей позиции КАМЕРЫ (клиентская телепортация)
                local lookVector = camera.CFrame.LookVector
                local yaw = math.atan2(-lookVector.X, -lookVector.Z)
                
                -- Плавная телепортация без проверки коллизий
                -- (позиция берется из freeCam.position, которая обновлялась в updateClientCamera)
                rootPart.CFrame = CFrame.new(freeCam.position) * CFrame.Angles(0, yaw, 0)
            end
        end
        
        -- Удаляем призрака
        if phaseGhostModel then 
            phaseGhostModel:Destroy() 
            phaseGhostModel = nil 
        end
        
        -- Восстанавливаем камеру
        camera.CameraType = prevCameraType or Enum.CameraType.Custom
        
        phaseOriginalCFrame = nil
        moveSpeed = baseMoveSpeed
    end
end

phaseButton.MouseButton1Click:Connect(togglePhase)

-- Hotkey: Z toggles Phase
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Z then
        togglePhase()
    end
end)

-- Очистка
localPlayer.CharacterAdded:Connect(function(character)
    if phaseEnabled then
        phaseEnabled = false
        phaseButton.Text = "Phase [ВЫКЛ]"
        
        if phaseConnection then 
            phaseConnection:Disconnect() 
            phaseConnection = nil 
        end
        
        if phaseGhostModel then 
            phaseGhostModel:Destroy() 
            phaseGhostModel = nil 
        end
        
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        UserInputService.MouseIconEnabled = true
        
        if camera then
            camera.CameraType = prevCameraType or Enum.CameraType.Custom
        end
        
        moveSpeed = baseMoveSpeed
    end
end)

-- ============================
-- FakeLag (Camera Desync)
-- ============================
local fakeLagEnabled = false
local fakeLagConnection = nil
local phantomPart = nil
local realPosition = nil

local function createPhantom()
    if phantomPart then
        phantomPart:Destroy()
    end
    
    local character = localPlayer.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    phantomPart = Instance.new("Part")
    phantomPart.Name = "Phantom"
    phantomPart.Size = Vector3.new(4, 5, 2)
    phantomPart.Transparency = 0.7
    phantomPart.Material = Enum.Material.Neon
    phantomPart.Color = Color3.fromRGB(255, 0, 0)
    phantomPart.CanCollide = false
    phantomPart.Anchored = true
    phantomPart.CFrame = hrp.CFrame
    phantomPart.Parent = workspace
    
    realPosition = hrp.CFrame
end

local function removePhantom()
    if phantomPart then
        phantomPart:Destroy()
        phantomPart = nil
    end
    realPosition = nil
end

local function toggleFakeLag()
    fakeLagEnabled = not fakeLagEnabled
    fakeLagButton.Text = fakeLagEnabled and "FakeLag [ВКЛ]" or "FakeLag [ВЫКЛ]"
    
    if fakeLagEnabled then
        createPhantom()
        
        if fakeLagConnection then fakeLagConnection:Disconnect() end
        
        fakeLagConnection = RunService.Heartbeat:Connect(function()
            if not localPlayer.Character then 
                removePhantom()
                return 
            end
            
            local hrp = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            -- Сохраняем реальную позицию игрока
            realPosition = hrp.CFrame
            
            -- Телепортируем HRP назад (это увидят другие игроки)
            hrp.CFrame = realPosition * CFrame.new(0, 0, -5) -- Отставание на 5 studs назад
            
            -- Фантом показывает где ты на самом деле
            if phantomPart then
                phantomPart.CFrame = realPosition
            end
        end)
    else
        if fakeLagConnection then 
            fakeLagConnection:Disconnect() 
            fakeLagConnection = nil 
        end
        
        -- Возвращаем персонажа на реальную позицию
        if realPosition and localPlayer.Character then
            local hrp = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = realPosition
            end
        end
        
        removePhantom()
    end
end

fakeLagButton.MouseButton1Click:Connect(toggleFakeLag)

-- Очистка
localPlayer.CharacterAdded:Connect(function()
    removePhantom()
    if fakeLagEnabled then
        fakeLagEnabled = false
        fakeLagButton.Text = "FakeLag [ВЫКЛ]"
        if fakeLagConnection then 
            fakeLagConnection:Disconnect() 
            fakeLagConnection = nil 
        end
    end
end)

localPlayer.CharacterRemoving:Connect(removePhantom)

-- ============================
-- Tracers module (inline implementation compatible with separate module)
-- ============================
local Tracers = {}
Tracers.__index = Tracers

function Tracers.new(parentGui)
    local self = setmetatable({}, Tracers)
    self.parentGui = parentGui
    self.enabled = false
    self.linesByPlayer = {}
    self.updateConn = nil
    local container = Instance.new("Frame")
    container.Name = "Hex_Tracers"
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.Size = UDim2.fromScale(1, 1)
    container.Position = UDim2.fromScale(0, 0)
    container.ZIndex = 60
    container.Parent = parentGui
    self.container = container
    return self
end

function Tracers:_getOrCreateLineFor(playerObj)
    local line = self.linesByPlayer[playerObj]
    if line and line.Parent then return line end
    
    -- Создаем линию как Frame
    local frame = Instance.new("Frame")
    frame.Name = "Tracer_" .. playerObj.Name
    frame.BackgroundColor3 = getTeamColor(playerObj)
    frame.BorderSizePixel = 0
    frame.AnchorPoint = Vector2.new(0.5, 0.5) -- Якорь в центре для правильного поворота
    frame.Size = UDim2.fromOffset(100, 2) -- Начальная длина
    frame.Position = UDim2.fromScale(0.5, 0.5) -- Позиция в центре экрана
    frame.BackgroundTransparency = 0
    frame.ZIndex = 61
    frame.Visible = false
    frame.Parent = self.container
    
    -- Добавляем стрелку на конце
    local arrow = Instance.new("Frame")
    arrow.Name = "Arrow"
    arrow.BackgroundColor3 = frame.BackgroundColor3
    arrow.BorderSizePixel = 0
    arrow.AnchorPoint = Vector2.new(0.5, 0.5)
    arrow.Size = UDim2.fromOffset(6, 6)
    arrow.Position = UDim2.fromScale(1, 0.5) -- Позиция на конце линии
    arrow.Rotation = 45 -- Поворот для создания стрелки
    arrow.ZIndex = 62
    arrow.Parent = frame
    
    self.linesByPlayer[playerObj] = frame
    return frame
end

function Tracers:_updateOnce()
    if not camera then 
        camera = workspace.CurrentCamera
        if not camera then return end
    end
    
    local viewport = camera.ViewportSize
    local centerPos = Vector2.new(viewport.X / 2, viewport.Y / 2)
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= localPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart
            local screenPoint, onScreen = camera:WorldToViewportPoint(hrp.Position)
            local line = self:_getOrCreateLineFor(plr)
            local arrow = line:FindFirstChild("Arrow")
            
            if onScreen then
                local endPos = Vector2.new(screenPoint.X, screenPoint.Y)
                local delta = endPos - centerPos
                local length = math.min(delta.Magnitude, viewport.X * 0.8) -- Ограничиваем максимальную длину
                
                -- Рассчитываем угол в радианах и градусах
                local angleRad = math.atan2(delta.Y, delta.X)
                local angleDeg = math.deg(angleRad)
                
                -- Обновляем линию
                line.Visible = true
                line.Rotation = angleDeg
                line.Size = UDim2.fromOffset(length, 2)
                line.Position = UDim2.fromOffset(centerPos.X, centerPos.Y)
                line.BackgroundColor3 = getTeamColor(plr)
                
                -- Обновляем стрелку
                if arrow then
                    arrow.BackgroundColor3 = getTeamColor(plr)
                end
            else
                -- Если игрок за пределами экрана, показываем линию к краю экрана
                local worldPos = hrp.Position
                local cameraPos = camera.CFrame.Position
                local direction = (worldPos - cameraPos).Unit
                
                -- Получаем точку на границе экрана
                local ray = Ray.new(cameraPos, direction * 1000)
                local point = workspace:FindPartOnRayWithIgnoreList(ray, {localPlayer.Character})
                
                if point then
                    local edgePoint, edgeOnScreen = camera:WorldToViewportPoint(point.Position)
                    if edgeOnScreen then
                        local endPos = Vector2.new(edgePoint.X, edgePoint.Y)
                        local delta = endPos - centerPos
                        local length = delta.Magnitude
                        local angleRad = math.atan2(delta.Y, delta.X)
                        local angleDeg = math.deg(angleRad)
                        
                        line.Visible = true
                        line.Rotation = angleDeg
                        line.Size = UDim2.fromOffset(length, 2)
                        line.Position = UDim2.fromOffset(centerPos.X, centerPos.Y)
                        line.BackgroundColor3 = getTeamColor(plr)
                        
                        if arrow then
                            arrow.BackgroundColor3 = getTeamColor(plr)
                        end
                    else
                        line.Visible = false
                    end
                else
                    line.Visible = false
                end
            end
        end
    end
    
    -- Очистка для игроков, которые вышли
    for trackedPlr, line in pairs(self.linesByPlayer) do
        if not trackedPlr.Parent or not Players:FindFirstChild(trackedPlr.Name) then
            if line then line:Destroy() end
            self.linesByPlayer[trackedPlr] = nil
        end
    end
end

function Tracers:enable()
    if self.enabled then return end
    self.enabled = true
    self.container.Visible = true
    
    if self.updateConn then 
        self.updateConn:Disconnect() 
    end
    
    self.updateConn = RunService.RenderStepped:Connect(function()
        self:_updateOnce()
    end)
end

function Tracers:disable()
    if not self.enabled then return end
    self.enabled = false
    
    if self.updateConn then 
        self.updateConn:Disconnect() 
        self.updateConn = nil 
    end
    
    self.container.Visible = false
    
    for _, line in pairs(self.linesByPlayer) do
        if line then 
            line.Visible = false 
        end
    end
end

function Tracers:destroy()
    self:disable()
    for _, line in pairs(self.linesByPlayer) do
        if line then line:Destroy() end
    end
    self.linesByPlayer = {}
    if self.container then self.container:Destroy() end
end

-- Инициализация трайсеров
local tracersObj = Tracers.new(screenGui)
local tracersEnabled = false

local function toggleTracers()
    tracersEnabled = not tracersEnabled
    tracersButton.Text = tracersEnabled and "Tracers [ВКЛ]" or "Tracers [ВЫКЛ]"
    if tracersEnabled then 
        tracersObj:enable() 
    else 
        tracersObj:disable() 
    end
end

tracersButton.MouseButton1Click:Connect(toggleTracers)

    -- ============================
    -- Панель биндов
    -- ============================
    local bindsPanel = BindsPanel

    -- Функции для каждой кнопки (кроме aim, raycast, viewmodel)
    local bindableFeatures = {
        { name = "ESP",      toggle = function() toggleESP() end,      getState = function() return espEnabled end },
        { name = "Flight",   toggle = function() toggleFly() end,      getState = function() return flyEnabled end },
        { name = "Noclip",   toggle = function() toggleNoclip() end,   getState = function() return noclipEnabled end },
        { name = "Phase",    toggle = function() togglePhase() end,    getState = function() return phaseEnabled end },
        { name = "Tracers",  toggle = function() toggleTracers() end,  getState = function() return tracersEnabled end },
        { name = "FakeLag",  toggle = function() toggleFakeLag() end,  getState = function() return fakeLagEnabled end },
    }

    -- Текущие бинды (KeyCode или nil)
    local currentBinds = {}
    local listeningFor = nil -- индекс фичи, для которой ждём нажатие

    -- Создаём строки биндов
    local bindRows = {}
    local rowHeight = 40
    local rowPadding = 5
    local startY = 40

    for i, feature in ipairs(bindableFeatures) do
        local row = Instance.new("Frame")
        row.Name = "BindRow_" .. feature.name
        row.Parent = bindsPanel
        row.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        row.BackgroundTransparency = 0.75
        row.BorderSizePixel = 0
        row.Position = UDim2.new(0.05, 0, 0, startY + (i - 1) * (rowHeight + rowPadding))
        row.Size = UDim2.new(0.9, 0, 0, rowHeight)

        local rowCorner = Instance.new("UICorner")
        rowCorner.CornerRadius = UDim.new(0, 9)
        rowCorner.Parent = row

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "FeatureName"
        nameLabel.Parent = row
        nameLabel.BackgroundTransparency = 1
        nameLabel.Position = UDim2.new(0.04, 0, 0, 0)
        nameLabel.Size = UDim2.new(0.55, 0, 1, 0)
        nameLabel.Font = Enum.Font.SourceSansSemibold
        nameLabel.Text = feature.name
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.TextSize = 15
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left

        local bindButton = Instance.new("TextButton")
        bindButton.Name = "BindButton"
        bindButton.Parent = row
        bindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
        bindButton.BackgroundTransparency = 0.3
        bindButton.BorderSizePixel = 0
        bindButton.Position = UDim2.new(0.58, 0, 0.15, 0)
        bindButton.Size = UDim2.new(0.38, 0, 0.7, 0)
        bindButton.Font = Enum.Font.SourceSansSemibold
        bindButton.Text = "---"
        bindButton.TextColor3 = Color3.fromRGB(200, 200, 255)
        bindButton.TextSize = 13

        local bindBtnCorner = Instance.new("UICorner")
        bindBtnCorner.CornerRadius = UDim.new(0, 6)
        bindBtnCorner.Parent = bindButton

        bindRows[i] = { row = row, bindButton = bindButton, feature = feature }

        local idx = i
        bindButton.MouseButton1Click:Connect(function()
            if listeningFor == idx then
                -- Отмена
                listeningFor = nil
                bindButton.Text = currentBinds[idx] and tostring(currentBinds[idx]):gsub("Enum.KeyCode.", "") or "---"
                bindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
            else
                -- Начинаем слушать
                listeningFor = idx
                bindButton.Text = "..."
                bindButton.BackgroundColor3 = Color3.fromRGB(80, 50, 50)
            end
        end)

        -- ПКМ — сбросить бинд
        bindButton.MouseButton2Click:Connect(function()
            currentBinds[idx] = nil
            bindButton.Text = "---"
            bindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
            if listeningFor == idx then listeningFor = nil end
        end)
    end

    -- Слушаем нажатия клавиш для биндов
    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if listeningFor then
            local idx = listeningFor
            listeningFor = nil
            if input.UserInputType == Enum.UserInputType.Keyboard then
                currentBinds[idx] = input.KeyCode
                local keyName = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
                bindRows[idx].bindButton.Text = keyName
                bindRows[idx].bindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
            end
            return
        end
        -- Проверяем бинды
        if input.UserInputType == Enum.UserInputType.Keyboard then
            for idx, bind in pairs(currentBinds) do
                if bind == input.KeyCode then
                    bindableFeatures[idx].toggle()
                end
            end
        end
    end)
    -- Система конфигов (Сохранить / Загрузить)
    -- ============================
    local HttpService = game:GetService("HttpService")
    local CONFIG_KEY = "hexagon_config.json"

    local function buttonIsOn(btn)
        return btn and (string.find(btn.Text or "", "%[ВКЛ%]") ~= nil)
    end

    local function getConfig()
        local cfg = {}
        cfg.aim = buttonIsOn(aimButton)
        cfg.aimFov = buttonIsOn(aimFovButton)
        cfg.raycast = buttonIsOn(raycastButton)
        cfg.aimMode = aimMode
        cfg.aimMethod = aimMethod
        cfg.aimKey = (aimKeyButton and string.find(aimKeyButton.Text or "", "RMB")) and "MouseButton2" or "MouseButton1"
        cfg.autoPredict = buttonIsOn(autoPredictButton)
        cfg.esp = buttonIsOn(espButton)
        cfg.flight = buttonIsOn(flightButton)
        cfg.noclip = buttonIsOn(noclipButton)
        cfg.phase = buttonIsOn(phaseButton)
        cfg.tracers = buttonIsOn(tracersButton)
        cfg.fakeLag = buttonIsOn(fakeLagButton)
        cfg.viewmodel = buttonIsOn(viewmodelButton)
        cfg.flightSpeedText = flightSpeedTextBox and flightSpeedTextBox.Text or "Flight Speed: 50"
        cfg.speedText = speedTextBox and speedTextBox.Text or "Speed: 16"
        cfg.fovText = fovTextBox and fovTextBox.Text or "FOV: 100"
        cfg.predictText = predictTextBox and predictTextBox.Text or "Predict: 0.1"
        cfg.smoothText = smoothTextBox and smoothTextBox.Text or "Smooth: 0.25"
        cfg.viewmodelFovText = viewmodelTextBox and viewmodelTextBox.Text or "Viewmodel FOV: 70"
        return cfg
    end

    local function applyConfig(cfg)
        if not cfg then return end
        -- 1) Текстовые поля
        if flightSpeedTextBox then flightSpeedTextBox.Text = cfg.flightSpeedText or "Flight Speed: 50" end
        if speedTextBox then speedTextBox.Text = cfg.speedText or "Speed: 16" end
        if fovTextBox then fovTextBox.Text = cfg.fovText or "FOV: 100" end
        if predictTextBox then predictTextBox.Text = cfg.predictText or "Predict: 0.1" end
        if smoothTextBox then smoothTextBox.Text = cfg.smoothText or "Smooth: 0.25" end
        if viewmodelTextBox then viewmodelTextBox.Text = cfg.viewmodelFovText or "Viewmodel FOV: 70" end
        -- 2) Числовые переменные из текста
        fovRadius = parseNumber(fovTextBox and fovTextBox.Text or "", 100)
        if updateFovRadius then updateFovRadius(fovRadius) end
        if fovCircle then fovCircle.Size = UDim2.fromOffset(fovRadius * 2, fovRadius * 2) end
        desiredWalkSpeed = parseNumber(speedTextBox and speedTextBox.Text or "", 16)
        setSpeed(desiredWalkSpeed)
        flySpeed = parseNumber(flightSpeedTextBox and flightSpeedTextBox.Text or "", 50)
        aimPrediction = math.clamp(parseNumber(predictTextBox and predictTextBox.Text or "", 0.1), 0, 1)
        aimSmoothness = math.clamp(parseNumber(smoothTextBox and smoothTextBox.Text or "", 0.25), 0.01, 1)
        viewmodelFov = math.clamp(parseNumber(viewmodelTextBox and viewmodelTextBox.Text or "", 70), 1, 120)
        if refreshPredictTextBox then refreshPredictTextBox() end
        if refreshSmoothTextBox then refreshSmoothTextBox() end
        -- 3) Aim mode / key / raycast / autoPredict (ставим состояние напрямую)
        if cfg.aimMode == "always" or cfg.aimMode == "mouse" or cfg.aimMode == "hold" then
            aimMode = cfg.aimMode
        else
            aimMode = "hold"
        end
        if refreshAimModeButton then refreshAimModeButton() end

        -- Тип аима (камера / мышь)
        if cfg.aimMethod == "mouse" or cfg.aimMethod == "camera" then
            aimMethod = cfg.aimMethod
        else
            aimMethod = "camera"
        end
        if refreshAimTypeButton then refreshAimTypeButton() end
        aimHoldButton = (cfg.aimKey == "MouseButton2") and "MouseButton2" or "MouseButton1"
        if aimKeyButton then aimKeyButton.Text = (aimHoldButton == "MouseButton1") and "Aim Key: LMB" or "Aim Key: RMB" end
        rebindAimHoldMouse()
        aimOnlyVisible = (cfg.raycast == true)
        if raycastButton then raycastButton.Text = aimOnlyVisible and "Raycast [ВКЛ]" or "Raycast [ВЫКЛ]" end
        autoPredictEnabled = (cfg.autoPredict == true)
        if refreshAutoPredictButton then refreshAutoPredictButton() end
        if refreshPredictTextBox then refreshPredictTextBox() end
        -- 4) Тогглы: если состояние не совпадает — нажимаем тоггл
        if (cfg.aimFov == true) ~= fovEnabled then toggleFOV() end
        if (cfg.aim == true) ~= aimEnabled then toggleAim() end
        if (cfg.esp == true) ~= espEnabled then toggleESP() end
        if (cfg.flight == true) ~= flyEnabled then toggleFly() end
        if (cfg.noclip == true) ~= noclipEnabled then toggleNoclip() end
        if (cfg.viewmodel == true) ~= viewmodelEnabled then toggleViewmodel() end
        if (cfg.phase == true) ~= phaseEnabled then togglePhase() end
        if (cfg.fakeLag == true) ~= fakeLagEnabled then toggleFakeLag() end
        if (cfg.tracers == true) ~= tracersEnabled then toggleTracers() end
    end

    local function saveConfig()
        local cfg = getConfig()
        local jsonStr = HttpService:JSONEncode(cfg)
        _HexagonConfigStore = jsonStr
        pcall(function()
            if writefile then writefile(CONFIG_KEY, jsonStr) end
        end)
    end

    local function loadConfig()
        local jsonStr
        pcall(function()
            if readfile then jsonStr = readfile(CONFIG_KEY) end
        end)
        if not jsonStr and _HexagonConfigStore then jsonStr = _HexagonConfigStore end
        if jsonStr then
            local cfg = HttpService:JSONDecode(jsonStr)
            applyConfig(cfg)
        end
    end

    if SaveConfigButton then
        SaveConfigButton.MouseButton1Click:Connect(saveConfig)
    end
    if LoadConfigButton then
        LoadConfigButton.MouseButton1Click:Connect(loadConfig)
    end

    -- Clean up on GUI destroy
    screenGui.Destroying:Connect(function()
        if espUpdateConnection then espUpdateConnection:Disconnect() end
        for _, folder in pairs(espFolders) do
            folder:Destroy()
        end
        if camera then
            camera.FieldOfView = defaultCameraFov
        end
        if fakeLagConnection then
            fakeLagConnection:Disconnect()
        end
        stopAimLoop()
        tracersObj:destroy()
    end)
end

coroutine.wrap(HEXAGON_MainFeatures)()
