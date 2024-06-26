LatestBootableURL = "https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.3/Source.lua"
LatestKryptonVersion = "a3.3"

function RewindKrypton()
    if _G.RewindKrypton == "a3.3" then
        warn("No need to rewind, Krypton is already using the latest version!")
    elseif _G.RewindKrypton == "a2.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a2.0/Source.lua"))()
    elseif _G.RewindKrypton == "a2.5" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a2.5/source.lua"))()
    elseif _G.RewindKrypton == "a3.0" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.0/source.lua"))()
    elseif _G.RewindKrypton == "a3.2" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.2/source.lua"))()
    else
        warn("Invalid Krypton Version!")
        game:GetService('StarterGui'):SetCore("DevConsoleVisible", true)
    end
end

if not _G.License then
    error("Please add back _G.License and accept our license!")
end

function KryptonBoot()
    if not _G.RewindKrypton then
        loadstring(game:HttpGet(LatestBootableURL))()
    end
end

if _G.License == true then
    KryptonBoot()
end

if _G.RewindToggle == true and _G.License == true then
    RewindKrypton()
end

if _G.RewindToggle == nil and _G.License == true then
    KryptonBoot()
end
