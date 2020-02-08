Explosion = Object:extend()

function Explosion:new(x,y)
  self.x = x
  self.y = y
  self.radius = 10
  self.dead = false
  self.Timer = require 'libraries/timer'
  self.decayTimer = Timer.new()
end

function Explosion:update(dt)
  self.decayTimer:update(dt)
  self.decayTimer:tween(1, self, {radius = 0}, 'in-linear', function() self.dead = true end)
  print (self.radius)
end

function Explosion:draw()
    love.graphics.circle('fill', self.x, self.y, self.radius * scale)
end