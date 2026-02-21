-- ╔══════════════════════════════════════════════════════════╗
-- ║              HERLYS HUB - FULL SCRIPT                    ║
-- ║         Library + Blox Fruits | by Herlys                ║
-- ║                    Version 2.0.0                         ║
-- ╚══════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════
--           LIBRARY CORE
-- ═══════════════════════════════════════

local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService   = game:GetService("UserInputService")
local TweenService       = game:GetService("TweenService")
local HttpService        = game:GetService("HttpService")
local RunService         = game:GetService("RunService")
local Players            = game:GetService("Players")
local Lighting           = game:GetService("Lighting")
local VirtualUser        = game:GetService("VirtualUser")
local ReplicatedStorage  = game:GetService("ReplicatedStorage")
local Camera             = workspace.CurrentCamera

local Player      = Players.LocalPlayer
local PlayerMouse = Player:GetMouse()
local Enemies     = workspace:FindFirstChild("Enemies") or workspace
local Map         = workspace:FindFirstChild("Map") or workspace

local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

local HerlysHub = {
    Themes = {
        Darker = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 25)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(32.5, 32.5, 32.5)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))
            }),
            ["Color Hub 2"]    = Color3.fromRGB(30, 30, 30),
            ["Color Stroke"]   = Color3.fromRGB(40, 40, 40),
            ["Color Theme"]    = Color3.fromRGB(88, 101, 242),
            ["Color Text"]     = Color3.fromRGB(243, 243, 243),
            ["Color Dark Text"]= Color3.fromRGB(180, 180, 180)
        },
        Dark = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(40, 40, 40)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(47.5, 47.5, 47.5)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(40, 40, 40))
            }),
            ["Color Hub 2"]    = Color3.fromRGB(45, 45, 45),
            ["Color Stroke"]   = Color3.fromRGB(65, 65, 65),
            ["Color Theme"]    = Color3.fromRGB(65, 150, 255),
            ["Color Text"]     = Color3.fromRGB(245, 245, 245),
            ["Color Dark Text"]= Color3.fromRGB(190, 190, 190)
        },
        Purple = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(27.5, 25, 30)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(32.5, 32.5, 32.5)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(27.5, 25, 30))
            }),
            ["Color Hub 2"]    = Color3.fromRGB(30, 30, 30),
            ["Color Stroke"]   = Color3.fromRGB(40, 40, 40),
            ["Color Theme"]    = Color3.fromRGB(150, 0, 255),
            ["Color Text"]     = Color3.fromRGB(240, 240, 240),
            ["Color Dark Text"]= Color3.fromRGB(180, 180, 180)
        },
        HerlysBlue = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 15, 30)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(15, 22, 45)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 15, 30))
            }),
            ["Color Hub 2"]    = Color3.fromRGB(12, 18, 36),
            ["Color Stroke"]   = Color3.fromRGB(30, 50, 100),
            ["Color Theme"]    = Color3.fromRGB(0, 150, 255),
            ["Color Text"]     = Color3.fromRGB(220, 235, 255),
            ["Color Dark Text"]= Color3.fromRGB(130, 170, 220)
        },
        HerlysRed = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 10, 10)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(35, 15, 15)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 10, 10))
            }),
            ["Color Hub 2"]    = Color3.fromRGB(28, 12, 12),
            ["Color Stroke"]   = Color3.fromRGB(80, 25, 25),
            ["Color Theme"]    = Color3.fromRGB(220, 50, 50),
            ["Color Text"]     = Color3.fromRGB(255, 230, 230),
            ["Color Dark Text"]= Color3.fromRGB(200, 150, 150)
        },
        Ocean = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 50, 80)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 80, 120)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 50, 80))
            }),
            ["Color Hub 2"]    = Color3.fromRGB(0, 60, 100),
            ["Color Stroke"]   = Color3.fromRGB(0, 100, 150),
            ["Color Theme"]    = Color3.fromRGB(0, 200, 255),
            ["Color Text"]     = Color3.fromRGB(255, 255, 255),
            ["Color Dark Text"]= Color3.fromRGB(200, 230, 255)
        },
        Forest = {
            ["Color Hub 1"] = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 50, 20)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(30, 80, 30)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(20, 50, 20))
            }),
            ["Color Hub 2"]    = Color3.fromRGB(25, 65, 25),
            ["Color Stroke"]   = Color3.fromRGB(40, 100, 40),
            ["Color Theme"]    = Color3.fromRGB(50, 200, 50),
            ["Color Text"]     = Color3.fromRGB(240, 255, 240),
            ["Color Dark Text"]= Color3.fromRGB(180, 220, 180)
        },
    },
    Info       = { Name = "Herlys Hub", Version = "2.0.0", Author = "Herlys" },
    Save       = { UISize = {550, 380}, TabSize = 160, Theme = "Darker" },
    Settings   = {},
    Connection = {},
    Instances  = {},
    Elements   = {},
    Options    = {},
    Flags      = {},
    Tabs       = {},
    Icons = (function()
        return {
            ["accessibility"]="rbxassetid://10709751939",["activity"]="rbxassetid://10709752035",
            ["airvent"]="rbxassetid://10709752131",["alarmclock"]="rbxassetid://10709752630",
            ["alertcircle"]="rbxassetid://10709752996",["alerttriangle"]="rbxassetid://10709753149",
            ["anchor"]="rbxassetid://10709761530",["angry"]="rbxassetid://10709761629",
            ["aperture"]="rbxassetid://10709761813",["archive"]="rbxassetid://10709762233",
            ["arrowdown"]="rbxassetid://10709767827",["arrowleft"]="rbxassetid://10709768114",
            ["arrowright"]="rbxassetid://10709768347",["arrowup"]="rbxassetid://10709768939",
            ["bell"]="rbxassetid://10709775704",["belloff"]="rbxassetid://10709775320",
            ["book"]="rbxassetid://10709781824",["bookmark"]="rbxassetid://10709782154",
            ["bot"]="rbxassetid://10709782230",["box"]="rbxassetid://10709782497",
            ["bug"]="rbxassetid://10709782845",["calendar"]="rbxassetid://10709789505",
            ["camera"]="rbxassetid://10709789686",["check"]="rbxassetid://10709790644",
            ["cherry"]="rbxassetid://10709790875",["chevrondown"]="rbxassetid://10709790948",
            ["chevronleft"]="rbxassetid://10709791281",["chevronright"]="rbxassetid://10709791437",
            ["chevronup"]="rbxassetid://10709791523",["clock"]="rbxassetid://10709805144",
            ["cog"]="rbxassetid://10709810948",["code"]="rbxassetid://10709810463",
            ["compass"]="rbxassetid://10709811445",["copy"]="rbxassetid://10709812159",
            ["crown"]="rbxassetid://10709818626",["database"]="rbxassetid://10709818996",
            ["download"]="rbxassetid://10723344270",["edit"]="rbxassetid://10734883598",
            ["eye"]="rbxassetid://10723346959",["eyeoff"]="rbxassetid://10723346871",
            ["file"]="rbxassetid://10723374641",["filter"]="rbxassetid://10723375128",
            ["flag"]="rbxassetid://10723375890",["flame"]="rbxassetid://10723376114",
            ["folder"]="rbxassetid://10723387563",["gift"]="rbxassetid://10723396402",
            ["globe"]="rbxassetid://10723404337",["heart"]="rbxassetid://10723406885",
            ["home"]="rbxassetid://10723407389",["image"]="rbxassetid://10723415040",
            ["info"]="rbxassetid://10723415903",["key"]="rbxassetid://10723416652",
            ["layers"]="rbxassetid://10723424505",["leaf"]="rbxassetid://10723425539",
            ["link"]="rbxassetid://10723426722",["list"]="rbxassetid://10723433811",
            ["lock"]="rbxassetid://10723434711",["map"]="rbxassetid://10734886202",
            ["mappin"]="rbxassetid://10734886004",["menu"]="rbxassetid://10734887784",
            ["mic"]="rbxassetid://10734888864",["minus"]="rbxassetid://10734896206",
            ["monitor"]="rbxassetid://10734896881",["moon"]="rbxassetid://10734897102",
            ["music"]="rbxassetid://10734905958",["package"]="rbxassetid://10734909540",
            ["pencil"]="rbxassetid://10734919691",["phone"]="rbxassetid://10734921524",
            ["plus"]="rbxassetid://10734924532",["power"]="rbxassetid://10734930466",
            ["rocket"]="rbxassetid://10734934585",["save"]="rbxassetid://10734941499",
            ["search"]="rbxassetid://10734943674",["send"]="rbxassetid://10734943902",
            ["server"]="rbxassetid://10734949856",["settings"]="rbxassetid://10734950309",
            ["settings2"]="rbxassetid://10734950020",["share"]="rbxassetid://10734950813",
            ["shield"]="rbxassetid://10734951847",["shieldcheck"]="rbxassetid://10734951367",
            ["shoppingcart"]="rbxassetid://10734952479",["signal"]="rbxassetid://10734961133",
            ["skull"]="rbxassetid://10734962068",["sliders"]="rbxassetid://10734963400",
            ["star"]="rbxassetid://10734966248",["sun"]="rbxassetid://10734974297",
            ["swords"]="rbxassetid://10734975692",["target"]="rbxassetid://10734977012",
            ["terminal"]="rbxassetid://10734982144",["trash"]="rbxassetid://10747362393",
            ["trophy"]="rbxassetid://10747363809",["tv"]="rbxassetid://10747364593",
            ["unlock"]="rbxassetid://10747366027",["upload"]="rbxassetid://10747366434",
            ["user"]="rbxassetid://10747373176",["users"]="rbxassetid://10747373426",
            ["video"]="rbxassetid://10747374938",["volume"]="rbxassetid://10747376008",
            ["wallet"]="rbxassetid://10747376205",["wifi"]="rbxassetid://10747382504",
            ["wind"]="rbxassetid://10747382750",["wrench"]="rbxassetid://10747383470",
            ["x"]="rbxassetid://10747384394",["xcircle"]="rbxassetid://10747383819",
            ["zoomin"]="rbxassetid://10747384552",["zoomout"]="rbxassetid://10747384679",
            ["waves"]="rbxassetid://10747376931",["locate"]="rbxassetid://10723434557",
            ["swords2"]="rbxassetid://10734975486",["Info"]="rbxassetid://10723415903",
            ["Home"]="rbxassetid://10723407389",["Waves"]="rbxassetid://10747376931",
            ["ShoppingCart"]="rbxassetid://10734952479",["Swords"]="rbxassetid://10734975692",
            ["Cherry"]="rbxassetid://10709790875",["Settings"]="rbxassetid://10734950309",
            ["Locate"]="rbxassetid://10723434557",["Signal"]="rbxassetid://10734961133",
            ["User"]="rbxassetid://10747373176",["Search"]="rbxassetid://10734943674",
            ["dragon"]="rbxassetid://10709791344",["anchor"]="rbxassetid://10709761530",
            ["ghost"]="rbxassetid://10723346021",["crown"]="rbxassetid://10709818626",
        }
    end)()
}

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 450
local Settings = HerlysHub.Settings
local Flags    = HerlysHub.Flags

-- ─── Core helpers ───────────────────────────────────────────
local SetProps, SetChildren, InsertTheme, Create do
    InsertTheme = function(Instance, Type)
        table.insert(HerlysHub.Instances, { Instance = Instance, Type = Type })
        return Instance
    end
    SetChildren = function(Instance, Children)
        if Children then
            table.foreach(Children, function(_, Child) Child.Parent = Instance end)
        end
        return Instance
    end
    SetProps = function(Instance, Props)
        if Props then
            table.foreach(Props, function(prop, value) Instance[prop] = value end)
        end
        return Instance
    end
    Create = function(...)
        local args = {...}
        if type(args) ~= "table" then return end
        local new = Instance.new(args[1])
        if type(args[2]) == "table" then
            SetProps(new, args[2]); SetChildren(new, args[3])
        elseif typeof(args[2]) == "Instance" then
            new.Parent = args[2]; SetProps(new, args[3]); SetChildren(new, args[4])
        end
        return new
    end
    local function Load(file)
        if readfile and isfile and isfile(file) then
            local ok, decode = pcall(function() return HttpService:JSONDecode(readfile(file)) end)
            if ok and type(decode) == "table" then
                if rawget(decode,"UISize")  then HerlysHub.Save["UISize"]  = decode["UISize"]  end
                if rawget(decode,"TabSize") then HerlysHub.Save["TabSize"] = decode["TabSize"] end
                if rawget(decode,"Theme") and HerlysHub.Themes[decode["Theme"]] then HerlysHub.Save["Theme"] = decode["Theme"] end
                if rawget(decode,"AutoExecute") then HerlysHub.Save["AutoExecute"] = decode["AutoExecute"] end
            end
        end
    end
    pcall(Load, "Herlys Hub.json")
end

-- ─── Funcs ──────────────────────────────────────────────────
local Funcs = {}
function Funcs:InsertCallback(tab, func)
    if type(func)=="function" then table.insert(tab, func) end; return func
end
function Funcs:FireCallback(tab, ...)
    for _,v in ipairs(tab) do if type(v)=="function" then task.spawn(v,...) end end
end
function Funcs:ToggleVisible(Obj, Bool)
    Obj.Visible = Bool ~= nil and Bool or Obj.Visible
end
function Funcs:GetConnectionFunctions(ConnectedFuncs, func)
    local C = { Function=func, Connected=true }
    function C:Disconnect()
        if self.Connected then table.remove(ConnectedFuncs,table.find(ConnectedFuncs,self.Function)); self.Connected=false end
    end
    function C:Fire(...) if self.Connected then task.spawn(self.Function,...) end end
    return C
end
function Funcs:GetCallback(Configs, index)
    local func = Configs[index] or Configs.Callback or function()end
    if type(func)=="table" then return ({function(V) func[1][func[2]]=V end}) end
    return {func}
end

-- ─── Connections ────────────────────────────────────────────
local Connections, Connection = {}, HerlysHub.Connection
local function NewConnectionList(List)
    for _,CoName in ipairs(List) do
        local CF, C = {}, {}
        Connection[CoName]=C; Connections[CoName]=CF; C.Name=CoName
        function C:Connect(func)
            if type(func)=="function" then table.insert(CF,func); return Funcs:GetConnectionFunctions(CF,func) end
        end
        function C:Once(func)
            if type(func)=="function" then
                local Conn; local F;F=function(...) task.spawn(func,...); Conn:Disconnect() end
                Conn=Funcs:GetConnectionFunctions(CF,F); return Conn
            end
        end
    end
end
function Connection:FireConnection(CoName,...)
    local C=type(CoName)=="string" and Connections[CoName] or Connections[CoName.Name]
    for _,F in pairs(C) do task.spawn(F,...) end
end
NewConnectionList({"FlagsChanged","ThemeChanged","FileSaved","ThemeChanging","OptionAdded"})

-- ─── Flags ──────────────────────────────────────────────────
local GetFlag, SetFlag, CheckFlag
CheckFlag = function(N) return type(N)=="string" and Flags[N]~=nil end
GetFlag   = function(N) return type(N)=="string" and Flags[N] end
SetFlag   = function(Flag,Value)
    if Flag and (Value~=Flags[Flag] or type(Value)=="table") then
        Flags[Flag]=Value; Connection:FireConnection("FlagsChanged",Flag,Value)
    end
end
local function SaveJson(File,data)
    if writefile then local ok,j=pcall(function() return HttpService:JSONEncode(data) end); if ok then writefile(File,j) end end
end
local db
Connection.FlagsChanged:Connect(function()
    local SF=Settings.ScriptFile
    if not db and SF and writefile then
        db=true;task.wait(0.1);db=false
        local ok,e=pcall(function() return HttpService:JSONEncode(Flags) end)
        if ok then pcall(writefile,SF,e) end
    end
end)

-- ─── ScreenGui ──────────────────────────────────────────────
local ScreenGui = Create("ScreenGui",CoreGui,{Name="Herlys-Hub-v2"},{
    Create("UIScale",{Scale=UIScale,Name="Scale"})
})
local SF=CoreGui:FindFirstChild(ScreenGui.Name)
if SF and SF~=ScreenGui then SF:Destroy() end

-- ─── Utilities ──────────────────────────────────────────────
local function GetStr(v) if type(v)=="function" then return v() end; return v end
local function ConnectSave(Inst,func)
    Inst.InputBegan:Connect(function(I)
        if I.UserInputType==Enum.UserInputType.MouseButton1 or I.UserInputType==Enum.UserInputType.Touch then
            while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait() end
        end; func()
    end)
