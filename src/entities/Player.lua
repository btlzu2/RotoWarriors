local gfx = playdate.graphics
local X_MOV = 3
local Y_MOV = 3
local playerRotation = 0

class("Player").extends(gfx.sprite)

function Player:init()
    -- store on self so other methods can access them
    self.image0   = gfx.image.new("assets/images/rotowarrior0.png")
    self.image90  = gfx.image.new("assets/images/rotowarrior90.png")
    self.image180 = gfx.image.new("assets/images/rotowarrior180.png")
    self.image270 = gfx.image.new("assets/images/rotowarrior270.png")

    assert(self.image0,   "image0 not found!")
    assert(self.image90,  "image90 not found!")
    assert(self.image180, "image180 not found!")
    assert(self.image270, "image270 not found!")

    self:setImage(self.image0)
    self:setCenter(0.5, 0.5)
    self:moveTo(200, 200)
    self:add()
end

function Player:update()
    local dx, dy = 0, 0

    -- Lua: no += / -=
    if playdate.buttonIsPressed(playdate.kButtonUp)    then dy = dy - Y_MOV end
    if playdate.buttonIsPressed(playdate.kButtonDown)  then dy = dy + Y_MOV end
    if playdate.buttonIsPressed(playdate.kButtonLeft)  then dx = dx - X_MOV end
    if playdate.buttonIsPressed(playdate.kButtonRight) then dx = dx + X_MOV end

    self:moveBy(dx, dy)

local a = playdate.getCrankPosition()
playerRotation = (math.floor((a + 45) / 90) % 4) * 90  -- 0,90,180,270
          
local imgs = {
    [0]   = self.image0,
    [90]  = self.image90,
    [180] = self.image180,
    [270] = self.image270,
}
          
self:setImage(imgs[playerRotation])
end

function Player:getRotation()
    return playerRotation
end
