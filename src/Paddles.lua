Paddles = Class{}

function Paddles:init()
  self.x = (VIRTUAL_WIDTH / 2) - 32
  self.y = VIRTUAL_HEIGHT - 32

  self.width = 64
  self.height = 16

  self.dx = 0

  -- paddle color
  self.skin = 1

  -- paddle size
  self.size = 2
end

function Paddles:update(dt)
  -- update the dx velocity according to the input
  if love.keyboard.isDown('left') then
    self.dx = -PADDLE_SPEED
  elseif love.keyboard.isDown('right') then
    self.dx = PADDLE_SPEED 
  else
    self.dx = 0
  end

  -- update the paddle x coordinate to create movement  
  -- and prevent the paddle from transpassing the sides
  if self.dx < 0 then
    self.x = math.max(0, self.x + self.dx * dt)
  else
    self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dx * dt)
  end
end

function Paddles:render()
  love.graphics.draw(gTextures['main'], gFrames['paddles'][self.size + (4 * (self.skin - 1))], self.x, self.y)
end