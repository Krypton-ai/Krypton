BootableURL = "https://github.com/Krypton-ai/Krypton/raw/main/a2.5/source.lua"
local KryptonVersion = "a2.5"

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
