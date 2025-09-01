import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "src/scene_manager"
import "src/scenes/game"

local pd  <const> = playdate
local gfx <const> = playdate.graphics

SceneManager:switch(GameScene)

function pd.update()
    pd.timer.updateTimers()
    SceneManager:update()
    gfx.sprite.update()   -- will call Player:update() automatically
end