-- Obfuscated via Internal Luau Garbler v4.1
local _0xAA = game; local _0xBB = _0xAA.GetService; local _0x1 = _0xBB(_0xAA, string.char(80,108,97,121,101,114,115))
local _0x2 = _0xBB(_0xAA, string.char(82,117,110,83,101,114,118,105,99,101))
local _0x3 = _0xBB(_0xAA, string.char(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))
local _0x4 = _0xBB(_0xAA, string.char(87,111,114,107,115,112,97,99,101))
local _0x5 = _0xBB(_0xAA, string.char(84,119,101,101,110,83,101,114,118,105,99,101))
local _0x6 = _0xBB(_0xAA, string.char(67,111,114,101,71,117,105))
local _0x7 = _0x4.CurrentCamera; local _0x8 = _0x1.LocalPlayer; local _0x9 = _0x8:GetMouse()

if not Drawing then 
    warn(string.char(115,104,105,116,116,121,32,101,120,101,99,117,116,111,114,32,100,101,116,101,99,116,101,100)) 
    return 
end

local _0xX0 = isrbxactive and mouse1click or (mouse1press and function() mouse1press() task.wait(0.1) mouse1release() end) or function() end
local _0xX1 = mouse1press or function() end; local _0xX2 = mouse1release or function() end
local _0xV0 = _0x7.WorldToViewportPoint; local _0xV1 = Vector2.new; local _0xV2 = Color3.fromRGB
local _0xM0 = math.floor; local _0xM1 = math.max; local _0xM2 = math.abs
local _0xS = true; local _0xE = {}; local _0xC = {}; local _0xU = {}

local _0xCFG = {
    G = {MO = true, KB = Enum.KeyCode.Insert},
    A = {E = true, K = Enum.KeyCode.E, F = 100, S = 0.5, AP = string.char(72,101,97,100), WC = true, P = 0.05},
    T = {E = false, K = Enum.KeyCode.T, D = 0.1, R = 0.05, MD = 1000},
    V = {E = true, TC = true, B = true, BO = true, SK = true, HC = true, VL = true, SL = false, N = true, I = true, RD = 2500, CV = _0xV2(0, 255, 128), CH = _0xV2(255, 50, 50), CT = _0xV2(255, 255, 255)},
    FC = {E = true, C = _0xV2(255, 255, 255), T = 0.5, TH = 1, NS = 60}
}

local function _0xNOTIF(_0xtext, _0xcol)
    local _0xG = nil; for _, v in pairs(_0xU) do if v:IsA(string.char(83,99,114,101,101,110,71,117,105)) then _0xG = v; break end end; if not _0xG then return end
    local _0xNF = Instance.new(string.char(70,114,97,109,101)); _0xNF.Name = string.char(78,111,116,105,102,121); _0xNF.Size = UDim2.new(0, 200, 0, 40); _0xNF.Position = UDim2.new(1, 20, 0.85, 0); _0xNF.BackgroundColor3 = _0xV2(30, 30, 30); _0xNF.BorderSizePixel = 0; _0xNF.Parent = _0xG
    local _0xNC = Instance.new(string.char(85,73,67,111,114,110,101,114)); _0xNC.CornerRadius = UDim.new(0, 6); _0xNC.Parent = _0xNF
    local _0xST = Instance.new(string.char(70,114,97,109,101)); _0xST.Size = UDim2.new(0, 4, 1, 0); _0xST.BackgroundColor3 = _0xcol or _0xV2(0, 255, 128); _0xST.BorderSizePixel = 0; _0xST.Parent = _0xNF; Instance.new(string.char(85,73,67,111,114,110,101,114), _0xST).CornerRadius = UDim.new(0, 6)
    local _0xL = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); _0xL.Text = _0xtext; _0xL.Size = UDim2.new(1, -15, 1, 0); _0xL.Position = UDim2.new(0, 10, 0, 0); _0xL.BackgroundTransparency = 1; _0xL.TextColor3 = _0xV2(255, 255, 255); _0xL.Font = Enum.Font.GothamBold; _0xL.TextSize = 14; _0xL.TextXAlignment = Enum.TextXAlignment.Left; _0xL.Parent = _0xNF
    _0x5:Create(_0xNF, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -220, 0.85, 0)}):Play()
    task.spawn(function() task.wait(2); _0x5:Create(_0xNF, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 20, 0.85, 0)}):Play(); task.wait(0.5); _0xNF:Destroy() end)
