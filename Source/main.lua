-- Name this file `main.lua`. Your game can use multiple source files if you wish
-- (use the `import "myFilename"` command), but the simplest games can be written
-- with just `main.lua`.

-- You'll want to import these in just about every project you'll work on.

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "healthbar"
import "circle"
import "spike"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
	-- local r = 20
	-- local circleImage = gfx.image.new(r * 2, r * 2)
	-- gfx.pushContext(circleImage)
	-- 	gfx.fillCircleAtPoint(r, r, r)
	-- gfx.popContext()
	-- local circleSprite = gfx.sprite.new(circleImage)
	-- circleSprite:moveTo(200, 120)
	-- circleSprite:add()
	
	local circleSprite = Circle(200, 120, 20)
	circleSprite:add()
	
	local circleSprite2 = Circle(300, 120, 30)
	circleSprite2:add()
	
	local spike = Spike(300, 200)
	spike:add()
	
	local textImage = gfx.image.new(100, 20)
	gfx.lockFocus(textImage)
		gfx.drawText("Glub glub", 0, 0)
	gfx.unlockFocus()
	local textSprite = gfx.sprite.new(textImage)
	textSprite:setZIndex(30)
	textSprite:moveTo(80, 10)
	textSprite:add()
end

initialize()

function pd.update()
	gfx.sprite.update()
end