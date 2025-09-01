import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

local pd  <const> = playdate
local gfx <const> = pd.graphics

class("Bullet").extends(gfx.sprite)

function Bullet:init(x, y, angleDeg)
    -- tiny 4×4 black dot for now
    local img = gfx.image.new(4, 4, gfx.kColorBlack)
    self:setImage(img)
    self:setCenter(0.5, 0.5)
    self:moveTo(x, y)
    self:add()

    -- speed + velocity components
    local speed = 6
    local rad = math.rad(angleDeg)
    self.vx = math.cos(rad) * speed
    self.vy = math.sin(rad) * speed
end

function Bullet:update()
    self:moveBy(self.vx, self.vy)

    -- remove if it goes off screen
    local x, y = self.x, self.y
    if x < -10 or x > 410 or y < -10 or y > 250 then
        self:remove()
    end
end