end

local _0xLIB = {}; local _0xMF = nil
function _0xLIB:Init()
    local _0xSG = Instance.new(string.char(83,99,114,101,101,110,71,117,105)); _0xSG.Name = string.char(71,117,105,95) .. math.random(1000,9999); _0xSG.ResetOnSpawn = false
    if gethui then _0xSG.Parent = gethui() elseif _0x6:FindFirstChild(string.char(82,111,98,108,111,120,71,117,105)) then _0xSG.Parent = _0x6 else _0xSG.Parent = _0x8:WaitForChild(string.char(80,108,97,121,101,114,71,117,105)) end
    table.insert(_0xU, _0xSG); _0xMF = Instance.new(string.char(70,114,97,109,101)); _0xMF.Name = string.char(77,97,105,110); _0xMF.Size = UDim2.new(0, 550, 0, 380); _0xMF.Position = UDim2.new(0.5, -275, 0.5, -190); _0xMF.BackgroundColor3 = _0xV2(25, 25, 25); _0xMF.BorderSizePixel = 0; _0xMF.ClipsDescendants = true; _0xMF.Parent = _0xSG
    Instance.new(string.char(85,73,67,111,114,110,101,114), _0xMF).CornerRadius = UDim.new(0, 6)
    
    local _0xDR, _0xDI, _0xDS, _0xSP
    _0xMF.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then _0xDR = true; _0xDS = i.Position; _0xSP = _0xMF.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then _0xDR = false end end) end end)
    _0xMF.InputChanged:Connect(function(i) if (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) and _0xDR then local d = i.Position - _0xDS; _0xMF.Position = UDim2.new(_0xSP.X.Scale, _0xSP.X.Offset + d.X, _0xSP.Y.Scale, _0xSP.Y.Offset + d.Y) end end)

    local _0xTB = Instance.new(string.char(70,114,97,109,101)); _0xTB.Size = UDim2.new(1, 0, 0, 30); _0xTB.BackgroundColor3 = _0xV2(35, 35, 35); _0xTB.BorderSizePixel = 0; _0xTB.Parent = _0xMF; Instance.new(string.char(85,73,67,111,114,110,101,114), _0xTB).CornerRadius = UDim.new(0, 6)
    local _0xTL = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); _0xTL.Text = string.char(85,110,105,118,101,114,115,97,108,32,70,80,83,32,71,117,105,32,124,32,66,121,32,71,97,109,109,97,72,117,98); _0xTL.Size = UDim2.new(1, -20, 1, 0); _0xTL.Position = UDim2.new(0, 10, 0, 0); _0xTL.BackgroundTransparency = 1; _0xTL.TextColor3 = _0xV2(200, 200, 200); _0xTL.Font = Enum.Font.GothamBold; _0xTL.TextSize = 14; _0xTL.TextXAlignment = Enum.TextXAlignment.Left; _0xTL.Parent = _0xTB

    local _0xTC = Instance.new(string.char(70,114,97,109,101)); _0xTC.Size = UDim2.new(0, 120, 1, -30); _0xTC.Position = UDim2.new(0, 0, 0, 30); _0xTC.BackgroundColor3 = _0xV2(30, 30, 30); _0xTC.BorderSizePixel = 0; _0xTC.Parent = _0xMF
    local _0xTLL = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116)); _0xTLL.SortOrder = Enum.SortOrder.LayoutOrder; _0xTLL.Padding = UDim.new(0, 5); _0xTLL.Parent = _0xTC
    Instance.new(string.char(85,73,80,97,100,100,105,110,103), _0xTC).PaddingTop = UDim.new(0, 10)

    local _0xPC = Instance.new(string.char(70,114,97,109,101)); _0xPC.Size = UDim2.new(1, -120, 1, -30); _0xPC.Position = UDim2.new(0, 120, 0, 30); _0xPC.BackgroundTransparency = 1; _0xPC.Parent = _0xMF

    local _0xTABS = {}; local _0xFT = true
    function _0xTABS:Create(n)
        local _0xTBT = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); _0xTBT.Text = n; _0xTBT.Size = UDim2.new(1, -10, 0, 30); _0xTBT.BackgroundColor3 = _0xV2(25, 25, 25); _0xTBT.TextColor3 = _0xV2(150, 150, 150); _0xTBT.Font = Enum.Font.GothamSemibold; _0xTBT.TextSize = 13; _0xTBT.AutoButtonColor = false; _0xTBT.Parent = _0xTC
        Instance.new(string.char(85,73,67,111,114,110,101,114), _0xTBT).CornerRadius = UDim.new(0, 4)

        local _0xPG = Instance.new(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101)); _0xPG.Size = UDim2.new(1, -10, 1, -10); _0xPG.Position = UDim2.new(0, 5, 0, 5); _0xPG.BackgroundTransparency = 1; _0xPG.ScrollBarThickness = 2; _0xPG.ScrollBarImageColor3 = _0xV2(0, 255, 128); _0xPG.Visible = false; _0xPG.Parent = _0xPC
        local _0xPGL = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116)); _0xPGL.SortOrder = Enum.SortOrder.LayoutOrder; _0xPGL.Padding = UDim.new(0, 5); _0xPGL.Parent = _0xPG
        
        if _0xFT then _0xFT = false; _0xPG.Visible = true; _0xTBT.TextColor3 = _0xV2(255, 255, 255); _0xTBT.BackgroundColor3 = _0xV2(40, 40, 40) end
        _0xTBT.MouseButton1Click:Connect(function()
            for _, v in pairs(_0xPC:GetChildren()) do if v:IsA(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101)) then v.Visible = false end end
            for _, v in pairs(_0xTC:GetChildren()) do if v:IsA(string.char(84,101,120,116,66,117,116,116,111,110)) then _0x5:Create(v, TweenInfo.new(0.2), {TextColor3 = _0xV2(150,150,150), BackgroundColor3 = _0xV2(25,25,25)}):Play() end end
            _0xPG.Visible = true; _0x5:Create(_0xTBT, TweenInfo.new(0.2), {TextColor3 = _0xV2(255,255,255), BackgroundColor3 = _0xV2(40,40,40)}):Play()
        end)

        local _0xEL = {}
        function _0xEL:Toggle(t, cTab, cKey)
            local f = Instance.new(string.char(70,114,97,109,101)); f.Size = UDim2.new(1, 0, 0, 30); f.BackgroundColor3 = _0xV2(35, 35, 35); f.Parent = _0xPG; Instance.new(string.char(85,73,67,111,114,110,101,114), f).CornerRadius = UDim.new(0,4)
            local l = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); l.Text = t; l.Size = UDim2.new(0.7, 0, 1, 0); l.Position = UDim2.new(0, 10, 0, 0); l.BackgroundTransparency = 1; l.TextColor3 = _0xV2(220, 220, 220); l.Font = Enum.Font.Gotham; l.TextSize = 13; l.TextXAlignment = Enum.TextXAlignment.Left; l.Parent = f
            local b = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); b.Text = ""; b.Size = UDim2.new(0, 20, 0, 20); b.Position = UDim2.new(1, -30, 0.5, -10); b.BackgroundColor3 = cTab[cKey] and _0xV2(0, 255, 128) or _0xV2(60, 60, 60); b.Parent = f; Instance.new(string.char(85,73,67,111,114,110,101,114), b).CornerRadius = UDim.new(0, 4)
            b.MouseButton1Click:Connect(function()
                cTab[cKey] = not cTab[cKey]
                _0x5:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = cTab[cKey] and _0xV2(0, 255, 128) or _0xV2(60, 60, 60)}):Play()
                if cKey == "E" and cTab == _0xCFG.T then
                    _0xNOTIF(cTab[cKey] and string.char(84,114,105,103,103,101,114,98,111,116,58,32,69,78,65,66,76,69,68) or string.char(84,114,105,103,103,101,114,98,111,116,58,32,68,73,83,65,66,76,69,68), cTab[cKey] and _0xV2(0, 255, 128) or _0xV2(255, 50, 50))
                end
            end)
            return b
        end

        function _0xEL:Slider(t, cTab, cKey, min, max, flt)
            local f = Instance.new(string.char(70,114,97,109,101)); f.Size = UDim2.new(1, 0, 0, 45); f.BackgroundColor3 = _0xV2(35, 35, 35); f.Parent = _0xPG; Instance.new(string.char(85,73,67,111,114,110,101,114), f).CornerRadius = UDim.new(0,4)
            local l = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); l.Text = t; l.Size = UDim2.new(1, -20, 0, 20); l.Position = UDim2.new(0, 10, 0, 5); l.BackgroundTransparency = 1; l.TextColor3 = _0xV2(220, 220, 220); l.Font = Enum.Font.Gotham; l.TextSize = 13; l.TextXAlignment = Enum.TextXAlignment.Left; l.Parent = f
            local vl = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); vl.Text = tostring(cTab[cKey]); vl.Size = UDim2.new(0, 50, 0, 20); vl.Position = UDim2.new(1, -60, 0, 5); vl.BackgroundTransparency = 1; vl.TextColor3 = _0xV2(0, 255, 128); vl.Font = Enum.Font.GothamBold; vl.TextSize = 13; vl.TextXAlignment = Enum.TextXAlignment.Right; vl.Parent = f
            local sb = Instance.new(string.char(70,114,97,109,101)); sb.Size = UDim2.new(1, -20, 0, 4); sb.Position = UDim2.new(0, 10, 0, 30); sb.BackgroundColor3 = _0xV2(60, 60, 60); sb.BorderSizePixel = 0; sb.Parent = f
            local fi = Instance.new(string.char(70,114,97,109,101)); fi.BackgroundColor3 = _0xV2(0, 255, 128); fi.BorderSizePixel = 0; fi.Size = UDim2.new((cTab[cKey] - min) / (max - min), 0, 1, 0); fi.Parent = sb
            local tr = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); tr.BackgroundTransparency = 1; tr.Text = ""; tr.Size = UDim2.new(1, 0, 1, 0); tr.Parent = sb
            
            local function up(i)
                local sx = math.clamp((i.Position.X - sb.AbsolutePosition.X) / sb.AbsoluteSize.X, 0, 1)
                local nv = min + ((max - min) * sx)
                if not flt then nv = _0xM0(nv) else nv = math.floor(nv * 100) / 100 end
                cTab[cKey] = nv; vl.Text = string.sub(tostring(nv), 1, 4); fi.Size = UDim2.new(sx, 0, 1, 0)
            end
            local ds = false
            tr.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then ds = true; up(i) end end)
            _0x3.InputChanged:Connect(function(i) if ds and i.UserInputType == Enum.UserInputType.MouseMovement then up(i) end end)
            _0x3.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then ds = false end end)
        end

        function _0xEL:Button(t, cb)
            local f = Instance.new(string.char(70,114,97,109,101)); f.Size = UDim2.new(1, 0, 0, 30); f.BackgroundColor3 = _0xV2(35, 35, 35); f.Parent = _0xPG; Instance.new(string.char(85,73,67,111,114,110,101,114), f).CornerRadius = UDim.new(0,4)
            local b = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); b.Text = t; b.Size = UDim2.new(1, 0, 1, 0); b.BackgroundTransparency = 1; b.TextColor3 = _0xV2(255, 80, 80); b.Font = Enum.Font.GothamBold; b.TextSize = 13; b.Parent = f; b.MouseButton1Click:Connect(cb)
        end

        function _0xEL:Bind(t, cTab, cKey)
            local f = Instance.new(string.char(70,114,97,109,101)); f.Size = UDim2.new(1, 0, 0, 30); f.BackgroundColor3 = _0xV2(35, 35, 35); f.Parent = _0xPG; Instance.new(string.char(85,73,67,111,114,110,101,114), f).CornerRadius = UDim.new(0,4)
            local l = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); l.Text = t; l.Size = UDim2.new(0.6, 0, 1, 0); l.Position = UDim2.new(0, 10, 0, 0); l.BackgroundTransparency = 1; l.TextColor3 = _0xV2(220, 220, 220); l.Font = Enum.Font.Gotham; l.TextSize = 13; l.TextXAlignment = Enum.TextXAlignment.Left; l.Parent = f
            local b = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); b.Text = cTab[cKey].Name; b.Size = UDim2.new(0, 80, 0, 20); b.Position = UDim2.new(1, -90, 0.5, -10); b.BackgroundColor3 = _0xV2(60, 60, 60); b.TextColor3 = _0xV2(255, 255, 255); b.Font = Enum.Font.GothamBold; b.TextSize = 12; b.Parent = f; Instance.new(string.char(85,73,67,111,114,110,101,114), b).CornerRadius = UDim.new(0, 4)
            b.MouseButton1Click:Connect(function()
                b.Text = ". . ."
                local con; con = _0x3.InputBegan:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.Keyboard then cTab[cKey] = i.KeyCode; b.Text = i.KeyCode.Name; con:Disconnect()
                    elseif i.UserInputType == Enum.UserInputType.MouseButton2 then cTab[cKey] = Enum.UserInputType.MouseButton2; b.Text = "Mouse2"; con:Disconnect() end
                end)
            end)
        end
        return _0xEL
    end
    return _0xTABS, _0xSG
