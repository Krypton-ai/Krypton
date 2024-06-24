BootableURL = "https://github.com/Krypton-ai/Krypton/raw/main/a3.0/source.lua"
local KryptonVersion = "a3.0"

--[] Version Loader
if _G.RewindKrypton == KryptonVersion then
    warn("No need to rewind Krypton is already using the latest version")
    game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
elseif _G.RewindKrypton == "a2.5" then
    loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a2.5/source.lua"))()
elseif _G.RewindKrypton == "a2.0" then
    loadstring(game:HttpGet("https://github.com/Krypton-ai/Krypton/raw/main/a2.0/source.lua"))()
else
    warn("Invalid Krypton version")
    game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
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
  loadstring(game:HttpGet(BootableURL))()
end
