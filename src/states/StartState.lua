StartState = Class{__includes = BaseState}

function StartState:init()
  self.option = 0 
end

function StartState:update(dt)
  if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
    gSounds['paddle_hit']:play()
    if self.option == 0 then
      self.option = 1 
    else
      self.option = 0
    end
  end
end

function StartState:render()
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf('Breakout', 0, 64, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(gFonts['small'])
  if self.option == 0 then
    love.graphics.setColor(0, 1, 0, 1)
  end
  love.graphics.printf('Start', 0, 185, VIRTUAL_WIDTH, 'center')
  love.graphics.setColor(1, 1, 1, 1)
  if self.option == 1 then
    love.graphics.setColor(0, 1, 0, 1)
  end
  love.graphics.printf('Highscore', 0, 200, VIRTUAL_WIDTH, 'center')
  love.graphics.setColor(1, 1, 1, 1)
end