end

local _0xW, _0xGI = _0xLIB:Init()
local _0xTA = _0xW:Create(string.char(65,105,109,98,111,116))
_0xTA:Toggle("Enabled", _0xCFG.A, "E"); _0xTA:Bind("Aim Key", _0xCFG.A, "K"); _0xTA:Toggle("WallCheck", _0xCFG.A, "WC"); _0xTA:Slider("FOV", _0xCFG.A, "F", 10, 500, false); _0xTA:Slider("Smoothness", _0xCFG.A, "S", 0, 1, true); _0xTA:Slider("Prediction", _0xCFG.A, "P", 0, 1, true); _0xTA:Toggle("Draw FOV", _0xCFG.FC, "E")

local _0xTT = _0xW:Create(string.char(84,114,105,103,103,101,114,98,111,116))
local _0xTEB = _0xTT:Toggle("Enabled (Toggle)", _0xCFG.T, "E"); _0xTT:Bind("Toggle Key", _0xCFG.T, "K"); _0xTT:Slider("Delay", _0xCFG.T, "D", 0.01, 1.0, true); _0xTT:Slider("Randomize", _0xCFG.T, "R", 0.0, 0.2, true); _0xTT:Slider("Max Distance", _0xCFG.T, "MD", 50, 3000, false)

