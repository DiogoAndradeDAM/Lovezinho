local Mathf = {}

function Mathf.clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    end
    return value
end


return Mathf