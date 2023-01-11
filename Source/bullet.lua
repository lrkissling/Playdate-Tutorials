local pd <const> = playdate
local gfx <const> = pd.graphics

class('Bullet').extends(gfx.sprite)

-- create image of the bullet
local bulletRadius = 4
local bulletImage = gfx.image.new(bulletRadius * 2, bulletRadius * 2)
gfx.pushContext(bulletImage)
	gfx.drawCircleAtPoint(bulletRadius, bulletRadius, bulletRadius)
gfx.popContext()

function Bullet:init(x, y, speed)
	self:setImage(bulletImage)
	self:setCollideRect(0, 0, self:getSize())
	self.speed = speed
	self:moveTo(x, y)
	self:add()
end

function Bullet:update()
	local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.speed, self.y)
	if length > 0 then
		for index, collision in pairs(collisions) do
			local collidedObject = collision['other']
			if collidedObject:isa(Enemy) then
				collidedObject:remove()
				incrementScore()
				setShakeAmount(5)
			end
		end
		self:remove()
	elseif actualX > 400 then
		self:remove()
	end
end