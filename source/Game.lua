import "source/Player"
import "source/Bullet"
Game = {}

local gfx = playdate.graphics
local player

function Game:update()
    if not player then
        player = Player()  -- now that Player is global, this works
    end
if playdate.buttonJustPressed(playdate.kButtonA) then
        local px, py = player:getPosition()
        local angle = player:getRotation() -- assuming you're storing this in degrees
        local radians = math.rad(angle)
        local speed = 5
    
        local dx = math.cos(radians) * speed
        local dy = math.sin(radians) * speed
    
        Bullet(px, py, dx, dy)
    end
    gfx.sprite.update()
    playdate.timer.updateTimers()
end