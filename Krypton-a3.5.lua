
KryptonVersion = 'a3.5'

--[[
Time Wasted : 2:30HR
]]
--[[
   __ __              __          
  / //_/_____ _____  / /____  ___ 
 / ,< / __/ // / _ \/ __/ _ \/ _ \
/_/|_/_/  \_, / .__/\__/\___/_//_/
       /___/_/
> Krypton | NON OPEN-SOURCED
]]
print("Krypton Multipurpose Hub | NON OPEN-SOURCED")
--[] Arguments
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/thanhdat4461/OrionMoblie/main/source'))()
--[] Krypton Locals
_G.CrosshairVisible = true
local apiKey = ""
local apiUrl = "https://api.openai.com/v1/chat/completions"
local ProxyUrl = ""
local Players = game:GetService("Players")
local uis = game:GetService("UserInputService")
local ismobile = uis.TouchEnabled
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Typing = false
local HttpService = game:GetService("HttpService")
UserInputService = game:GetService("UserInputService")
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local ID = game:GetService("Players").LocalPlayer.UserId
local PLAYERNAME = game:GetService("Players").LocalPlayer.Name
local GameID = tostring(game.PlaceId)
local LocalPlayer = game:GetService("Players").LocalPlayer.Name
local MembershipType = "a"
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
local AccountAge = LocalPlayer.AccountAge
--[] Force Reset Character
local function forceResetAction()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Health = 0
    end
end
--[] Esp
function Esp()
    _G.SendNotifications = false
    _G.DefaultSettings = false
    _G.TeamCheck = false
    _G.ESPVisible = nil
    _G.TextColor = Color3.fromRGB(255, 80, 10)
    _G.TextSize = 25
    _G.Center = true
    _G.Outline = true
    _G.OutlineColor = Color3.fromRGB(255, 255, 255)
    _G.TextTransparency = 1.7
    _G.TextFont = Drawing.Fonts.UI
    _G.DisableKey = nil
    
    local function CreateESP()
        for _, v in next, Players:GetPlayers() do
            if v.Name ~= Players.LocalPlayer.Name then
                local ESP = Drawing.new("Text")
    
                RunService.RenderStepped:Connect(function()
                    if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                        local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
    
                        ESP.Size = _G.TextSize
                        ESP.Center = _G.Center
                        ESP.Outline = _G.Outline
                        ESP.OutlineColor = _G.OutlineColor
                        ESP.Color = _G.TextColor
                        ESP.Transparency = _G.TextTransparency
                        ESP.Font = _G.TextFont
    
                        if OnScreen == true then
                            local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                            local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                            local Dist = (Part1 - Part2).Magnitude
                            ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                            ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= v.Team then
                                    ESP.Visible = _G.ESPVisible
                                else
                                    ESP.Visible = false
                                end
                            else
                                ESP.Visible = _G.ESPVisible
                            end
                        else
                            ESP.Visible = false
                        end
                    else
                        ESP.Visible = false
                    end
                end)
    
                Players.PlayerRemoving:Connect(function()
                    ESP.Visible = false
                end)
            end
        end
    
        Players.PlayerAdded:Connect(function(Player)
            Player.CharacterAdded:Connect(function(v)
                if v.Name ~= Players.LocalPlayer.Name then 
                    local ESP = Drawing.new("Text")
        
                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                            local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
        
                            ESP.Size = _G.TextSize
                            ESP.Center = _G.Center
                            ESP.Outline = _G.Outline
                            ESP.OutlineColor = _G.OutlineColor
                            ESP.Color = _G.TextColor
                            ESP.Transparency = _G.TextTransparency
        
                            if OnScreen == true then
                                local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                local Dist = (Part1 - Part2).Magnitude
                                ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= Player.Team then
                                        ESP.Visible = _G.ESPVisible
                                    else
                                        ESP.Visible = false
                                    end
                                else
                                    ESP.Visible = _G.ESPVisible
                                end
                            else
                                ESP.Visible = false
                            end
                        else
                            ESP.Visible = false
                        end
                    end)
        
                    Players.PlayerRemoving:Connect(function()
                        ESP.Visible = false
                    end)
                end
            end)
        end)
    end
    
    if _G.DefaultSettings == true then
        _G.TeamCheck = false
        _G.ESPVisible = true
        _G.TextColor = Color3.fromRGB(40, 90, 255)
        _G.TextSize = 14
        _G.Center = true
        _G.Outline = false
        _G.OutlineColor = Color3.fromRGB(0, 0, 0)
        _G.DisableKey = Enum.KeyCode.Q
        _G.TextTransparency = 0.75
    end
    
    UserInputService.TextBoxFocused:Connect(function()
        Typing = true
    end)
    
    UserInputService.TextBoxFocusReleased:Connect(function()
        Typing = false
    end)
    
    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == _G.DisableKey and Typing == false then
            _G.ESPVisible = not _G.ESPVisible
            
            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Exunys Developer";
                    Text = "The ESP's visibility is now set to "..tostring(_G.ESPVisible)..".";
                    Duration = 5;
                })
            end
        end
    end)
    
    local Success, Errored = pcall(function()
        CreateESP()
    end)
    
    if Success and not Errored then
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Exunys Developer";
                Text = "ESP script has successfully loaded.";
                Duration = 5;
            })
        end
    elseif Errored and not Success then
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Exunys Developer";
                Text = "ESP script has errored while loading, please check the developer console! (F9)";
                Duration = 5;
            })
        end
        TestService:Message("The ESP script has errored, please notify Exunys with the following information :")
        warn(Errored)
        print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
    end
end

--[] Crosshair
function Crosshair()
    -- Check if Drawing API is available
    local function API_Check()
        if Drawing == nil then
            return false
        else
            return true
        end
    end

    -- Initialize Drawing API check
    if not API_Check() then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "KryptonReload";
            Text = "Crosshair script could not be loaded because your exploit is unsupported.";
            Duration = math.huge;
            Button1 = "OK"
        })
        return
    end

    -- Required services and variables
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Camera = workspace.CurrentCamera

    -- Global settings
    _G.SendNotifications = false
    _G.DefaultSettings = false
    _G.ToMouse = false
    _G.CrosshairSize = 20
    _G.CrosshairThickness = 1
    _G.CrosshairColor = Color3.fromRGB(255, 255, 255)
    _G.CrosshairTransparency = 1
    _G.DisableKey = Enum.KeyCode.Q

    -- Drawing setup
    local HorizontalLine = Drawing.new("Line")
    local VerticalLine = Drawing.new("Line")

    -- Function to update crosshair position and appearance
    local function UpdateCrosshair()
        local Real_Size = _G.CrosshairSize / 2

        HorizontalLine.Color = _G.CrosshairColor
        HorizontalLine.Thickness = _G.CrosshairThickness
        HorizontalLine.Visible = _G.CrosshairVisible
        HorizontalLine.Transparency = _G.CrosshairTransparency
        
        VerticalLine.Color = _G.CrosshairColor
        VerticalLine.Thickness = _G.CrosshairThickness
        VerticalLine.Visible = _G.CrosshairVisible
        VerticalLine.Transparency = _G.CrosshairTransparency
        
        if _G.ToMouse == true then
            local MouseLocation = UserInputService:GetMouseLocation()
            HorizontalLine.From = Vector2.new(MouseLocation.X - Real_Size, MouseLocation.Y)
            HorizontalLine.To = Vector2.new(MouseLocation.X + Real_Size, MouseLocation.Y)
            
            VerticalLine.From = Vector2.new(MouseLocation.X, MouseLocation.Y - Real_Size)
            VerticalLine.To = Vector2.new(MouseLocation.X, MouseLocation.Y + Real_Size)
        else
            local ViewportSize = Camera.ViewportSize / 2
            local Axis_X, Axis_Y = ViewportSize.X, ViewportSize.Y
            
            HorizontalLine.From = Vector2.new(Axis_X - Real_Size, Axis_Y)
            HorizontalLine.To = Vector2.new(Axis_X + Real_Size, Axis_Y)
        
            VerticalLine.From = Vector2.new(Axis_X, Axis_Y - Real_Size)
            VerticalLine.To = Vector2.new(Axis_X, Axis_Y + Real_Size)
        end
    end

    -- RenderStepped connection to update crosshair
    RunService.RenderStepped:Connect(UpdateCrosshair)

    -- Default settings initialization
    if _G.DefaultSettings == true then
        _G.CrosshairVisible = true
        _G.CrosshairSize = 25
        _G.CrosshairThickness = 1
        _G.CrosshairColor = Color3.fromRGB(255, 255, 255)
        _G.CrosshairTransparency = 0.15
        _G.DisableKey = Enum.KeyCode.Q
    end

    -- Input handlers
    local Typing = false

    UserInputService.TextBoxFocused:Connect(function()
        Typing = true
    end)

    UserInputService.TextBoxFocusReleased:Connect(function()
        Typing = false
    end)

    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == _G.DisableKey and not Typing then
            _G.CrosshairVisible = not _G.CrosshairVisible
            
            if _G.SendNotifications then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "KryptonReload";
                    Text = "The crosshair's visibility is now set to " .. tostring(_G.CrosshairVisible) .. ".";
                    Duration = 5;
                })
            end
        end
    end)
