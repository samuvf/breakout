require 'src/Dependencies'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')

  love.window.setTitle('Breakout')

  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true
  })

  push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = 'normal' })

  gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
  }
  love.graphics.setFont(gFonts['small'])

  gSounds = {
    ['paddle_hit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),

    ['music'] = love.audio.newSource('sounds/music.wav', 'static'),
  }
  gSounds['music']:setLooping(true)

  gTextures = {
    ['background'] = love.graphics.newImage('graphics/background.png')
  }

  gStateMachine = {
    ['start'] = function() return StartState() end,
  }
  -- gStateMachine:change('start')

  love.keyboard.keysPressed = {}
end

function love.resize(w, h)
  push.resize(w, h)
end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  return love.keyboard.keysPressed[key]
end

function love.update(dt)
  -- gStateMachine:update(dt)

  love.keyboard.keysPressed = {}
end

function love.draw()
  push:start()

    local backgroundWidth = gTextures['background']:getWidth()
    local backgroundHeight = gTextures['background']:getHeight()

    love.graphics.draw(gTextures['background'],
      0, 0,
      0,
      VIRTUAL_WIDTH / (backgroundWidth - 1), VIRTUAL_HEIGHT / (backgroundHeight - 1))

    -- gStateMachine:render()
  push:finish()
end