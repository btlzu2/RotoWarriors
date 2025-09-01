-- main.lua
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd  <const> = playdate
local gfx <const> = playdate.graphics

import "src/scene_manager"
import "src/scenes/Game"     -- your existing game, refactored into a scene

-- Start directly in the game scene (no menu yet)
SceneManager:switch(GameScene)

function pd.update()
  pd.timer.updateTimers()
  SceneManager:update()      -- run the active scene
  gfx.sprite.update()        -- if you use sprites
end