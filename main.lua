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
    stage = require "rooms/Stage"
    Input = require 'libraries/Input'
    Timer = require 'libraries/timer'
    player = PlayerBase()
   -- Camera = require 'libraries/camera'
  
    current_room = Stage
  
   -- create initial game objects and tables to hold them
    listOfMissiles = {}
    listOfExplosions = {}
    listOfTrails = {}

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
end

function love.update(dt)
  if current_room then current_room:update(dt) end
end

function love.draw()
  if current_room then current_room:draw() end
end

function resize(s)
    love.window.setMode(s*gw, s*gh) 
    sx, sy = s, s
end