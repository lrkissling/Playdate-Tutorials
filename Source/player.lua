import "bullet"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y)
	local playerImage = gfx.image.new("Images/player")
	self:setImage(playerImage)
	self:moveTo(x, y)
	self:add()
	
	self.speed = 3
	self.offset = 16
end

function Player:update()
	-- handle up/down player movement
	if pd.buttonIsPressed(pd.kButtonUp) then
		if self.y > 0 + self.offset then
			self:moveBy(0, -self.speed)
		end
	elseif pd.buttonIsPressed(pd.kButtonDown) then
		if self.y < 240 - self.offset then
			self:moveBy(0, self.speed)
		end
	end
	
	-- handle bullet firing
	if pd.buttonJustPressed(pd.kButtonA) then
		Bullet(self.x + self.offset, self.y, 5)
	end
end