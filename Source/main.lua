
import "CoreLibs/graphics"

import "CoreLibs/object"

import "CoreLibs/sprites"

import "CoreLibs/nineslice"

import "CoreLibs/timer"

import "CoreLibs/graphics"

import "CoreLibs/ui"

import "CoreLibs/animation"

import "CoreLibs/animator"

import "CoreLibs/crank"

local gfx <const> = playdate.graphics
local start = 0
local timer = 0
local on = false
local stepInc = 0


x = 2760
y = 1278
onStartScreen=0
sideX = 200
sideY = 486
talk=0
chat=false


local menu = playdate.getSystemMenu()

local menuItem, error = menu:addMenuItem("Chao", function()
    print("Item 1 selected")
end)
local menuItem2, error = menu:addMenuItem("Link", function()
  print("Item 1 selected")
end)
local menuItem3, error = menu:addMenuItem("Options", function()
  print("Item 1 selected")
end)


function addChaoSheet()
  local dbm_image = gfx.image.new('chao.png')
  dbm = gfx.sprite.new( dbm_image )
  dbm:moveTo(x,y)
  dbm:add() --adds the sprite to the display list
  startScreen()
end

function startScreen()
  dbm:moveTo(x-4950,y)
  addGrid()
end

function addMail()
  local mail_image = gfx.image.new('mail.png')
  mail = gfx.sprite.new( mail_image )
  mail:moveTo(374,220)
  mail:add() --adds the sprite to the display list
end

function addSides()
  local side_image = gfx.image.new('sides.png')
  side = gfx.sprite.new( side_image )
  side:moveTo(sideX,sideY)
  side:add() --adds the sprite to the display list
end

function addGrid()
  local grid_image = gfx.image.new('grid.png')
  grid = gfx.sprite.new( grid_image )
  grid:moveTo(200,120)
  grid:add() --adds the sprite to the display list

  addSides()
  on=true
end

function drawText()
  gfx.drawText("Amount: ", 100, 100)
end

function addChatBox()
  local chatBox_image = gfx.image.new('chatBox.png')
  chatBox = gfx.sprite.new( chatBox_image )
  chatBox:moveTo(200,80)
  chatBox:add() --adds the sprite to the display list
  chat=true
end

function removeChatBox()
  chatBox:moveTo(999,80)
  chat=false
end


function addTextBox()

end

function walkingLogic()
  if timer % 20 == 0 then
    if stepInc == 0 then
      x=x+100
      dbm:moveTo(x,y)
      side:moveTo(sideX,sideY)
      stepInc = stepInc + 1
    elseif stepInc == 1 then
      x=x-100
      dbm:moveTo(x,y)
      side:moveTo(sideX,sideY-244)
      stepInc = stepInc + 1
    elseif stepInc == 2 then
      x=x-100
      dbm:moveTo(x,y)
      side:moveTo(sideX,sideY-488)
      stepInc = stepInc + 1
    elseif stepInc == 3 then
      x=x+100
      dbm:moveTo(x,y)
      side:moveTo(sideX,sideY-732)
      stepInc = 0
    end
  end
end

function mailLogic()
  if timer==00 then
    addMail()
  end
end


function playdate.update()

  if playdate.buttonJustPressed(playdate.kButtonA) and talk==0 and mail~=nil then
    grid:moveTo(300,200)
    x=x+97
    y=y-28
    sideX=sideX+999
    sideY=sideY+999
    talk=1
    timer=20
    mail:remove()
    addChatBox()
  elseif playdate.buttonJustPressed(playdate.kButtonA) and talk==1 then
    grid:moveTo(200,120)
    x=x-97
    y=y+28
    sideX=sideX-999
    sideY=sideY-999
    talk=0
    timer=20
    removeChatBox()
  end

  if on==true then
    walkingLogic()
    mailLogic()
    timer = timer + 1
    print (timer)
  end

  
  gfx.sprite.update() -- need to update and render your sprites
  if chat==true then
    drawText()
  elseif chat==false then
  gfx.drawText("", 100, 100)
  end

  if start==0 then
    addChaoSheet()
    start=1
  end
end