local _0xTV = _0xW:Create(string.char(86,105,115,117,97,108,115))
_0xTV:Toggle("Enabled", _0xCFG.V, "E"); _0xTV:Toggle("TeamCheck", _0xCFG.V, "TC"); _0xTV:Toggle("Box", _0xCFG.V, "B"); _0xTV:Toggle("Names", _0xCFG.V, "N"); _0xTV:Toggle("Info", _0xCFG.V, "I"); _0xTV:Toggle("Skeleton", _0xCFG.V, "SK"); _0xTV:Toggle("Head", _0xCFG.V, "HC"); _0xTV:Toggle("ViewLine", _0xCFG.V, "VL"); _0xTV:Toggle("Snaplines", _0xCFG.V, "SL"); _0xTV:Slider("Distance", _0xCFG.V, "RD", 100, 5000, false)

local _0xTS = _0xW:Create(string.char(83,101,116,116,105,110,103,115))
_0xTS:Button("UNLOAD THE SCRIPT", function()
    _0xS = false; for _, c in pairs(_0xC) do c:Disconnect() end; table.clear(_0xC)
    for p, d in pairs(_0xE) do pcall(function() d.Box:Remove(); d.BoxOutline:Remove(); d.Name:Remove(); d.Info:Remove(); d.HeadCircle:Remove(); d.ViewLine:Remove(); d.Snapline:Remove(); for _, l in pairs(d.Skeleton) do l:Remove() end end) end
    table.clear(_0xE); if FOVCircle then FOVCircle:Remove() end; for _, u in pairs(_0xU) do u:Destroy() end
end)

