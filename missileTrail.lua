missileTrail = Object:extend()

function missileTrail:new(x1,y1,x2,y2)
    self.x1 = x1
    self.y1 = y1
    self.x2 = x2
    self.y2 = y2
end 

function missileTrail:update(dt)
end

function missileTrail:draw()
    love.graphics.line(self.x1, self.y1, self.x2, self.y2)
end