end
local function CreateTween(C)
    local I=C[1] or C.Instance; local P=C[2] or C.Prop; local V=C[3] or C.NewVal
    local T=C[4] or C.Time or 0.5; local W=C[5] or C.wait or false
    local tw=TweenService:Create(I,TweenInfo.new(T,Enum.EasingStyle.Quint),{[P]=V})
    tw:Play(); if W then tw.Completed:Wait() end; return tw
end
local function MakeDrag(Inst)
    task.spawn(function()
        SetProps(Inst,{Active=true,AutoButtonColor=false})
        local DS,SP,IO
        Inst.MouseButton1Down:Connect(function() IO=true end)
        Inst.InputBegan:Connect(function(I)
            if I.UserInputType==Enum.UserInputType.MouseButton1 or I.UserInputType==Enum.UserInputType.Touch then
                SP=Inst.Position; DS=I.Position
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do RunService.Heartbeat:Wait()
                    if IO then
                        local d=I.Position-DS
                        CreateTween({Inst,"Position",UDim2.new(SP.X.Scale,SP.X.Offset+d.X/UIScale,SP.Y.Scale,SP.Y.Offset+d.Y/UIScale),0.35})
                    end
                end; IO=false
            end
        end)
    end); return Inst
end
local Theme = HerlysHub.Themes[HerlysHub.Save.Theme]

-- ─── Elements ───────────────────────────────────────────────
local function AddEle(N,F) HerlysHub.Elements[N]=F end
local function Make(E,I,p,...) return HerlysHub.Elements[E](I,p,...) end

AddEle("Corner",function(p,r) return SetProps(Create("UICorner",p,{CornerRadius=r or UDim.new(0,7)}),{}) end)
AddEle("Stroke",function(p,props,...)
    local a={...}; return InsertTheme(SetProps(Create("UIStroke",p,{Color=a[1] or Theme["Color Stroke"],Thickness=a[2] or 1,ApplyStrokeMode="Border"}),props),"Stroke")
end)
AddEle("Button",function(p,props,...)
    local a={...}
    local N=InsertTheme(SetProps(Create("TextButton",p,{Text="",Size=UDim2.fromScale(1,1),BackgroundColor3=Theme["Color Hub 2"],AutoButtonColor=false}),props),"Frame")
    N.MouseEnter:Connect(function() N.BackgroundTransparency=0.4 end)
    N.MouseLeave:Connect(function() N.BackgroundTransparency=0 end)
    if a[1] then N.Activated:Connect(a[1]) end; return N
end)
AddEle("Gradient",function(p,props,...) return InsertTheme(SetProps(Create("UIGradient",p,{Color=Theme["Color Hub 1"]}),props),"Gradient") end)

local function GetColor(I)
    if I:IsA("Frame") then return "BackgroundColor3"
    elseif I:IsA("ImageLabel") then return "ImageColor3"
    elseif I:IsA("TextLabel") then return "TextColor3"
    elseif I:IsA("ScrollingFrame") then return "ScrollBarImageColor3"
    elseif I:IsA("UIStroke") then return "Color" end; return ""
end

local function ButtonFrame(Parent,Title,Desc,HSize)
    local TL=InsertTheme(Create("TextLabel",{Font=Enum.Font.GothamMedium,TextColor3=Theme["Color Text"],Size=UDim2.new(1,-20),AutomaticSize="Y",Position=UDim2.new(0,0,0.5),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,TextTruncate="AtEnd",TextSize=10,TextXAlignment="Left",Text="",RichText=true}),"Text")
    local DL=InsertTheme(Create("TextLabel",{Font=Enum.Font.Gotham,TextColor3=Theme["Color Dark Text"],Size=UDim2.new(1,-20),AutomaticSize="Y",Position=UDim2.new(0,12,0,15),BackgroundTransparency=1,TextWrapped=true,TextSize=8,TextXAlignment="Left",Text="",RichText=true}),"DarkText")
    local Fr=Make("Button",Parent,{Size=UDim2.new(1,0,0,25),AutomaticSize="Y",Name="Option"})
    Make("Corner",Fr,UDim.new(0,6))
    local LH=Create("Frame",Fr,{AutomaticSize="Y",BackgroundTransparency=1,Size=HSize,Position=UDim2.new(0,10,0),AnchorPoint=Vector2.new(0,0)},{
        Create("UIListLayout",{SortOrder="LayoutOrder",VerticalAlignment="Center",Padding=UDim.new(0,2)}),
        Create("UIPadding",{PaddingBottom=UDim.new(0,5),PaddingTop=UDim.new(0,5)}),
        TL,DL
    })
    local Lb={}
    function Lb:SetTitle(T)
        if type(T)=="string" and T:gsub(" ",""):len()>0 then TL.Text=T end
    end
    function Lb:SetDesc(D)
        if type(D)=="string" and D:gsub(" ",""):len()>0 then
            DL.Visible=true; DL.Text=D
            LH.Position=UDim2.new(0,10,0); LH.AnchorPoint=Vector2.new(0,0)
        else
            DL.Visible=false; DL.Text=""
            LH.Position=UDim2.new(0,10,0.5); LH.AnchorPoint=Vector2.new(0,0.5)
        end
    end
    Lb:SetTitle(Title); Lb:SetDesc(Desc); return Fr,Lb
end

-- ─── Public API ─────────────────────────────────────────────
function HerlysHub:GetIcon(idx)
    if type(idx)~="string" or idx:find("rbxassetid://") or #idx==0 then return idx end
    local first; idx=string.lower(idx):gsub("lucide",""):gsub("-","")
    if self.Icons[idx] then return self.Icons[idx] end
    for N,I in pairs(self.Icons) do
        if N==idx then return I
        elseif not first and N:find(idx,1,true) then first=I end
    end
    return first or idx
end

function HerlysHub:SetTheme(NT)
    if not HerlysHub.Themes[NT] then return end
    HerlysHub.Save.Theme=NT; SaveJson("Herlys Hub.json",HerlysHub.Save)
    Theme=HerlysHub.Themes[NT]; Connection:FireConnection("ThemeChanged",NT)
    table.foreach(HerlysHub.Instances,function(_,V)
        local T,I=V.Type,V.Instance
        if T=="Gradient" then I.Color=Theme["Color Hub 1"]
        elseif T=="Frame" then I.BackgroundColor3=Theme["Color Hub 2"]
        elseif T=="Stroke" then I[GetColor(I)]=Theme["Color Stroke"]
        elseif T=="Theme"  then I[GetColor(I)]=Theme["Color Theme"]
        elseif T=="Text"   then I[GetColor(I)]=Theme["Color Text"]
        elseif T=="DarkText" then I[GetColor(I)]=Theme["Color Dark Text"]
        elseif T=="ScrollBar" then I[GetColor(I)]=Theme["Color Theme"] end
    end)
end

function HerlysHub:SetScale(NS)
    NS=ViewportSize.Y/math.clamp(NS,300,2000)
    UIScale=NS; ScreenGui.Scale.Scale=NS
end

function HerlysHub:MakeNotify(C)
    local NN=C[1] or C.Name or "Herlys Hub"
    local NT=C[2] or C.Text or ""
    local NTm=C[3] or C.Time or 5
    local NF=InsertTheme(Create("Frame",ScreenGui,{
        Size=UDim2.fromOffset(220,55),
        Position=UDim2.new(1,10,1,-75),
        BackgroundColor3=Theme["Color Hub 2"],
        AnchorPoint=Vector2.new(1,1),
        BackgroundTransparency=0.1,
        Name="HerlysNotif"
    }),"Frame")
    Make("Corner",NF,UDim.new(0,8)); Make("Stroke",NF); Make("Gradient",NF,{Rotation=90})
    local Ac=InsertTheme(Create("Frame",NF,{Size=UDim2.new(0,3,1,-10),Position=UDim2.new(0,5,0.5),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Theme["Color Theme"]}),"Theme")
    Make("Corner",Ac,UDim.new(1,0))
    InsertTheme(Create("TextLabel",NF,{Size=UDim2.new(1,-20,0,15),Position=UDim2.new(0,15,0,5),Text=NN,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=Theme["Color Text"],BackgroundTransparency=1,TextXAlignment="Left"}),"Text")
    InsertTheme(Create("TextLabel",NF,{Size=UDim2.new(1,-20,0,25),Position=UDim2.new(0,15,0,22),Text=NT,Font=Enum.Font.Gotham,TextSize=9,TextWrapped=true,TextColor3=Theme["Color Dark Text"],BackgroundTransparency=1,TextXAlignment="Left"}),"DarkText")
    CreateTween({NF,"Position",UDim2.new(1,-230,1,-75),0.4})
    task.delay(NTm,function() CreateTween({NF,"Position",UDim2.new(1,10,1,-75),0.4,true}); NF:Destroy() end)
end

