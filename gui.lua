-- // Minimalistic GUI // --
local UserInputService = game:GetService("UserInputService")


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MinimalGui"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Parent = ScreenGui


local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)


local TabPanel = Instance.new("Frame")
TabPanel.Size = UDim2.new(0, 120, 1, 0)
TabPanel.Position = UDim2.new(0, 0, 0, 0)
TabPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TabPanel.Parent = MainFrame
Instance.new("UICorner", TabPanel).CornerRadius = UDim.new(0, 10)


local function CreateTab(name, posY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, posY)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.Font = Enum.Font.Code -- технологичный моно-стиль
    btn.TextSize = 16
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.AutoButtonColor = true
    btn.Parent = TabPanel
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local homeTab = CreateTab("Home", 20)
local settingsTab = CreateTab("Settings", 70)
local aboutTab = CreateTab("About", 120)


local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 10)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 18
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
CloseBtn.Parent = MainFrame
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Size = UDim2.new(0, 250, 0, 120)
ConfirmFrame.Position = UDim2.new(0.5, -125, 0.5, -60)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ConfirmFrame.Visible = false
ConfirmFrame.Parent = ScreenGui
Instance.new("UICorner", ConfirmFrame).CornerRadius = UDim.new(0, 10)

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Size = UDim2.new(1, 0, 0, 40)
ConfirmText.Position = UDim2.new(0, 0, 0, 10)
ConfirmText.Text = "Are you sure you want to close?"
ConfirmText.TextColor3 = Color3.fromRGB(230, 230, 230)
ConfirmText.Font = Enum.Font.Code
ConfirmText.TextSize = 16
ConfirmText.BackgroundTransparency = 1
ConfirmText.Parent = ConfirmFrame

local YesBtn = Instance.new("TextButton")
YesBtn.Size = UDim2.new(0, 100, 0, 30)
YesBtn.Position = UDim2.new(0.2, 0, 0.6, 0)
YesBtn.Text = "Yes"
YesBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
YesBtn.Font = Enum.Font.Code
YesBtn.TextSize = 16
YesBtn.BackgroundColor3 = Color3.fromRGB(80, 40, 40)
YesBtn.Parent = ConfirmFrame
Instance.new("UICorner", YesBtn).CornerRadius = UDim.new(0, 6)

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0, 100, 0, 30)
NoBtn.Position = UDim2.new(0.55, 0, 0.6, 0)
NoBtn.Text = "No"
NoBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
NoBtn.Font = Enum.Font.Code
NoBtn.TextSize = 16
NoBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
NoBtn.Parent = ConfirmFrame
Instance.new("UICorner", NoBtn).CornerRadius = UDim.new(0, 6)

-- Logic
CloseBtn.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = true
end)

YesBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    ConfirmFrame:Destroy()
end)

NoBtn.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
end)


local guiVisible = true
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        guiVisible = not guiVisible
        MainFrame.Visible = guiVisible
        TabPanel.Visible = guiVisible
        CloseBtn.Visible = guiVisible
    end
end)
