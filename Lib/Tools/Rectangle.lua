Vector2 =   require "Lib/Tools/Vector2"

local Rectangle = {position = Vector2.zero(), width = 0, height = 0}

function Rectangle.new(pos, w, h)
    local o = setmetatable({}, {__index = Rectangle})
    o.position = pos
    o.width = w
    o.height = h
    return o
end

function Rectangle:getTop()
    return self.position.y
end
function Rectangle:getBottom()
    return self.position.y + self.height
end
function Rectangle:getLeft()
    return self.position.x
end
function Rectangle:getRight()
    return self.position.x + self.width
end

function Rectangle:intersect(other)
    return (other:getLeft() < self:getRight()) and
    (self:getLeft() < other:getRight()) and
    (other:getTop() < self:getBottom()) and
    (self:getTop() < other:getBottom())
end

return Rectangle
