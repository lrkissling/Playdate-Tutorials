local pd <const> = playdate
local gfx <const> = pd.graphics

class('Enemy').extends(gfx.sprite)

function Enemy:init(x, y, image)
	self:setImage(image)
	self:moveTo(x, y)
	self:add()
	
	self:setCollideRect(0, 0, self:getSize())
	
	-- Instance variables to override with subclasses
	self.moveSpeed = 1
	self.health = 1
end

function Enemy:update()
	self:moveBy(-self.moveSpeed, 0)
	if self.x < 0 then
		resetGame()
	end
end

function Enemy:handleBulletCollision()
	self.health -= 1
	if self.health <= 0 then
		self:remove()
		incrementScore()
		setShakeAmount(5)
	else
		setShakeAmount(2)
	end
end

function Enemy:collisionResponse()
	return 'overlap'
end