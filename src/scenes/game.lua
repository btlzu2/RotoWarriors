import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"


import "src/entities/player"
import "src/entities/bullet"

local pd  <const> = playdate
local gfx <const> = pd.graphics
local snd <const> = pd.sound

GameScene = {}

function GameScene:enter()
    gfx.sprite.setBackgroundDrawingCallback(function(x, y, w, h)
        gfx.clear(gfx.kColorWhite)
    end)

    -- create one player
    self.player = Player()
    self.bullets = {}

    -- load pew sound
    self.pew = snd.sampleplayer.new("assets/sounds/pew.wav")
    assert(self.pew, "pew.wav not found! Make sure it’s in assets/sounds/")
end

function GameScene:update()
    -- fire bullet on A press
    if pd.buttonJustPressed(pd.kButtonA) and self.player then
        local px, py = self.player:getPosition()
        local facing = self.player:getRotation()
        local b = Bullet(px, py, facing)
        table.insert(self.bullets, b)

        -- play sound
        if self.pew then self.pew:play() end
    end

    -- prune bullets that have been removed
    for i = #self.bullets, 1, -1 do
        if not self.bullets[i].superview then
            table.remove(self.bullets, i)
        end
    end
end