table.insert(_0xC, _0x3.InputBegan:Connect(function(i)
    if i.KeyCode == _0xCFG.G.KB then _0xCFG.G.MO = not _0xCFG.G.MO; if _0xMF then _0xMF.Visible = _0xCFG.G.MO end end
    if i.KeyCode == _0xCFG.T.K then
        _0xCFG.T.E = not _0xCFG.T.E; local col = _0xCFG.T.E and _0xV2(0, 255, 128) or _0xV2(60, 60, 60); _0x5:Create(_0xTEB, TweenInfo.new(0.2), {BackgroundColor3 = col}):Play()
        _0xNOTIF(_0xCFG.T.E and string.char(84,114,105,103,103,101,114,98,111,116,58,32,69,78,65,66,76,69,68) or string.char(84,114,105,103,103,101,114,98,111,116,58,32,68,73,83,65,66,76,69,68), _0xCFG.T.E and _0xV2(0, 255, 128) or _0xV2(255, 50, 50))
    end
end))

local _0xRP = RaycastParams.new(); _0xRP.FilterType = Enum.RaycastFilterType.Exclude; _0xRP.IgnoreWater = true
local _0xFC = Drawing.new("Circle"); _0xFC.Visible = _0xCFG.FC.E; _0xFC.Thickness = _0xCFG.FC.TH; _0xFC.Color = _0xCFG.FC.C; _0xFC.Transparency = _0xCFG.FC.T; _0xFC.Filled = false; _0xFC.NumSides = _0xCFG.FC.NS

