local gfx = playdate.graphics

class("Player").extends(gfx.sprite)

function Player:init()
    local image = gfx.image.new("images/rotowarrior0.png")
    assert(image, "image not found!")

    self:setImage(image)
    self:setCenter(0.5, 0.5)
    self:moveTo(200, 200)
    self:add()
end

function Player:update()
    local dx, dy = 0, 0
    if playdate.buttonIsPressed(playdate.kButtonUp) then dy -= 2 end
    if playdate.buttonIsPressed(playdate.kButtonDown) then dy += 2 end
    if playdate.buttonIsPressed(playdate.kButtonLeft) then dx -= 2 end
    if playdate.buttonIsPressed(playdate.kButtonRight) then dx += 2 end

    self:moveBy(dx, dy)
end