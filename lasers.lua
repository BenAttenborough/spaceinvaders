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
    foreach(
        lasers,
        function(laser) 
            laser.y -= laserSpeed
        end
    )
end

function laserCollision()
end