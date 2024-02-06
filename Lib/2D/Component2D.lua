local Vector2 = require "Lib/Tools/Vector2"
local Rectangle = require "Lib/Tools/Rectangle"

Component2D = {position = Vector2.new(0,0), body = Rectangle.new(Vector2.new(0,0), 64, 64)}
Component2D.__index = Component2D

function Component2D.new(params)
    local o = setmetatable({}, Component2D)
    o.position = params.position
    o.body = params.body
    o.color = params.color
    return o
end

function Component2D:initialize()

end

function Component2D:update(dt)
    print("I am live")
end

function Component2D:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.body.width, self.body.height)
    love.graphics.setColor({0,0,0,1})
end

return Component2D