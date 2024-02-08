local KeyboardState = {keys = {}}
KeyboardState.__index = KeyboardState

function KeyboardState.new(keys)
    local o = setmetatable({}, KeyboardState)
    KeyboardState.keys = keys
    for key, value in ipairs(keys) do
        o[value] = love.keyboard.isDown(value)
    end
    return o
end


return KeyboardState