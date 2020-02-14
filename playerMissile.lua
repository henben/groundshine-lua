playerMissile = Object:extend()

function playerMissile:new(x, y, angle)
    self.x = x
    self.y = y
    -- store initial x & y 
    self.initial_x = self.x
    self.initial_y = self.y

    self.angle = angle
    self.speed = gh/40
    -- v_x and v_y are for ballistic movement after boost, not used yet
    self.v_x = nil
    self.v_y = nil
    self.boost = true -- is the missile currently boosting?
    self.launched = false -- is there a missile currently launched? 
    self.gravity = gh/8000
    self.dead = false
    self.flight_distance = nil
end

function playerMissile:draw()
    love.graphics.circle('fill', self.x, self.y, gw/200)
    if self.boost then
      --self.flight_distance = getDistance(self.initial_x, self.initial_y, self.x, self.y)
      love.graphics.line(self.initial_x, self.initial_y, self.x, self.y)
    end
end

function playerMissile:update(dt)
    if input:pressed('detonate') then
      table.insert (listOfExplosions, Explosion(self.x, self.y))
      sfxBoost:stop()
      self.dead = true
      if self.boost == true then
        table.insert (listOfTrails, missileTrail(self.initial_x, self.initial_y, self.x, self.y))
      end
    end
    if input:released('launch') and (self.launched == false) then 
      sfxBoost:stop()
      self.v_x = (self.speed * cos * dt)
      self.v_y = (self.speed * sin * dt)
      self.boost = false
      self.launched = true
      -- create a separate missile trail object
      table.insert (listOfTrails, missileTrail(self.initial_x, self.initial_y, self.x, self.y))
    end
    if self.boost == true then
      cos = math.cos(self.angle)
      sin = math.sin(self.angle)
      self.x = self.x + self.speed * cos * dt
      self.y = self.y + self.speed * sin * dt
      self.speed = self.speed + gh/300
    end
    if self.boost == false then
      self.x = self.x + self.v_x
      self.v_y = self.v_y + self.gravity
      self.y = self.y + self.v_y
    end
end

function getDistance(x1, y1, x2, y2)
  local horizontal_distance = x1 - x2
  local vertical_distance = y1 - y2
  local a = horizontal_distance ^2
  local b = vertical_distance ^2
  local c = a + b
  local distance = math.sqrt(c)
  return distance
end