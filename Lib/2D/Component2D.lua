local Vector2 = require "Lib/Tools/Vector2"
local Rectangle = require "Lib/Tools/Rectangle"

Component2D = {position = Vector2.new(0,0), body = Rectangle.new(Vector2.new(0,0), 64, 64)}
Component2D.__index = Component2D

function Component2D.new(params)
    local o = setmetatable({}, Component2D)
    o.position = params.position
    o.body = params.body
    o.spritesheet = params.spritesheet
    o.srcRectangle = params.srcRectangle or Rectangle.new(0,0, o.spritesheet:getDimensions())
    return o
end

function Component2D:initialize()

end

function Component2D:update(dt)

end

function Component2D:draw()

end

return Component2D