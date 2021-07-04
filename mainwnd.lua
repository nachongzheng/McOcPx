local GUI = require("GUI")
local system = require("System")
local component = require("component")
local nts=0
local workspace,window,menu=system.addWindow(GUI.filledWindow(1,1,120,40,0xE1E1E1))
local layout=window:addChild(GUI.layout(2,2,window.width,window.height,3,2))
layout:setRowHeight(1,GUI.SIZE_POLICY_RELATIVE,0.8)
local contextMenu=menu:addContextMenuItem("File")
contextMenu:addItem("quit").onTouch=function()
    window:remove()
end
conf={}
conf["ts"]={}
layout:setPosition(1,1,layout:addChild(GUI.text(1, 1, 0x000000, "Select transposer")))
local vlist1=layout:setPosition(1,1,layout:addChild(GUI.list(3, 2, 25, 18, 3, 0, 0xFFFFFF, 0x4B4B4B, 0xD2D2D2, 0x4B4B4B, 0x3366CC, 0xFFFFFF, false)))
btn1=layout:setPosition(1, 2, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Scan all")))
btn2=layout:setPosition(1, 2, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Erase")))
layout:setPosition(2,1,layout:addChild(GUI.text(1, 1, 0x000000, "Select item and fluid")))
local vlist2=layout:setPosition(2,1,layout:addChild(GUI.list(3, 2, 25, 18, 3, 0, 0xFFFFFF, 0x4B4B4B, 0xD2D2D2, 0x4B4B4B, 0x3366CC, 0xFFFFFF, false)))

local on_v1_click=function()
    for i=1,nts do
        vlist1:getItem(nts-i+1):remove()
    end
    nts=0
    conf["ts"]={}
    tsaddr=getallts()
    if tsaddr=={} then
        return
    end
    for i=1,#(tsaddr) do
        vlist1:addItem(tsaddr[i]).onTouch=onList1Touch 
        table.insert( conf["ts"],tsaddr[i])
        nts=nts+1
    end    
end
function getComponentByAddr(addr)
    return component.proxy(addr)
end

btn2.onTouch=function()

end
btn1.onTouch=on_v1_click
function scan(ts)
    -- body
end
function onList1Touch()
    i=vlist1.selectedItem
    addr=conf["ts"][i]
    searchItemNLiquid(addr)
end
function searchItemNLiquid(addr)
    ts=getComponentByAddr(addr)
    for i=1,5 do
        f=ts.getFluidInTank(i)
        if #f~=0 then
            vlist2:addItem(f[1]["name"])
        end
    end
end

function getallts()
    tsadr={}
    tss=component.list("trans")
    for adr,name in pairs(tss) do
        table.insert( tsadr,adr)     
    end
    return tsadr
end
window.onResize = function ( newWidth,newHeight )
    window.backgrondPanel.width,window.backgrondPanel.height=newWidth,newHeight
    layout.width,layout.height=newWidth,newHeight
end

workspace:draw()
workspace:start()