lasers = {}
laserSprite = 49
laserSpeed = 5

function drawLasers()
    foreach(
        lasers,
        function(laser) 
            spr(laserSprite,laser.x,laser.y)
        end
    )
end

function updateLasers()
    cleanupLasers()
    foreach(
        lasers,
        function(laser) 
            laser.y -= laserSpeed
            if laser.y < alienColStart - 4 then
                laser.alive = false
            end
        end
    )
end

function cleanupLasers()
    local lasersToRemove = {}
    for i=1,#lasers do
        if lasers[i].alive == false then
            add(lasersToRemove,i)
        end
    end
    foreach(
        lasersToRemove,
        function(laserIdx)
            del(lasers,lasers[laserIdx])
        end
    )
end