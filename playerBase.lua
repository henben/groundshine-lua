playerBase = Object:extend()

function playerBase:new()
  self.x = gw/2
  self.y = gh
  self.w = gw/40
  self.angle = 0
  self.mousex = 0
  self.mousey = 0
  --self.turn_speed = 0.1
end

function playerBase:update(dt)
  self.mousex = love.mouse.getX()/scale
  self.mousey = love.mouse.getY()/scale
  self.angle = findRotation(self.x,self.y,self.mousex,self.mousey)
  if input:pressed('launch') and ((next(listOfMissiles)) == nil) then 
    table.insert (listOfMissiles, playerMissile(self.x + 2*self.w*math.cos(self.angle), self.y + 2*self.w*math.sin(self.angle), self.angle))
  end
end

function playerBase:draw()
    love.graphics.circle('line', self.x, self.y, self.w)
    love.graphics.line(self.x, self.y, self.x + 2*self.w*math.cos(self.angle), self.y + 2*self.w*math.sin(self.angle))
end

function findRotation(x1,y1,x2,y2)
	return math.atan2(y2 - y1, x2 - x1)
end