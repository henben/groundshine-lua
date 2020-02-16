Explosion = Object:extend()

function Explosion:new(x,y)
  self.flash = true
  self.x = x
  self.y = y
  self.radius = gw/400
  self.dead = false
  --self.Timer = require 'libraries/timer'
  self.decayTimer = Timer.new()
  sfxExplosion:stop()
  sfxExplosion:play()
  shrink = function () self.decayTimer:tween(0.9, self, {radius = gw/400}, 'in-out-quad', self:die()) end
  self.decayTimer:after(0.1, function () self.flash = false end)
  self.decayTimer:tween(0.2, self, {radius = gw/10}, 'out-circ', shrink)
  self.collider = world:newCircleCollider(self.x, self.y, gw/10)
  self.collider:setObject(self)
  self.collider:setCollisionClass('Explosion')
end

function Explosion:update(dt)
  self.decayTimer:update(dt)
end

function Explosion:draw()
    love.graphics.circle('fill', self.x, self.y, self.radius)
    if self.flash then
    love.graphics.setBackgroundColor( 1, 1, 1, 1 )
    else
    love.graphics.setBackgroundColor( 0, 0, 0, 0 )
    end
end

function Explosion:die()
  self.dead = true
  self.collider:destroy()
end