end

--[] Bypasser Functions
local function fetchAndParse(url)
	local success, response = pcall(function()
		return HttpService:GetAsync(url)
	end)
	if success then
		local parsedResponse = HttpService:JSONDecode(response)
		local status = parsedResponse.status
		local key = parsedResponse.key or "No key provided"
		local message = parsedResponse.message or "No message provided"
		if status == "success" then
			status = message
		end
		return status, key, message
	else
		warn("Failed to fetch URL:", response)
		return nil, nil, nil
	end
end
local baseURL = "http://45.90.13.151:6041/?url="
userInput = ""
local fullURL = baseURL .. HttpService:UrlEncode(userInput)
local status, key, message = fetchAndParse(fullURL)
finalStatus = status
finalKey = key
finalMessage = message

function PrintResultBypass()
	print(finalStatus)
	print(finalKey)
	print(finalMessage)
end
--[] ChatGPT ResponeDirect
local function getChatGPTResponseDirect(message)
	local requestBody = HttpService:JSONEncode({
		model = "gpt-3.5-turbo",
		messages = {
			{
				role = "user",
				content = message
			}
		}
	})
	local headers = {
		["Authorization"] = "Bearer " .. apiKey,
		["Content-Type"] = "application/json"
	}
	local response
	local success, errorMessage = pcall(function()
		response = HttpService:PostAsync(apiUrl, requestBody, Enum.HttpContentType.ApplicationJson, false, headers)
	end)
	if success then
		local data = HttpService:JSONDecode(response)
		if data and data.choices and data.choices[1] then
			return data.choices[1].message.content
		end
	else
		warn("Failed to get response from ChatGPT: " .. errorMessage)
	end
	return "Sorry, I couldn't understand that."
end
--[] ChatGPT ResponeProxy
local function getChatGPTResponseViaProxy(message, proxyUrl)
	local requestBody = HttpService:JSONEncode({
		message = message
	})
	local response
	local success, errorMessage = pcall(function()
		response = HttpService:PostAsync(proxyUrl, requestBody, Enum.HttpContentType.ApplicationJson)
	end)
	if success then
		local data = HttpService:JSONDecode(response)
		if data and data.choices and data.choices[1] then
			return data.choices[1].message.content
		end
	else
		warn("Failed to get response from ChatGPT via proxy: " .. errorMessage)
	end
	return "Sorry, I couldn't understand that."
end

 
if ismobile then
	loadstring(game:HttpGet("https://pastebin.com/raw/qyFBKExn"))()
end

--[] Vuln Checker
for i, v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
	if v.Name == "DestroySegway" or v.Name == "DeleteCar" or v.Name == "HandlessSegway" or v.Name == "Building Tools" or v.Name == "SetNetworkOwnership" or v.Name == "ChangeParent" or v.Name == "despawn" then
		OrionLib:MakeNotification({
			Name = "Krypton",
			Content = "Vuln FOUND!",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
		VulnGame = true
	end
end
--[] Krypton Window
local Window = OrionLib:MakeWindow({
	Name = "Krypton",
	HidePremium = false,
	IntroEnabled = true,
	IntroText = "Krypton",
	IntroIcon = "rbxassetid://7733752575",
	SaveConfig = false,
	ConfigFolder = "Krypton",
})

--[] Krypton Notification
OrionLib:MakeNotification({
	Name = "Krypton",
	Content = "Krypton started successfully",
	Image = "rbxassetid://7733771628",
	Time = 5
})

function scriptnotify()
	OrionLib:MakeNotification({
		Name = "Krypton",
		Content = "Script ran",
		Image = "rbxassetid://7733771628",
		Time = 5
	})
end

function scriptnotfound()
	OrionLib:MakeNotification({
		Name = "Krypton",
		Content = "Script cannot be found ]:",
		Image = "rbxassetid://7733771628",
		Time = 5
	})
end

--[] Krypton Tabs
local AnimationTab = Window:MakeTab({
	Name = "Animation",
	Icon = "rbxassetid://7743871002",
	PremiumOnly = false
})

local UniversalHubTab = Window:MakeTab({
	Name = "Universal Hubs",
	Icon = "rbxassetid://7733954760",
	PremiumOnly = false
})

local TrollTab = Window:MakeTab({
	Name = "Troll",
	Icon = "rbxassetid://7733741741",
	PremiumOnly = false
})

local ServerTab = Window:MakeTab({
	Name = "Server",
	Icon = "rbxassetid://7734053426",
	PremiumOnly = false
})

local AdminTab = Window:MakeTab({
	Name = "Admin",
	Icon = "rbxassetid://7734056608",
	PremiumOnly = false
})

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://7743875962",
	PremiumOnly = false
})

local DebuggingTab = Window:MakeTab({
	Name = "Debugging",
	Icon = "rbxassetid://7743872929",
	PremiumOnly = false
})

local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://7734053495",
	PremiumOnly = false
})

local InfoTab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://7743866778",
	PremiumOnly = false
})

local MiscTab = Window:MakeTab({
	Name = "Mics",
	Icon = "rbxassetid://7733793319",
	PremiumOnly = false
})

--[] Krypton | Animation

local MiscTimeLabel = MiscTab:AddLabel("Current Time and Date")

--[] Seperator
local Section = AnimationTab:AddSection({
	Name = "Total Animations : 10"
})
--[] Seperator

local AnimationTimeLabel = AnimationTab:AddLabel("Current Time and Date")

AnimationTab:AddParagraph("IMPORTANT","Some animations wont work since its outdated or your executor!")

AnimationTab:AddButton({
	Name = "Animation Player",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/yayeet-creator/nameless-r6-scripts/raw/main/%5BFE%5D%20Animation%20ID%20Player.txt"))()
	end
})

--[] Seperator
local Section = AnimationTab:AddSection({
	Name = "Universal Animation R6/R15"
})
--[] Seperator

AnimationTab:AddButton({
	Name = "Energize Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
	end
})

AnimationTab:AddButton({
	Name = "Pendulum Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
	end
})

