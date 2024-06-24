BootableURL = "https://github.com/Krypton-ai/Krypton/raw/main/a3.0/source.lua"
local KryptonVersion = "a3.0"
local HWIDTableUrl = 'https://pastebin.com/raw/4D5tWizi'
local BannedHWIDTable = loadstring(game:HttpGet(HWIDTableUrl))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

--[] Banned Check HWID
function BannedHWIDCheck()
  for i,v in pairs(BannedHWIDTable) do
  if v == HWID then
    warn("Krypton Stopped, Reason : You are banned from using Krypton")
    warn("Krypton Crashed, Reason : Banned!")
    game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
    while true do end
  end
 end
end

--[] Version Loader
if _G.RewindKrypton == KryptonVersion then
    warn("No need to rewind Krypton is already using the latest version")
    game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
elseif _G.RewindKrypton == "a2.5" then
    loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a2.5/source.lua"))()
elseif _G.RewindKrypton == "a2.0" then
    loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a2.0/Source.lua"))()
else
    warn("Invalid Krypton version")
    game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
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
if not _G.License then
    error("The license variable is missing!")
    warn("Add it back by adding _G.License = true")
    warn("Krypton Version " .. KryptonVersion)
    game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
end

if _G.License == false then
  error("Please accept our license")
  warn("Krypton Version " .. KryptonVersion)
  game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
  while true do end
else
  BootKrypton()
end
