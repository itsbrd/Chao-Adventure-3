import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx = playdate.graphics
local start = 0

x = 2760
y = 1278
onStartScreen=0
sideX = 200
sideY = 486


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

  playdate.timer.performAfterDelay(0000, addGrid)
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
  addMail()
  walkNormal2()
end

function walkLeft()
  dbm:moveTo(x+100,y)
  side:moveTo(sideX,sideY)
  playdate.timer.performAfterDelay(500, walkNormal)
end

function walkNormal()
  dbm:moveTo(x,y)
  side:moveTo(sideX,sideY-244)
  playdate.timer.performAfterDelay(500, walkRight)
end

function walkRight()
dbm:moveTo(x-100,y)
side:moveTo(sideX,sideY-488)
playdate.timer.performAfterDelay(500, walkNormal2)
end

function walkNormal2()
dbm:moveTo(x,y)
side:moveTo(sideX,sideY-732)
playdate.timer.performAfterDelay(500, walkLeft)
end

function connect()
  local attempt_image = gfx.image.new('dd.png')
  attempt = gfx.sprite.new( attempt_image )
  attempt:moveTo(100,120)
  attempt:add()
end

function playdate.update()


  gfx.sprite.update() -- need to update and render your sprites

  if start==0 then
    addChaoSheet()
    start=1
  end

  playdate.timer.updateTimers()
end