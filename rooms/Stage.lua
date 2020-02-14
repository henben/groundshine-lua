Stage = Object:extend()

function Stage:new()

end

function Stage:update(dt)
  player:update(dt)
  for i,v in ipairs(listOfMissiles) do
        v:update(dt)
        if v.dead then
            --Remove it from the list
            table.remove(listOfMissiles, i)
        end
  end
  for i,v in ipairs(listOfExplosions) do
        v:update(dt)
        if v.dead then
          table.remove(listOfExplosions, i)
        end
  end
end

function Stage:draw()
  love.graphics.setCanvas(main_canvas)
  love.graphics.clear()
  love.graphics.setLineStyle('smooth')
  love.graphics.setLineWidth( 4 )
  player:draw()
  love.graphics.setLineStyle('rough')
  love.graphics.setLineWidth( 2 )
  for i,v in ipairs(listOfMissiles) do
    v:draw()
  end
  for i,v in ipairs(listOfExplosions) do
    v:draw()
  end
  for i,v in ipairs(listOfTrails) do
    v:draw()
  end
  love.graphics.setCanvas()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setBlendMode('alpha', 'premultiplied')
  love.graphics.draw(main_canvas, 0, 0, 0, sx, sy)
  love.graphics.setBlendMode('alpha')
end