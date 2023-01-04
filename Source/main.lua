import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "giant"
import "knight"
import "wizard"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
	local playerInstance = Wizard(200, 200)
	playerInstance:add()
	
	local name = playerInstance.className --name == "Wizard"
	local isGiant = playerInstance:isA(Giant) -- false
	local isWizard = playerInstance:isA(Wizard) -- true
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end