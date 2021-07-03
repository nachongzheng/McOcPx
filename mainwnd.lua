local GUI = require("GUI")
local system = require("System")
local workspace,window,menu=system.addWindow(GUI.filledWindow(1,1,120,40,0xE1E1E1))
local layout=window:addChild(GUI.layout(1,1,window.width,window.height,1,1))
local contextMenu=menu:addContextMenuItem("File")
contextMenu:addItem("quit").onTouch=function()
    window:remove()
end


window.onResize = function ( newWidth,newHeight )
    window.backgrondPanel.width,window.backgrondPanel.height=newWidth,newHeight
    layout.width,layout.height=newWidth,newHeight
end

workspace:draw()
workspace:start()