local Vector2 = require "Lib/Tools/Vector2"
local Rectangle = require "Lib/Tools/Rectangle"



Component2D = {position = Vector2.zero(), body = Rectangle.new(Vector2.zero(), 0, 0), spritesheet = nil, srcRectangle = Rectangle.new(Vector2.zero(), 0,0), depth = 0 }
Component2D.__index = Component2D

--abstract class

-- function Component2D.new(params)
--     local o = setmetatable({}, Component2D)
--     o.position = params.position
--     o.body = params.body
--     o.spritesheet = params.spritesheet
--     o.srcRectangle = params.srcRectangle
--     o.depth = params.depth 
--     return o
-- end

function Component2D:initialize()

end

function Component2D:update(dt)
    print("I'm alive")
end

function Component2D:draw()
    print("I draw myself")
end

return Component2D