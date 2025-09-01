local gfx = playdate.graphics

class('Bullet').extends(gfx.sprite)

function Bullet:init(x, y, dx, dy)
    Bullet.super.init(self)

    self:setSize(4, 4) -- small bullet size
    local bulletImage = gfx.image.new(4, 4)
    gfx.pushContext(bulletImage)
    gfx.fillCircleAtPoint(2, 2, 2) -- simple circle bullet
    gfx.popContext()
    self:setImage(bulletImage)

    self:moveTo(x, y)
    self.dx = dx
    self.dy = dy

    self:add()
end

function Bullet:update()
    self:moveBy(self.dx, self.dy)
    -- Remove the bullet if it's off screen
    local x, y = self:getPosition()
    y = y - 32
    x = x - 32
    if x < -10 or x > 410 or y < -10 or y > 250 then
        self:remove()
    end
end