AnimationTab:AddButton({
	Name = "LX63 Animation Hub",
	Callback = function()
	  loadstring(game:HttpGet(('https://raw.githubusercontent.com/Gogogamer61/LXHub-Main/main/LXHub%20Main%20Script'),true))()
	end
})

AnimationTab:AddButton({
	Name = "Animation Hub",
	Callback = function()
	  loadstring(game:HttpGet('https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/UFE'))()
	end
})

AnimationTab:AddButton({
	Name = "Animation Changer 1",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/RubyBoo4life/Scripts/main/animations.vis'))()"))()
	end
})


AnimationTab:AddButton({
	Name = "Animation Changer 2",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/UniversalDance-AnimGui.lua'))()
	end
})

--[] Seperator
local Section = AnimationTab:AddSection({
	Name = "R6"
})
--[] Seperator

AnimationTab:AddButton({
	Name = "Da Feets",
	Callback = function()
		loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-FE-da-Feets-Modded-14288'))()
	end
})

AnimationTab:AddButton({
	Name = "Human Car",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/YbEir502'))()
	end
})

AnimationTab:AddButton({
	Name = "Winged Master",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/G68Krc4Q'))()
	end
})

--[] Krypton | Universal

--[] Seperator
local Section = UniversalHubTab:AddSection({
	Name = "Total Hubs : 5"
})
--[] Seperator

local UniversalTimeLabel = UniversalHubTab:AddLabel("Current Time and Date")

UniversalHubTab:AddParagraph("WARNING","Some of these might not work with your executor!")

--[] Seperator
local Section = UniversalHubTab:AddSection({
	Name = "Universal Hub [99+]"
})
--[] Seperator

UniversalHubTab:AddButton({
	Name = "Rochips V5 [99+]",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/Zm2VwbsU"))()
	end
})

--[] Seperator
local Section = UniversalHubTab:AddSection({
	Name = " Universal Hub [50+]"
})
--[] Seperator

UniversalHubTab:AddButton({
	Name = "Skyhub [50+]",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
	end
})

UniversalHubTab:AddButton({
	Name = "Unfair Hub [50+]",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
	end
})

--[] Seperator
local Section = UniversalHubTab:AddSection({
	Name = "Universal Hub [15+]"
})
--[] Seperator

UniversalHubTab:AddButton({
	Name = "Ender Hub [15+]",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/NovaExploits/NovaX-Key/main/Ender'))() 
	end
})

--[] Krypton | Troll

--[] Seperator
local Section = TrollTab:AddSection({
	Name = "Total : 24"
})
--[] Seperator

local TrollTimeLabel = TrollTab:AddLabel("Current Time and Date")

TrollTab:AddParagraph("WARNING","Some of these might not work with your executor or game!")

--[] Seperator
local Section = TrollTab:AddSection({
	Name = "Classic"
})
--[] Seperator


TrollTab:AddButton({
	Name = "CoolKid Panel",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ckid", true))() 
	end
})

--[] Seperator
local Section = TrollTab:AddSection({
	Name = "Universal Troll GUI"
})
--[] Seperator

TrollTab:AddButton({
	Name = "Ultimate Trolling GUI [V1]",
	Callback = function()
		scriptnotfound()
	end
})

TrollTab:AddButton({
	Name = "Ultimate Trolling GUI [V2]",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/UZPJ7jGs"))()
	end
})

TrollTab:AddButton({
	Name = "Ultimate Trolling GUI [V3]",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Blukez/Scripts/main/UTG%20V3%20RAW"))()
	end
})

--[] Seperator
local Section = TrollTab:AddSection({
	Name = "Universal FE GUIS"
})
--[] Seperator

TrollTab:AddButton({
	Name = "Universal FE GUI [1]",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/Script'))()
	end
})

TrollTab:AddButton({
	Name = "Universal FE GUI [2]",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/o5u3/Selexity/main/Main'), true))()
	end
})

TrollTab:AddButton({
	Name = "Universal FE GUI [3]",
	Callback = function()
		loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Rochips-Panel-v4-13177'))()
	end
})

--[] Seperator
local Section = TrollTab:AddSection({
	Name = "Universal Troll Hubs"
})
--[] Seperator

TrollTab:AddButton({
	Name = "Skyhub Trolling [2+]",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
	end
})

--[] Seperator
local Section = TrollTab:AddSection({
	Name = "Scripts"
})
--[] Seperator

TrollTab:AddButton({
	Name = "Netless FE",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/pXWQxpLK'))()
	end
})

TrollTab:AddButton({
	Name = "Fling All FE",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
	end
})

TrollTab:AddButton({
	Name = "Fling Random FE",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/1FaK0DnK'))()
	end
})

TrollTab:AddButton({
	Name = "Touch Fling FE",
	Callback = function()
		loadstring(game:HttpGet('https://gist.githubusercontent.com/1BlueCat/544f7efbe88235666b5b7add65b7344d/raw/f20804bb85542dcc3bc938982e1f05b7ff05cded/FE%2520Hat%2520Fling'))()
	end
})	

TrollTab:AddButton({
	Name = "Click Fling FE",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'), true))()
	end
})	

TrollTab:AddButton({
	Name = "Orbit GUI FE",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Orbit%20GUI"))()
	end
})

TrollTab:AddButton({
	Name = "Giant Head FE",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/Dif6a2SK'))()
	end
})

--[] Seperator
local Section = TrollTab:AddSection({
	Name = "Anti's"
})
--[] Seperator

TrollTab:AddButton({
	Name = "Anti Fling",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/h8sLkBP0"))()
	end
})

TrollTab:AddButton({
	Name = "Anti Fling",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/tMHP76Ex"))()
	end
})

TrollTab:AddButton({
	Name = "Anti Fling",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/DVJUMC9j"))()
	end
})

TrollTab:AddButton({
	Name = "Anti Fling",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/DVJUMC9j"))()
	end
})

TrollTab:AddButton({
	Name = "Anti Bang",
	Callback = function()
		loadstring(game:HttpGet('https://github.com/AnthonyIsntHere/anthonysrepository/raw/main/scripts/Anti%20Bang.lua'))()
	end
})

TrollTab:AddButton({
	Name = "Anti Tool Kill",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/Anti%20Tool%20Kill.lua'))()
	end
})

--[] Seperator
local Section = TrollTab:AddSection({
	Name = "No Dignity"
})
--[] Seperator

TrollTab:AddButton({
	Name = "Sussy HUB FE",
	Callback = function()
		loadstring(game:HttpGet('https://gist.githubusercontent.com/Nilrogram/8b0c8bd710be142f383c71f79279752c/raw/e4fb01a7de7cd498bb53270d2ad191dfab268a88/FE%2520SussyHub', true))()
	end
})

TrollTab:AddButton({
	Name = "Bang GUI FE",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/RENBex6969/Krypton/main/BangGui.lua'))()
	end
})

--[] Krypton | Server

--[] Seperator
local Section = ServerTab:AddSection({
	Name = "Total : 10"
})
--[] Seperator

local ServerTimeLabel = ServerTab:AddLabel("Current Time and Date")

ServerTab:AddParagraph("WARNING","Some of these might not work because of your executor or game!")

--[] Seperator
local Section = ServerTab:AddSection({
	Name = "Chat bypass"
})
--[] Seperator

ServerTab:AddButton({
	Name = "SIMPLE Chat Bypasser",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
	end
})

ServerTab:AddButton({
	Name = "V3rge's Bypasser",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/MRCBV4LSB4KRS/main/Loader"))()
	end
})

ServerTab:AddButton({
	Name = "BetterBypasser",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua", true))()
		Method = 3
		Keybind = "F"
		ShowMethodDictionary = true
	end
})

