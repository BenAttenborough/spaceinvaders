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
    furthestAlienLeft = getFurthestLeftAlien(aliens)
    alienRowRightEdgeX = getAlienRightEdgeRowX()
    alienRowLeftEdgeX = getAlienLeftEdgeRowX()
    debug = false
end

function _update()
    furthestAlienRight = getFurthestRightAlien(aliens)
    alienRowRightEdgeX = getAlienRightEdgeRowX()
    alienRowLeftEdgeX = getAlienLeftEdgeRowX()
    if frameCount == 30 then
        toggle = not toggle
        sfx(0)
        if alienRowRightEdgeX > 120 then
            alienColStart += 1
            alienMovementX = -1
        elseif alienRowLeftEdgeX < 8 then
            alienColStart += 1
            alienMovementX = 1
        end
        alienRowStart += alienMovementX
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

    if debug then
        line(
            alienRowRightEdgeX, 0,
            alienRowRightEdgeX, 128,
            11
        )
        line(
            alienRowLeftEdgeX, 0,
            alienRowLeftEdgeX, 128,
            11
        )
        print("furthest alien right = " .. furthestAlienRight,5,100,7)
        print("furthest alien left = " .. furthestAlienLeft,5,108,7)
    end
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

function getAlienRightEdgeRowX()
    return alienRowStart + (furthestAlienRight*spriteWidth) + (#aliens[1] - 1)*alienColBuffer
end

function getAlienLeftEdgeRowX()
    return alienRowStart + ((furthestAlienLeft-1)*spriteWidth) 
end