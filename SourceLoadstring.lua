-- Define constants for the latest bootable URL and the latest Krypton version
LatestBootableURL = "https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.3/Source.lua"
LatestKryptonVersion = "a3.3"

-- Function to rewind Krypton to a specified version
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

-- Check if the license is not accepted
if not _G.License then
    error("Please add back _G.License and accept our license!")
end

-- Function to boot the latest version of Krypton
function KryptonBoot()
    if not _G.RewindKrypton then
        loadstring(game:HttpGet(LatestBootableURL))()
    end
end

-- Boot Krypton if the license is accepted
if _G.License == true then
    KryptonBoot()
end

-- Rewind Krypton if the toggle and license are true
if _G.RewindToggle == true and _G.License == true then
    RewindKrypton()
end

-- Default to booting the latest version if RewindToggle is not provided
if _G.RewindToggle == nil and _G.License == true then
    KryptonBoot()
end
