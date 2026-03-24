function GenerateQuads(atlas, tileWidth, tileHeight) 
  local sheetWidth = atlas:getWidth() / tileWidth
  local sheetHeight = atlas:getHeight() / tileHeight

  local sheetCounter = 1
  local spriteSheet = {}

  for y = 0, sheetWidth - 1 do
    for x = 0, sheetHeight - 1 do
      spriteSheet[sheetCounter] = love.graphics.newQuad( x * tileWidth, y * tileHeight, tileWidth, tileHeight, atlas:getDimensions())
      sheetCounter = sheetCounter + 1
    end
  end
  
  return spriteSheet
end

function table.slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced + 1] = tbl[i]
  end

  return sliced
end

-- We need a specific function to piece out the paddles since they are of different sizes 

function GeneratePaddles(atlas)
  local x = 0
  local y = 64

  local paddles = {}
  local paddleCount = 1

  for i = 1, 4 do
    --smallest
    paddle[paddleCount] = love.graphics.newQuad(x, y, 32, 16, atlas:getDimensions())
    paddleCount = paddleCount + 1
    --medium
    paddle[paddleCount] = love.graphics.newQuad(x + 32, y, 64, 16, atlas:getDimensions())
    paddleCount = paddleCount + 1
    --large
    paddle[paddleCount] = love.graphics.newQuad(x + 96, y, 96, 16, atlas:getDimensions())
    paddleCount = paddleCount + 1
    --huge
    paddle[paddleCount] = love.graphics.newQuad(x, y + 16, 128, 16, atlas:getDimensions())
    paddleCount = paddleCount + 1

    -- prepare y for the next set of paddles
    y = y + 32
  end

  return paddles
end