--[] Seperator
local Section = ServerTab:AddSection({
	Name = "Essentials [1]"
})
--[] Seperator

ServerTab:AddButton({
	Name = "Server Stat Icons",
	Callback = function()
		local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
		module:Teleport(game.PlaceId)
	end
})

ServerTab:AddButton({
	Name = "Server HOP",
	Callback = function()
		local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
		module:Teleport(game.PlaceId)
	end
})

ServerTab:AddButton({
	Name = "Server Auto Rejoin",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/9fYwjt6n"))()
	end
})

ServerTab:AddButton({
	Name = "Server Rejoin",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
	end
})

ServerTab:AddButton({
	Name = "Server Kick",
	Callback = function()
		game:GetService("Players").LocalPlayer:Kick("Kicked by Krypton")
	end
})

ServerTab:AddButton({
	Name = "Server Join Smallest Server",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/QQMDVUHL"))() 
	end
})

--[] Seperator
local Section = ServerTab:AddSection({
	Name = "Essentials [2]"
})
--[] Seperator

ServerTab:AddButton({
	Name = "Anti AFK V1",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))()
	end
})

ServerTab:AddButton({
	Name = "Anti Kick",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/gsxvWvnj"))()
	end
})

--[] Krypton | Admin

--[] Seperator
local Section = AdminTab:AddSection({
	Name = "Total : 13"
})
--[] Seperator

local AdminTimeLabel = AdminTab:AddLabel("Current Time and Date")

AdminTab:AddParagraph("NOTE","Found a admin script? tell us about it on our discord!")

--[] Seperator
local Section = AdminTab:AddSection({
	Name = "Admin"
})
--[] Seperator

AdminTab:AddButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet("https://cdn.wearedevs.net/script/Infinite%20Yield.txt"))()
	end    
})

AdminTab:AddButton({
	Name = "Infinite Yield Secure",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/ionlyusegithubformcmods/1-Line-Scripts/raw/main/Infinite%20Yield%20but%20with%20secure%20dex"))()
	end    
})


AdminTab:AddButton({
	Name = "Fate's Admin",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
	end    
})

AdminTab:AddButton({
	Name = "CMD-X",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
	end    
})

AdminTab:AddButton({
	Name = "Nameless",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
	end    
})

AdminTab:AddButton({
	Name = "Proton",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/HuT90Wbu"))()
	end    
})

AdminTab:AddButton({
	Name = "Reviz",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/ibFPdiF7'))()
	end    
})

AdminTab:AddButton({
	Name = "Shattervast",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/iL4NRDux'))()
	end    
})

AdminTab:AddButton({
	Name = "Homebrew",
	Callback = function()
		_G.CustomUI = false
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/mgamingpro/HomebrewAdmin/master/Main'), true))()
	end    
})

AdminTab:AddButton({
	Name = "Homebrew Custom UI",
	Callback = function()
		_G.CustomUI = true
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/mgamingpro/HomebrewAdmin/master/Main'), true))()
	end    
})

AdminTab:AddButton({
	Name = "QuirkyCMD",
	Callback = function()
    loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
	end    
})

--[] Seperator
local Section = AdminTab:AddSection({
	Name = "Chat Admin"
})
--[] Seperator

AdminTab:AddButton({
	Name = "Simple Chat Admin !",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Ta153Q07"))()
	end    
})

AdminTab:AddButton({
	Name = "Simple Chat Admin .",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Dn5ihVgH"))()
	end    
})



--[] Krypton | Player

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Total : 46"
})
--[] Seperator

local PlayerTimeLabel = PlayerTab:AddLabel("Current Time and Date")

PlayerTab:AddParagraph("WARNING","Be carefull to not press anything that u dont want!")

PlayerTab:AddButton({
	Name = "Reset Player",
	Callback = function()
		forceResetAction()
	end    
})

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Player Tools"
})
--[] Seperator

PlayerTab:AddButton({
	Name = "TP Tool",
	Callback = function()
		mouse = game.Players.LocalPlayer:GetMouse()
		tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Tp Tool"
		tool.Activated:connect(function()
			local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
			pos = CFrame.new(pos.X, pos.Y, pos.Z)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		end)
		tool.Parent = game.Players.LocalPlayer.Backpack
	end
})

PlayerTab:AddButton({
	Name = "BTools",
	Callback = function()
		loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
	end    
})

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Character Scripts"
})
--[] Seperator

PlayerTab:AddButton({
	Name = "Anti-AFK",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))()
	end    
})

PlayerTab:AddButton({
	Name = "Fly V3",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/bHa6HDFc'))()
	end
})	

PlayerTab:AddButton({
	Name = "Shiftlock",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/CjNsnSDy'))()
	end
})

PlayerTab:AddButton({
	Name = "FullBright",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/xVrJdCn2"))
	end    
})

PlayerTab:AddButton({
	Name = "Hit-Box Expander",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/ajhFdr2Z'))()
	end
})	

PlayerTab:AddButton({
	Name = "X-ray",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/tweN2ysU"))()
	end
})	

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Teleport"
})
--[] Seperator

local playerNames = {}

for _, player in pairs(game.Players:GetPlayers()) do
    table.insert(playerNames, player.Name)
end

local selectedPlayerName = nil

local PlayerDropdown = PlayerTab:AddDropdown({
    Name = "Player Names",
    Default = playerNames[1] or "None",
    Options = playerNames,
    Callback = function(selectedName)
        selectedPlayerName = selectedName
    end    
})

local function updatePlayerNames()
    playerNames = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    PlayerDropdown:Refresh(playerNames, true)
end

game.Players.PlayerAdded:Connect(updatePlayerNames)
game.Players.PlayerRemoving:Connect(updatePlayerNames)

PlayerTab:AddButton({
    Name = "Teleport",
    Callback = function()
        if selectedPlayerName then
            local localPlayer = game.Players.LocalPlayer
            local targetPlayer = game.Players:FindFirstChild(selectedPlayerName)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                    print("Teleported to " .. selectedPlayerName)
                end
            end
        else
            print("No player selected for teleportation")
        end
    end    
})

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "ESP"
})
--[] Seperator

PlayerTab:AddButton({
	Name = "Lightnux ESP",
	Callback = function()
	  loadstring(game:HttpGet('https://raw.githubusercontent.com/cool83birdcarfly02six/UNIVERSALESPLTX/main/README.md'))()
  end
})

PlayerTab:AddButton({
	Name = "Unnamed ESP",
	Callback = function()
	  pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
  end
})

PlayerTab:AddButton({
	Name = "ESP Refresh",
	Callback = function()
	  _G.ESPVisible = true
    Esp()
    _G.ESPVisible = false
    Esp()
  end
})

PlayerTab:AddToggle({
	Name = "ESP Visible",
	Default = false,
	Callback = function(Value)
		if Value == true then
		  _G.ESPVisible = true
		  Esp()
		  else
		    _G.ESPVisible = false
		    Esp()
		end
	end    
})


--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Crosshair"
})
--[] Seperator

PlayerTab:AddButton({
	Name = "Refresh Crosshair",
	Callback = function()
		Crosshair()
	end    
})

PlayerTab:AddButton({
	Name = "Turn On Crosshair",
	Callback = function()
		_G.CrosshairVisible = true
		Crosshair()
	end    
})

PlayerTab:AddButton({
	Name = "Turn Off Crosshair",
	Callback = function()
		_G.CrosshairVisible = false
		Crosshair()
	end    
})

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Character Preset"
})
--[] Seperator

PlayerTab:AddButton({
	Name = "Reset Character",
	Callback = function()
		forceResetAction()
	end    
})

