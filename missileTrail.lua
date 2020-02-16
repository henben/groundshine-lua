MissileTrail = Object:extend()

function MissileTrail:new(x1,y1,x2,y2)
    -- parameters passed from PlayerMissile: x1, y1 are start of the missile trail, x2, y2 are the end of the trail
    self.x1 = x1
    self.y1 = y1
    self.x2 = x2
    self.y2 = y2
end 

function MissileTrail:update(dt)
end

function MissileTrail:draw()
    love.graphics.line(self.x1, self.y1, self.x2, self.y2)
end