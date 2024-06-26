LatestVersion = "a3.4"
LatestVersionURL = "https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.4/Source.lua"

function KryptonBoot()
  if _G.KryptonVersion == LatestVersion then
    warn("Using version :" .. _G.KryptonVersion)
    loadstring(game:HttpGet(LatestVersionURL))()
  elseif _G.KryptonVersion == "a3.3" then
    warn("Using version :" .. _G.KryptonVersion)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.3/Source.lua'))()
  elseif _G.KryptonVersion == "a3.2" then
    warn("Using version :" .. _G.KryptonVersion)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.2/source.lua'))()
  elseif _G.KryptonVersion == "a3.0" then
    warn("Using version :" .. _G.KryptonVersion)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.0/source.lua'))()
  elseif _G.KryptonVersion == "a2.5" then
    warn("Using version :" .. _G.KryptonVersion)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a2.5/source.lua'))()
  elseif _G.KryptonVersion == "a2.0" then
    warn("Using version :" .. _G.KryptonVersion)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a2.0/Source.lua'))()
  end
end

function LicenseCheck()
  if _G.License == true then
    KryptonVersionCheck()
  end
end

function KryptonVersionCheck()
  if not _G.KryptonVersionCheck then
    warn("Krypton is missing it's KryptonVersion variable add it back!")
    print("defaulting to latest version")
    loadstring(game:HttpGet(LatestVersionURL))()
  else
    KryptonBoot()
  end
end

if not _G.License then
  print("Using version : " .. _G.KryptonVersion)
  warn("Krypton is missing it's license variable add it back!")
  else
    LicenseCheck()
end
