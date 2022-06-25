function makeAliens()
    local alienCols = 11
    local alienRows = 5
    local row = {}
    local data = {}
    local alienType = 1
    for i = 1,(alienRows) do 
        for j = 1,(alienCols) do
            -- drawAlien(alienType,alienRowStart + (j*spriteWidth),(i*spriteHeight)+(i*alienRowBuffer))        
            add(
                row, 
                {
                    type = alienType,
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

function getFurthestRightAlien(aliens)
    furthestRight = 0
    for i = 1,(#aliens) do 
        for j = 1,(#aliens[i]) do
            if j > furthestRight and aliens[i][j].alive then
                furthestRight = j
            end
        end
    end
    return furthestRight
end