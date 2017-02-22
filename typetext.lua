------------------------------------------------------------------------------
-- typetext.lua
-- Description : An implementation of the "typer" style typewriter text 
-- function for Corona SDK. 
-- Code By : Jesse L Blum
-- Revised 2/20/2017
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Usage : dialogMessage( msgIndex,x,y,h,w,fontsize)
-- msgIndex = text to display
-- x,y = x and y screen positions 
-- h,w = display box height and width
-- fontsize = Size of font, defaults to 18 if no argument passed
------------------------------------------------------------------------------

local keySound = audio.loadSound("keysound.wav") -- Pre-load key press Sound
local MSGTABLE = {}								 -- Sample table of Strings
local space = "		"							 -- insert tab when desired

----------------------------------
--Sample table of text to display
----------------------------------
MSGTABLE[1] =  " ".. space .. "GAME SYSTEM MESSAGE DIALOG                  \n" ..
			 "-----------------------------------------------------------\n"   
MSGTABLE[2] = "This is a demonstration of a game dialog message box. " ..
			  "Displayed text in this demo is passed to function from " ..
			  "a string, or table (array) of strings. "
--			{ }, 
--			{ }
----------------------------------  
----------------------------------

                                                                   
function dialogMessage(msgIndex,x,y,h,w,fontsize)
 height = h
 width = w
textHeight = height * .85
textWidth = width * .85

if fontsize == nil then
fontsize = 18
end

local boxImage = io.open("msgBox.png","r")

if (boxImage) then
	msgBox = display.newImageRect("msgBox.png", width, height)
	msgBox.x = x
	msgBox.y = y
else   
	msgBox = display.newRoundedRect(x,y,width,height,10)
	msgBox.strokeWidth=5
	msgBox:setFillColor(0)
	msgBox:setStrokeColor(0,0.63,.62,1.00)
end
local msgText = display.newText({
   text="",
   font = "ArcadeClassic.ttf",
   fontSize = fontsize,
   x = msgBox.x,
   y = msgBox.y,
   width = width *.85,
   height = height *.85,
   align = "left"
})


local typerFunction = function(event)
   msgText.text = string.sub(msgIndex .. "  ", 1, event.count)
   audio.play(keySound)
   if ((event.count*fontsize)) == (msgText.width) then
   msgText.text = "\n"
   end
end
local typerTimer = timer.performWithDelay(50, typerFunction, string.len(msgIndex))
msgBox:addEventListener("tap",function()display.remove(msgBox)display.remove(msgText) audio.stop() timer.cancel(typerTimer) end)

end
dialogMessage(MSGTABLE[2],display.contentCenterX,display.contentCenterY,100,400,18)