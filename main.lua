import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd  <const> = playdate
local gfx <const> = playdate.graphics

import "src/scene_manager"
import "src/scenes/game"

-- start directly in the game
SceneManager:switch(GameScene)

function pd.update()
  pd.timer.updateTimers()
  SceneManager:update()
  gfx.sprite.update()
end