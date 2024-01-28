local Mathf = {}

function Mathf.clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    end
    return value
end

function Mathf.normalize(x, y)
    return math.sqrt((x*x) + (y*y))
end


return Mathf