BootableURL = "https://github.com/Krypton-ai/Krypton/raw/main/a2.5/source.lua"
local KryptonVersion = "a2.5"

if _G.License == false then
  error("Please accept our license")
  warn("Krypton Version " .. KryptonVersion)
  game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
  task.wait(1)
  while true do end
else
  loadstring(game:HttpGet(BootableURL))()
end
