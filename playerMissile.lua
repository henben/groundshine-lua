playerMissile = Object:extend()

function playerMissile:new(x, y, angle)
    self.x = x
    self.y = y
    self.angle = angle
    self.speed = gh/20
   -- self.boost = true
end

function playerMissile:draw()
    love.graphics.circle('fill', self.x, self.y, gw/200)
end

--function playerMissile:keyPressed(key)
--  if key == "space" then
--    self.boost = false
--  end
--end

function playerMissile:update(dt)
    cos = math.cos(self.angle)
    sin = math.sin(self.angle)
    self.x = self.x + self.speed * cos * dt
    self.y = self.y + self.speed * sin * dt
    --if self.boost == true then
    self.speed = self.speed + scale
--    else
--      self.x = self.x - gh/200
    --end
end