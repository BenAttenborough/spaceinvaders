-- Set your logfile in Globals
function debugLog(str, overwrite)
   overwrite = overwrite or false
   printh(str, logfile, overwrite)
end

function debugOutput()
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
    print("furthest alien left = " .. furthestAlienLeft)
    print("alienRowRightEdgeX = " .. alienRowRightEdgeX)
    line(
        screenBoundLeft, 0,
        screenBoundLeft, 128,
        8
    )
    line(
        screenBoundRight, 0,
        screenBoundRight, 128,
        8
    )
end