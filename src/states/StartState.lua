StartState = Class{__includes = BaseState}

function StartState:init()
  self.option = 0 
end

function StartState:update(dt)
  if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
    gSounds['paddle_hit']:play()
    self.option = self.option == 0 and 1 or 0
  end

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('enter') and self.option == 0 then
    gStateMachine:change('play')
  end
end

function StartState:render()
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf('BREAKOUT', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(gFonts['small'])
  if self.option == 0 then
    -- highlight option
    love.graphics.setColor(103/255, 1, 1, 1)
  end
  love.graphics.printf('START', 0, VIRTUAL_HEIGHT / 2 + 75, VIRTUAL_WIDTH, 'center')
  -- reset color
  love.graphics.setColor(1, 1, 1, 1)
  if self.option == 1 then
    -- highlight option
    love.graphics.setColor(103/255, 1, 1, 1)
  end
  love.graphics.printf('HIGHSCORE', 0, VIRTUAL_HEIGHT / 2 + 85, VIRTUAL_WIDTH, 'center')
  -- reset color
  love.graphics.setColor(1, 1, 1, 1)
end