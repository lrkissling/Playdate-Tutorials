import "giant"
import "goblin"

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
	local randomEnemyType = math.random(1, 10)
	if randomEnemyType == 10 then
		Giant(430, spawnPosition)
	else
		Goblin(430, spawnPosition)
	end
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