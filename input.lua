function input()
    if (btn(0)) then
        if playerX > screenBoundLeft then
            playerX -= 1
        end
    end
    if (btn(1)) then
        if playerX + playerWidth < screenBoundRight then
            playerX += 1
        end
    end
    if (btnp(5)) then
        sfx(1)
        add(lasers,{
            x = playerX + 4,
            y = playerY,
            alive = true
        })
    end
end