PlayerTab:AddButton({
	Name = "Super Human",
	Callback = function()
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 50
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 100
	end    
})

PlayerTab:AddButton({
	Name = "Super Human++",
	Callback = function()
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 100
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 200
	end    
})

PlayerTab:AddButton({
	Name = "Slow RocketShip",
	Callback = function()
		game.workspace.Gravity = 1
	end    
})

PlayerTab:AddButton({
	Name = "God",
	Callback = function()
		loadstring(game:HttpGet("https://freenote.biz/raw/Fhpx5r5A8M"))()
	end
})

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Character Settings"
})
--[] Seperator

local Noclipping = nil
PlayerTab:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(a)
		getgenv().looping = a
		task.spawn(function()
			while true do 
				if not getgenv().looping then
					for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == false then
							v.CanCollide = true
						end
					end
					break
				end
				task.wait()
				if getgenv().looping and game:GetService("Players").LocalPlayer.Character ~= nil then
					for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == true then
							v.CanCollide = false
						end
					end
				end
			end
		end)
	end
})

PlayerTab:AddToggle({
	Name = "Invisible",
	Default = false,
	Callback = function(Value)
    if Value == true then
      _G.InvisibleToggle = true
      loadstring(game:HttpGet("https://pastebin.com/raw/f7n6qjKu"))()
      else
        _G.InvisibleToggle = false
      end
	end    
})

PlayerTab:AddButton({
	Name = "Invisible PC",
	Callback = function()
		print("The keybind is E")
		loadstring(game:HttpGet("https://pastebin.com/raw/hk09qgd9"))()
		StarterGui:SetCore("DevConsoleVisible", true)
	end    
})

PlayerTab:AddButton({
	Name = "Refresh Invisible",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/f7n6qjKu"))()
	end    
})

local WalkSpeed = PlayerTab:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 1000,
	Default = 50,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "Walkspeed",
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

local JumpPower = PlayerTab:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 1000,
	Default = 50,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "Jump power",
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
	end 
})

local FOV = PlayerTab:AddSlider({
	Name = "FOV",
	Min = 70,
	Max = 1000,
	Default = 70,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "FOV",
	Callback = function(Value)
		game:GetService("Workspace").CurrentCamera.FieldOfView = Value
	end 
})

local Gravity = PlayerTab:AddSlider({
	Name = "Gravity",
	Min = 1,
	Max = 1000,
	Default = 192.2,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "FOV",
	Callback = function(Value)
		game.workspace.Gravity = Value
	end 
})

local HipHeight = PlayerTab:AddSlider({
	Name = "Hip Height",
	Min = 0,
	Max = 1000,
	Default = 0,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "HipHeight",
	Callback = function(Value) 
	  local Humanoid = game.Players.LocalPlayer.Character.Humanoid
    Humanoid.HipHeight = Value
	end 
})


PlayerTab:AddTextbox({
	Name = "Walkspeed",
	Default = "16",
	TextDisappear = false,
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end	  
})

PlayerTab:AddTextbox({
	Name = "Jump power",
	Default = "50",
	TextDisappear = false,
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
	end	  
})

PlayerTab:AddTextbox({
	Name = "FOV",
	Default = "70",
	TextDisappear = false,
	Callback = function(Value)
		game:GetService("Workspace").CurrentCamera.FieldOfView = Value
	end	  
})

PlayerTab:AddTextbox({
	Name = "Gravity",
	Default = "192.2",
	TextDisappear = false,
	Callback = function(Value)
		game.workspace.Gravity = Value
	end	  
})

PlayerTab:AddTextbox({
	Name = "Hip Height",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
		local Humanoid = game.Players.LocalPlayer.Character.Humanoid
    Humanoid.HipHeight = Value
	end	  
})

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Reset"
})
--[] Seperator


PlayerTab:AddButton({
	Name = "Reset Inventory",
	Callback = function()
		local gear = game.Players.LocalPlayer.Backpack:GetChildren()
    for i, child in ipairs(gear) do
      child:Destroy()
    end
	end    
})

PlayerTab:AddButton({
	Name = "Reset Character",
	Callback = function()
		forceResetAction()
	end    
})

PlayerTab:AddButton({
	Name = "Reset Walkspeed",
	Callback = function()
		WalkSpeed:Set(16)
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
	end    
})

PlayerTab:AddButton({
	Name = "Reset Jump Power",
	Callback = function()
		JumpPower:Set(50)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50
	end    
})

PlayerTab:AddButton({
	Name = "Reset FOV",
	Callback = function()
		FOV:Set(70)
		game:GetService("Workspace").CurrentCamera.FieldOfView = 70
	end    
})

PlayerTab:AddButton({
	Name = "Reset Gravity",
	Callback = function()
		Gravity:Set(192.2)
		game.workspace.Gravity = 192.2
	end    
})

PlayerTab:AddButton({
	Name = "Reset Hip Height",
	Callback = function()
		HipHeight:Set(0)
		game.workspace.Gravity = 0
	end    
})

PlayerTab:AddButton({
	Name = "Reset Character Settings",
	Callback = function()
		JumpPower:Set(50)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50
		WalkSpeed:Set(16)
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
		FOV:Set(70)
		game:GetService("Workspace").CurrentCamera.FieldOfView = 70
		Gravity:Set(192.2)
		game.workspace.Gravity = 192.2
		HipHeight:Set(0)
		local Humanoid = game.Players.LocalPlayer.Character.Humanoid
    Humanoid.HipHeight = 0
	end    
})

--[] Seperator
local Section = PlayerTab:AddSection({
	Name = "Misci"
})
--[] Seperator

PlayerTab:AddButton({
	Name = "Display Name Remover",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/XdAKeTym'))()
	end
})	

PlayerTab:AddButton({
	Name = "Push to talk [T]",
	Callback = function()
		loadstrin(game:HttpGet("https://pastebin.com/raw/XcZPe0Lj"))()
	end
})	


--[] Krypton | Debugging

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Total : 45"
})
--[] Seperator

local DebuggingTimeLabel = DebuggingTab:AddLabel("Current Time and Date")

DebuggingTab:AddParagraph("WARNING","These scripts are made for developers that make exploits. Executing these might get you kicked out or even banned of the game!")

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Executor UI's"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "Executer UI 1",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/Hu0XkvMg"))()
	end
})

DebuggingTab:AddButton({
	Name = "Executer UI 2",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/PzCjpXMC"))()
	end
})

DebuggingTab:AddButton({
	Name = "Executer UI 3",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/9nvwUAGr"))()
	end
})

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Executor"
})
--[] Seperator

DebuggingTab:AddTextbox({
	Name = "Executor",
	Default = "Paste your scripts here",
	TextDisappear = false,
	Callback = function(Value)
		ExecutorValue = Value
	end	  
})
DebuggingTab:AddButton({
	Name = "Execute",
	Callback = function()
		loadstring(ExecutorValue)()
	end
})

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Executor Testing"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "Open Console",
	Callback = function()
		game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
	end
})

DebuggingTab:AddButton({
	Name = "Executor LVL",
	Callback = function()
		printidentity()
	end
})

DebuggingTab:AddButton({
	Name = "Vulnerability Scanner",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/OfficialValkyrie/Vulnerability-Check/main/Executor%20Vulnerability%20Check"))()
	end
})

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "UNC Test's"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "UNC Test 1",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/main/UNCCheckEnv.lua"))()
	end
})

DebuggingTab:AddButton({
	Name = "UNC Test 2",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/tests/main/UNC%20no%20luau.lua"))()
	end
})

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Anti-Cheat Bypass"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "AC Bypasser+ [ANTICHEAT]",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Xen8054/AntiCheatBypassPLUS/main/Script"))();
	end
})

