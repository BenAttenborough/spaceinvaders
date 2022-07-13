function drawShields()
    local sheildTopY = 90
    local sheildLeftX = 20
    drawShield(sheildTopY, sheildLeftX)
    drawShield(sheildTopY, sheildLeftX+32)
    drawShield(sheildTopY, sheildLeftX+64)
end

function drawShield(sheildTopY, sheildLeftX)
    spr(shieldSpr,sheildLeftX,sheildTopY)
    spr(shieldSpr+1,sheildLeftX+spriteWidth,sheildTopY)
    spr(shieldSpr+2,sheildLeftX+spriteWidth*2,sheildTopY)
    spr(shieldSpr+1,sheildLeftX,sheildTopY+spriteHeight)
    spr(57,sheildLeftX+spriteWidth,sheildTopY+spriteHeight)
    spr(shieldSpr+1,sheildLeftX+spriteWidth*2,sheildTopY+spriteHeight)
end