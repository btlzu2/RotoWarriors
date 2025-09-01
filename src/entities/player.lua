local pd  <const> = playdate
local gfx <const> = playdate.graphics

Player = {}  -- global
Player.__index = Player

function Player.new(x, y)
  local self = setmetatable({}, Player)
  self.x, self.y = x, y
  self.speed = 2
  return self
end

function Player:update()
  if pd.buttonIsPressed(pd.kButtonUp)    then self.y -= self.speed end
  if pd.buttonIsPressed(pd.kButtonDown)  then self.y += self.speed end
  if pd.buttonIsPressed(pd.kButtonLeft)  then self.x -= self.speed end
  if pd.buttonIsPressed(pd.kButtonRight) then self.x += self.speed end
  gfx.fillCircleAtPoint(self.x, self.y, 3)
end