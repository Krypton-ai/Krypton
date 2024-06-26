if not _G.License then
  warn("Krypton is missing it's License variable add it back!")
else
  if _G.License == true then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Krypton-ai/Krypton/main/a3.4/Source.lua'))()
  end
end
