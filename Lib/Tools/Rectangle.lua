Vector2 =   require     "Lib/Tools/Vector2"

local Rectangle = {position = Vector2.zero(), width = 0, height = 0}
Rectangle.__index = Rectangle

function Rectangle.new(pos, w, h)
    local o = setmetatable({}, Rectangle)
    o.position = pos
    o.width = w
    o.height = h
    return o
end

function Rectangle.isRectangle(rect)
    if getmetatable(rect) ~= Rectangle then
        return false
    else
        return true
    end
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

function Rectangle:inflate(horizontalAmount, verticalAmount)
    self.position.x = self.position.x - horizontalAmount/2
    self.position.y = self.position.y - verticalAmount/2
    self.width = self.width + horizontalAmount
    self.height = self.height + verticalAmount
end

function Rectangle:__add(other)
    return Rectangle.new(self.position, self.width + other.width, self.height + other.height)
end
function Rectangle:__sub(other)
    return Rectangle.new(self.position, self.width - other.width, self.height - other.height)
end

function Rectangle:__tostring()
    return ("Rectangle(X: %d, Y: %d, W: %d, H: %d)"):format(self.position.x, self.position.y, self.width, self.height)
end

return Rectangle
