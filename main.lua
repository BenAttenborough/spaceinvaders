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
    playerSprite = 16
    playerX = 8
    playerY = 120
    playerWidth = 14
    screenBoundLeft = 8
    screenBoundRight = 120
    frameCount = 1
    aliens = makeAliens()
    furthestAlienRight = getFurthestRightAlien(aliens)
    furthestAlienLeft = getFurthestLeftAlien(aliens)
    alienRowRightEdgeX = getAlienRightEdgeRowX()
    alienRowLeftEdgeX = getAlienLeftEdgeRowX()
    score = 0
    hiscore = 1000
    debug = false
end

function _update()
    furthestAlienRight = getFurthestRightAlien(aliens)
    alienRowRightEdgeX = getAlienRightEdgeRowX()
    alienRowLeftEdgeX = getAlienLeftEdgeRowX()
    if frameCount == 30 then
        toggle = not toggle
        sfx(0)
        if alienRowRightEdgeX >= 120 then
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
    updateLasers()
    input()
end

function _draw()
    cls()
    print("score: " .. score, screenBoundLeft, 0, 7)
    print("hi-score: " .. hiscore, 64, 0, 7)
    for i = 0,(alienRows - 1) do 
        for j = 0,(alienCols - 1) do
            drawAlien(
                aliens[i+1][j+1].type,
                alienRowStart + (j*spriteWidth)+(j*alienColBuffer),
                alienColStart + (i*spriteHeight)+(i*alienRowBuffer)
            )        
        end
    end
    drawLasers()
    drawPlayer(playerX, playerY)
    if debug then debugOutput() end
end

