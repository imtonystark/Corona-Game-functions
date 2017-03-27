------------------------------------------------------------------------------
-- Sphere - Drawing a sphere in Lua with the Corona SDK. 
-- Coded by : Jesse L Blum
-- Revised 3/27/2017
--
-----------------------------------------------------------------------------
_H   = math.floor( display.actualContentHeight + 0.5 )
_W  = math.floor( display.actualContentWidth + 0.5 )

local n = 20
local arrayX = { }
local arrayY = { }
local arrayZ = { }
local alpha = 0
Pi = -3.141593
radius = 250
local widthSegments = 100
local heightSegments = 100

sphere = display.newGroup()
for i = 0, n do
    for j = 0, n do
        phi = i * 2 * Pi / n
        theta = j * 2 * Pi / n
        arrayX[j] = radius * math.cos(phi)
        arrayY[j] = radius * math.sin(phi) * math.cos(theta)
        arrayZ[j] = radius * math.sin(phi) * math.sin(theta)
    
	line = display.newRect(arrayY[j]+_W*.5,arrayX[j]+_H*.5,6,6)
	--line:setStrokeColor( 0, 0, 0, 0 )
	line.strokeWidth = 1
	line.alpha=arrayZ[j]/360
	end
	end

