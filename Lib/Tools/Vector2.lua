Mathf   =   require "Lib/Tools/Mathf"


local Vector2 = {x=0, y=0}
Vector2.__index = Vector2;

function Vector2.new(x, y)
    local o = setmetatable({}, Vector2)
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

function Vector2.isVector2(value)
    if getmetatable(value) ~= Vector2 then
        return false
    else
        return true
    end
end

function Vector2:distance(other)
    local vx = self.x - other.x
    local vy = self.y - other.y
    return math.sqrt((vx * vx) + (vy * vy))
end

function Vector2:clamp(min, max)
    self.x = Mathf.clamp(self.x, min.x, max.x)
    self.y = Mathf.clamp(self.y, min.y, max.y)
end

function Vector2:normalize()
    local norm = 1.00 / Mathf.normalize(self.x, self.y)
    return Vector2.new(self.position.x * norm, self.posiiton.y * norm)
end

function Vector2:scale(scale)
    self.x = self.x * scale
    self.y = self.y * scale
end

function Vector2:inverse()
    self.x = self.x * -1
    self.y = self.y * -1
end

function Vector2:translateVec(vector)
    self.position = self.position + vector
end

function Vector2:translate(x, y)
    self.position.x = self.position.x + x
    self.position.y = self.position.y + y
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
    return ("Vector2(X: %d, Y: %d)"):format(self.x, self.y)
end

return Vector2