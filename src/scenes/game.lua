import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "src/entities/player"

local gfx <const> = playdate.graphics

GameScene = {}

function GameScene:enter()
    gfx.sprite.setBackgroundDrawingCallback(function(x, y, w, h)
        gfx.clear(gfx.kColorWhite)
    end)

    -- create one player instance
    self.player = Player()
end

function GameScene:update()
    -- nothing special needed, Player:update runs automatically
    -- because it extends gfx.sprite and you’re calling gfx.sprite.update()
    -- in main.lua
end