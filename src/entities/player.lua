import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

local pd  <const> = playdate
local gfx <const> = pd.graphics

-- Extend sprite, just like before
class("Player").extends(gfx.sprite)

-- constants for movement speed
local X_MOV = 3
local Y_MOV = 3

-- file-level variable for current rotation
local playerRotation = 0

function Player:init()
    -- load images for 4 facings
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
    self:moveTo(200, 200)   -- starting position
    self:add()              -- add to sprite system
end

function Player:update()
    local dx, dy = 0, 0

    -- movement via d-pad
    if pd.buttonIsPressed(pd.kButtonUp)    then dy -= Y_MOV end
    if pd.buttonIsPressed(pd.kButtonDown)  then dy += Y_MOV end
    if pd.buttonIsPressed(pd.kButtonLeft)  then dx -= X_MOV end
    if pd.buttonIsPressed(pd.kButtonRight) then dx += X_MOV end

    self:moveBy(dx, dy)

    -- crank → 4-way rotation
    local a = pd.getCrankPosition()
    playerRotation = (math.floor((a + 45) / 90) % 4) * 90  -- snap to 0,90,180,270

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