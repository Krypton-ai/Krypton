BootableURL = "https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a4.0/Source.lua"
LatestVersion = "a4.0"

if not _G.License then
    warn("Krypton current latest version is " .. LatestVersion)
    warn("Please add _G.License and accept our License!")
else
    if _G.License == true then
        loadstring(game:HttpGet(BootableURL))()
    end
end
