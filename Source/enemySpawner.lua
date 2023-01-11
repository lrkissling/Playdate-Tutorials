import "enemy"

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer
local offset = 16

function startSpawner()
	math.randomseed(pd.getSecondsSinceEpoch())
	createTimer()
end

function createTimer()
	local spawnTime = math.random(500, 1000)
	spawnTimer = pd.timer.performAfterDelay(spawnTime, function()
		createTimer()
		spawnEnemy()
	end)
end

function spawnEnemy()
	local spawnPosition = math.random(offset, 240 - offset)
	Enemy(430, spawnPosition, 1)
end

function stopSpawner()
	if spawnTimer then
		spawnTimer:remove()
	end
end

function clearEnemies()
	local allSprites = gfx.sprite.getAllSprites()
	for index, sprite in ipairs(allSprites) do
		if sprite:isa(Enemy) then
			sprite:remove()
		end
	end
end