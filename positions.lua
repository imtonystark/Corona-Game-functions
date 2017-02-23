------------------------------------------------------------------------------
-- positions.lua 
-- Description: A collection of functions for use with object or character
-- positions within a grid based field (example, an 8x8 game board).
-- Coded By: Jesse L Blum
-- Revised: 2/22/2017
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Returns the angle in degrees (0-360) between two points on a grid
-- Usage: compassGrid( x of origin, y of origin, x of target, y of target)
------------------------------------------------------------------------------
function compassGrid(x,y,x2,y2)
local degrees
local currentX=x
local currentY=y
local destY=y2
local destX=x2

  local degrees = ( math.deg( math.atan2( y2-y, x2-x ) )+180 )
   if ( degrees < 0 ) then degrees = degrees + 360 end
   return degrees % 360

end

-------------------------------------------------------------------------------
-- Returns the middle distance point between two points/positions on a grid.
-- Usage: midPoint(x of origin, y of origin, x of target, y of target)
-------------------------------------------------------------------------------
function midPoint(x1,y1,x2,y2)
local val = {}
val[1]= ((x1+x2)/(2))
val[2]= ((y1+y2)/(2))
return val       -- Note, this returns an array as the value. val = { , }
end