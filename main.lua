-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created By Gillian Gonzales
-- Created On April 23 2018
--
-- This code will have gravity to a character 
-----------------------------------------------------------------------------------------

-- Adding Physics
local physics = require( "physics" )

physics.start()
physics.setGravity(0, 50)
--physics.setDrawMode( "hybrid" )

-- Adding Images

local ground1 = display.newImage("./assets/sprites/land1.png")
ground1.x = display.contentCenterX - 500
ground1.y = display.contentHeight - 400
physics.addBody( ground1, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local ground2 = display.newImage("./assets/sprites/land2.png")
ground2.x = display.contentCenterX + 500
ground2.y = display.contentHeight - 100
physics.addBody( ground2, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )



local Ninja = display.newImage( "./assets/sprites/Ninja.png" )
Ninja.x = display.contentCenterX - 900
Ninja.y = display.contentCenterY
Ninja.id = "the character"
Ninja.isFixedRotation = true
physics.addBody( Ninja, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3
    } )


local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 150
dPad.alpha = 0.50
dPad.id = "d-pad"

local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 260
upArrow.id = "up arrow"

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 150
rightArrow.id = "right arrow"

local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 150
leftArrow.id = "left arrow"

local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 40
downArrow.id = "down arrow"



-- Making functions
function upArrow:touch( event )
	-- This function will move the character up
    if ( event.phase == "ended" ) then
        transition.moveBy( Ninja, { 
        	x = 0, 
        	y = -50, 
        	time = 100 
        	} )
    end

    return true
end

function rightArrow:touch( event )
	-- This function will move the character to the right
    if ( event.phase == "ended" ) then
        transition.moveBy( Ninja, { 
        	x = 50, 
        	y = 0, 
        	time = 100 
        	} )
    end

    return true
end

function leftArrow:touch( event )
	-- This function will move the character to the left
    if ( event.phase == "ended" ) then
        transition.moveBy( Ninja, { 
        	x = -50, 
        	y = 0, 
        	time = 100 
        	} )
    end

    return true
end

function downArrow:touch( event )
	-- This function will move the character down
    if ( event.phase == "ended" ) then
        transition.moveBy( Ninja, { 
        	x = 0, 
        	y = 50, 
        	time = 100 
        	} )
    end

    return true
end

upArrow:addEventListener( "touch", upArrow )
rightArrow:addEventListener( "touch", rightArrow )
leftArrow:addEventListener( "touch", leftArrow )
downArrow:addEventListener( "touch", downArrow )
