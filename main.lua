function _init()
    debug = false
    logfile = "log.txt"
    spriteWidth = 8
    spriteHeight = 8
    frameToUpdate = 30
    alienRowStart = 8
    alienColStart = 8
    alienCols = 11
    alienRows = 5
    alienRowBuffer = 4
    alienColBuffer = 2
    alienMovementX = 1
    alienMovementY = 1
    alienMovementToggle = false
    alienYToggle = false
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
end

function _update60()
    furthestAlienRight = getFurthestRightAlien(aliens)
    furthestAlienLeft = getFurthestLeftAlien(aliens)
    alienRowRightEdgeX = getAlienRightEdgeRowX()
    alienRowLeftEdgeX = getAlienLeftEdgeRowX()
    aliensUpdate()
    frameCount += 1
    frameCount = frameCount % (flr(frameToUpdate) + 1)
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
                aliens[i+1][j+1]
            )
            -- rect(
            --     aliens[i+1][j+1].x,
            --     aliens[i+1][j+1].y,
            --     aliens[i+1][j+1].x + spriteWidth - 1,
            --     aliens[i+1][j+1].y + spriteHeight - 1,
            --     3
            -- )
        end
    end
    drawLasers()
    drawPlayer(playerX, playerY)
    if debug then debugOutput() end
end
