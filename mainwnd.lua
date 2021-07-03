local GUI = require("GUI")
local system = require("System")
local workspace,window,menu=system.addWindow(GUI.filledWindow(1,1,120,40,0xE1E1E1))
local layout=window:addChild(GUI.layout(2,2,window.width,window.height,3,2))
layout:setRowHeight(1,GUI.SIZE_POLICY_RELATIVE,0.8)
local contextMenu=menu:addContextMenuItem("File")
contextMenu:addItem("quit").onTouch=function()
    window:remove()
end
local vlist1=layout:setPosition(1,1,layout:addChild(GUI.list(3, 2, 25, 25, 2, 0, 0xFFFFFF, 0x4B4B4B, 0xD2D2D2, 0x4B4B4B, 0x3366CC, 0xFFFFFF, false)))
btn1=layout:setPosition(1, 2, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 2")))
local vlist2=layout:setPosition(2,1,layout:addChild(GUI.list(3, 2, 25, 25, 2, 0, 0xFFFFFF, 0x4B4B4B, 0xD2D2D2, 0x4B4B4B, 0x3366CC, 0xFFFFFF, false)))
for i=1,6 do
    vlist1:addItem("empty")
    vlist2:addItem("empty")
end

window.onResize = function ( newWidth,newHeight )
    window.backgrondPanel.width,window.backgrondPanel.height=newWidth,newHeight
    layout.width,layout.height=newWidth,newHeight
end

workspace:draw()
workspace:start()