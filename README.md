# example
```lua
local loader = loadstring(game:HttpGet('https://raw.githubusercontent.com/loglizzy/module-loader/main/main.lua'))()

local modules = loader('shitty gui loader')({
    UILibrary = 'https://some.shitty.library',
    Modules = 'https://hardick.gov',
    BypassingAntiExploit = function()
        game = true
    end
})

UILibrary:CreateShitGui()
Modules.Aimbot.Start()
```
