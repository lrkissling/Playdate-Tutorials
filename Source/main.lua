import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "enemySpawner"
import "scoreDisplay"
import "screenShake"

local pd <const> = playdate
local gfx <const> = pd.graphics

local screenShake = ScreenShake()

local function initialize()
	createScoreDisplay()
	Player(30, 120)
	startSpawner()
end

function resetGame()
	resetScore()
	clearEnemies()
	stopSpawner()
	startSpawner()
	setShakeAmount(10)
end

function setShakeAmount(amount)
	screenShake:setShakeAmount(amount)
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
	screenShake:update()
end