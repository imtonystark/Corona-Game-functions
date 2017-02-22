------------------------------------------------------------------------------
-- statusbar.lua
-- Description :  Simple "power level" status bars for player health or other
-- game purposes - Corona SDK.
-- Code By : Jesse L Blum
-- Revised 2/22/2017
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Usage : statusBar( barid, x , y , col , rot )
-- barid = Label for individual power status bars
-- x,y = x and y screen positions 
-- h,w = display box height and width
-- color = 1, 2, 3, or 4
------------------------------------------------------------------------------


function statusBar(barid,x,y, barWidth, barHeight, color)

--------------------------------------
-- Corona Color Values
--------------------------------------
if color == 1 then            -- RED
	col = {0.68,0,0,1.00}
elseif
	color == 2 then			  -- BLUE
	col = {0,0,0.52,1.00}
elseif 
	color == 3 then			  -- GREEN
	col = {0.00,0.36,0.00,1.00}
elseif 
	color == 4 then			  -- YELLOW	
	col = {1,1,0,1.00}
else
	col = 0
end

local displayGroup = display.newGroup()
local barLabel = display.newText(tostring(barid), x , y *.90, "ArcadeClassic.ttf", 35)
barLabel:setFillColor(  0.72, 0.9, 0.16, 0.78 )

statusbar = display.newRoundedRect(x , y, barWidth , barHeight, 10)
statusbar.x = x
statusbar.y= y
statusbar.strokeWidth=3
statusbar:setFillColor(0)
statusbar:setStrokeColor(0,0.63,.62,1)
statusbar.name = barid
local spacer = 0 

for i = 1, 8 do                             

	local levelBar = display.newRoundedRect(statusbar.x, statusbar.y, barHeight *.94 ,barWidth*.105,3)
	levelBar.name = barid
	levelBar.y = statusbar.y
	levelBar.x = (statusbar.x - statusbar.contentWidth/2 - 14) + ((statusbar.contentWidth/8-1)) * i
	levelBar.strokeWidth=1
	levelBar:setFillColor(col[1],col[2],col[3],col[4])
	levelBar:setStrokeColor(0,.63,.62,1)
	levelBar.rotation=90
end

end

-------------------------------------------------
-- Example function call
-------------------------------------------------
statusBar("Status  Bar  Label", display.contentWidth/2,display.contentHeight/2, 300 , 150, 4)
-------------------------------------------------