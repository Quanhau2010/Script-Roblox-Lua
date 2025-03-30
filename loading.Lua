shared.LoaderTitle = "IDK HUB"
shared.LoaderKeyFrames = {[1] = {3, 30}, [2] = {5, 50}}

local v2 = {
    LoaderData = {
        Name = shared.LoaderTitle or "A Loader",
        Colors = shared.LoaderColors or {
            Main = Color3.fromRGB(24, 24, 24),
            Topic = Color3.fromRGB(0, 220, 255),  -- Màu xanh sáng hơn
            Title = Color3.fromRGB(0, 220, 255),
            LoaderBackground = Color3.fromRGB(30, 30, 30),
            LoaderSplash = Color3.fromRGB(0, 220, 255)
        }
    },
    Keyframes = shared.LoaderKeyFrames or {
        [1] = {1, 10},
        [2] = {2, 30},
        [3] = {3, 60},
        [4] = {2, 100}
    }
}

local function v3(v104, v105, v106)
    game.TweenService:Create(v104, TweenInfo.new(v105, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v106):Play()
end

local function v4(v107, v108)
    local v109 = Instance.new(v107)
    local v110
    for v589, v590 in pairs(v108) do
        if (v589 ~= "Parent") then
            v109[v589] = v590
        else
            v110 = v590
        end
    end
    v109.Parent = v110
    return v109
end

-- Hàm để tạo loading
local function createLoading()
    local v5 = v4("ScreenGui", {Name = "Core", Parent = game.CoreGui})
    local v6 = v4("Frame", {
        Name = "Main",
        Parent = v5,
        BackgroundColor3 = v2.LoaderData.Colors.Main,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(0, 0, 0, 0)
    })

    local v7 = v4("TextLabel", {
        Name = "Top",
        TextTransparency = 1,
        Parent = v6,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 30, 0, 8),
        Size = UDim2.new(0, 301, 0, 50),
        Font = Enum.Font.Gotham,
        Text = "I Don't Know Hub",
        TextColor3 = v2.LoaderData.Colors.Topic,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    local v8 = v4("TextLabel", {
        Name = "BottomRightLabel",
        TextTransparency = 0,
        Parent = v6,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 30, 0, 85),
        Size = UDim2.new(0, 301, 0, 50),
        Font = Enum.Font.Gotham,
        RichText = true,
        Text = "<b>Cre By : Quan Hậu</b>",
        TextColor3 = v2.LoaderData.Colors.Topic,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right
    })

    local v9 = v4("TextLabel", {
        Name = "Title",
        Parent = v6,
        TextTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 30, 0, 27),
        Size = UDim2.new(0, 301, 0, 46),
        Font = Enum.Font.Gotham,
        RichText = true,
        Text = "<b>" .. v2.LoaderData.Name .. "</b>",
        TextColor3 = v2.LoaderData.Colors.Title,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    local v10 = v4("Frame", {
        Name = "BG",
        Parent = v6,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 1,
        BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
        BorderSizePixel = 0,
        Position = UDim2.new(0.5, 0, 0, 70),
        Size = UDim2.new(0.8500000238418579, 0, 0, 24)
    })

    local v11 = v4("Frame", {
        Name = "Progress",
        Parent = v10,
        BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 0, 24)
    })

    local function v12(v112)
        v3(v11, 0.5, {Size = UDim2.new(v112 / 100, 0, 0, 24)})
    end

    -- Hiển thị phần loading
    v3(v6, 0.25, {Size = UDim2.new(0, 346, 0, 121)})
    wait(0.25)
    v3(v7, 0.5, {TextTransparency = 0})
    v3(v9, 0.5, {TextTransparency = 0})
    v3(v10, 0.5, {BackgroundTransparency = 0})
    v3(v11, 0.5, {BackgroundTransparency = 0})

    -- Cập nhật phần tiến trình
    for v113, v114 in pairs(v2.Keyframes) do
        wait(v114[1])
        v12(v114[2])
    end

    -- Hoàn thành loading
    v12(100)
    v3(v7, 0.5, {TextTransparency = 1})
    v3(v9, 0.5, {TextTransparency = 1})
    v3(v10, 0.5, {BackgroundTransparency = 1})
    v3(v11, 0.5, {BackgroundTransparency = 1})
    wait(0.5)
    v3(v6, 0.25, {Size = UDim2.new(0, 0, 0, 0)})
    v5:Destroy()
end

-- Gọi hàm để tạo loading
createLoading()
