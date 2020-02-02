io.stdout:setvbuf("no")

up = 1.5 * math.pi
scale = 2

function love.load()
    love.graphics.setDefaultFilter('nearest')
    love.graphics.setLineStyle( 'rough' )
    
    Object = require "classic"
    require "playerBase"
    require "playerMissile"
    Input = require 'Input'
    
    player = playerBase()
    listOfMissiles = {}
    main_canvas = love.graphics.newCanvas(gw, gh)
    resize(scale)
    
    input = Input()
    input:bind('space', 'launch')
end

function love.update(dt)
  player:update(dt)
  for i,v in ipairs(listOfMissiles) do
        v:update(dt)
  end
end

function love.draw()
    love.graphics.setCanvas(main_canvas)
    love.graphics.clear()
        player:draw()
        for i,v in ipairs(listOfMissiles) do
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