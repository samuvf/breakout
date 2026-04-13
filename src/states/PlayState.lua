PlayState = Class{__includes = BaseState}

function PlayState:init() 
  self.paddles = Paddles()
  self.paused = false
end

function PlayState:update(dt) 
  if love.keyboard.wasPressed('space') then
    gSounds['pause']:play()
    self.paused = not self.paused
  end

  if not self.paused then
    self.paddles:update(dt)
  end

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
end

function PlayState:render() 
  self.paddles:render()
  if self.paused then
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('PAUSED', 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
  end
end