DebuggingTab:AddButton({
	Name = "Adonis Bypasser [ANTICHEAT]",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/GZRt3WgA"))()
	end
})

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Essentials"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "Auto Clicker",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JustEzpi/ROBLOX-Scripts/main/ROBLOX_AutoClicker"))()
	end
})	

DebuggingTab:AddButton({
	Name = "Coords Finder V2",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/FSy9bHnW"))()
	end
})	

DebuggingTab:AddButton({
	Name = "Http Spy",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-httpspy-8197"))()
	end
})	

DebuggingTab:AddButton({
	Name = "Anti Webhook",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/C4ntmknq"))()
	end
})	

DebuggingTab:AddButton({
	Name = "GUI Stealer",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-GuiStealer-12751"))()
	end
})	

DebuggingTab:AddButton({
	Name = "Keyboard",
	Callback = function()
		loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-MobileKeyboard-8101"))()
	end
})	

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Admin"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet("https://cdn.wearedevs.net/script/Infinite%20Yield.txt"))()
	end    
})

DebuggingTab:AddButton({
	Name = "Infinite Yield Secure",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/ionlyusegithubformcmods/1-Line-Scripts/raw/main/Infinite%20Yield%20but%20with%20secure%20dex"))()
	end    
})


DebuggingTab:AddButton({
	Name = "Fate's Admin",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
	end    
})

DebuggingTab:AddButton({
	Name = "CMD-X",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
	end    
})

DebuggingTab:AddButton({
	Name = "Nameless",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
	end    
})

DebuggingTab:AddButton({
	Name = "Proton",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/HuT90Wbu"))()
	end    
})

DebuggingTab:AddButton({
	Name = "Reviz",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/ibFPdiF7'))()
	end    
})

DebuggingTab:AddButton({
	Name = "Shattervast",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/iL4NRDux'))()
	end    
})

DebuggingTab:AddButton({
	Name = "Homebrew",
	Callback = function()
		_G.CustomUI = false
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/mgamingpro/HomebrewAdmin/master/Main'), true))()
	end    
})

DebuggingTab:AddButton({
	Name = "Homebrew Custom UI",
	Callback = function()
		_G.CustomUI = true
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/mgamingpro/HomebrewAdmin/master/Main'), true))()
	end    
})

DebuggingTab:AddButton({
	Name = "QuirkyCMD",
	Callback = function()
    loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
	end    
})

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Experimental"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "Lag Reducer",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/RW7ZT29m'))()
	end
})

DebuggingTab:AddButton({
	Name = "FPS Counter",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Sempiller/sdluniversal/main/fpsviewer.lua"))()
	end
})

DebuggingTab:AddButton({
	Name = "FPS+",
	Callback = function()
		loadstring(game:HttpGet("https://fpsplus.000webhostapp.com/OBFUSCATED_SOURCE_FPSPLUS.lua", true))()
	end
})	

DebuggingTab:AddTextbox({
	Name = "FPS Cap Changer",
	Default = "60",
	TextDisappear = false,
	Callback = function(Value)
		setfpscap(Value)
	end	  
})

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Dex's"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "Dark Dex V1",
	Callback = function()
		loadstring(game:GetObjects("rbxassetid://3025032531")[1].Source)()
	end
})	

DebuggingTab:AddButton({
	Name = "Dark Dex V2",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceSpiffer/Scripts/main/Script4", true))()
	end
})	

DebuggingTab:AddButton({
	Name = "Dark Dex V3",
	Callback = function()
		loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
	end
})	

DebuggingTab:AddButton({
	Name = "Dark Dex V4",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SpaceSpiffer/Scripts/main/Script5", true))()
	end
})

DebuggingTab:AddButton({
	Name = "Dark Dex V4 [MOBILE]",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/Hosvile/DEX-Explorer/releases/latest/download/main.lua", true))()
	end
})	

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Remote SPY"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "SimpleSPY V3",
	Callback = function()
		loadstring(game:HttpGet('loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()'))()
	end
})

DebuggingTab:AddButton({
	Name = "SimpleSPY V2.2",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua'))()
	end
})

DebuggingTab:AddButton({
	Name = "TurtleSPY",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Spy/main/source.lua", true))()
	end
})	

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Game Vulnerability"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "Deconstructed Hex",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/S28p8fN9"))()
  end
})

DebuggingTab:AddButton({
	Name = "Harked GUI",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Legenda06/Harked/main/GUI"))()
  end
})

DebuggingTab:AddParagraph("Game Teleporter","Teleport to the game with a vulnerability!")

local GameList = {
    ["BT-Drive-BETA"] = 10592754185,
    ["Car-Crash-Test"] = 4643061038,
    ["Car Crash Test"] = 7720943627,
    ["Car-Crashing-Simulator"] = 7217128574,
    ["Car-Suspension-Test"] = 6816975827,
    ["CrashBG-drive"] = 7283842182,
    ["Crush-Hard"] = 10927225814,
    ["Luigis-Cafe-Restaurant"] = 4829955709,
    ["Ramp-Jumping-On-sports-cars"] = 9043532917,
    ["Ro-Crash"] = 4456880028,
    ["TRAFFIC-Road-of-Car-Crash"] = 3239849876,
    ["UPDATE-Realistic-Car-Crash-Simulator"] = 7764872557,
    ["Z-Bus"] = 5752297721,
    ["Social-Hangout-VOICE-CHAT"] = 5551771360
}

local GameNames = {}
for name, _ in pairs(GameList) do
	table.insert(GameNames, name)
end

local SelectedGame = nil

DebuggingTab:AddDropdown({
	Name = "Select Game",
	Default = "Select a game",
	Options = GameNames,
	Callback = function(Value)
		SelectedGame = GameList[Value]
	end
})

DebuggingTab:AddButton({
	Name = "Teleport",
	Callback = function()
		if SelectedGame then
			game:GetService("TeleportService"):Teleport(SelectedGame, game:GetService("Players").LocalPlayer)
		else
			print("No game selected")
		end
	end
})

--[] Seperator
local Section = DebuggingTab:AddSection({
	Name = "Game Scanning"
})
--[] Seperator

DebuggingTab:AddButton({
	Name = "Backdoor Scanner & [EXECUTOR] 1",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/L1ghtingBolt/FraktureSS/master/source.lua', true))()
	end
})	

DebuggingTab:AddButton({
	Name = "Backdoor Scanner & [EXECUTOR] 2",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/main.lua"))();
	end
})

DebuggingTab:AddButton({
	Name = "Backdoor Scanner & [EXECUTOR] 3",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
	end
})

--[] Krypton | Settings

--[] Seperator

local Section = SettingsTab:AddSection({
	Name = "Total : 14 Settings"
})
--[] Seperator

SettingsTab:AddParagraph("WARNING","Changing these might require you to rejoin your game if you dont know what youre doing!")

SettingsTab:AddButton({
	Name = "End Krypton",
	Callback = function()
		OrionLib:Destroy()
	end    
})

SettingsTab:AddButton({
	Name = "Reload Krypton",
	Callback = function()
		print("Krypton Reloaded Succesfully")
		loadstring(game:HttpGet(""))
		OrionLib:Destroy()
	end    
})

--[] Seperator
local Section = SettingsTab:AddSection({
	Name = "ESP"
})
--[] Seperator
SettingsTab:AddButton({
	Name = "ESP Refresh",
	Callback = function()
	  _G.ESPVisible = true
    Esp()
    _G.ESPVisible = false
    Esp()
  end
})

