BootableURL = "https://github.com/Krypton-ai/Krypton/raw/main/a3.3/source.lua"
KryptonVersion = "a3.3"

--[] RewindKrypton
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

--[] Krypton Boot
function KryptonBoot()
    if not _G.RewindKrypton then
        loadstring(game:HttpGet(BootableURL))()
    else
        warn("Using RewindKrypton")
        game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
    end
end

--[] License Check
if _G.License == false then
  error("Please accept our license")
  warn("Krypton Version " .. KryptonVersion)
  game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
  while true do end
else
  KryptonBoot()
end

--[] License Variable
if not _G.License then
    error("The license variable is missing!")
    warn("Add it back by adding _G.License = true")
    warn("Krypton Version " .. KryptonVersion)
    game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
end

--[] Version Loader
if _G.RewindToggle == true then
  rewindKrypton()
end
