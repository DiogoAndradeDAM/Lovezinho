local Vector2 = {x=0, y=0}

function Vector2.new(x, y)
    local o = setmetatable({}, {__index = Vector2})
    o.x = x
    o.y = y
    return o
end

function Vector2.zero()
    return Vector2.new(0,0)
end

function Vector2.one()
    return Vector2.new(1,1)
end

function Vector2:__add(other)
    return Vector2.new(self.x + other.x, self.y + other.y)
end

function Vector2:__sub(other)
    return Vector2.new(self.x - other.x, self.y - other.y)
end

function Vector2:__mul(other)
    return Vector2.new(self.x * other.x, self.y * other.y)
end

function Vector2:__div(other)
    return Vector2.new(self.x / other.x, self.y / other.y)
end

function Vector2:__eq(other)
    return (self.x == other.x) and (self.y == other.y)
end

function Vector2:__lt(other)
    return (self.x < other.x) and (self.y < other.y)
end

function Vector2:__le(other)
    return (self.x <= other.x) and (self.y <= other.y)
end

function Vector2:__unm()
    return Vector2.new(-self.x, -self.y)
end

function Vector2:__tostring()
    return "(X: ".. self.x ..", Y: ".. self.y ..")"
end

return Vector2