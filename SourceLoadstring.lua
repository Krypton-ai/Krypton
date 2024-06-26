BootableURL = "https://github.com/Krypton-ai/Krypton/raw/main/a3.3/source.lua"
KryptonVersion = "a3.3"
local HWIDTableUrl = 'https://pastebin.com/raw/4D5tWizi'
local BannedHWIDTable = loadstring(game:HttpGet(HWIDTableUrl))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

--[] Banned Check HWID
function BannedHWIDCheck()
	for i, v in pairs(BannedHWIDTable) do
		if v == HWID then
			warn("Krypton Stopped, Reason : You are banned from using Krypton")
			warn("Krypton Crashed, Reason : Banned!")
			game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
			while true do
			end
		end
	end
end


function rewindKrypton()
	if _G.RewindKrypton == KryptonVersion then
		warn("No need to rewind Krypton is already using the latest version")
		game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
	elseif _G.RewindKrypton == "a2.5" then
		loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a2.5/source.lua"))()
	elseif _G.RewindKrypton == "a2.0" then
		loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a2.0/Source.lua"))()
	elseif _G.RewindKrypton == "a3.0" then
		loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a3.0/Source.lua"))()
	elseif _G.RewindKrypton == "a3.2" then
		loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a3.2/source.lua"))()
	elseif _G.RewindKrypton == "a3.3" then
		loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a3.3/Source.lua"))()
	else
		warn("Invalid Krypton version")
		game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
	end
end

--[] Version Loader
if _G.RewindToggle == true then
	rewindKrypton()
end

--[] Krypton Boot
function KryptonBoot()
	if not _G.RewindKrypton then
		loadstring(game:HttpGet(BootableURL))()
	else
		warn("Using RewindKrypton")
		game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
	end
end

--[] License
if _G.License == false then
	warn("Please accept our license")
	warn("Krypton Version " .. KryptonVersion)
	game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
	while true do
	end
else
	KryptonBoot()
end

if not _G.License then
	warn("The license variable is missing!")
	warn("Add it back by adding _G.License = true")
	warn("Krypton Version " .. KryptonVersion)
	game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
end
