Paddles = Class{}

local PADDLE_SPEED = 200

function Paddles:init()
  self.x = VIRTUAL_WIDTH - 32
  self.y = VIRTUAL_HEIGHT - 32

  self.width = 64
  self.height = 16

  self.dx = 0

  -- paddle color
  self.skin = 1

  -- paddle size
  self.size = 2

  -- *skin times size will give the exact paddle
end

function Paddles:update(dt)
  -- update the x velocity depend on the input
  if love.keyboard.isDown('left') then
    self.dx = -PADDLE_SPEED
  end
  if love.keyboard.isDown('rigth') then
    self.dx = PADDLE_SPEED 
  end

  -- update the paddle x coordinate to create movement illusion 
  -- and prevent the paddle from transpassing the sides
  if self.dx < 0 then
    self.x = math.max(0, self.x + self.dx * dt)
  end
  if self.dx > 0 then
    self.x = math.min(VIRTUAL_WIDTH - 32, self.x + self.dx * dt)
  end
end

function Paddles:render()
  love.graphics.draw(gTextures['main'], gFrames['paddles'][], self.x, self.y)
end