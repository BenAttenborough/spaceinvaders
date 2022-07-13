function makeAliens()
    local alienCols = 11
    local alienRows = alienRows
    local row = {}
    local data = {}
    local alienType = 1
    for i = 0,(alienRows - 1) do 
        for j = 0,(alienCols - 1) do
            add(
                row, 
                {
                    type = alienType,
                    x = alienRowStart + (j*spriteWidth)+(j*alienColBuffer),
                    y = alienColStart + (i*spriteHeight)+(i*alienRowBuffer),
                    alive = true
                }
            )
        end
        add(data,row)
        row = {}
        if i == 1 then alienType = 2 end
        if i == 3 then alienType = 3 end
    end
    return data
end

function aliensUpdate()
    if frameCount == flr(frameToUpdate) then
        toggle = not toggle
        sfx(0)
        if alienRowRightEdgeX == 120 then
            alienYToggle = true
            alienMovementX = -1
        elseif alienRowLeftEdgeX < 8 then
            alienYToggle = true
            alienMovementX = 1
        end
        foreach(
            aliens,
            function(row)
                foreach(
                    row, 
                    function(alien)
                        alien.x += alienMovementX
                        if alienYToggle then
                            alien.y += 1
                        end
                    end
                )
            end
        )
        if alienYToggle then
            alienYToggle = false
        end  
    end
      
    foreach(
            aliens,
            function(row)
                foreach(
                    row, 
                    function(alien)
                        foreach(
                        lasers,
                        function(laser) 
                            if checkAlienCollision(alien, laser) then
                                alien.alive = false
                                laser.alive = false
                                sfx(2)
                                score += 50
                                frameToUpdate -= 0.55
                            end
                        end
                    )
                end
            )
        end
    )
end

function getFurthestRightAlien(aliens)
    furthestRight = 0
    for i = 1,(#aliens) do 
        for j = 1,(#aliens[i]) do
            if j > furthestRight and aliens[i][j].alive then
                -- We can bail early if there's an alien in the last row
                if j == alienCols then
                    return j
                end
                furthestRight = j
            end
        end
    end
    return furthestRight
end

function getFurthestLeftAlien(aliens)
    furthestLeft = alienCols
    for i = 1,(#aliens) do 
        for j = 1,(#aliens[i]) do
            if  j < furthestLeft and aliens[i][j].alive then
                if j == 1 then
                    return j
                end
                furthestLeft = j
            end
        end
    end
    return furthestLeft
end

function drawAlien(alien)
    if not alien.alive then return end
    if alien.type == 1 then
        sprN = 32
    elseif alien.type == 2 then
        sprN = 34
    elseif alien.type == 3 then
        sprN = 36
    else
        sprN = 38
    end
    if toggle then sprN += 1 end
    if alien.alive then
        spr(sprN,alien.x,alien.y)
    end
end

function getAlienRightEdgeRowX()
    return aliens[1][furthestAlienRight].x + spriteWidth
end

function getAlienLeftEdgeRowX()
    return aliens[1][furthestAlienLeft].x
end

function checkAlienCollision(alien,obj)
    if not alien.alive then
        return false
    elseif alien.y >= obj.y and alien.y - spriteHeight <= obj.y then
        if (obj.x + 4) >= alien.x and (obj.x + 5) <= alien.x + spriteWidth  then
            return true
        end
    end
    return false
end