function _init()
    spriteWidth = 8
    spriteHeight = 8
    alienRowStart = 8
    alienColStart = 8
    alienCols = 11
    alienRows = 5
    alienRowBuffer = 4
    alienColBuffer = 2
    alienMovementToggle = false
    frameCount = 1
    aliens = makeAliens()
end

function _update()
    if frameCount == 30 then
        alienRowStart += 1
        toggle = not toggle
        sfx(0)
    end
    frameCount += 1
    frameCount = frameCount % 31
end

function _draw()
    cls()
    -- alienType = 1
    -- for i = 0,(alienRows - 1) do 
    --     for j = 0,(alienCols - 1) do
    --         -- drawAlien(alienType,alienRowStart + (j*spriteWidth),(i*spriteHeight)+(i*alienRowBuffer))        
    --         drawAlienSmall(
    --             alienType,
    --             alienRowStart + (j*spriteWidth)+(j*alienColBuffer),
    --             alienColStart + (i*spriteHeight)+(i*alienRowBuffer)
    --         )        
    --     end
    --     if i == 0 then alienType = 2 end
    --     if i == 2 then alienType = 3 end
    -- end  
    for i = 0,(alienRows - 1) do 
        for j = 0,(alienCols - 1) do
            -- drawAlien(alienType,alienRowStart + (j*spriteWidth),(i*spriteHeight)+(i*alienRowBuffer))        
            drawAlienSmall(
                aliens[i+1][j+1].type,
                alienRowStart + (j*spriteWidth)+(j*alienColBuffer),
                alienColStart + (i*spriteHeight)+(i*alienRowBuffer)
            )        
        end
        -- if i == 0 then alienType = 2 end
        -- if i == 2 then alienType = 3 end
    end 
end

function drawAlien(type,x,y)
    if type == 1 then
        sprX = 9
    elseif type == 2 then
        sprX = 42
    elseif type == 3 then
        sprX = 73
    else
        sprX = 104
    end
    sspr(sprX,sprY,spriteWidth,spriteHeight,x,y)
end

function drawAlienSmall(type,x,y)
    if type == 1 then
        sprN = 32
    elseif type == 2 then
        sprN = 34
    elseif type == 3 then
        sprN = 36
    else
        sprN = 38
    end
    if toggle then sprN += 1 end
    spr(sprN,x,y)
end