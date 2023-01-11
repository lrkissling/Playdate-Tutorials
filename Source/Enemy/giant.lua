import "enemy"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Giant').extends(Enemy)

function Giant:init(x, y)
	local giantImage = gfx.image.new('Images/giant')
	Giant.super.init(self, x, y, giantImage)
	
	self.moveSpeed = 2
	self.health = 2
end