-- ─── MakeWindow ─────────────────────────────────────────────
function HerlysHub:MakeWindow(Cfg)
    local WT  = Cfg[1] or Cfg.Name or Cfg.Title or "Herlys Hub"
    local WS  = Cfg[2] or Cfg.SubTitle or "by Herlys"
    Settings.ScriptFile = Cfg[3] or Cfg.SaveFolder or false

    local function LoadFile()
        local F=Settings.ScriptFile
        if type(F)~="string" or not readfile or not isfile then return end
        local ok,r=pcall(isfile,F); if ok and r then
            local ok2,raw=pcall(readfile,F); if ok2 and type(raw)=="string" then
                local ok3,decoded=pcall(function() return HttpService:JSONDecode(raw) end)
                Flags=ok3 and decoded or {}
            end
        end
    end; LoadFile()

    local SX,SY=unpack(HerlysHub.Save.UISize)
    local MF=InsertTheme(Create("ImageButton",ScreenGui,{
        Size=UDim2.fromOffset(SX,SY),
        Position=UDim2.new(0.5,-SX/2,0.5,-SY/2),
        BackgroundTransparency=0.03,Name="HerlysHub"
    }),"Main")
    Make("Gradient",MF,{Rotation=45}); MakeDrag(MF)
    local MC=Make("Corner",MF)
    local Comps=Create("Folder",MF,{Name="Components"})
    local DH=Create("Folder",ScreenGui,{Name="Dropdown"})
    local TB=Create("Frame",Comps,{Size=UDim2.new(1,0,0,28),BackgroundTransparency=1,Name="TopBar"})

    local TitleL=InsertTheme(Create("TextLabel",TB,{
        Position=UDim2.new(0,15,0.5),AnchorPoint=Vector2.new(0,0.5),
        AutomaticSize="XY",Text=WT,TextXAlignment="Left",TextSize=12,
        TextColor3=Theme["Color Text"],BackgroundTransparency=1,
        Font=Enum.Font.GothamMedium,Name="Title"
    },{
        InsertTheme(Create("TextLabel",{
            Size=UDim2.fromScale(0,1),AutomaticSize="X",AnchorPoint=Vector2.new(0,1),
            Position=UDim2.new(1,5,0.9),Text=WS,TextColor3=Theme["Color Dark Text"],
            BackgroundTransparency=1,TextXAlignment="Left",TextYAlignment="Bottom",
            TextSize=8,Font=Enum.Font.Gotham,Name="SubTitle"
        }),"DarkText")
    }),"Text")

    local MS=InsertTheme(Create("ScrollingFrame",Comps,{
        Size=UDim2.new(0,HerlysHub.Save.TabSize,1,-TB.Size.Y.Offset),
        ScrollBarImageColor3=Theme["Color Theme"],Position=UDim2.new(0,0,1,0),
        AnchorPoint=Vector2.new(0,1),ScrollBarThickness=1.5,BackgroundTransparency=1,
        ScrollBarImageTransparency=0.2,CanvasSize=UDim2.new(),AutomaticCanvasSize="Y",
        ScrollingDirection="Y",BorderSizePixel=0,Name="TabScroll"
    },{
        Create("UIPadding",{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,10)}),
        Create("UIListLayout",{Padding=UDim.new(0,5)})
    }),"ScrollBar")

    local Cont=Create("Frame",Comps,{
        Size=UDim2.new(1,-MS.Size.X.Offset,1,-TB.Size.Y.Offset),
        AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,ClipsDescendants=true,Name="Containers"
    })
    local CS1=MakeDrag(Create("ImageButton",MF,{Size=UDim2.new(0,35,0,35),Position=MF.Size,Active=true,AnchorPoint=Vector2.new(0.8,0.8),BackgroundTransparency=1,Name="CS1"}))
    local CS2=MakeDrag(Create("ImageButton",MF,{Size=UDim2.new(0,20,1,-30),Position=UDim2.new(0,MS.Size.X.Offset,1,0),AnchorPoint=Vector2.new(0.5,1),Active=true,BackgroundTransparency=1,Name="CS2"}))
    local function ControlSize()
        local P1,P2=CS1.Position,CS2.Position
        CS1.Position=UDim2.fromOffset(math.clamp(P1.X.Offset,430,1000),math.clamp(P1.Y.Offset,200,500))
        CS2.Position=UDim2.new(0,math.clamp(P2.X.Offset,135,250),1,0)
        MS.Size=UDim2.new(0,CS2.Position.X.Offset,1,-TB.Size.Y.Offset)
        Cont.Size=UDim2.new(1,-MS.Size.X.Offset,1,-TB.Size.Y.Offset)
        MF.Size=CS1.Position
    end
    CS1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
    CS2:GetPropertyChangedSignal("Position"):Connect(ControlSize)
    ConnectSave(CS1,function() if not Minimized then HerlysHub.Save.UISize={MF.Size.X.Offset,MF.Size.Y.Offset}; SaveJson("Herlys Hub.json",HerlysHub.Save) end end)
    ConnectSave(CS2,function() HerlysHub.Save.TabSize=MS.Size.X.Offset; SaveJson("Herlys Hub.json",HerlysHub.Save) end)

    local BF=Create("Folder",TB,{Name="Buttons"})
    local CloseBtn=Create("ImageButton",{Size=UDim2.new(0,14,0,14),Position=UDim2.new(1,-10,0.5),AnchorPoint=Vector2.new(1,0.5),BackgroundTransparency=1,Image="rbxassetid://10747384394",AutoButtonColor=false,Name="Close"})
    local MinBtn=SetProps(CloseBtn:Clone(),{Position=UDim2.new(1,-35,0.5),Image="rbxassetid://10734896206",Name="Minimize"})
    SetChildren(BF,{CloseBtn,MinBtn})

    local Minimized,SaveSize,WC
    local Window,FirstTab={},false

    function Window:CloseBtn()
        Window:Dialog({Title="Herlys Hub",Text="Bạn có muốn đóng Herlys Hub không?",
            Options={{"Xác nhận",function() ScreenGui:Destroy() end},{"Huỷ"}}})
    end
    function Window:MinimizeBtn()
        if WC then return end; WC=true
        if Minimized then
            MinBtn.Image="rbxassetid://10734896206"
            CreateTween({MF,"Size",SaveSize,0.25,true})
            CS1.Visible=true; CS2.Visible=true; Minimized=false
        else
            MinBtn.Image="rbxassetid://10734924532"; SaveSize=MF.Size
            CS1.Visible=false; CS2.Visible=false
            CreateTween({MF,"Size",UDim2.fromOffset(MF.Size.X.Offset,28),0.25,true}); Minimized=true
        end; WC=false
    end
    function Window:Minimize() MF.Visible=not MF.Visible end
    function Window:Set(V1,V2)
        if type(V1)=="string" and type(V2)=="string" then TitleL.Text=V1; TitleL.SubTitle.Text=V2
        elseif type(V1)=="string" then TitleL.Text=V1 end
    end
    function Window:Dialog(Cfg2)
        if MF:FindFirstChild("HerlysDialog") then return end
        if Minimized then Window:MinimizeBtn() end
        local DT=Cfg2[1] or Cfg2.Title or "Herlys Hub"
        local DX=Cfg2[2] or Cfg2.Text or "Thông báo"
        local DO=Cfg2[3] or Cfg2.Options or {}
        local Fr=Create("Frame",{Active=true,Size=UDim2.fromOffset(250*1.08,150*1.08),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5)},{
            InsertTheme(Create("TextLabel",{Font=Enum.Font.GothamBold,Size=UDim2.new(1,0,0,20),Text=DT,TextXAlignment="Left",TextColor3=Theme["Color Text"],TextSize=15,Position=UDim2.fromOffset(15,5),BackgroundTransparency=1}),"Text"),
            InsertTheme(Create("TextLabel",{Font=Enum.Font.GothamMedium,Size=UDim2.new(1,-25),AutomaticSize="Y",Text=DX,TextXAlignment="Left",TextColor3=Theme["Color Dark Text"],TextSize=12,Position=UDim2.fromOffset(15,25),BackgroundTransparency=1,TextWrapped=true}),"DarkText")
        })
        Make("Gradient",Fr,{Rotation=270}); Make("Corner",Fr)
        local BH=Create("Frame",Fr,{Size=UDim2.fromScale(1,0.35),Position=UDim2.fromScale(0,1),AnchorPoint=Vector2.new(0,1),BackgroundTransparency=1},{
            Create("UIListLayout",{Padding=UDim.new(0,10),VerticalAlignment="Center",FillDirection="Horizontal",HorizontalAlignment="Center"})
        })
        local Sc=InsertTheme(Create("Frame",MF,{BackgroundTransparency=0.6,Active=true,BackgroundColor3=Theme["Color Stroke"],Size=UDim2.new(1,0,1,0),Name="HerlysDialog"}),"Stroke")
        MC:Clone().Parent=Sc; Fr.Parent=Sc
        CreateTween({Fr,"Size",UDim2.fromOffset(250,150),0.2}); CreateTween({Sc,"BackgroundTransparency",0.3,0.15})
        local BC,Dlg=1,{}
        function Dlg:Button(Bc)
            local N=Bc[1] or Bc.Name or ""; local Cb=Bc[2] or Bc.Callback or function()end
            BC=BC+1; local Btn=Make("Button",BH); Make("Corner",Btn)
            SetProps(Btn,{Text=N,Font=Enum.Font.GothamBold,TextColor3=Theme["Color Text"],TextSize=12})
            for _,B in pairs(BH:GetChildren()) do
                if B:IsA("TextButton") then B.Size=UDim2.new(1/BC,-(((BC-1)*20)/BC),0,32) end
            end
            Btn.Activated:Connect(Dlg.Close); Btn.Activated:Connect(Cb)
        end
        function Dlg:Close()
            CreateTween({Fr,"Size",UDim2.fromOffset(250*1.08,150*1.08),0.2})
            CreateTween({Sc,"BackgroundTransparency",1,0.15,true}); Sc:Destroy()
        end
        table.foreach(DO,function(_,B) Dlg:Button(B) end); return Dlg
    end
    function Window:SelectTab(TS)
        if type(TS)=="number" then HerlysHub.Tabs[TS].func:Enable()
        else for _,T in pairs(HerlysHub.Tabs) do if T.Cont==TS.Cont then T.func:Enable() end end end
    end
    function Window:AddMinimizeButton(Cfg2)
        local Btn=MakeDrag(Create("ImageButton",ScreenGui,{Size=UDim2.fromOffset(35,35),Position=UDim2.fromScale(0.15,0.15),BackgroundTransparency=1,BackgroundColor3=Theme["Color Hub 2"],AutoButtonColor=false}))
        local Strk,Cor
        if Cfg2.Corner then Cor=Make("Corner",Btn); SetProps(Cor,Cfg2.Corner) end
        if Cfg2.Stroke then Strk=Make("Stroke",Btn) end
        SetProps(Btn,Cfg2.Button); Btn.Activated:Connect(Window.Minimize)
        return {Stroke=Strk,Corner=Cor,Button=Btn}
    end

    local ContList={}
    function Window:MakeTab(paste,Cfg2)
        if type(paste)=="table" then Cfg2=paste end
        local TN=Cfg2[1] or Cfg2.Title or "Tab"
        local TI=Cfg2[2] or Cfg2.Icon or ""
        TI=HerlysHub:GetIcon(TI)
        if not TI:find("rbxassetid://") or TI:gsub("rbxassetid://",""):len()<6 then TI=false end

        local TS=Make("Button",MS,{Size=UDim2.new(1,0,0,24)}); Make("Corner",TS)
        local LT=InsertTheme(Create("TextLabel",TS,{Size=UDim2.new(1,TI and -25 or -15,1),Position=UDim2.fromOffset(TI and 25 or 15),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,Text=TN,TextColor3=Theme["Color Text"],TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=(FirstTab and 0.3) or 0,TextTruncate="AtEnd"}),"Text")
        local LI=InsertTheme(Create("ImageLabel",TS,{Position=UDim2.new(0,8,0.5),Size=UDim2.new(0,13,0,13),AnchorPoint=Vector2.new(0,0.5),Image=TI or "",BackgroundTransparency=1,ImageTransparency=(FirstTab and 0.3) or 0}),"Text")
        local Sel=InsertTheme(Create("Frame",TS,{Size=FirstTab and UDim2.new(0,4,0,4) or UDim2.new(0,4,0,13),Position=UDim2.new(0,1,0.5),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Theme["Color Theme"],BackgroundTransparency=FirstTab and 1 or 0}),"Theme")
        Make("Corner",Sel,UDim.new(0.5,0))

        local Container=InsertTheme(Create("ScrollingFrame",{
            Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,1),AnchorPoint=Vector2.new(0,1),
            ScrollBarThickness=1.5,BackgroundTransparency=1,ScrollBarImageTransparency=0.2,
            ScrollBarImageColor3=Theme["Color Theme"],AutomaticCanvasSize="Y",
            ScrollingDirection="Y",BorderSizePixel=0,CanvasSize=UDim2.new(),
            Name=("HTab_%d_%s"):format(#ContList+1,TN)
        },{
            Create("UIPadding",{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,10)}),
            Create("UIListLayout",{Padding=UDim.new(0,5)})
        }),"ScrollBar")
        table.insert(ContList,Container)
        if not FirstTab then Container.Parent=Cont end

        local Tab={Enabled=(FirstTab==false)}
        local function Tabs()
            if Container.Parent then return end
            for _,F in pairs(ContList) do if F:IsA("ScrollingFrame") and F~=Container then F.Parent=nil end end
            Container.Parent=Cont; Container.Size=UDim2.new(1,0,1,150)
            table.foreach(HerlysHub.Tabs,function(_,T) if T.Cont~=Container then T.func:Disable() end end)
            Tab.Enabled=true
            CreateTween({Container,"Size",UDim2.new(1,0,1,0),0.3})
            CreateTween({LT,"TextTransparency",0,0.35}); CreateTween({LI,"ImageTransparency",0,0.35})
            CreateTween({Sel,"Size",UDim2.new(0,4,0,13),0.35}); CreateTween({Sel,"BackgroundTransparency",0,0.35})
        end
        TS.Activated:Connect(Tabs); FirstTab=true
        table.insert(HerlysHub.Tabs,{TabInfo={Name=TN,Icon=TI},func=Tab,Cont=Container})
        Tab.Cont=Container

        function Tab:Disable()
            self.Enabled=false; Container.Parent=nil
            CreateTween({LT,"TextTransparency",0.3,0.35}); CreateTween({LI,"ImageTransparency",0.3,0.35})
            CreateTween({Sel,"Size",UDim2.new(0,4,0,4),0.35}); CreateTween({Sel,"BackgroundTransparency",1,0.35})
        end
        function Tab:Enable() Tabs() end
        function Tab:Visible(B) Funcs:ToggleVisible(TS,B) end
        function Tab:Destroy() TS:Destroy(); Container:Destroy() end

        function Tab:AddSection(Cfg3)
            local SN=type(Cfg3)=="string" and Cfg3 or Cfg3[1] or Cfg3.Name or Cfg3.Title or ""
            local SF=Create("Frame",Container,{Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Name="Option"})
            local SL=InsertTheme(Create("TextLabel",SF,{Font=Enum.Font.GothamBold,Text=SN,TextColor3=Theme["Color Text"],Size=UDim2.new(1,-25,1,0),Position=UDim2.new(0,5),BackgroundTransparency=1,TextTruncate="AtEnd",TextSize=14,TextXAlignment="Left"}),"Text")
            local Sec={}
            table.insert(HerlysHub.Options,{type="Section",Name=SN,func=Sec})
            function Sec:Visible(B) if B==nil then SF.Visible=not SF.Visible else SF.Visible=B end end
            function Sec:Destroy() SF:Destroy() end
            function Sec:Set(N) if N then SL.Text=GetStr(N) end end
            return Sec
        end

        function Tab:AddParagraph(Cfg3)
            local PN=Cfg3[1] or Cfg3.Title or ""; local PD=Cfg3[2] or Cfg3.Text or ""
            local Fr,Lb=ButtonFrame(Container,PN,PD,UDim2.new(1,-20))
            local P={}
            function P:Visible(...) Funcs:ToggleVisible(Fr,...) end
            function P:Destroy() Fr:Destroy() end
            function P:SetTitle(V) Lb:SetTitle(GetStr(V)) end
            function P:SetDesc(V)  Lb:SetDesc(GetStr(V)) end
            function P:Set(V1,V2)
                if V1 and V2 then Lb:SetTitle(GetStr(V1)); Lb:SetDesc(GetStr(V2))
                elseif V1 then Lb:SetDesc(GetStr(V1)) end
            end
            return P
        end

        function Tab:AddButton(Cfg3)
            local BN=Cfg3[1] or Cfg3.Name or Cfg3.Title or "Button"
            local BD=Cfg3.Desc or Cfg3.Description or ""
            local Cb=Funcs:GetCallback(Cfg3,2)
            local Fr,Lb=ButtonFrame(Container,BN,BD,UDim2.new(1,-20))
            Create("ImageLabel",Fr,{Size=UDim2.new(0,14,0,14),Position=UDim2.new(1,-10,0.5),AnchorPoint=Vector2.new(1,0.5),BackgroundTransparency=1,Image="rbxassetid://10709791437"})
            Fr.Activated:Connect(function() Funcs:FireCallback(Cb) end)
            local Btn={}
            function Btn:Visible(...) Funcs:ToggleVisible(Fr,...) end
            function Btn:Destroy() Fr:Destroy() end
            function Btn:Callback(...) Funcs:InsertCallback(Cb,...) end
            function Btn:Set(V1,V2)
                if type(V1)=="string" and type(V2)=="string" then Lb:SetTitle(V1); Lb:SetDesc(V2)
                elseif type(V1)=="string" then Lb:SetTitle(V1)
                elseif type(V1)=="function" then Cb=V1 end
            end
            return Btn
        end

        function Tab:AddToggle(Cfg3)
            local TgN=Cfg3[1] or Cfg3.Name or Cfg3.Title or "Toggle"
            local TgD=Cfg3.Desc or Cfg3.Description or ""
            local Cb=Funcs:GetCallback(Cfg3,3)
            local Fl=Cfg3[4] or Cfg3.Flag or false
            local Def=Cfg3[2] or Cfg3.Default or false
            if CheckFlag(Fl) then Def=GetFlag(Fl) end
            local Fr,Lb=ButtonFrame(Container,TgN,TgD,UDim2.new(1,-38))
            local TH=InsertTheme(Create("Frame",Fr,{Size=UDim2.new(0,35,0,18),Position=UDim2.new(1,-10,0.5),AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=Theme["Color Stroke"]}),"Stroke")
            Make("Corner",TH,UDim.new(0.5,0))
            local Sl=Create("Frame",TH,{BackgroundTransparency=1,Size=UDim2.new(0.8,0,0.8,0),Position=UDim2.new(0.5,0,0.5,0),AnchorPoint=Vector2.new(0.5,0.5)})
            local Kn=InsertTheme(Create("Frame",Sl,{Size=UDim2.new(0,12,0,12),Position=UDim2.new(0,0,0.5),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Theme["Color Theme"]}),"Theme")
            Make("Corner",Kn,UDim.new(0.5,0))
            local WCT
            local function SetTg(V)
                if WCT then return end; WCT,Def=true,V
                SetFlag(Fl,Def); Funcs:FireCallback(Cb,Def)
                if Def then
                    CreateTween({Kn,"Position",UDim2.new(1,0,0.5),0.25}); CreateTween({Kn,"BackgroundTransparency",0,0.25}); CreateTween({Kn,"AnchorPoint",Vector2.new(1,0.5),0.25})
                else
                    CreateTween({Kn,"Position",UDim2.new(0,0,0.5),0.25}); CreateTween({Kn,"BackgroundTransparency",0.8,0.25}); CreateTween({Kn,"AnchorPoint",Vector2.new(0,0.5),0.25})
                end; WCT=false
            end; task.spawn(SetTg,Def)
            Fr.Activated:Connect(function() SetTg(not Def) end)
            local Tg={}
            function Tg:Visible(...) Funcs:ToggleVisible(Fr,...) end
            function Tg:Destroy() Fr:Destroy() end
            function Tg:Callback(...) Funcs:InsertCallback(Cb,...)() end
            function Tg:Set(V1,V2)
                if type(V1)=="string" and type(V2)=="string" then Lb:SetTitle(V1); Lb:SetDesc(V2)
                elseif type(V1)=="string" then Lb:SetTitle(V1,false,true)
                elseif type(V1)=="boolean" then if WCT and V2 then repeat task.wait() until not WCT end; task.spawn(SetTg,V1)
                elseif type(V1)=="function" then Cb=V1 end
            end
            return Tg
        end

        function Tab:AddDropdown(Cfg3)
            local DN=Cfg3[1] or Cfg3.Name or Cfg3.Title or "Dropdown"
            local DD=Cfg3.Desc or Cfg3.Description or ""
            local DO=Cfg3[2] or Cfg3.Options or {}
            local ODef=Cfg3[3] or Cfg3.Default or {}
            local Fl=Cfg3[5] or Cfg3.Flag or false
            local DMS=Cfg3.MultiSelect or false
            local Cb=Funcs:GetCallback(Cfg3,4)
            local Fr,Lb=ButtonFrame(Container,DN,DD,UDim2.new(1,-180))
            local SF=InsertTheme(Create("Frame",Fr,{Size=UDim2.new(0,150,0,18),Position=UDim2.new(1,-10,0.5),AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=Theme["Color Stroke"]}),"Stroke")
            Make("Corner",SF,UDim.new(0,4))
            local AL=InsertTheme(Create("TextLabel",SF,{Size=UDim2.new(0.85,0,0.85,0),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextScaled=true,TextColor3=Theme["Color Text"],Text="..."}),"Text")
            local Ar=Create("ImageLabel",SF,{Size=UDim2.new(0,15,0,15),Position=UDim2.new(0,-5,0.5),AnchorPoint=Vector2.new(1,0.5),Image="rbxassetid://10709791523",BackgroundTransparency=1})
            local NCF=Create("TextButton",DH,{Name="HAC",Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=false,Text=""})
            local DF=Create("Frame",NCF,{Size=UDim2.new(0,152,0,0),BackgroundTransparency=0.1,BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0,1),Name="HDF",ClipsDescendants=true,Active=true})
            Make("Corner",DF); Make("Stroke",DF); Make("Gradient",DF,{Rotation=60})
            local ScFr=InsertTheme(Create("ScrollingFrame",DF,{ScrollBarImageColor3=Theme["Color Theme"],Size=UDim2.new(1,0,1,0),ScrollBarThickness=1.5,BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=UDim2.new(),ScrollingDirection="Y",AutomaticCanvasSize="Y",Active=true},{
                Create("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,5)}),
                Create("UIListLayout",{Padding=UDim.new(0,4)})
            }),"ScrollBar")
            local SS,WCD=5
            local function Disable()
                WCD=true; CreateTween({Ar,"Rotation",0,0.2}); CreateTween({DF,"Size",UDim2.new(0,152,0,0),0.2,true})
                CreateTween({Ar,"ImageColor3",Color3.fromRGB(255,255,255),0.2}); Ar.Image="rbxassetid://10709791523"; NCF.Visible=false; WCD=false
            end
            local function GFS() return UDim2.fromOffset(152,SS) end
            local function CalcSz()
                local C2=0
                for _,F in pairs(ScFr:GetChildren()) do if F:IsA("Frame") or F.Name=="Option" then C2=C2+1 end end
                SS=(math.clamp(C2,0,10)*25)+10; if NCF.Visible then CreateTween({DF,"Size",GFS(),0.2,true}) end
            end
            local function Mini()
                if WCD then return end; WCD=true
                if NCF.Visible then Ar.Image="rbxassetid://10709791523"; CreateTween({Ar,"ImageColor3",Color3.fromRGB(255,255,255),0.2}); CreateTween({DF,"Size",UDim2.new(0,152,0,0),0.2,true}); NCF.Visible=false
                else NCF.Visible=true; Ar.Image="rbxassetid://10709790948"; CreateTween({Ar,"ImageColor3",Theme["Color Theme"],0.2}); CreateTween({DF,"Size",GFS(),0.2,true}) end; WCD=false
            end
            local function CalcPos()
                local FP=SF.AbsolutePosition; local SS2=ScreenGui.AbsoluteSize
                local CX=math.clamp(FP.X/UIScale,0,SS2.X/UIScale-DF.Size.X.Offset)
                local CY=math.clamp(FP.Y/UIScale,0,SS2.Y/UIScale)
                local AP=FP.Y>SS2.Y/1.4 and 1 or SS>80 and 0.5 or 0
                DF.AnchorPoint=Vector2.new(0,AP); CreateTween({DF,"Position",UDim2.fromOffset(CX,CY),0.1})
            end
            local ANO,GOpts,AO,RO,Sel2
            do
                local DefD=type(ODef)~="table" and {ODef} or ODef
                local MS2=DMS; local Opts={}
                Sel2=MS2 and {} or CheckFlag(Fl) and GetFlag(Fl) or DefD[1]
                if MS2 then
                    for i,V in pairs(CheckFlag(Fl) and GetFlag(Fl) or DefD) do
                        if type(i)=="string" and (DO[i] or table.find(DO,i)) then Sel2[i]=V
                        elseif DO[V] then Sel2[V]=true end
                    end
                end
                local function CBS() SetFlag(Fl,if MS2 then Sel2 else tostring(Sel2 or "...")); Funcs:FireCallback(Cb,Sel2) end
                local function UL()
                    if MS2 then local l={} for i,V in pairs(Sel2) do if V then table.insert(l,i) end end; AL.Text=#l>0 and table.concat(l,", ") or "..."
                    else AL.Text=tostring(Sel2 or "...") end
                end
                local function US()
                    if MS2 then for _,v in pairs(Opts) do local n,S=v.nodes,v.Stats; CreateTween({n[2],"BackgroundTransparency",S and 0 or 0.8,0.35}); CreateTween({n[2],"Size",S and UDim2.fromOffset(4,12) or UDim2.fromOffset(4,4),0.35}); CreateTween({n[3],"TextTransparency",S and 0 or 0.4,0.35}) end
                    else for _,v in pairs(Opts) do local sl=v.Value==Sel2; local n=v.nodes; CreateTween({n[2],"BackgroundTransparency",sl and 0 or 1,0.35}); CreateTween({n[2],"Size",sl and UDim2.fromOffset(4,14) or UDim2.fromOffset(4,4),0.35}); CreateTween({n[3],"TextTransparency",sl and 0 or 0.4,0.35}) end end; UL()
                end
                local function Sel3(O)
                    if MS2 then O.Stats=not O.Stats; Sel2[O.Name]=O.Stats; CBS()
                    else Sel2=O.Value; CBS() end; US()
                end
                AO=function(i,V)
                    local N=tostring(type(i)=="string" and i or V); if Opts[N] then return end
                    Opts[N]={index=i,Value=V,Name=N,Stats=false}
                    if MS2 then local S=Sel2[N]; Sel2[N]=S or false; Opts[N].Stats=S end
                    local B=Make("Button",ScFr,{Name="Option",Size=UDim2.new(1,0,0,21)}); Make("Corner",B,UDim.new(0,4))
                    local IS=InsertTheme(Create("Frame",B,{Position=UDim2.new(0,1,0.5),Size=UDim2.new(0,4,0,4),BackgroundColor3=Theme["Color Theme"],BackgroundTransparency=1,AnchorPoint=Vector2.new(0,0.5)}),"Theme"); Make("Corner",IS,UDim.new(0.5,0))
                    local ON=InsertTheme(Create("TextLabel",B,{Size=UDim2.new(1,0,1),Position=UDim2.new(0,10),Text=N,TextColor3=Theme["Color Text"],Font=Enum.Font.GothamBold,TextXAlignment="Left",BackgroundTransparency=1,TextTransparency=0.4}),"Text")
                    B.Activated:Connect(function() Sel3(Opts[N]) end); Opts[N].nodes={B,IS,ON}
                end
                RO=function(i,V)
                    local N=tostring(type(i)=="string" and i or V)
                    if Opts[N] then if MS2 then Sel2[N]=nil else Sel2=nil end; Opts[N].nodes[1]:Destroy(); table.clear(Opts[N]); Opts[N]=nil end
                end
                GOpts=function() return Opts end
                ANO=function(List,Clear)
                    if Clear then table.foreach(Opts,RO) end
                    table.foreach(List,AO); CBS(); US()
                end
                table.foreach(DO,AO); CBS(); US()
            end
            Fr.Activated:Connect(Mini); NCF.MouseButton1Down:Connect(Disable); NCF.MouseButton1Click:Connect(Disable)
            MF:GetPropertyChangedSignal("Visible"):Connect(Disable); SF:GetPropertyChangedSignal("AbsolutePosition"):Connect(CalcPos)
            Fr.Activated:Connect(CalcSz); ScFr.ChildAdded:Connect(CalcSz); ScFr.ChildRemoved:Connect(CalcSz)
            CalcPos(); CalcSz()
            local Dp={}
            function Dp:Visible(...) Funcs:ToggleVisible(Fr,...) end
            function Dp:Destroy() Fr:Destroy() end
            function Dp:Callback(...) Funcs:InsertCallback(Cb,...)(Sel2) end
            function Dp:Add(...) local NO={...}; if type(NO[1])=="table" then table.foreach(NO[1],function(_,N) AO(N) end) else table.foreach(NO,function(_,N) AO(N) end) end end
            function Dp:Remove(O) for i,V in pairs(GOpts()) do if type(O)=="number" and i==O or V.Name==O then RO(i,V.Value) end end end
            function Dp:Set(V1,Clear) if type(V1)=="table" then ANO(V1,not Clear) elseif type(V1)=="function" then Cb=V1 end end
            return Dp
        end

        function Tab:AddSlider(Cfg3)
            local SN=Cfg3[1] or Cfg3.Name or Cfg3.Title or "Slider"
            local SD=Cfg3.Desc or Cfg3.Description or ""
            local Mn=Cfg3[2] or Cfg3.MinValue or Cfg3.Min or 10
            local Mx=Cfg3[3] or Cfg3.MaxValue or Cfg3.Max or 100
            local Inc=Cfg3[4] or Cfg3.Increase or 1
            local Cb=Funcs:GetCallback(Cfg3,6)
            local Fl=Cfg3[7] or Cfg3.Flag or false
            local Def=Cfg3[5] or Cfg3.Default or 25
            if CheckFlag(Fl) then Def=GetFlag(Fl) end
            Mn,Mx=Mn/Inc,Mx/Inc
            local Fr,Lb=ButtonFrame(Container,SN,SD,UDim2.new(1,-180))
            local SH=Create("TextButton",Fr,{Size=UDim2.new(0.45,0,1),Position=UDim2.new(1),AnchorPoint=Vector2.new(1,0),AutoButtonColor=false,Text="",BackgroundTransparency=1})
            local SB=InsertTheme(Create("Frame",SH,{BackgroundColor3=Theme["Color Stroke"],Size=UDim2.new(1,-20,0,6),Position=UDim2.new(0.5,0,0.5),AnchorPoint=Vector2.new(0.5,0.5)}),"Stroke"); Make("Corner",SB)
            local Ind=InsertTheme(Create("Frame",SB,{BackgroundColor3=Theme["Color Theme"],Size=UDim2.fromScale(0.3,1),BorderSizePixel=0}),"Theme"); Make("Corner",Ind)
            local SI=Create("Frame",SB,{Size=UDim2.new(0,6,0,12),BackgroundColor3=Color3.fromRGB(220,220,220),Position=UDim2.fromScale(0.3,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=0.2}); Make("Corner",SI)
            local LV=InsertTheme(Create("TextLabel",SH,{Size=UDim2.new(0,14,0,14),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(0,0,0.5),BackgroundTransparency=1,TextColor3=Theme["Color Text"],Font=Enum.Font.FredokaOne,TextSize=12}),"Text")
            local UV=Create("UIScale",LV)
            local BMP=Create("Frame",SB,{Position=UDim2.new(0,0,0.5,0),Visible=false})
            local function UL2(NV)
                local N=math.floor(tonumber(NV*Inc)*100)/100; Def=N; LV.Text=tostring(N); Funcs:FireCallback(Cb,Def)
            end
            local function CP()
                local MP=Player:GetMouse(); local AP=MP.X-BMP.AbsolutePosition.X
                SI.Position=UDim2.new(math.clamp(AP/SB.AbsoluteSize.X,0,1),0,0.5,0)
            end
            local function UV2()
                Ind.Size=UDim2.new(SI.Position.X.Scale,0,1,0)
                local NV=math.floor(((SI.Position.X.Scale*Mx)/Mx)*(Mx-Mn)+Mn); UL2(NV)
            end
            SH.MouseButton1Down:Connect(function()
                Container.ScrollingEnabled=false
                while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait(); CP() end
                Container.ScrollingEnabled=true; SetFlag(Fl,Def)
            end)
            LV:GetPropertyChangedSignal("Text"):Connect(function()
                UV.Scale=0.3; CreateTween({UV,"Scale",1.2,0.1}); CreateTween({LV,"Rotation",math.random(-1,1)*5,0.15,true}); CreateTween({UV,"Scale",1,0.2}); CreateTween({LV,"Rotation",0,0.1})
            end)
            local function SS2(NV)
                if type(NV)~="number" then return end
                local MnR,MxR=Mn*Inc,Mx*Inc; local SP=(NV-MnR)/(MxR-MnR)
                SetFlag(Fl,NV); CreateTween({SI,"Position",UDim2.fromScale(math.clamp(SP,0,1),0.5),0.3,true})
            end; SS2(Def)
            SI:GetPropertyChangedSignal("Position"):Connect(UV2); UV2()
            local Sl={}
            function Sl:Set(V1,V2)
                if V1 and V2 then Lb:SetTitle(V1); Lb:SetDesc(V2)
                elseif type(V1)=="string" then Lb:SetTitle(V1)
                elseif type(V1)=="function" then Cb=V1
                elseif type(V1)=="number" then SS2(V1) end
            end
            function Sl:Callback(...) Funcs:InsertCallback(Cb,...)(tonumber(Def)) end
            function Sl:Visible(...) Funcs:ToggleVisible(Fr,...) end
            function Sl:Destroy() Fr:Destroy() end
            return Sl
        end

        function Tab:AddTextBox(Cfg3)
            local TN=Cfg3[1] or Cfg3.Name or Cfg3.Title or "Text Box"
            local TD=Cfg3.Desc or Cfg3.Description or ""
            local TPH=Cfg3[5] or Cfg3.PlaceholderText or "Nhập..."
            local TCT=Cfg3[3] or Cfg3.ClearText or false
            local Cb=Funcs:GetCallback(Cfg3,4)
            local Fr,Lb=ButtonFrame(Container,TN,TD,UDim2.new(1,-38))
            local SF2=InsertTheme(Create("Frame",Fr,{Size=UDim2.new(0,150,0,18),Position=UDim2.new(1,-10,0.5),AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=Theme["Color Stroke"]}),"Stroke"); Make("Corner",SF2,UDim.new(0,4))
            local TBI=InsertTheme(Create("TextBox",SF2,{Size=UDim2.new(0.85,0,0.85,0),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextScaled=true,TextColor3=Theme["Color Text"],ClearTextOnFocus=TCT,PlaceholderText=TPH,Text=""}),"Text")
            local Pen=Create("ImageLabel",SF2,{Size=UDim2.new(0,12,0,12),Position=UDim2.new(0,-5,0.5),AnchorPoint=Vector2.new(1,0.5),Image="rbxassetid://15637081879",BackgroundTransparency=1})
            local TB2={}
            local function Inp()
                local T=TBI.Text; if T:gsub(" ",""):len()>0 then
                    if TB2.OnChanging then T=TB2.OnChanging(T) or T end; Funcs:FireCallback(Cb,T); TBI.Text=T end
            end
            TBI.FocusLost:Connect(Inp); Inp()
            TBI.FocusLost:Connect(function() CreateTween({Pen,"ImageColor3",Color3.fromRGB(255,255,255),0.2}) end)
            TBI.Focused:Connect(function() CreateTween({Pen,"ImageColor3",Theme["Color Theme"],0.2}) end)
            TB2.OnChanging=false
            function TB2:Visible(...) Funcs:ToggleVisible(Fr,...) end
            function TB2:Destroy() Fr:Destroy() end
            function TB2:Set(V) if type(V)=="string" then TBI.Text=V end end
            return TB2
        end

        function Tab:AddDiscordInvite(Cfg3)
            local DT=Cfg3[1] or Cfg3.Name or Cfg3.Title or "Herlys Hub Discord"
            local DDesc=Cfg3.Desc or Cfg3.Description or ""
            local Logo=Cfg3[2] or Cfg3.Logo or ""
            local Inv=Cfg3[3] or Cfg3.Invite or ""
            local IH=Create("Frame",Container,{Size=UDim2.new(1,0,0,80),Name="Option",BackgroundTransparency=1})
            Create("TextLabel",IH,{Size=UDim2.new(1,0,0,15),Position=UDim2.new(0,5),TextColor3=Color3.fromRGB(40,150,255),Font=Enum.Font.GothamBold,TextXAlignment="Left",BackgroundTransparency=1,TextSize=10,Text=Inv})
            local FH=InsertTheme(Create("Frame",IH,{Size=UDim2.new(1,0,0,65),AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,0,1),BackgroundColor3=Theme["Color Hub 2"]}),"Frame"); Make("Corner",FH)
            local IL=Create("ImageLabel",FH,{Size=UDim2.new(0,30,0,30),Position=UDim2.new(0,7,0,7),Image=Logo,BackgroundTransparency=1}); Make("Corner",IL,UDim.new(0,4)); Make("Stroke",IL)
            InsertTheme(Create("TextLabel",FH,{Size=UDim2.new(1,-52,0,15),Position=UDim2.new(0,44,0,7),Font=Enum.Font.GothamBold,TextColor3=Theme["Color Text"],TextXAlignment="Left",BackgroundTransparency=1,TextSize=10,Text=DT}),"Text")
            InsertTheme(Create("TextLabel",FH,{Size=UDim2.new(1,-52,0,0),Position=UDim2.new(0,44,0,22),AutomaticSize="Y",TextWrapped=true,Font=Enum.Font.Gotham,TextColor3=Theme["Color Dark Text"],TextXAlignment="Left",BackgroundTransparency=1,TextSize=8,Text=DDesc}),"DarkText")
            local JB=Create("TextButton",FH,{Size=UDim2.new(1,-14,0,16),AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-7),Text="Tham Gia",Font=Enum.Font.GothamBold,TextSize=12,TextColor3=Color3.fromRGB(220,220,220),BackgroundColor3=Color3.fromRGB(50,150,50)}); Make("Corner",JB,UDim.new(0,5))
            local CD; JB.Activated:Connect(function()
                setclipboard(Inv); if CD then return end; CD=true
                SetProps(JB,{Text="Đã sao chép!",BackgroundColor3=Color3.fromRGB(100,100,100),TextColor3=Color3.fromRGB(150,150,150)})
                task.wait(5); SetProps(JB,{Text="Tham Gia",BackgroundColor3=Color3.fromRGB(50,150,50),TextColor3=Color3.fromRGB(220,220,220)}); CD=false
            end)
            local DI={}; function DI:Destroy() IH:Destroy() end; function DI:Visible(...) Funcs:ToggleVisible(IH,...) end; return DI
        end

        return Tab
    end

    CloseBtn.Activated:Connect(Window.CloseBtn)
    MinBtn.Activated:Connect(Window.MinimizeBtn)
    return Window
