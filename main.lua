io.stdout:setvbuf("no")

up = 1.5 * math.pi
scale = 3 -- default res is 400x240, this scaling factor is used to upscale the game

function love.load()
    love.graphics.setDefaultFilter('nearest')
    love.graphics.setLineStyle( 'rough' )
    
    Object = require "libraries/classic"
    require "playerBase"
    require "playerMissile"
    require "Explosion"
    require "missileTrail"
    Input = require 'libraries/Input'
    Timer = require 'libraries/timer'
   -- Camera = require 'libraries/camera'
    
    player = playerBase()
    listOfMissiles = {}
    listOfExplosions = {}
    listOfTrails = {}
    main_canvas = love.graphics.newCanvas(gw, gh)
    resize(scale)
    
    input = Input()
    input:bind('space', 'launch')
    input:bind('z', 'detonate')
end

function love.update(dt)
  --Timer.update(dt)
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

function love.draw()
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

function resize(s)
    love.window.setMode(s*gw, s*gh) 
    sx, sy = s, s
end