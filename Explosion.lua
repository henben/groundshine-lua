Explosion = Object:extend()

function Explosion:new(x,y)
  self.x = x
  self.y = y
end

function Explosion.update(dt)
  
end

function Explosion:draw()
    love.graphics.circle('fill', self.x, self.y, 10 * scale)
end