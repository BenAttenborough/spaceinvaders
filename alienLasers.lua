aLasers = {}
aLaserSprite = 50
aLaserSpeed = 0.5

function drawALasers()
    foreach(
        aLasers,
        function(laser) 
            spr(aLaserSprite,laser.x,laser.y)
        end
    )
end

function updateALasers()
    if alienAttackFrameCount == flr(alienAttackFrame) then
        local randomAlienX = flr(rnd(alienCols)) + 1
        add(aLasers,{
            x = aliens[1][randomAlienX].x,
            y = aliens[5][1].y + spriteHeight - 3,
            alive = true
        })
    end
    cleanupALasers()
    foreach(
        aLasers,
        function(laser) 
            laser.y += aLaserSpeed
            if laser.y > 128 then
                laser.alive = false
            end
        end
    )
end

function cleanupALasers()
    local lasersToRemove = {}
    for i=1,#aLasers do
        if aLasers[i].alive == false then
            add(lasersToRemove,i)
        end
    end
    foreach(
        lasersToRemove,
        function(laserIdx)
            del(aLasers,aLasers[laserIdx])
        end
    )
end