end

-- Alias backward compat
local redzlib = HerlysHub

-- ═══════════════════════════════════════════════════════════
--           BLOX FRUITS SCRIPT - HERLYS HUB V2
-- ═══════════════════════════════════════════════════════════

local Window = HerlysHub:MakeWindow({
    Title    = "Herlys Hub : Blox Fruits v2.0",
    SubTitle = "by Herlys | Update 24",
    SaveFolder = "Herlys Hub | Blox Fruits v2.lua"
})

local AFKOptions = {}

-- ── Sea detection ──────────────────────────────────────────
local Sea3 = game.PlaceId == 4442272183
local Sea2 = game.PlaceId == 2753915549
local Sea1 = not Sea3 and not Sea2
local MaxLavel = 2550
local PlayerLevel = Player:WaitForChild("Data",9e9):WaitForChild("Level",9e9)
local IsOwner = false
local TeleportPos = Vector3.new(0,0,0)
local BossListT = {"Gorilla King","Bobby","Yeti","Mob Leader","Corrupt Monk","Saber Expert","Warden","Chief Warden","Snow Lurker","Magma Admiral","Lord of Destruction","Cursed Captain","Wysper","Thunder God","Greybeard","Darkbeard","Order","Rip_indra","Golden Beast","Longma","Cake Queen","Cake Prince","Dough King","Soul Reaper","Demonio","Kuma","Beautiful Pirate","Terrorshark"}
local Raids_Chip = {}

