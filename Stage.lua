Stage = Object:extend()

function Stage:new()
  --self.Timer = require 'libraries/timer'
  self.enemyTimer = Timer.new()
  self.enemyTimer:after(1, addBomber())
end

function Stage:update(dt)
 
end

function Stage:draw()

end