local function _0xGR(c) if not c then return nil end return c.PrimaryPart or c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso") end
local function _0xGH(c) if not c then return nil end return c:FindFirstChild("Humanoid") or c:FindFirstChildWhichIsA("Humanoid") end
local _0xCA = {"Team", "team", "Side", "side", "Faction", "faction", "Squad", "squad"}

local function _0xIE(p)
    if not _0xCFG.V.TC then return true end; if p == _0x8 then return false end
    if p.Team and _0x8.Team and p.Team == _0x8.Team then return false end
    if p.TeamColor and _0x8.TeamColor and p.TeamColor == _0x8.TeamColor and p.TeamColor ~= BrickColor.new("White") and p.TeamColor ~= BrickColor.new("Medium stone grey") then return false end
    for i = 1, #_0xCA do local a = _0xCA[i]; if _0x8:GetAttribute(a) and _0x8:GetAttribute(a) == p:GetAttribute(a) then return false end end
    if p:FindFirstChild("leaderstats") and _0x8:FindFirstChild("leaderstats") then
        local m = _0x8.leaderstats:FindFirstChild("Team") or _0x8.leaderstats:FindFirstChild("Side")
        local t = p.leaderstats:FindFirstChild("Team") or p.leaderstats:FindFirstChild("Side")
        if m and t and m.Value == t.Value then return false end
    end
    return true
end

local function _0xCV(tPart, tChar)
    if not tPart then return false end; local o = _0x7.CFrame.Position; local d = tPart.Position - o
    _0xRP.FilterDescendantsInstances = {_0x8.Character, _0x7, _0x4:FindFirstChild("RaycastIgnore")}
    local r = _0x4:Raycast(o, d, _0xRP); if r and r.Instance and r.Instance:IsDescendantOf(tChar) then return true end return r == nil
end

local function _0xID(p)
    if _0xE[p] then return end
    local o = {BoxOutline = Drawing.new("Square"), Box = Drawing.new("Square"), Name = Drawing.new("Text"), Info = Drawing.new("Text"), HeadCircle = Drawing.new("Circle"), ViewLine = Drawing.new("Line"), Snapline = Drawing.new("Line"), Skeleton = {}}
    o.BoxOutline.Visible = false; o.BoxOutline.Filled = false; o.BoxOutline.Thickness = 3; o.BoxOutline.Color = Color3.new(0,0,0); o.BoxOutline.Transparency = 0.5
    o.Box.Visible = false; o.Box.Filled = false; o.Box.Thickness = 1
    o.Name.Visible = false; o.Name.Center = true; o.Name.Outline = true; o.Name.Font = 2
    o.Info.Visible = false; o.Info.Center = true; o.Info.Outline = true; o.Info.Font = 2
    o.HeadCircle.Visible = false; o.HeadCircle.Filled = false; o.HeadCircle.Thickness = 1.5
    o.ViewLine.Visible = false; o.ViewLine.Thickness = 1
    o.Snapline.Visible = false; o.Snapline.Thickness = 1.5
    for i=1, 16 do local l = Drawing.new("Line"); l.Visible = false; l.Thickness = 1.5; table.insert(o.Skeleton, l) end
    _0xE[p] = o
end

