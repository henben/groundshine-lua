playerMissile = Object:extend()

function playerMissile:new(x, y, angle)
    self.x = x
    self.y = y
    -- store initial x & y 
    self.initial_x = self.x
    self.initial_y = self.y
    --self.end_boost_x = nil
    --self.end_boost_y = nil

    self.angle = angle
    self.speed = gh/40
    -- v_x and v_y are for ballistic movement after boost, not used yet
    self.v_x = nil
    self.v_y = nil
    self.boost = true
    self.launched = false
    self.gravity = gh/5000
    self.dead = false
end

function playerMissile:draw()
    love.graphics.circle('fill', self.x, self.y, gw/200)
    if self.boost then
      --draw the missile trail while boosting
      love.graphics.line(self.initial_x, self.initial_y, self.x, self.y)
    end
end

function playerMissile:update(dt)
    if input:pressed('detonate') then
      table.insert (listOfExplosions, Explosion(self.x, self.y))
      self.dead = true
    end
    if input:released('launch') and (self.launched == false) then 
      self.v_x = (self.speed * cos * dt)
      self.v_y = (self.speed * sin * dt)
      self.boost = false
      self.launched = true
      -- draw a persistent trail
      table.insert (listOfTrails, missileTrail(self.initial_x, self.initial_y, self.x, self.y))
    end
    if self.boost == true then
      cos = math.cos(self.angle)
      sin = math.sin(self.angle)
      self.x = self.x + self.speed * cos * dt
      self.y = self.y + self.speed * sin * dt
      self.speed = self.speed + scale * 0.75
    end
    if self.boost == false then
      self.x = self.x + self.v_x
      self.v_y = self.v_y + self.gravity
      self.y = self.y + self.v_y
    end
end