SettingsTab:AddToggle({
	Name = "ESP Visible",
	Default = false,
	Callback = function(Value)
		if Value == true then
		  _G.ESPVisible = true
		  Esp()
		  else
		    _G.ESPVisible = false
		    Esp()
		end
	end    
})

SettingsTab:AddToggle({
	Name = "Team Check",
	Default = false,
	Callback = function(Value)
		if Value == true then
		  _G.TeamCheck = true
		  Esp()
		  else
		    _G.TeamCheck = false
		    Esp()
		end
	end    
})

SettingsTab:AddToggle({
	Name = "Center",
	Default = true,
	Callback = function(Value)
		if Value == true then
		  _G.Center = true
		  Esp()
		  else
		    _G.Center = false
		    Esp()
		end
	end    
})

SettingsTab:AddToggle({
	Name = "Outline",
	Default = true,
	Callback = function(Value)
		if Value == true then
		  _G.Outline = true
		  Esp()
		  else
		    _G.Outline = false
		    Esp()
		end
	end    
})


SettingsTab:AddTextbox({
	Name = "Text Size",
	Default = "25",
	TextDisappear = false,
	Callback = function(Value)
	  _G.TextSize = Value
	end	  
})

SettingsTab:AddTextbox({
	Name = "Text Transparency",
	Default = "1.7",
	TextDisappear = false,
	Callback = function(Value)
		_G.TextTransparency = Value
	end	  
})

--[] Seperator
local Section = SettingsTab:AddSection({
	Name = "ChatGPT"
})
--[] Seperator

SettingsTab:AddTextbox({
	Name = "ChatGPT API Key",
	Default = "Enter your own api key",
	TextDisappear = false,
	Callback = function(Value)
		apiKey = Value
	end	  
})

SettingsTab:AddTextbox({
	Name = "ChatGPT API Url",
	Default = "https://api.openai.com/v1/chat/completions",
	TextDisappear = false,
	Callback = function(Value)
		apiUrl = Value
	end	  
})

SettingsTab:AddTextbox({
	Name = "ChatGPT Proxy URL",
	Default = "Enter your proxy url",
	TextDisappear = true,
	Callback = function(Value)
		ProxyUrl = Value
	end	  
})

SettingsTab:AddButton({
	Name = "ChatGPT Proxy Code",
	Callback = function()
		setclipboard("non")
	end    
})

--[] Krypton | Info

InfoTab:AddParagraph("Krypton VER", KryptonVersion)

--[] Seperator
local Section = InfoTab:AddSection({
	Name = "Information"
})
--[] Seperator

InfoTab:AddParagraph("Krypton", "Krypton, a non opensource hub")

InfoTab:AddParagraph("Script", "Scripts within Krypton is all internet found.")

InfoTab:AddParagraph("Bypasser", "Bypasser is using Bypassi API currently the best free API")

--[] Seperator
local Section = InfoTab:AddSection({
	Name = "Developers"
})
--[] Seperator

InfoTab:AddParagraph("Krypton / REN", "Founder")

InfoTab:AddParagraph("Jazmine", "Founder of Skyhub, Helped with 50% of everything [:")

--[] Seperator
local Section = InfoTab:AddSection({
	Name = "Development Testers"
})
--[] Seperator

InfoTab:AddParagraph("Eryxie", "First tester of Krypton")

InfoTab:AddParagraph("Jazmine", "Second tester of Krypton")

InfoTab:AddParagraph("Testaccount", "Third tester of Krypton")

InfoTab:AddParagraph("Missing Name?", "Be a tester right now!")

--[] Seperator
local Section = InfoTab:AddSection({
	Name = "Social"
})
--[] Seperator

InfoTab:AddButton({
	Name = "Github",
	Callback = function()
		setclipboard("Not yet Implemented")
	end
})

InfoTab:AddButton({
	Name = "Discord",
	Callback = function()
		setclipboard("Not yet Implemented")
	end
})

InfoTab:AddButton({
	Name = "Youtube",
	Callback = function()
		setclipboard("Not yet Implemented")
	end
})

--[] Seperator
local Section = InfoTab:AddSection({
	Name = "Information"
})

InfoTab:AddParagraph("GameVuln Found", VulnGame)

InfoTab:AddParagraph("Hardware ID", HWID)

InfoTab:AddParagraph("Roblox Username", PLAYERNAME)

InfoTab:AddParagraph("Roblox ID", ID)

InfoTab:AddParagraph("MembershipType", MembershipType)

InfoTab:AddParagraph("Account Age", AccountAge)

InfoTab:AddParagraph("Game ID", GameID)

--[] Seperator
local Section = InfoTab:AddSection({
	Name = "Copy"
})
--[] Seperator

InfoTab:AddButton({
	Name = "Copy your HWID",
	Callback = function()
		setclipboard(HWID)
	end
})

InfoTab:AddButton({
	Name = "Copy your Username",
	Callback = function()
		setclipboard(PLAYERNAME)
	end
})

InfoTab:AddButton({
	Name = "Copy your ID",
	Callback = function()
		setclipboard(ID)
	end
})

InfoTab:AddButton({
	Name = "Copy your MembershipType",
	Callback = function()
		setclipboard(MembershipType)
	end
})

InfoTab:AddButton({
	Name = "Copy your Account Age",
	Callback = function()
		setclipboard(AccountAge)
	end
})

InfoTab:AddButton({
	Name = "Copy Game ID",
	Callback = function()
		setclipboard(GameID)
	end
})

--[] Seperator
local Section = InfoTab:AddSection({
	Name = "Copy Other Players"
})
--[] Seperator

local Players = game:GetService("Players")
local SelectedPlayer = "Krypton"
local SelectedPlayerUserName = ""
local SelectedPlayerDisplayName = ""
local SelectedPlayerUserId = ""
local SelectedPlayerAccountAge = 0

local function getPlayerInfo(playerName)
    local player = Players:FindFirstChild(playerName)
    if player then
        SelectedPlayerUserName = playerName
        SelectedPlayerDisplayName = player.DisplayName
        SelectedPlayerUserId = player.UserId
        SelectedPlayerAccountAge = player.AccountAge
    else
        print("Player not found")
        SelectedPlayerUserName = ""
        SelectedPlayerDisplayName = ""
        SelectedPlayerUserId = ""
        SelectedPlayerAccountAge = 0
    end
end

local SelectedPlayerLabel = InfoTab:AddLabel("Non selected")

local function UpdatePlayerDropdown()
    playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    PlayerDropdown:Refresh(playerNames,true)
end

local function ScrollDropdown(direction)
    local currentIndex = table.find(playerNames, SelectedPlayer)
    if currentIndex then
        local newIndex = currentIndex + direction
        if newIndex >= 1 and newIndex <= #playerNames then
            SelectedPlayer = playerNames[newIndex]
            PlayerDropdown:Set(SelectedPlayer)
            SelectedPlayerLabel:Set(SelectedPlayer)
            GetSelectedPlayerInfo()  -- Update player info
        end
    end
end

function GetSelectedPlayerInfo()
    getPlayerInfo(SelectedPlayer)
    UpdatePlayerDropdown()
end

local PlayerDropdown = InfoTab:AddDropdown({
    Name = "Player Names",
    Default = playerNames[1] or SelectedPlayer,
    Options = playerNames,
    Callback = function(Selected)
        SelectedPlayerLabel:Set(Selected)
        SelectedPlayer = Selected
        GetSelectedPlayerInfo()
    end
})

InfoTab:AddButton({
    Name = "Scroll Up",
    Callback = function()
        ScrollDropdown(-1)  -- Scroll up
    end
})

InfoTab:AddButton({
    Name = "Scroll Down",
    Callback = function()
        ScrollDropdown(1)  -- Scroll down
    end
})

