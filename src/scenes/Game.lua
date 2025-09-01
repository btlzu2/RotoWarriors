import "src/entities/Player"
import "src/entities/Bullet"


Game = {}

local gfx = playdate.graphics
local player
local snd = playdate.sound
local pew = snd.sampleplayer.new("assets/sounds/pew.wav")

function Game:update()
    if not player then
        player = Player()  -- now that Player is global, this works
    end
if playdate.buttonJustPressed(playdate.kButtonA) then
        local px, py = player:getPosition()
        print ("PX" .. px .. " PY " .. py)
        local angle = player:getRotation() -- assuming you're storing this in degrees
        local radians = math.rad(angle)
        local speed = 5
    
        local dx = math.cos(radians) * speed
        local dy = math.sin(radians) * speed
        Bullet(px, py, dx, dy)
        pew:play()
    end
    gfx.sprite.update()
    playdate.timer.updateTimers()
end