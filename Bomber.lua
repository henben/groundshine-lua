Bomber = Object:extend()

function Bomber:new()
    self.x = 0
    self.y = (gh - 0.75*gh)
    self.w = gw/20
    self.h = gh/20
    self.collider = world:newRectangleCollider(self.x, self.y, self.w, self.h)
    self.collider:setObject(self)
    self.collider:setCollisionClass('Bomber')
    self.collider:setLinearVelocity(gw/50, 0)
    self.dead = false
end

function Bomber:draw()
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end


function Bomber:update()
    self.x, self.y = self.collider:getPosition()
    if self.collider:enter('Explosion') or self.x > gw then
        self.collider:destroy()
        self.dead = true
    end
end