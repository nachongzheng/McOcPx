local GUI = require("GUI")
local system = require("System")
local workspace,window,menu=system.addWindow(GUI.filledWindow(1,1,120,40,0xE1E1E1))
local layout=window:addChild(GUI.layout(1,1,window.width,window.height,1,1))
local contextMenu=menu:addContextMenuItem("File")
contextMenu:addItem("quit").onTouch=function()
    window:remove()
end
local vlist1=layout:setPosition(1,1,layout:addChild(GUI.list(3, 2, 25, 30, 3, 0, 0xE1E1E1, 0x4B4B4B, 0xD2D2D2, 0x4B4B4B, 0x3366CC, 0xFFFFFF, false)))
vlist1:addItem("Hello world")
vlist1:addItem("This is test").onTouch = function()
	GUI.alert("Selected item: " .. verticalList.selectedItem)
end

window.onResize = function ( newWidth,newHeight )
    window.backgrondPanel.width,window.backgrondPanel.height=newWidth,newHeight
    layout.width,layout.height=newWidth,newHeight
end

workspace:draw()
workspace:start()