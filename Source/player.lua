local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y, image)
	self:moveTo(x, y)
	self:setImage(image)
	self.moveSpeed = 1
	self.projectileSpeed = 1
end

function Player:update()
	Player.super.update(self)
	if pd.buttonIsPressed(pd.kButtonLeft) then
		self:moveBy(-self.moveSpeed, 0)
	elseif pd.buttonIsPressed(pd.kButtonRight) then
		self:moveBy(self.moveSpeed, 0)
	end
end