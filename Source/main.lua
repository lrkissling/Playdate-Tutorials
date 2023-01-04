import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/tiemr"

local pd <const> = playdate
local gfx <const> = pd.grahics

local function initialize()
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end