-- Helper functions (game functions)
local function FireRemote(...)
    local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if Remotes then
        local CommF = Remotes:FindFirstChild("CommF_")
        if CommF then pcall(function() CommF:InvokeServer(...) end) end
    end
end
local function PlayerTP(CF)
    local Char = Player.Character
    if Char and Char.PrimaryPart then Char:SetPrimaryPartCFrame(CF) end
end
local function VerifyNPC(Name)
    if not Enemies then return false end
    return Enemies:FindFirstChild(Name) ~= nil
end
local function VerifyTool(Name)
    local BP = Player.Backpack; local Ch = Player.Character
    if BP:FindFirstChild(Name) then return true end
    if Ch and Ch:FindFirstChild(Name) then return true end
    return false
end
local function GetToolLevel(Name)
    local Tool = Player.Backpack:FindFirstChild(Name) or (Player.Character and Player.Character:FindFirstChild(Name))
    if Tool and Tool:FindFirstChild("Level") then return Tool.Level.Value end
    return 0
end
local function EquipToolName(Name)
    local T = Player.Backpack:FindFirstChild(Name)
    if T then Player.Character.Humanoid:EquipTool(T) end
end
local function VerifyQuest(Name)
    local QGui = Player.PlayerGui:FindFirstChild("Main")
    if QGui then
        local QF = QGui:FindFirstChild("Quest")
        if QF and QF.Visible then return QF:FindFirstChild(Name) ~= nil end
    end; return false
end
local function QuestVisible()
    local QGui = Player.PlayerGui:FindFirstChild("Main")
    if QGui then local QF = QGui:FindFirstChild("Quest"); if QF then QF.Visible = true end end
end
local function GetEnemies(Names)
    if not Enemies then return nil end
    local plrPP = Player.Character and Player.Character.PrimaryPart
    local best, dist = nil, math.huge
    for _, npc in pairs(Enemies:GetChildren()) do
        for _, N in pairs(Names) do
            if npc.Name == N and npc:FindFirstChild("HumanoidRootPart") and plrPP then
                local d = (plrPP.Position - npc.HumanoidRootPart.Position).Magnitude
                if d < dist then dist = d; best = npc end
            end
        end
    end; return best
end
local function ServerHop()
    local TS = game:GetService("TeleportService")
    local servers = {}
    local ok, res = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if ok and res and res.data then
        for _, s in pairs(res.data) do
            if s.id ~= game.JobId and s.playing < s.maxPlayers then table.insert(servers, s.id) end
        end
    end
    if #servers > 0 then TS:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1,#servers)], Player) end
end
local function BuyFightStyle(Remote) FireRemote(Remote) end
local function VerifyToolTip(T) return VerifyTool(T) end
local function EquipTool()
    local FT = getgenv().FarmTool or "Melee"
    if FT == "Melee" then
        for _, T in pairs(Player.Backpack:GetChildren()) do
            if T:IsA("Tool") and T:FindFirstChild("Melee") then Player.Character.Humanoid:EquipTool(T); return end
        end
    elseif FT == "Sword" then
        for _, T in pairs(Player.Backpack:GetChildren()) do
            if T:IsA("Tool") and T:FindFirstChild("Sword") then Player.Character.Humanoid:EquipTool(T); return end
        end
    elseif FT == "Blox Fruit" then
        for _, T in pairs(Player.Backpack:GetChildren()) do
            if T:IsA("Tool") and T:FindFirstChild("Fruit") then Player.Character.Humanoid:EquipTool(T); return end
        end
    end
end
local function PlayerClick()
    local M = Player:GetMouse()
    local VU = game:GetService("VirtualUser")
    VU:Button1Down(Vector2.new(M.X, M.Y))
    task.wait(getgenv().AutoClickDelay or 0.2)
    VU:Button1Up(Vector2.new(M.X, M.Y))
end
local function ActiveHaki()
    if not getgenv().AutoHaki then return end
    local Char = Player.Character
    if Char then
        local H = Char:FindFirstChild("Humanoid")
        if H and H.Health / H.MaxHealth < 0.5 then
            FireRemote("Haki", "Buso")
        end
    end
end
local function AimBotPart(Part)
    if not Part then return end
    local Char = Player.Character
    if Char and Char.PrimaryPart then
        Char.PrimaryPart.CFrame = CFrame.lookAt(Char.PrimaryPart.Position, Part.Position)
    end
end
local function BringNPC(NPC, keepPos)
    if not NPC or not NPC:FindFirstChild("HumanoidRootPart") then return end
    local Char = Player.Character
    if Char and Char.PrimaryPart then
        local dist = getgenv().BringMobsDistance or 250
        if (Char.PrimaryPart.Position - NPC.HumanoidRootPart.Position).Magnitude > dist then
            NPC.HumanoidRootPart.CFrame = Char.PrimaryPart.CFrame + Char.PrimaryPart.CFrame.LookVector * 5
        end
    end
end
local function KeyboardPress(Key)
    local VU = game:GetService("VirtualUser")
    VU:CaptureController()
    local Enum2 = Enum.KeyCode[Key]
    if Enum2 then VU:Button1Down(Vector2.new(0,0)); task.wait(0.1); VU:Button1Up(Vector2.new(0,0)) end
end
local function TweenNPCSpawn(positions, npcName)
    task.spawn(function()
        for _, pos in pairs(positions) do
            PlayerTP(pos)
            task.wait(0.5)
            if VerifyNPC(npcName) then return end
        end
    end)
end
local function Configure(cType) return false end
local function FruitFind()
    local plrChar = Player.Character and Player.Character.PrimaryPart
    if not plrChar then return nil end
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Tool") and obj.Name:find("Fruit") then return obj end
    end
    for _, obj in pairs(Map:GetChildren()) do
        if obj:IsA("Tool") and obj.Name:find("Fruit") then return obj end
    end
    return nil
end
local function Get_Fruit(Name)
    return Name:gsub(" Fruit",""):gsub(" ","_")
end

