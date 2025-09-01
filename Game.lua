import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local pd  <const> = playdate
local gfx <const> = playdate.graphics

-- GLOBAL on purpose so main.lua can see it
GameScene = {}

function GameScene:enter()
  -- Put your old one-time setup here:
  -- load images/sounds, create sprites, init player/enemies/etc.
  -- Example placeholder you can delete:
  self.player = { x = 200, y = 120, speed = 2 }
end

function GameScene:update()
  -- Put your old per-frame loop here:
  -- read input, move things, spawn bullets, collisions, draw HUD
  if pd.buttonIsPressed(pd.kButtonUp)    then self.player.y -= self.player.speed end
  if pd.buttonIsPressed(pd.kButtonDown)  then self.player.y += self.player.speed end
  if pd.buttonIsPressed(pd.kButtonLeft)  then self.player.x -= self.player.speed end
  if pd.buttonIsPressed(pd.kButtonRight) then self.player.x += self.player.speed end

  -- If you draw manually (not relying on sprites):
  gfx.clear()
  gfx.drawText("RotoWarriors", 5, 5)
  gfx.fillCircleAtPoint(self.player.x, self.player.y, 3)
end