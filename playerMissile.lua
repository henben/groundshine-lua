playerMissile = Object:extend()

function playerMissile:new(x, y, angle)
    self.x = x
    self.y = y
    self.angle = angle
    self.speed = gh/40
    self.v_x = nil
    self.v_y = nil
    self.boost = true
    self.gravity = gh/5000
end

function playerMissile:draw()
    love.graphics.circle('fill', self.x, self.y, gw/200)
end

function playerMissile:update(dt)
    if input:released('launch') then 
      self.v_x = (self.speed * cos * dt)
      self.v_y = (self.speed * sin * dt)
      self.boost = false
    end
    if self.boost == true then
      cos = math.cos(self.angle)
      sin = math.sin(self.angle)
      self.x = self.x + self.speed * cos * dt
      self.y = self.y + self.speed * sin * dt
      self.speed = self.speed + scale
    end
    if self.boost == false then
      self.x = self.x + self.v_x
      self.v_y = self.v_y + self.gravity
      self.y = self.y + self.v_y
    end
end