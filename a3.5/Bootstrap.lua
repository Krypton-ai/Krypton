BootableURL = "https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.5/Krypton-a3.5.lua"

if _G.KryptonIsLoaded == true then
  warn("Krypton is alreadly loaded!")
  else
    loadstring(game:HttpGet(BootableURL))()
end

_G.KryptonIsLoaded = true
