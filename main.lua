-- print to console while game is running
io.stdout:setvbuf("no")

up = 1.5 * math.pi
scale = 3 -- default res is 400x240, this scaling factor is used to upscale the game

function love.load()
    -- retro look
    love.graphics.setDefaultFilter('nearest')
    --love.graphics.setLineStyle( 'rough' )
    
    -- load libraries and objects
    Object = require "libraries/classic"
    require "PlayerBase"
    require "PlayerMissile"
    require "Explosion"
    require "MissileTrail"
    require "Bomber"
    Physics = require "libraries/windfield"
    Input = require 'libraries/Input'
    Timer = require 'libraries/timer'
    player = PlayerBase()
   -- Camera = require 'libraries/camera'
  
    world = Physics.newWorld(0, 0, true)
    world:addCollisionClass('Explosion')
    world:addCollisionClass('Bomber')
  
   -- create initial game objects and tables to hold them
    listOfMissiles = {}
    listOfExplosions = {}
    listOfTrails = {}
    listOfEnemies = {}

    -- audio
    sfxBackground = love.audio.newSource("sounds/Melt-Down_Looping.mp3", "stream")
    sfxBackground:setLooping(true)
    sfxBackground:setVolume(0.2)
    sfxBackground:play()
    sfxBoost = love.audio.newSource("sounds/Air-Lock-3.mp3", "static")
    sfxExplosion = love.audio.newSource("sounds/Explosion7.mp3", "static")

    -- scaling
    main_canvas = love.graphics.newCanvas(gw, gh)
    resize(scale)
    
    -- initialise controls
    input = Input()
    input:bind('space', 'launch')
    input:bind('z', 'detonate')

    bomber_timer = 0
    bomber_delay = 5

    addBomber()
end

function love.update(dt)
  world:update(dt)
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
          --v.collider = nil
          table.remove(listOfExplosions, i)
        end
  end
  for i,v in ipairs(listOfEnemies) do
      v:update(dt)
      if v.dead then
        --v.collider = nil
        table.remove(listOfEnemies, i)
      end
  end
  bomber_timer = bomber_timer + dt
  if bomber_timer > bomber_delay then
    addBomber()
    bomber_timer = 0
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
  for i,v in ipairs(listOfEnemies) do
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

function addBomber()
  table.insert (listOfEnemies, Bomber() )
  return true
end