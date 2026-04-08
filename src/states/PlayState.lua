-- PlayState = Class{__includes = BaseState}

-- function PlayState:init() 
--   self.paddles = GeneratePaddles(gTextures['blocks']) -- generates an table of 16 paddles
--   self.x = (VIRTUAL_WIDTH / 2) - 32
--   self.dx = 200
-- end

-- function PlayState:update(dt) 
--   -- movement
--   if love.keyboard.isDown('left') then
--     self.x = self.x + -self.dx * dt
--   end
--   if love.keyboard.isDown('right') then
--     self.x = self.x + self.dx * dt
--   end

--   -- side collisions
--   if self.x < 0 then
--     self.x = 0
--   end
--   if self.x + 64 > VIRTUAL_WIDTH then
--     self.x = VIRTUAL_WIDTH - 64
--   end
-- end

-- function PlayState:render() 
--   love.graphics.draw(gTextures['blocks'], self.paddles[2], self.x, VIRTUAL_HEIGHT - 50)
-- end