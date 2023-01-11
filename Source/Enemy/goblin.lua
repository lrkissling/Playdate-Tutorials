import "enemy"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Goblin').extends(Enemy)

function Goblin:init(x, y)
	local goblinImage = gfx.image.new('Images/goblin')
	Goblin.super.init(self, x, y, goblinImage)
	
	self.moveSpeed = 1
	self.health = 1
end