InfoTab:AddButton({
    Name = "Copy Username",
    Callback = function()
        setclipboard(SelectedPlayerUserName)
    end
})

InfoTab:AddButton({
    Name = "Copy Display Name",
    Callback = function()
        setclipboard(SelectedPlayerDisplayName)
    end
})

InfoTab:AddButton({
    Name = "Copy Userid",
    Callback = function()
        setclipboard(tostring(SelectedPlayerUserId))
    end
})

InfoTab:AddButton({
    Name = "Copy Accountage",
    Callback = function()
        setclipboard(tostring(SelectedPlayerAccountAge))
    end
})

UpdatePlayerDropdown()
GetSelectedPlayerInfo()

--[] Krypton | Suggestions

local TimeLabel = MiscTab:AddLabel("Current Time and Date")

--[] Seperator
local Section = MiscTab:AddSection({
	Name = "P Shade"
})
--[] Seperator

MiscTab:AddDropdown({
	Name = "P Shade Options",
	Default = "Midday lite",
	Options = {
	  "Morning", 
	  "Midday", 
	  "Afternoon", 
	  "Evening",
	  "Night",
	  "Midnight",
	  "Morning lite", 
	  "Midday lite", 
	  "Afternoon lite", 
	  "Evening lite",
	  "Night lite",
	  "Midnight lite"
	},
	Callback = function(Value)
		getgenv().RTX_Name = Value
	end    
})

MiscTab:AddButton({
	Name = "Load P Shade",
	Callback = function()
	  loadstring(game:HttpGet('https://pastefy.app/xXkUxA0P/raw', true))()
  end    
})

--[] Seperator
local Section = MiscTab:AddSection({
	Name = "Shaders"
})
--[] Seperator

MiscTab:AddButton({
	Name = "Zaptosis Shader",
	Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/6ubafXBz'))()
  end    
})

--[] Seperator
local Section = MiscTab:AddSection({
	Name = "Game Teleporter"
})
--[] Seperator
local games = {
	["3008"] = 2768379856,
	["Adopt and Raise a Baby"] = 383793228,
	["Adopt Me!"] = 920587237,
	["Arsenal"] = 286090429,
	["Bedwars"] = 6872265039,
	["BIG Paintball!"] = 3527629287,
	["BIG Paintball 2!"] = 9865958871,
	["Blade Ball"] = 13772394625,
	["Blox Fruits"] = 2753915549,
	["Bloxburg"] = 185655149,
	["Brookhaven RP"] = 4924922222,
	["Build A Boat For Treasure"] = 537413528,
	["CHAOS"] = 6441847031,
	["Colony Survival"] = 14888386963,
	["Counter Blox"] = 301549746,
	["Cursed Sea"] = 14426444782,
	["Da Hood"] = 2788229376,
	["Doors"] = 6516141723,
	["Fencing"] = 12109643,
	["Gorilla Tag Professional"] = 8690998110,
	["Guess the drawing!"] = 3281073759,
	["Hide and Seek Extreme"] = 205224386,
	["Infectious Smile"] = 5985232436,
	["Jailbreak"] = 606849621,
	["Murder Mystery 2"] = 142823291,
	["Natural Disaster Survival"] = 189707,
	["Nico's Nextbots"] = 10118559731,
	["Plates of Fate Remastered"] = 864984217,
	["Redwood Prison"] = 919623646,
	["Royal High"] = 735030788,
	["Skywars"] = 855499080,
	["Slap Battles"] = 6403373529,
	["Spray Paint"] = 9456350429,
	["The Day Before The Dawn"] = 6985184673,
	["TOH"] = 1962086868,
	["Undertale Crazy Multiverse Timeline"] = 9846910264,
	["Untitled Tag Game"] = 11763012139,
	["Vampire Hunters 3"] = 3550586365,
	["Work at a Pizza Place"] = 192800,
	["Your Bizarre Adventure"] = 2809202155
}

local gameNames = {}
for name, _ in pairs(games) do
	table.insert(gameNames, name)
end

local selectedGame = nil

MiscTab:AddDropdown({
	Name = "Select Game",
	Default = "Select a game",
	Options = gameNames,
	Callback = function(Value)
		selectedGame = games[Value]
	end
})

MiscTab:AddButton({
	Name = "Teleport",
	Callback = function()
		if selectedGame then
			game:GetService("TeleportService"):Teleport(selectedGame, game:GetService("Players").LocalPlayer)
		else
			print("No game selected")
		end
	end
})

--[] Seperator
local Section = MiscTab:AddSection({
	Name = "Load's"
})
--[] Seperator

MiscTab:AddParagraph("Suggestion UI", "DISCLAIMER : When suggestion UI is loaded we will log your ip for secruity purposes.")

MiscTab:AddButton({
	Name = "Load Suggestion Ui",
	Callback = function()
		loadstring(game:HttpGet('https://github.com/RENBex6969/OfficialKrypton/raw/main/Suggestion.lua'))()
		IPLogger()
	end
})

MiscTab:AddButton({
	Name = "Load Toggle Ui",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/qyFBKExn"))()
	end
})

MiscTab:AddButton({
	Name = "Load Changelogs Ui",
	Callback = function()
		loadstring(game:HttpGet(""))()
	end
})

--[] Seperator
local Section = MiscTab:AddSection({
	Name = "Bypass Links"
})
--[] Seperator

MiscTab:AddParagraph("Supported Key System Links", "Fluxus Key,  Delta Key, Hydrogen Key, VegaX Key, Bananahub Key, Every Key system that is platoboost,")
MiscTab:AddParagraph("Supported Ad-links", "Linkvertise")

MiscTab:AddTextbox({
	Name = "Place what you wanna bypass",
	Default = "Place your link here",
	TextDisappear = true,
	Callback = function(Value)
		UserInput = Value
	end	  
})

MiscTab:AddButton({
	Name = "Bypass",
	Callback = function()
		if userInput == "" then
			warn("Enter Valid Link")
		end
		fetchAndParse(url)
		PrintResultBypass()
	end    
})

--[] Seperator
local Section = MiscTab:AddSection({
	Name = "ChatGPT"
})
--[] Seperator

local ChatGPTParagraph = MiscTab:AddParagraph("ChatGPT 3.5", "")

MiscTab:AddTextbox({
	Name = "ChatGPT TextInput",
	Default = "Hello World",
	TextDisappear = true,
	Callback = function(message)
		local chatGPTResponse
		if ProxyUrl and ProxyUrl ~= "" then
			chatGPTResponse = getChatGPTResponseViaProxy(message, ProxyUrl)
		else
			chatGPTResponse = getChatGPTResponseDirect(message)
		end
		print("ChatGPT: " .. chatGPTResponse)
		ChatGPTParagraph:Set("ChatGPT", chatGPTResponse)
	end	  
})

--[] Agruments
OrionLib:Init()

--[] clock
local function updateDateTimeLabel()
    local currentTime = os.time()
    local formattedTime = os.date("%I:%M:%S %p - %d - %B - %Y", currentTime)
    AnimationTimeLabel:Set(formattedTime)
    UniversalTimeLabel:Set(formattedTime)
    TrollTimeLabel:Set(formattedTime)
    ServerTimeLabel:Set(formattedTime)
    AdminTimeLabel:Set(formattedTime)
    PlayerTimeLabel:Set(formattedTime)
    DebuggingTimeLabel:Set(formattedTime)
    MiscTimeLabel:Set(formattedTime)
end

while true do
    updateDateTimeLabel()
    wait(1)
end

--[] Protection Function
function Protection()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/Anti%20GUI%20Detection.lua"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/Anti%20Instance%20Detector.lua"))()
end
Protection()