-- ── Farming Functions ──────────────────────────────────────
local function AutoFarm_Level() task.spawn(function()
    while getgenv().AutoFarm_Level do task.wait()
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if not plrPP then task.wait(1); continue end
        local bestNPC, bestDist = nil, math.huge
        if Enemies then
            for _, npc in pairs(Enemies:GetChildren()) do
                if npc:FindFirstChild("HumanoidRootPart") and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
                    local d = (plrPP.Position - npc.HumanoidRootPart.Position).Magnitude
                    if d < bestDist then bestDist = d; bestNPC = npc end
                end
            end
        end
        if bestNPC then
            PlayerTP(bestNPC.HumanoidRootPart.CFrame + (getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
            if getgenv().BringMobs then BringNPC(bestNPC) end
        end
    end
end) end

local function AutoFarmNearest() task.spawn(function()
    while getgenv().AutoFarmNearest do task.wait()
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if not plrPP then task.wait(1); continue end
        local bestNPC, bestDist = nil, math.huge
        if Enemies then
            for _, npc in pairs(Enemies:GetChildren()) do
                if npc:FindFirstChild("HumanoidRootPart") and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
                    local d=(plrPP.Position-npc.HumanoidRootPart.Position).Magnitude
                    if d<bestDist then bestDist=d; bestNPC=npc end
                end
            end
        end
        if bestNPC and bestNPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(bestNPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
            if getgenv().BringMobs then BringNPC(bestNPC) end
        end
    end
end) end

local function AutoChestTween() task.spawn(function()
    while getgenv().AutoChestTween do task.wait()
        for _, obj in pairs(workspace:GetDescendants()) do
            if (obj.Name=="Chest" or obj.Name=="chest") and obj:IsA("BasePart") and obj.Parent then
                local plrChar=Player.Character and Player.Character.PrimaryPart
                if plrChar then
                    PlayerTP(CFrame.new(obj.Position + Vector3.new(0,5,0)))
                    task.wait(0.5)
                end
            end
        end
    end
end) end

local function AutoChestBypass() task.spawn(function()
    while getgenv().AutoChestBypass do task.wait()
        FireRemote("GetChest")
    end
end) end

local function AutoFarmBossSelected() task.spawn(function()
    while getgenv().AutoFarmBossSelected do task.wait()
        local boss = getgenv().BossSelected
        if boss and VerifyNPC(boss) then
            local NPC = Enemies:FindFirstChild(boss)
            if NPC and NPC:FindFirstChild("HumanoidRootPart") and NPC:FindFirstChild("Humanoid") and NPC.Humanoid.Health > 0 then
                PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
                pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
            end
        end
    end
end) end

local function KillAllBosses() task.spawn(function()
    while getgenv().KillAllBosses do task.wait()
        for _, boss in pairs(BossListT) do
            if VerifyNPC(boss) then
                local NPC = Enemies:FindFirstChild(boss)
                if NPC and NPC:FindFirstChild("HumanoidRootPart") and NPC:FindFirstChild("Humanoid") and NPC.Humanoid.Health > 0 then
                    PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
                    pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
                    task.wait(0.5)
                end
            end
        end
    end
end) end

local function UpdateBossList() end

local function AutoFarmMaterial() task.spawn(function()
    while getgenv().AutoFarmMaterial do task.wait()
        local mat = getgenv().MaterialSelected
        if mat then
            local matNPC = {
                ["Angel Wings"]="Skypiean",["Leather + Scrap Metal"]="Pirate",
                ["Magma Ore"]="Magma Ninja",["Fish Tail"]="Shark",
                ["Mystic Droplet"]="Fishman Lord",["Vampire Fang"]="Vampire Bat",
                ["Dragon Scale"]="Dragon",["Gunpowder"]="Pirate Millionaire",
                ["Conjured Cocoa"]="Cookie Crafter",["Mini Tusk"]="Mini Tusk Warrior",
                ["Radioactive Material"]="Radioactive",
            }
            local target = matNPC[mat]
            if target and VerifyNPC(target) then
                local NPC = Enemies:FindFirstChild(target)
                if NPC and NPC:FindFirstChild("HumanoidRootPart") and NPC:FindFirstChild("Humanoid") and NPC.Humanoid.Health > 0 then
                    PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
                    pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
                end
            end
        end
    end
end) end

local function AutoFarmMastery() task.spawn(function()
    while getgenv().AutoFarmMastery do task.wait()
        local tool = getgenv().ToolMastery or "Blox Fruit"
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if not plrPP then task.wait(1); continue end
        local bestNPC, bestDist = nil, math.huge
        if Enemies then
            for _, npc in pairs(Enemies:GetChildren()) do
                if npc:FindFirstChild("HumanoidRootPart") and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
                    local d=(plrPP.Position-npc.HumanoidRootPart.Position).Magnitude
                    if d<bestDist then bestDist=d; bestNPC=npc end
                end
            end
        end
        if bestNPC and bestNPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(bestNPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki()
                if tool=="Blox Fruit" then
                    for _, T in pairs(Player.Backpack:GetChildren()) do
                        if T:IsA("Tool") and T:FindFirstChild("Fruit") then Player.Character.Humanoid:EquipTool(T); break end
                    end
                end
            end)
            if getgenv().BringMobs then BringNPC(bestNPC) end
        end
    end
end) end

local function AutoKillAura() task.spawn(function()
    while getgenv().AutoKillAura do task.wait()
        local plrPP = Player.Character and Player.Character.PrimaryPart
        if not plrPP then task.wait(1); continue end
        if Enemies then
            for _, npc in pairs(Enemies:GetChildren()) do
                if npc:FindFirstChild("HumanoidRootPart") and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 and (plrPP.Position-npc.HumanoidRootPart.Position).Magnitude < 20 then
                    pcall(function() PlayerClick(); ActiveHaki() end)
                end
            end
        end
    end
end) end

local function AutoRainbowHaki() task.spawn(function()
    local Colors={"Pure Red","Snow White","Winter Sky","Midnight Black","Electric Blue","Purple"}
    local idx=1
    while getgenv().AutoRainbowHaki do task.wait(3)
        pcall(function() FireRemote("activateColor",Colors[idx]) end)
        idx=idx%#Colors+1
    end
end) end

-- ── ESP Functions ──────────────────────────────────────────
local function EspPlayer() task.spawn(function()
    while getgenv().EspPlayer do task.wait()
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Player and plr.Character then
                local billboard = plr.Character:FindFirstChild("HerlysESP_Name")
                if not billboard then
                    local PrimaryPart = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Torso")
                    if PrimaryPart then
                        local BB = Instance.new("BillboardGui")
                        BB.Name = "HerlysESP_Name"; BB.AlwaysOnTop = true
                        BB.Size = UDim2.fromOffset(150, 30); BB.StudsOffset = Vector3.new(0, 3, 0)
                        BB.Parent = plr.Character; BB.Adornee = PrimaryPart
                        local TL = Instance.new("TextLabel", BB)
                        TL.Size = UDim2.fromScale(1,1); TL.BackgroundTransparency=1
                        TL.Font=Enum.Font.GothamBold; TL.TextSize=14
                        TL.TextColor3=Color3.fromRGB(255,80,80); TL.Text=plr.Name
                        local TL2 = Instance.new("TextLabel", BB)
                        TL2.Size = UDim2.fromScale(1,0.5); TL2.Position = UDim2.new(0,0,0.5,0)
                        TL2.BackgroundTransparency=1; TL2.Font=Enum.Font.Gotham; TL2.TextSize=12
                        TL2.TextColor3=Color3.fromRGB(255,200,0)
                        TL2.Text = tostring(math.floor((plr.Character.Humanoid.Health or 0))) .. "/" .. tostring(math.floor((plr.Character.Humanoid.MaxHealth or 0)))
                    end
                end
            end
        end
    end
end) end

local function EspFruits() task.spawn(function()
    while getgenv().EspFruits do task.wait()
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("Tool") and obj.Name:find("Fruit") then
                local handle = obj:FindFirstChild("Handle")
                if handle and not handle:FindFirstChild("HerlysESP_Fruit") then
                    local BB = Instance.new("BillboardGui", handle)
                    BB.Name = "HerlysESP_Fruit"; BB.AlwaysOnTop = true
                    BB.Size = UDim2.fromOffset(150, 25); BB.StudsOffset = Vector3.new(0, 2, 0)
                    local TL = Instance.new("TextLabel", BB)
                    TL.Size = UDim2.fromScale(1,1); TL.BackgroundTransparency=1
                    TL.Font=Enum.Font.GothamBold; TL.TextSize=12
                    TL.TextColor3=Color3.fromRGB(255,200,0); TL.Text="🍎 "..obj.Name
                end
            end
        end
    end
end) end

local function EspChests() task.spawn(function()
    while getgenv().EspChests do task.wait()
        for _, obj in pairs(workspace:GetDescendants()) do
            if (obj.Name=="Chest" or obj.Name=="chest") and obj:IsA("BasePart") then
                if not obj:FindFirstChild("HerlysESP_Chest") then
                    local BB = Instance.new("BillboardGui", obj)
                    BB.Name = "HerlysESP_Chest"; BB.AlwaysOnTop = true
                    BB.Size = UDim2.fromOffset(120, 25); BB.StudsOffset = Vector3.new(0, 2, 0)
                    local TL = Instance.new("TextLabel", BB)
                    TL.Size = UDim2.fromScale(1,1); TL.BackgroundTransparency=1
                    TL.Font=Enum.Font.GothamBold; TL.TextSize=12
                    TL.TextColor3=Color3.fromRGB(100,255,100); TL.Text="💰 Chest"
                end
            end
        end
    end
end) end

local function EspIslands() task.spawn(function()
    while getgenv().EspIslands do task.wait()
        if Map then
            for _, island in pairs(Map:GetChildren()) do
                if island:IsA("Model") and not island:FindFirstChild("HerlysESP_Island") then
                    local primary = island.PrimaryPart or island:FindFirstChildWhichIsA("BasePart")
                    if primary then
                        local BB = Instance.new("BillboardGui", primary)
                        BB.Name = "HerlysESP_Island"; BB.AlwaysOnTop = true
                        BB.Size = UDim2.fromOffset(200, 30); BB.StudsOffset = Vector3.new(0, 10, 0)
                        local TL = Instance.new("TextLabel", BB)
                        TL.Size = UDim2.fromScale(1,1); TL.BackgroundTransparency=1
                        TL.Font=Enum.Font.GothamBold; TL.TextSize=14
                        TL.TextColor3=Color3.fromRGB(100,200,255); TL.Text="🏝️ "..island.Name
                    end
                end
            end
        end
    end
end) end

local function EspFlowers() task.spawn(function()
    while getgenv().EspFlowers do task.wait()
        if Map then
            for _, obj in pairs(Map:GetDescendants()) do
                if obj.Name:find("Flower") and obj:IsA("BasePart") and not obj:FindFirstChild("HerlysESP_Flower") then
                    local BB = Instance.new("BillboardGui", obj)
                    BB.Name = "HerlysESP_Flower"; BB.AlwaysOnTop = true
                    BB.Size = UDim2.fromOffset(100, 20); BB.StudsOffset = Vector3.new(0, 2, 0)
                    local TL = Instance.new("TextLabel", BB)
                    TL.Size = UDim2.fromScale(1,1); TL.BackgroundTransparency=1
                    TL.Font=Enum.Font.GothamBold; TL.TextSize=11
                    TL.TextColor3=Color3.fromRGB(255,150,200); TL.Text="🌸"
                end
            end
        end
    end
end) end

local function EspMobs() task.spawn(function()
    while getgenv().EspMobs do task.wait()
        if Enemies then
            for _, mob in pairs(Enemies:GetChildren()) do
                if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") and not mob:FindFirstChild("HerlysESP_Mob") then
                    local primary = mob.HumanoidRootPart
                    if primary then
                        local BB = Instance.new("BillboardGui", primary)
                        BB.Name = "HerlysESP_Mob"; BB.AlwaysOnTop = true
                        BB.Size = UDim2.fromOffset(150, 30); BB.StudsOffset = Vector3.new(0, 3, 0)
                        local TL = Instance.new("TextLabel", BB)
                        TL.Size = UDim2.fromScale(1,1); TL.BackgroundTransparency=1
                        TL.Font=Enum.Font.GothamBold; TL.TextSize=12
                        TL.TextColor3=Color3.fromRGB(255,100,100); TL.Text="👾 "..mob.Name
                    end
                end
            end
        end
    end
end) end

-- ── New Features ───────────────────────────────────────────
local function AutoFarmBone() task.spawn(function()
    while getgenv().AutoFarmBone do task.wait()
        local NPC = Enemies and (Enemies:FindFirstChild("Reborn Skeleton") or Enemies:FindFirstChild("Cursed Skeleton") or Enemies:FindFirstChild("Living Zombie"))
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
            if getgenv().BringMobs then BringNPC(NPC) end
        end
    end
end) end

local function AutoSoulReaper() task.spawn(function()
    while getgenv().AutoSoulReaper do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("Soul Reaper")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoFarmEctoplasm() task.spawn(function()
    while getgenv().AutoFarmEctoplasm do task.wait()
        local NPC = Enemies and (Enemies:FindFirstChild("Living Zombie") or Enemies:FindFirstChild("Demonic Soul") or Enemies:FindFirstChild("Posessed Mummy"))
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
            if getgenv().BringMobs then BringNPC(NPC) end
        end
    end
end) end

local function AutoEliteHunter() task.spawn(function()
    while getgenv().AutoEliteHunter do task.wait()
        local NPC = GetEnemies({"Urban","Deandre","Diablo"})
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        else
            if getgenv().AutoEliteHunterHop then ServerHop() end
        end
    end
end) end

local function AutoRipIndra() task.spawn(function()
    while getgenv().AutoRipIndra do task.wait()
        local NPC = Enemies and (Enemies:FindFirstChild("rip_indra True Form") or Enemies:FindFirstChild("rip_indra"))
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoCakePrince() task.spawn(function()
    while getgenv().AutoCakePrince do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("Cake Prince")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoDoughKing() task.spawn(function()
    while getgenv().AutoDoughKing do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("Dough King")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoMusketeerHat() task.spawn(function()
    while getgenv().AutoMusketeerHat do task.wait()
        if VerifyTool("Musketeer Hat") then getgenv().AutoMusketeerHat=false; return end
        FireRemote("MusketeerHat","Get")
    end
end) end

local function AutoSecondSea() task.spawn(function()
    while getgenv().AutoSecondSea do task.wait(0.5)
        FireRemote("TravelDressrosa")
    end
end) end

local function AutoThirdSea() task.spawn(function()
    while getgenv().AutoThirdSea do task.wait(0.5)
        FireRemote("TravelZou")
    end
end) end

local function AutoKillDonSwan() task.spawn(function()
    while getgenv().AutoKillDonSwan do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("Don Swan")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        else if getgenv().AutoDonSwanHop then ServerHop() end end
    end
end) end

local function AutoBartiloQuest() task.spawn(function()
    while getgenv().AutoBartiloQuest do task.wait()
        FireRemote("BartiloQuest","Accept"); task.wait(0.5)
        local NPC = GetEnemies({"Stone","Mr.Captain","Fishman Raider","Pirate Millionaire"})
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoRengoku() task.spawn(function()
    while getgenv().AutoRengoku do task.wait()
        if VerifyTool("Rengoku") then getgenv().AutoRengoku=false; return end
        FireRemote("RengokuQuest")
        local NPC = GetEnemies({"Ice Admiral","Snow Owl","Yeti"})
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        else if getgenv().AutoRengokuHop then ServerHop() end end
    end
end) end

local function AutoRaceV2() task.spawn(function()
    while getgenv().AutoRaceV2 do task.wait()
        FireRemote("RaceV2","Start")
    end
end) end

local function AutoCursedCaptain() task.spawn(function()
    while getgenv().AutoCursedCaptain do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("Cursed Captain")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoDarkbeard() task.spawn(function()
    while getgenv().AutoDarkbeard do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("Darkbeard")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoKillLawBoss() task.spawn(function()
    while getgenv().AutoKillLawBoss do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("Order")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoUnlockSaber() task.spawn(function()
    while getgenv().AutoUnlockSaber do task.wait()
        FireRemote("UnlockSaber")
    end
end) end

local function AutoEnelBossPole() task.spawn(function()
    while getgenv().AutoEnelBossPole do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("Thunder God")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoSawBoss() task.spawn(function()
    while getgenv().AutoSawBoss do task.wait()
        local NPC = Enemies and Enemies:FindFirstChild("The Saw")
        if NPC and NPC:FindFirstChild("HumanoidRootPart") then
            PlayerTP(NPC.HumanoidRootPart.CFrame+(getgenv().FarmPos or Vector3.new(0,15,10)))
            pcall(function() PlayerClick(); ActiveHaki(); EquipTool() end)
        end
    end
end) end

local function AutoTushita() task.spawn(function()
    while getgenv().AutoTushita do task.wait()
        -- Tushita logic
        local MapW=workspace:FindFirstChild("Map")
        if MapW then
            local Turtle=MapW:FindFirstChild("Turtle")
            if Turtle and not Turtle:FindFirstChild("TushitaGate") then
                local Longma=Enemies and Enemies:FindFirstChild("Longma")
                if Longma and Longma:FindFirstChild("HumanoidRootPart") then
                    PlayerTP(Longma.HumanoidRootPart.CFrame+Vector3.new(0,15,10))
                    pcall(PlayerClick)
                else
                    PlayerTP(CFrame.new(-10218,333,-9444))
                end
            end
        end
    end
end) end

local function AutoKitsuneIsland() task.spawn(function()
    while getgenv().AutoKitsuneIsland do task.wait()
        local MapW=workspace:FindFirstChild("Map")
        if MapW and MapW:FindFirstChild("KitsuneIsland") then
            PlayerTP(CFrame.new(28000,15000,100))
        end
    end
end) end

local function AutoFarmSea() task.spawn(function()
    while getgenv().AutoFarmSea do task.wait()
        local SeaNPCs = {"Terrorshark","Shark","Piranha","Fish Crew Member","Pirate Brigade","Pirate Grand Brigade","Fish Boat"}
        local target = nil
        for _, name in pairs(SeaNPCs) do
            if Enemies and Enemies:FindFirstChild(name) then
                target = Enemies:FindFirstChild(name)
                break
            end
        end
        if target and target:FindFirstChild("HumanoidRootPart") then
            PlayerTP(target.HumanoidRootPart.CFrame+Vector3.new(0,15,10))
            pcall(PlayerClick)
        end
    end
end) end

local function BuyNewBoat() FireRemote("BuyBoat") end

local function GetButton()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == "Button" and obj:IsA("BasePart") then return obj end
    end; return nil
end

-- ─── Tabs ──────────────────────────────────────────────────
local Discord   = Window:MakeTab({"Discord", "Info"})
local MainFarm  = Window:MakeTab({"Farm", "Home"})
local QuestsTabs= Window:MakeTab({"Quests/Items", "Swords"})
local FruitAndRaid= Window:MakeTab({"Fruit/Raid", "Cherry"})
local Teleport  = Window:MakeTab({"Teleport", "Locate"})
local Visual    = Window:MakeTab({"Visual", "User"})
local Shop      = Window:MakeTab({"Shop", "ShoppingCart"})
local Misc      = Window:MakeTab({"Misc", "Settings"})

-- ── Discord ────────────────────────────────────────────────
Discord:AddDiscordInvite({
    Name = "Herlys Hub | Community",
    Description = "Tham gia Discord để nhận thông tin cập nhật mới nhất",
    Logo   = "rbxassetid://15298567397",
    Invite = "https://discord.gg/herlyshub"
})

-- ── Main Farm Tab ──────────────────────────────────────────
MainFarm:AddDropdown({Name="Vũ khí Farm",Options={"Melee","Sword","Blox Fruit"},Default={"Melee"},Flag="Main/FarmTool",Callback=function(V) getgenv().FarmTool=V end})

MainFarm:AddSection({"Farm Cơ bản"})
MainFarm:AddToggle({"Auto Farm Level",false,function(V) getgenv().AutoFarm_Level=V; AutoFarm_Level() end,"Main/AutoFarmLevel"})
MainFarm:AddToggle({"Auto Farm Gần nhất",false,function(V) getgenv().AutoFarmNearest=V; AutoFarmNearest() end,"Main/AutoFarmNearest"})
MainFarm:AddToggle({"Auto Kill Aura",false,function(V) getgenv().AutoKillAura=V; AutoKillAura() end,"Main/AutoKillAura"})

MainFarm:AddSection({"Boss"})
MainFarm:AddButton({Name="Cập nhật danh sách Boss",Callback=function() pcall(UpdateBossList) end})
local BossList = MainFarm:AddDropdown({Name="Danh sách Boss",Callback=function(V) getgenv().BossSelected=V end})
function UpdateBossList()
    local NO={}
    for _,N in pairs(BossListT) do if VerifyNPC(N) then table.insert(NO,N) end end
    BossList:Set(NO,true)
end
UpdateBossList()
MainFarm:AddToggle({Name="Auto Farm Boss đã chọn",Callback=function(V) getgenv().AutoFarmBossSelected=V; AutoFarmBossSelected() end})
MainFarm:AddToggle({Name="Auto Farm tất cả Boss",Callback=function(V) getgenv().KillAllBosses=V; KillAllBosses() end})
MainFarm:AddButton({Name="Đổi Server",Callback=function() ServerHop() end})

MainFarm:AddSection({"Nguyên liệu"})
local MaterialList={}
if Sea1 then MaterialList={"Angel Wings","Leather + Scrap Metal","Magma Ore","Fish Tail"}
elseif Sea2 then MaterialList={"Leather + Scrap Metal","Magma Ore","Mystic Droplet","Radioactive Material","Vampire Fang"}
elseif Sea3 then MaterialList={"Leather + Scrap Metal","Fish Tail","Gunpowder","Mini Tusk","Conjured Cocoa","Dragon Scale"} end
MainFarm:AddDropdown({Name="Danh sách Nguyên liệu",Options=MaterialList,Flag="Material/Selected",Callback=function(V) getgenv().MaterialSelected=V end})
MainFarm:AddToggle({Name="Auto Farm Nguyên liệu",Callback=function(V) getgenv().AutoFarmMaterial=V; AutoFarmMaterial() end})

MainFarm:AddSection({"Mastery"})
MainFarm:AddSlider({Name="Chọn % HP dùng skill",Min=10,Max=100,Default=25,Callback=function(V) getgenv().HealthSkill=V end})
MainFarm:AddDropdown({Name="Chọn Vũ khí",Options={"Blox Fruit","Sword"},Default={"Blox Fruit"},Callback=function(V) getgenv().ToolMastery=V end})
MainFarm:AddToggle({Name="Auto Farm Mastery",Callback=function(V) getgenv().AutoFarmMastery=V; AutoFarmMastery() end})

MainFarm:AddSection({"Rương"})
MainFarm:AddToggle({Name="Auto Rương < Tween >",Callback=function(V) getgenv().AutoChestTween=V; AutoChestTween() end})
MainFarm:AddToggle({Name="Auto Rương < Bypass >",Callback=function(V) getgenv().AutoChestBypass=V; AutoChestBypass() end})

-- ── Quests / Items Tab ─────────────────────────────────────
if Sea1 then
    QuestsTabs:AddSection({"Sea 2"})
    QuestsTabs:AddToggle({Name="Auto Đến Sea 2",Callback=function(V) getgenv().AutoSecondSea=V; AutoSecondSea() end})
    QuestsTabs:AddSection({"Saber"})
    QuestsTabs:AddToggle({Name="Auto Mở Khóa Saber < Lv 200+ >",Callback=function(V) getgenv().AutoUnlockSaber=V; AutoUnlockSaber() end})
    QuestsTabs:AddSection({"God Boss"})
    QuestsTabs:AddToggle({Name="Auto Pole V1",Callback=function(V) getgenv().AutoEnelBossPole=V; AutoEnelBossPole() end})
    QuestsTabs:AddSection({"The Saw"})
    QuestsTabs:AddToggle({Name="Auto Saw Sword",Callback=function(V) getgenv().AutoSawBoss=V; AutoSawBoss() end})

elseif Sea2 then
    QuestsTabs:AddSection({"Sea 3"})
    QuestsTabs:AddToggle({Name="Auto Đến Sea 3",Callback=function(V) getgenv().AutoThirdSea=V; AutoThirdSea() end})
    QuestsTabs:AddToggle({Name="Auto Giết Don Swan",Callback=function(V) getgenv().AutoKillDonSwan=V; AutoKillDonSwan() end})
    QuestsTabs:AddToggle({Name="Auto Don Swan Hop",Callback=function(V) getgenv().AutoDonSwanHop=V end})
    QuestsTabs:AddSection({"Quest Bartilo"})
    QuestsTabs:AddToggle({Name="Auto Quest Bartilo",Callback=function(V) getgenv().AutoBartiloQuest=V; AutoBartiloQuest() end})
    QuestsTabs:AddSection({"Rengoku"})
    QuestsTabs:AddToggle({Name="Auto Rengoku",Callback=function(V) getgenv().AutoRengoku=V; AutoRengoku() end})
    QuestsTabs:AddToggle({Name="Auto Rengoku Hop",Callback=function(V) getgenv().AutoRengokuHop=V end})
    QuestsTabs:AddSection({"Kiếm Huyền Thoại"})
    QuestsTabs:AddToggle({"Auto Mua Legendary Sword",false,function(V)
        getgenv().AutoLegendarySword=V
        task.spawn(function()
            while getgenv().AutoLegendarySword do task.wait(0.5)
                FireRemote("LegendarySwordDealer","1"); FireRemote("LegendarySwordDealer","2"); FireRemote("LegendarySwordDealer","3")
            end
        end)
    end,"Buy/LegendarySword"})
    QuestsTabs:AddToggle({Name="Auto Mua True Triple Katana",Flag="Buy/TTK",Callback=function(V)
        getgenv().AutoTTK=V
        task.spawn(function() while getgenv().AutoTTK do task.wait(); FireRemote("MysteriousMan","1"); FireRemote("MysteriousMan","2") end end)
    end})
    QuestsTabs:AddSection({"Chủng tộc"})
    QuestsTabs:AddToggle({Name="Auto Evo Race V2",Callback=function(V) getgenv().AutoRaceV2=V; AutoRaceV2() end})
    QuestsTabs:AddSection({"Cursed Captain"})
    QuestsTabs:AddToggle({Name="Auto Cursed Captain",Callback=function(V) getgenv().AutoCursedCaptain=V; AutoCursedCaptain() end})
    QuestsTabs:AddSection({"Dark Beard"})
    QuestsTabs:AddToggle({Name="Auto Dark Beard",Callback=function(V) getgenv().AutoDarkbeard=V; AutoDarkbeard() end})
    QuestsTabs:AddSection({"Law"})
    QuestsTabs:AddToggle({Name="Auto Mua Law Chip",Callback=function(V)
        getgenv().AutoBuyLawChip=V
        task.spawn(function()
            while getgenv().AutoBuyLawChip do task.wait()
                if not VerifyNPC("Order") and not VerifyTool("Microchip") then FireRemote("BlackbeardReward","Microchip","2") end
            end
        end)
    end})
    QuestsTabs:AddToggle({Name="Auto Giết Law Boss",Callback=function(V) getgenv().AutoKillLawBoss=V; AutoKillLawBoss() end})

elseif Sea3 then
    QuestsTabs:AddSection({"Elite Hunter"})
    local LabelElite=QuestsTabs:AddParagraph({"Elite Stats : Chưa xuất hiện"})
    task.spawn(function()
        while task.wait() do
            if VerifyNPC("Urban") or VerifyNPC("Deandre") or VerifyNPC("Diablo") then 
                LabelElite:SetTitle("Elite Stats : Đã xuất hiện")
            else 
                LabelElite:SetTitle("Elite Stats : Chưa xuất hiện") 
            end
        end
    end)
    QuestsTabs:AddToggle({Name="Auto Elite Hunter",Callback=function(V) getgenv().AutoEliteHunter=V; AutoEliteHunter() end})
    QuestsTabs:AddToggle({Name="Auto Elite Hunter Hop",Callback=function(V) getgenv().AutoEliteHunterHop=V end})

    QuestsTabs:AddSection({"Tushita"})
    local LabelRipIndra=QuestsTabs:AddParagraph({"Rip Indra : Chưa xuất hiện"})
    task.spawn(function()
        while task.wait(0.5) do
            if VerifyNPC("rip_indra True Form") then 
                LabelRipIndra:SetTitle("Rip Indra : Đã xuất hiện")
            else 
                LabelRipIndra:SetTitle("Rip Indra : Chưa xuất hiện") 
            end
        end
    end)
    QuestsTabs:AddToggle({Name="Auto Tushita",Callback=function(V) getgenv().AutoTushita=V; AutoTushita() end})
    QuestsTabs:AddToggle({Name="Auto Tushita Hop",Callback=function(V) getgenv().AutoTushitaHop=V end})

    QuestsTabs:AddSection({"Cake Prince + Dough King"})
    local CakePT=QuestsTabs:AddToggle({"Auto Cake Prince",false,function(V) getgenv().AutoCakePrince=V; AutoCakePrince() end})
    local DoughKT=QuestsTabs:AddToggle({"Auto Dough King",false,function(V) getgenv().AutoDoughKing=V; AutoDoughKing() end})

    QuestsTabs:AddSection({"Rip Indra"})
    QuestsTabs:AddToggle({"Auto Rip Indra",false,function(V) getgenv().AutoRipIndra=V; AutoRipIndra() end})

    QuestsTabs:AddSection({"Musketeer Hat"})
    QuestsTabs:AddToggle({Name="Auto Musketeer Hat",Callback=function(V) getgenv().AutoMusketeerHat=V; AutoMusketeerHat() end})
end

-- ── Fighting Style (Sea 2 & 3) ────────────────────────────
if Sea2 or Sea3 then
    QuestsTabs:AddSection({"Phong cách chiến đấu"})
    QuestsTabs:AddToggle({Name="Auto Death Step",Callback=function(V)
        getgenv().AutoDeathStep=V
        -- Death Step logic
    end})
    QuestsTabs:AddToggle({Name="Auto Sharkman Karate",Callback=function(V)
        getgenv().AutoSharkmanKarate=V
        -- Sharkman logic
    end})
    QuestsTabs:AddToggle({Name="Auto Superhuman",Callback=function(V)
        getgenv().AutoSuperhuman=V
        -- Superhuman logic
    end})
    QuestsTabs:AddToggle({Name="Auto God Human",Callback=function(V)
        getgenv().AutoGodHuman=V
        -- Godhuman logic
    end})
    QuestsTabs:AddToggle({Name="Auto Sanguine Art",Callback=function(V)
        getgenv().AutoSanguineArt=V
        -- Sanguine Art logic
    end})
end

-- ── Fruit & Raid Tab ───────────────────────────────────────
FruitAndRaid:AddSection({"Trái Ác Ma"})
local Fruit_BlackList={}
FruitAndRaid:AddToggle({Name="Auto Cất Trái",Flag="Fruits/AutoStore",Callback=function(V)
    getgenv().AutoStoreFruits=V
    task.spawn(function()
        local Remote=ReplicatedStorage:WaitForChild("Remotes",9e9):WaitForChild("CommF_",9e9)
        while getgenv().AutoStoreFruits do task.wait()
            for _,plrObj in pairs({Player.Backpack, Player.Character or Instance.new("Folder")}) do
                for _,Fruit in pairs(plrObj:GetChildren()) do
                    if not table.find(Fruit_BlackList,Fruit.Name) and Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
                        if Remote:InvokeServer("StoreFruit",Get_Fruit(Fruit.Name),Fruit)~=true then
                            table.insert(Fruit_BlackList,Fruit.Name)
                        end
                    end
                end
            end
        end
    end)
end})

FruitAndRaid:AddToggle({Name="Tele đến Trái",Flag="Fruits/Teleport",Callback=function(V)
    getgenv().TeleportToFruit=V
    task.spawn(function()
        while getgenv().TeleportToFruit do task.wait()
            local Fruit=FruitFind()
            if Fruit then PlayerTP(Fruit.CFrame) end
        end
    end)
end})

FruitAndRaid:AddToggle({Name="Auto Random Trái",Flag="Fruits/AutoRandom",Callback=function(V)
    getgenv().AutoRandomFruit=V
    task.spawn(function() while getgenv().AutoRandomFruit do task.wait(1); FireRemote("Cousin","Buy") end end)
end})

FruitAndRaid:AddSection({"Raid"})
if Sea1 then
    FruitAndRaid:AddParagraph({"Chỉ hoạt động ở Sea 2 và 3"})
elseif Sea2 or Sea3 then
    pcall(function()
        local Raids=require(ReplicatedStorage.Raids)
        table.foreach(Raids.advancedRaids,function(a,b) table.insert(Raids_Chip,b) end)
        table.foreach(Raids.raids,function(a,b) table.insert(Raids_Chip,b) end)
    end)
    FruitAndRaid:AddDropdown({Name="Chọn Raid",Options=Raids_Chip,Flag="Raid/SelectedChip",Callback=function(V) getgenv().SelectRaidChip=V end})
    FruitAndRaid:AddToggle({Name="Auto Farm Raid",Callback=function(V)
        getgenv().AutoFarmRaid=V
        -- Raid logic
    end})
    FruitAndRaid:AddToggle({"Auto Mua Chip",false,function(V)
        getgenv().AutoBuyChip=V
        task.spawn(function()
            while getgenv().AutoBuyChip do task.wait()
                if not VerifyTool("Special Microchip") then FireRemote("RaidsNpc","Select",getgenv().SelectRaidChip); task.wait(1) end
            end
        end)
    end})
end

-- ── Teleport Tab ───────────────────────────────────────────
Teleport:AddSection({"Dịch chuyển đến Sea"})
Teleport:AddButton({Name="Teleport đến Sea 1",Callback=function() FireRemote("TravelMain") end})
Teleport:AddButton({Name="Teleport đến Sea 2",Callback=function() FireRemote("TravelDressrosa") end})
Teleport:AddButton({Name="Teleport đến Sea 3",Callback=function() FireRemote("TravelZou") end})

Teleport:AddSection({"Đảo"})
local IslandsList={}
if Sea1 then
    IslandsList={"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City"}
elseif Sea2 then
    IslandsList={"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island"}
elseif Sea3 then
    IslandsList={"Mansion","Port Town","Great Tree","Castle On The Sea","Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Candy Cane Island","Tiki Outpost"}
end
Teleport:AddDropdown({Name="Chọn Đảo",Options=IslandsList,Default="",Callback=function(V) getgenv().TeleportIslandSelect=V end})

local IslandCoords={
    -- Sea 1
    ["Middle Town"]=CFrame.new(-688,15,1585),["MarineFord"]=CFrame.new(-4810,21,4359),
    ["Marine"]=CFrame.new(-2728,25,2056),["WindMill"]=CFrame.new(889,17,1434),
    ["Snow Island"]=CFrame.new(1298,87,-1344),["Pirate Village"]=CFrame.new(-1173,45,3837),
    ["Jungle"]=CFrame.new(-1614,37,146),["Prison"]=CFrame.new(4870,6,736),
    ["Under Water Island"]=CFrame.new(61164,5,1820),["Colosseum"]=CFrame.new(-1535,7,-3014),
    ["Magma Village"]=CFrame.new(-5290,9,8349),["Sky Island 1"]=CFrame.new(-4814,718,-2551),
    ["Sky Island 2"]=CFrame.new(-4652,873,-1754),["Sky Island 3"]=CFrame.new(-7895,5547,-380),
    -- Sea 2
    ["The Cafe"]=CFrame.new(-382,73,290),["Frist Spot"]=CFrame.new(-11,29,2771),
    ["Dark Area"]=CFrame.new(3494,13,-3259),["Flamingo Mansion"]=CFrame.new(-317,331,597),
    ["Flamingo Room"]=CFrame.new(2285,15,905),["Green Zone"]=CFrame.new(-2258,73,-2696),
    ["Zombie Island"]=CFrame.new(-5552,194,-776),["Two Snow Mountain"]=CFrame.new(752,408,-5277),
    ["Punk Hazard"]=CFrame.new(-5897,18,-5096),["Cursed Ship"]=CFrame.new(919,125,32869),
    ["Ice Castle"]=CFrame.new(5505,40,-6178),["Forgotten Island"]=CFrame.new(-3050,240,-10178),
    ["Ussop Island"]=CFrame.new(4816,8,2863),
    -- Sea 3
    ["Mansion"]=CFrame.new(-12471,374,-7551),["Port Town"]=CFrame.new(-334,7,5300),
    ["Castle On The Sea"]=CFrame.new(-5073,315,-3153),["Hydra Island"]=CFrame.new(5756,610,-282),
    ["Great Tree"]=CFrame.new(2681,1682,-7190),["Floating Turtle"]=CFrame.new(-12528,332,-8658),
    ["Haunted Castle"]=CFrame.new(-9517,142,5528),["Ice Cream Island"]=CFrame.new(-902,79,-10988),
    ["Peanut Island"]=CFrame.new(-2062,50,-10232),["Cake Island"]=CFrame.new(-1897,14,-11576),
    ["Candy Cane Island"]=CFrame.new(-1038,10,-14076),["Tiki Outpost"]=CFrame.new(-16224,9,439),
}

local TPToggle=Teleport:AddToggle({Name="Teleport đến Đảo",Callback=function(V)
    getgenv().TeleportToIsland=V
    task.spawn(function()
        while getgenv().TeleportToIsland do task.wait()
            local Isl=getgenv().TeleportIslandSelect
            if Isl and IslandCoords[Isl] then
                TeleportPos=IslandCoords[Isl].p
                PlayerTP(IslandCoords[Isl])
            end
        end
    end)
end})

-- ── Visual Tab ─────────────────────────────────────────────
local NotifiFruits=false; local NotifiTime=15
workspace.ChildAdded:Connect(function(part)
    if NotifiFruits and (part:IsA("Tool") or part.Name:find("Fruit")) then
        HerlysHub:MakeNotify({Name="Herlys Hub - Trái Ác Ma",Text="Trái '"..part.Name.."' đã xuất hiện!",Time=NotifiTime})
    end
end)

Visual:AddSection({"Thông báo"})
Visual:AddSlider({Name="Thời gian thông báo",Max=120,Min=5,Increase=1,Default=15,Callback=function(V) NotifiTime=V end,Flag="Notify/Time"})
Visual:AddToggle({Name="Thông báo Trái Ác Ma",Callback=function(V) NotifiFruits=V end,Flag="Notify/Fruit"})

Visual:AddSection({"ESP"})
if Sea2 then Visual:AddToggle({Name="ESP Hoa",Callback=function(V) getgenv().EspFlowers=V; EspFlowers() end}) end
Visual:AddToggle({Name="ESP Người chơi",Callback=function(V) getgenv().EspPlayer=V; EspPlayer() end})
Visual:AddToggle({Name="ESP Trái Ác Ma",Callback=function(V) getgenv().EspFruits=V; EspFruits() end,Flag="ESP/Fruits"})
Visual:AddToggle({Name="ESP Rương",Callback=function(V) getgenv().EspChests=V; EspChests() end})
Visual:AddToggle({Name="ESP Đảo",Callback=function(V) getgenv().EspIslands=V; EspIslands() end})
Visual:AddToggle({Name="ESP Mobs",Callback=function(V) getgenv().EspMobs=V; EspMobs() end,Flag="ESP/Mobs"})

Visual:AddSection({"Màu sắc ESP"})
Visual:AddDropdown({Name="Màu ESP Người chơi",Options={"Đỏ","Xanh lá","Xanh dương","Vàng","Tím"},Default={"Đỏ"},Callback=function(V) getgenv().ESPPlayerColor=V end})
Visual:AddDropdown({Name="Màu ESP Trái",Options={"Vàng","Cam","Hồng"},Default={"Vàng"},Callback=function(V) getgenv().ESPFruitColor=V end})

-- ── Misc Tab ───────────────────────────────────────────────
Misc:AddSection({"Tham gia Server"})
local ServerId=""
Misc:AddTextBox({Name="Nhập Job Id",Default="",PlaceholderText="Job ID",Callback=function(V) ServerId=V end})
Misc:AddButton({"Tham gia Server",function()
    if ServerId and #ServerId>5 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,ServerId,Player)
    end
end})

Misc:AddSection({"Cấu hình Farm"})
Misc:AddSlider({"Khoảng cách Farm",5,30,1,20,function(V) getgenv().FarmPos=Vector3.new(0,V or 15,V or 10); getgenv().FarmDistance=V end,"Misc/FarmDistance"})
Misc:AddSlider({"Tốc độ Tween",50,300,5,170,function(V) getgenv().TweenSpeed=V end,"Misc/TweenSpeed"})
Misc:AddSlider({"Khoảng cách Kéo Mob",50,500,10,250,function(V) getgenv().BringMobsDistance=V or 250 end,"Misc/BringMobsDistance"})
Misc:AddSlider({"Độ trễ Auto Click",0.05,0.5,0.01,0.1,function(V) getgenv().AutoClickDelay=V end,"Misc/AutoClickDelay"})

Misc:AddSection({"Tính năng hỗ trợ"})
Misc:AddToggle({"Fast Attack",true,function(V) getgenv().FastAttack=V end,"Misc/FastAttack"})
Misc:AddToggle({"Auto Click",true,function(V) getgenv().AutoClick=V end,"Misc/AutoClick"})
Misc:AddToggle({"Kéo Mob lại gần",true,function(V) getgenv().BringMobs=V end,"Misc/BringMobs"})
Misc:AddToggle({"Auto Haki",true,function(V) getgenv().AutoHaki=V end,"Misc/AutoHaki"})

Misc:AddSection({"Code"})
Misc:AddButton({Name="Nhận tất cả Code mới",Callback=function()
    local Codes = {
        "ADMIN_STRENGTH", "ADMIN_TROLL", "Axiore", "BIGNEWS", "BLUXXY", "CHANDLER",
        "CINCODEMAYO_BOOST",         "COKE_OREKI", "CONTROL", "DEVSCOOKING", "DRAGONABUSE", "ENYU_IS_PRO",
        "EXP_5B", "FUDD10", "FUDD10_V2", "GAMERROBOT_YT", "GREENGARDEN",
        "JCWK", "JULYUPDATE_RESET", "KITT_RESET", "KITTGAMING", "MAGICBUS",
        "NOOB_REFUND", "REWARDFUN", "SECRET_ADMIN", "SHUTDOWNFIX2", "STAFFBATTLE",
        "STARCODEHEO", "STRAWHATMAINE", "SUB2CAPTAINMAUI", "SUB2DAIGROCK",
        "SUB2FER999", "SUB2GAMERROBOT_EXP1", "SUB2NOOBMASTER123", "SUB2OFFICIALNOOBIE",
        "SUB2UNCLEKIZARU", "TANTAIGAMING", "THEGREATACE", "THIRDSEA", "TY_FOR_WATCHING",
        "UPD15", "UPD16", "UPDATE10", "UPDATE11", "UPDATE12", "UPDATE13", "UPDATE14",
        "XMASEXP", "XMASRESET", "1BILLION", "1MLIKES_RESET", "2BILLION", "3BVISITS",
        "15B_BESTBROTHERS", "ADMINGIVEAWAY", "KITT_RESET", "SUB2GAMERROBOT_RESET1"
    }
    for _,code in pairs(Codes) do
        task.spawn(function() pcall(function() ReplicatedStorage.Remotes.Redeem:InvokeServer(code) end) end)
        task.wait(0.1)
    end
    HerlysHub:MakeNotify({Name="Herlys Hub",Text="Đã nhận "..#Codes.." code!",Time=3})
end})

Misc:AddSection({"Đội"})
Misc:AddButton({"Tham gia đội Cướp biển",function() FireRemote("SetTeam","Pirates") end})
Misc:AddButton({"Tham gia đội Hải quân",function() FireRemote("SetTeam","Marines") end})

Misc:AddSection({"Menu game"})
Misc:AddButton({"Cửa hàng Trái Ác Ma",function() FireRemote("GetFruits"); Player.PlayerGui.Main.FruitShop.Visible=true end})
Misc:AddButton({"Tiêu đề",function() FireRemote("getTitles"); Player.PlayerGui.Main.Titles.Visible=true end})
Misc:AddButton({"Màu Haki",function() Player.PlayerGui.Main.Colors.Visible=true end})
Misc:AddButton({"Danh hiệu Elite",function() FireRemote("getEliteHunter") end})

Misc:AddSection({"Hình ảnh & Hiệu ứng"})
Misc:AddButton({"Xóa Sương mù",function()
    local LL,Sky=Lighting:FindFirstChild("LightingLayers"),Lighting:FindFirstChild("Sky")
    if Sky then Sky:Destroy() end; if LL then LL:Destroy() end
    HerlysHub:MakeNotify({Name="Herlys Hub",Text="Đã xóa sương mù!",Time=2})
end})
Misc:AddButton({"Tắt mây",function()
    for _, v in pairs(Lighting:GetDescendants()) do
        if v:IsA("Clouds") then v:Destroy() end
    end
end})

Misc:AddSection({"Tăng FPS"})
Misc:AddToggle({"Ẩn sát thương",true,function(V)
    pcall(function() ReplicatedStorage.Assets.GUI.DamageCounter.Enabled=not V end)
end,"Misc/RemoveDamage"})
Misc:AddToggle({"Ẩn thông báo",false,function(V)
    pcall(function() Player.PlayerGui.Notifications.Enabled=not V end)
end,"Misc/RemoveNotifications"})
Misc:AddToggle({"Tối ưu đồ họa",false,function(V)
    if V then
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        settings().Rendering.QualityLevel = 1
    else
        Lighting.GlobalShadows = true
        Lighting.FogEnd = 100000
        settings().Rendering.QualityLevel = 10
    end
end})

Misc:AddSection({"Khác"})
Misc:AddToggle({"Đi trên nước",true,function(V)
    getgenv().WalkOnWater=V
    task.spawn(function()
        local MapW=workspace:FindFirstChild("Map")
        if MapW then
            while getgenv().WalkOnWater do task.wait(0.1)
                local WBP=MapW:FindFirstChild("WaterBase-Plane") or MapW:FindFirstChild("Water")
                if WBP then WBP.Size=Vector3.new(1000,113,1000) end
            end
            local WBP=MapW:FindFirstChild("WaterBase-Plane") or MapW:FindFirstChild("Water")
            if WBP then WBP.Size=Vector3.new(1000,80,1000) end
        end
    end)
end,"Misc/WalkOnWater"})

Misc:AddToggle({"Anti AFK",true,function(V)
    getgenv().AntiAFK=V
    task.spawn(function()
        while getgenv().AntiAFK do
            VirtualUser:CaptureController(); VirtualUser:ClickButton1(Vector2.new(0,0)); task.wait(600)
        end
    end)
end,"Misc/AntiAFK"})

Misc:AddToggle({"No Clip",false,function(V)
    getgenv().NoClip=V
    task.spawn(function()
        while getgenv().NoClip do task.wait()
            local Char = Player.Character
            if Char then
                for _, part in pairs(Char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end)
end})

Misc:AddSection({"Giao diện"})
Misc:AddDropdown({Name="Chủ đề màu",Options={"Darker","Dark","Purple","HerlysBlue","HerlysRed","Ocean","Forest"},Default={"Darker"},Callback=function(V)
    if V then HerlysHub:SetTheme(V) end
end})
Misc:AddSlider({Name="Kích thước UI",Min=300,Max=800,Increase=10,Default=550,Callback=function(V)
    HerlysHub:SetScale(V)
end})

-- ── Shop Tab ───────────────────────────────────────────────
Shop:AddSection({"Fragments"})
Shop:AddButton({"Race Reroll",function() FireRemote("BlackbeardReward","Reroll","1"); FireRemote("BlackbeardReward","Reroll","2") end})
Shop:AddButton({"Reset Stats",function() FireRemote("BlackbeardReward","Refund","1"); FireRemote("BlackbeardReward","Refund","2") end})

Shop:AddSection({"Phong cách chiến đấu"})
Shop:AddButton({"Mua Black Leg",function() FireRemote("BuyBlackLeg") end})
Shop:AddButton({"Mua Electro",function() FireRemote("BuyElectro") end})
Shop:AddButton({"Mua Fishman Karate",function() FireRemote("BuyFishmanKarate") end})
Shop:AddButton({"Mua Dragon Claw",function() FireRemote("BlackbeardReward","DragonClaw","1"); FireRemote("BlackbeardReward","DragonClaw","2") end})
Shop:AddButton({"Mua Superhuman",function() FireRemote("BuySuperhuman") end})
Shop:AddButton({"Mua Death Step",function() FireRemote("BuyDeathStep") end})
Shop:AddButton({"Mua Sharkman Karate",function() FireRemote("BuySharkmanKarate") end})
Shop:AddButton({"Mua Electric Claw",function() FireRemote("BuyElectricClaw") end})
Shop:AddButton({"Mua Dragon Talon",function() FireRemote("BuyDragonTalon") end})
Shop:AddButton({"Mua GodHuman",function() FireRemote("BuyGodhuman") end})
Shop:AddButton({"Mua Sanguine Art",function() FireRemote("BuySanguineArt") end})

Shop:AddSection({"Ability Teacher"})
Shop:AddButton({"Mua Geppo",function() FireRemote("BuyHaki","Geppo") end})
Shop:AddButton({"Mua Buso",function() FireRemote("BuyHaki","Buso") end})
Shop:AddButton({"Mua Soru",function() FireRemote("BuyHaki","Soru") end})
Shop:AddButton({"Mua Kenbunshoku",function() FireRemote("BuyHaki","Ken") end})

Shop:AddSection({"Kiếm"})
Shop:AddButton({"Mua Katana",function() FireRemote("BuyItem","Katana") end})
Shop:AddButton({"Mua Cutlass",function() FireRemote("BuyItem","Cutlass") end})
Shop:AddButton({"Mua Dual Katana",function() FireRemote("BuyItem","Dual Katana") end})
Shop:AddButton({"Mua Iron Mace",function() FireRemote("BuyItem","Iron Mace") end})
Shop:AddButton({"Mua Triple Katana",function() FireRemote("BuyItem","Triple Katana") end})
Shop:AddButton({"Mua Bisento",function() FireRemote("BuyItem","Bisento") end})
Shop:AddButton({"Mua Soul Cane",function() FireRemote("BuyItem","Soul Cane") end})
Shop:AddButton({"Mua Pole (Stage 1)",function() FireRemote("BuyItem","Pole") end})
Shop:AddButton({"Mua Saber",function() FireRemote("BuyItem","Saber") end})
Shop:AddButton({"Mua Warden Sword",function() FireRemote("BuyItem","Warden Sword") end})

Shop:AddSection({"Súng"})
Shop:AddButton({"Mua Musket",function() FireRemote("BuyItem","Musket") end})
Shop:AddButton({"Mua Slingshot",function() FireRemote("BuyItem","Slingshot") end})
Shop:AddButton({"Mua Flintlock",function() FireRemote("BuyItem","Flintlock") end})
Shop:AddButton({"Mua Cannon",function() FireRemote("BuyItem","Cannon") end})
Shop:AddButton({"Mua Kabucha",function() FireRemote("BlackbeardReward","Slingshot","1"); FireRemote("BlackbeardReward","Slingshot","2") end})
Shop:AddButton({"Mua Serpent Bow",function() FireRemote("BuyItem","Serpent Bow") end})
Shop:AddButton({"Mua Acidum Rifle",function() FireRemote("BuyItem","Acidum Rifle") end})

Shop:AddSection({"Phụ kiện"})
Shop:AddButton({"Mua Black Cape",function() FireRemote("BuyItem","Black Cape") end})
Shop:AddButton({"Mua Swordsman Hat",function() FireRemote("BuyItem","Swordsman Hat") end})
Shop:AddButton({"Mua Tomoe Ring",function() FireRemote("BuyItem","Tomoe Ring") end})
Shop:AddButton({"Mua Swan Glasses",function() FireRemote("BuyItem","Swan Glasses") end})
Shop:AddButton({"Mua Warrior Helmet",function() FireRemote("BuyItem","Warrior Helmet") end})
Shop:AddButton({"Mua Pale Scarf",function() FireRemote("BuyItem","Pale Scarf") end})
Shop:AddButton({"Mua Valkyrie Helmet",function() FireRemote("BuyItem","Valkyrie Helmet") end})

Shop:AddSection({"Chủng tộc"})
Shop:AddButton({"Chủng tộc Ghoul",function() FireRemote("Ectoplasm","Change",4) end})
Shop:AddButton({"Chủng tộc Cyborg",function() FireRemote("CyborgTrainer","Buy") end})
Shop:AddButton({"Chủng tộc Mink V3",function() FireRemote("Buddha","Buy") end})
Shop:AddButton({"Chủng tộc Skypiean V3",function() FireRemote("Sky","Buy") end})

-- ── Sea 3 - Auto Sea Tab ───────────────────────────────────
if Sea3 then
    local AutoSea = Window:MakeTab({"Sea", "Waves"})
    
    AutoSea:AddSection({"Kitsune Island"})
    local KILabel = AutoSea:AddParagraph({"Kitsune Island : Chưa xuất hiện"})
    AutoSea:AddToggle({Name="Auto Kitsune Island",Callback=function(V)
        getgenv().AutoKitsuneIsland=V; AutoKitsuneIsland()
    end})
    
    task.spawn(function()
        local MapW=workspace:FindFirstChild("Map")
        while task.wait(1) do
            if MapW and MapW:FindFirstChild("KitsuneIsland") then
                local plrPP=Player.Character and Player.Character.PrimaryPart
                local dist=plrPP and tostring(math.floor((plrPP.Position-MapW.KitsuneIsland.WorldPivot.p).Magnitude/3)) or "?"
                KILabel:SetTitle("Kitsune Island : Đã xuất hiện | Khoảng cách : "..dist)
            else
                KILabel:SetTitle("Kitsune Island : Chưa xuất hiện")
            end
        end
    end)
    
    AutoSea:AddSection({"Sea Events"})
    AutoSea:AddToggle({Name="Auto Farm Sea Events",Callback=function(V) getgenv().AutoFarmSea=V; AutoFarmSea() end})
    AutoSea:AddButton({Name="Mua Thuyền Mới",Callback=function() BuyNewBoat() end})
    
    AutoSea:AddSection({"Terrorshark"})
    AutoSea:AddToggle({Name="Auto Terrorshark",Callback=function(V) getgenv().AutoTerrorshark=V end})
    AutoSea:AddToggle({Name="Auto Terrorshark Hop",Callback=function(V) getgenv().AutoTerrorsharkHop=V end})
end

-- ── Stats Tab ──────────────────────────────────────────────
if PlayerLevel.Value < MaxLavel then
    local StatsTab = Window:MakeTab({"Stats", "signal"})
    local PointsSlider,Melee,Defense,Sword,Gun,DemonFruit = 1
    
    local function AutoStats() task.spawn(function()
        local function AddStats(S)
            if Player.Data.Points.Value>=1 then
                local Pts=math.clamp(PointsSlider,1,Player.Data.Points.Value)
                FireRemote("AddPoint",S,Pts)
            end
        end
        while getgenv().AutoStats do task.wait()
            if Melee then AddStats("Melee") end
            if Defense then AddStats("Defense") end
            if Sword then AddStats("Sword") end
            if Gun then AddStats("Gun") end
            if DemonFruit then AddStats("Demon Fruit") end
        end
    end) end
    
    StatsTab:AddToggle({Name="Auto Stats",Flag="Stats/AutoStats",Callback=function(V) getgenv().AutoStats=V; AutoStats() end})
    StatsTab:AddSlider({Name="Số điểm mỗi lần",Flag="Stats/SelectPoints",Min=1,Max=100,Increase=1,Default=1,Callback=function(V) PointsSlider=V end})
    StatsTab:AddSection({"Chọn Chỉ số"})
    StatsTab:AddToggle({Name="Melee",Flag="Stats/SelectMelee",Callback=function(V) Melee=V end})
    StatsTab:AddToggle({Name="Defense",Flag="Stats/SelectDefense",Callback=function(V) Defense=V end})
    StatsTab:AddToggle({Name="Sword",Flag="Stats/SelectSword",Callback=function(V) Sword=V end})
    StatsTab:AddToggle({Name="Gun",Flag="Stats/SelectGun",Callback=function(V) Gun=V end})
    StatsTab:AddToggle({Name="Demon Fruit",Flag="Stats/SelectDemonFruit",Callback=function(V) DemonFruit=V end})
end

-- ─── Init & Anti-Detection ─────────────────────────────────
getgenv().FarmPos         = Vector3.new(0, 15, 10)
getgenv().FarmDistance    = 20
getgenv().TweenSpeed      = 170
getgenv().BringMobsDistance = 250
getgenv().AutoClickDelay  = 0.1
getgenv().FastAttack      = true
getgenv().AutoClick       = true
getgenv().BringMobs       = true
getgenv().AutoHaki        = true
getgenv().FarmTool        = "Melee"

-- Anti-ban measures
task.spawn(function()
    local EC = ReplicatedStorage:FindFirstChild("Effect")
    if EC then
        EC = EC:FindFirstChild("Container")
        if EC then
            RunService.RenderStepped:Connect(function()
                local DE = EC:FindFirstChild("Death")
                if DE then DE:Destroy() end
            end)
        end
    end
    
    -- Hook functions
    pcall(function() 
        if hookfunction then
            hookfunction(error, function() end)
            hookfunction(warn, function() end)
            hookfunction(print, function() end)
        end
    end)
end)

-- Auto-load settings
local function LoadSettings()
    if readfile and isfile then
        local settingsFile = "HerlysHub_Settings.json"
        if isfile(settingsFile) then
            local success, data = pcall(function()
                return HttpService:JSONDecode(readfile(settingsFile))
            end)
            if success and type(data) == "table" then
                for k, v in pairs(data) do
                    getgenv()[k] = v
                end
            end
        end
    end
end
pcall(LoadSettings)

-- Save settings on exit
game:BindToClose(function()
    if writefile then
        local data = {}
        for k, v in pairs(getgenv()) do
            if type(v) ~= "function" and type(v) ~= "userdata" then
                data[k] = v
            end
        end
        local success, json = pcall(function()
            return HttpService:JSONEncode(data)
        end)
        if success then
            pcall(writefile, "HerlysHub_Settings.json", json)
        end
    end
end)

-- Welcome notification
HerlysHub:MakeNotify({
    Name = "Herlys Hub v2.0",
    Text = "Đã tải thành công! Chúc bạn chơi game vui vẻ 🎮",
    Time = 5
})

-- Auto-execute if enabled
if HerlysHub.Save.AutoExecute then
    task.wait(2)
    for _, toggle in pairs(AFKOptions) do
        pcall(function() toggle:Set(true) end)
    end
end

return HerlysHub