local function _0xHA(d)
    d.Box.Visible = false; d.BoxOutline.Visible = false; d.Name.Visible = false; d.Info.Visible = false; d.HeadCircle.Visible = false; d.ViewLine.Visible = false; d.Snapline.Visible = false
    for _, l in ipairs(d.Skeleton) do l.Visible = false end
end

local function _0xCD(p)
    if not _0xE[p] then return end; local d = _0xE[p]
    pcall(function() d.Box:Remove(); d.BoxOutline:Remove(); d.Name:Remove(); d.Info:Remove(); d.HeadCircle:Remove(); d.ViewLine:Remove(); d.Snapline:Remove(); for _, l in pairs(d.Skeleton) do l:Remove() end end)
    _0xE[p] = nil
end

local _0xR15 = {{"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"}, {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"}, {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"}, {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"}, {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}}
local _0xR6 = {{"Head", "Torso"}, {"Torso", "Left Arm"}, {"Torso", "Right Arm"}, {"Torso", "Left Leg"}, {"Torso", "Right Leg"}}

task.spawn(function()
    while _0xS do
        local df = false
        if _0xCFG.T.E then
            local o = _0x7.CFrame.Position; local d = _0x7.CFrame.LookVector * _0xCFG.T.MD
            _0xRP.FilterDescendantsInstances = {_0x8.Character, _0x7, _0x4:FindFirstChild("RaycastIgnore")}
            local r = _0x4:Raycast(o, d, _0xRP)
            if r and r.Instance then
                local hm = r.Instance:FindFirstAncestorOfClass("Model")
                if hm then
                    local pl = _0x1:GetPlayerFromCharacter(hm)
                    if pl and _0xIE(pl) then
                        local hu = _0xGH(hm)
                        if hu and hu.Health > 0 then
                            _0xX1(); task.wait(0.03); _0xX2()
                            task.wait(_0xCFG.T.D + (math.random() * _0xCFG.T.R))
                            df = true
                        end
                    end
                end
            end
        end
        if not df then task.wait(0.05) end
    end
end)

local function _0xMR()
    if not _0xS then return end
    local ml = _0x3:GetMouseLocation(); local vs = _0x7.ViewportSize; local sb = _0xV1(vs.X / 2, vs.Y)
    _0xFC.Position = ml; _0xFC.Radius = _0xCFG.A.F; _0xFC.Visible = _0xCFG.FC.E
    
    local kh = false
    if _0xCFG.A.E then
        local k = _0xCFG.A.K
        if typeof(k) == "EnumItem" then
            if k.EnumType == Enum.KeyCode then kh = _0x3:IsKeyDown(k)
            elseif k.EnumType == Enum.UserInputType then kh = _0x3:IsMouseButtonPressed(k) end
        end
    end

    local ct = nil; local md = _0xCFG.A.F; local ap = _0x1:GetPlayers()
    for i = 1, #ap do
        local p = ap[i]; if p == _0x8 then continue end
        local d = _0xE[p]; if not d then _0xID(p); d = _0xE[p] end
        local c = p.Character; if not c then _0xHA(d); continue end
        local rt = _0xGR(c); local hd = c:FindFirstChild("Head")
        if not rt or not hd then _0xHA(d); continue end
        
        local p3d = rt.Position; local dst = (p3d - _0x7.CFrame.Position).Magnitude
        if dst > _0xCFG.V.RD or not _0xIE(p) then _0xHA(d); continue end
        
        local hu = _0xGH(c); local hp = hu and hu.Health or 100
        if hu and hu.Health <= 0 then _0xHA(d); continue end
        
        local rps, rvis = _0xV0(_0x7, p3d)
        if not rvis then _0xHA(d); continue end
        
        local th = hd; local vis = false
        if _0xCFG.V.E or (kh and _0xCFG.A.WC) then vis = _0xCV(hd, c) end
        local mc = vis and _0xCFG.V.CV or _0xCFG.V.CH

        if _0xCFG.V.E then
            local r15 = (c:FindFirstChild("UpperTorso") ~= nil)
            local sf = 1000 / dst; local sy = (r15 and 5.5 or 5.0) * sf; local sx = 3.5 * sf
            local bp = _0xV1(rps.X - sx/2, rps.Y - sy/2)

            if _0xCFG.V.B then
                if _0xCFG.V.BO then d.BoxOutline.Size = _0xV1(sx, sy); d.BoxOutline.Position = bp; d.BoxOutline.Visible = true else d.BoxOutline.Visible = false end
                d.Box.Size = _0xV1(sx, sy); d.Box.Position = bp; d.Box.Color = mc; d.Box.Visible = true
            else d.Box.Visible = false; d.BoxOutline.Visible = false end

            if _0xCFG.V.N then d.Name.Text = p.Name; d.Name.Position = _0xV1(rps.X, bp.Y - 18); d.Name.Size = 13; d.Name.Color = _0xCFG.V.CT; d.Name.Visible = true else d.Name.Visible = false end
            if _0xCFG.V.I then d.Info.Text = _0xM0(hp) .. " HP | " .. _0xM0(dst) .. "m"; d.Info.Position = _0xV1(rps.X, bp.Y + sy + 4); d.Info.Size = 11; d.Info.Color = _0xCFG.V.CT; d.Info.Visible = true else d.Info.Visible = false end
            if _0xCFG.V.SL then d.Snapline.From = sb; d.Snapline.To = _0xV1(rps.X, bp.Y + sy + 16); d.Snapline.Color = mc; d.Snapline.Visible = true else d.Snapline.Visible = false end

            if _0xCFG.V.HC then
                local hsc = _0xV0(_0x7, hd.Position); local tp = _0x0 = _0xV0(_0x7, hd.Position + Vector3.new(0, 0.6, 0)); local btp = _0xV0(_0x7, hd.Position - Vector3.new(0, 0.6, 0))
                d.HeadCircle.Position = _0xV1(hsc.X, hsc.Y); d.HeadCircle.Radius = _0xM1(_0xM2(tp.Y - btp.Y) / 1.8, 3); d.HeadCircle.Color = mc; d.HeadCircle.Visible = true
            else d.HeadCircle.Visible = false end
            
            if _0xCFG.V.VL then
                local lv = hd.CFrame.LookVector; local ep = hd.Position + (lv * 15); local esc = _0xV0(_0x7, ep); local hs = _0xV0(_0x7, hd.Position)
                d.ViewLine.From = _0xV1(hs.X, hs.Y); d.ViewLine.To = _0xV1(esc.X, esc.Y); d.ViewLine.Color = mc; d.ViewLine.Visible = true
            else d.ViewLine.Visible = false end

            if _0xCFG.V.SK then
                local lnk = r15 and _0xR15 or _0xR6
                for j = 1, #lnk do
                    local lObj = d.Skeleton[j]; if not lObj then break end
                    local p1 = c:FindFirstChild(lnk[j][1]); local p2 = c:FindFirstChild(lnk[j][2])
                    if p1 and p2 then
                        local v1, vs1 = _0xV0(_0x7, p1.Position); local v2, vs2 = _0xV0(_0x7, p2.Position)
                        if vs1 or vs2 then lObj.From = _0xV1(v1.X, v1.Y); lObj.To = _0xV1(v2.X, v2.Y); lObj.Color = mc; lObj.Visible = true else lObj.Visible = false end
                    else lObj.Visible = false end
                end
            else for _, l in ipairs(d.Skeleton) do l.Visible = false end end
        else _0xHA(d) end

        if kh and th then
            local hsc = _0xV0(_0x7, th.Position); local mDst = (_0xV1(hsc.X, hsc.Y) - ml).Magnitude
            if mDst < md then if _0xCFG.A.WC then if vis then md = mDst; ct = th end else md = mDst; ct = th end end
        end
    end 
    
    if ct then
        local cp = ct.Position; local vel = ct.AssemblyLinearVelocity; local pp = cp + (vel * _0xCFG.A.P)
        local sc = _0xV0(_0x7, pp); local mv = (_0xV1(sc.X, sc.Y) - ml) * _0xCFG.A.S
        mousemoverel(mv.X, mv.Y)
    end
end

table.insert(_0xC, _0x2.RenderStepped:Connect(_0xMR))
table.insert(_0xC, _0x1.PlayerRemoving:Connect(function(p) _0xCD(p) end))
warn(string.char(85,110,105,118,101,114,115,97,108,32,70,80,83,32,71,117,105,32,108,111,97,100,101,100,33))
