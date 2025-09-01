-- GLOBAL on purpose so import makes it visible
SceneManager = { current = nil }

function SceneManager:switch(scene)
  self.current = scene
  if self.current and self.current.enter then self.current:enter() end
end

function SceneManager:update()
  if self.current and self.current.update then self.current:update() end
end