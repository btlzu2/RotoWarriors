import "source/Player"  -- this loads Player.lua, which defines the global 'Player'

Game = {}

local gfx = playdate.graphics
local player

function Game:update()
    if not player then
        player = Player()  -- now that Player is global, this works
    end

    gfx.sprite.update()
    playdate.timer.updateTimers()
end