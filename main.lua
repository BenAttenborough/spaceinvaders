function _init()
    spriteWidth = 8
    spriteHeight = 8
    alienRowStart = 8
    alienColStart = 8
    alienCols = 11
    alienRows = 5
    alienRowBuffer = 4
    alienColBuffer = 2
    alienMovementX = 1
    alienMovementToggle = false
    frameCount = 1
    aliens = makeAliens()
    furthestAlienRight = getFurthestRightAlien(aliens)
    alienRowEdgeX = getAlienEdgeRowX()
end

function _update()
    furthestAlienRight = getFurthestRightAlien(aliens)
    alienRowEdgeX = getAlienEdgeRowX()
    if frameCount == 30 then
        toggle = not toggle
        sfx(0)
        if alienRowEdgeX > 124 then
            alienColStart += 1
            alienMovementX = -1
            alienRowStart -= 1
        else
            alienRowStart += alienMovementX
        end
    end
    frameCount += 1
    frameCount = frameCount % 31
end

function _draw()
    cls()
    for i = 0,(alienRows - 1) do 
        for j = 0,(alienCols - 1) do
            drawAlien(
                aliens[i+1][j+1].type,
                alienRowStart + (j*spriteWidth)+(j*alienColBuffer),
                alienColStart + (i*spriteHeight)+(i*alienRowBuffer)
            )        
        end
    end 

    line(
        alienRowEdgeX, 0,
        alienRowEdgeX, 128,
        11
    )
    print("furthest alien right = " .. furthestAlienRight,5,100,7)
end

function drawAlien(type,x,y)
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

function getAlienEdgeRowX()
    return alienRowStart + (furthestAlienRight*spriteWidth) + (#aliens[1] - 1)*alienColBuffer
end