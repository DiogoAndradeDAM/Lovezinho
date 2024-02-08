KeyboardState = require "Lib/Input/Keyboard/KeyboardState"

local KeyboardManager = {prevState = KeyboardState.new({}), currState = KeyboardState.new({}), keys = {}}
KeyboardManager.__index = KeyboardManager

function KeyboardManager.init(keys)
    local o = setmetatable({}, KeyboardManager)
    KeyboardManager.keys = keys
    KeyboardManager.prevState = KeyboardState.new(keys)
    KeyboardManager.currState = KeyboardState.new(keys)
end

function KeyboardManager.update()
    KeyboardManager.prevState = KeyboardManager.currState
    KeyboardManager.currState = KeyboardState.new(KeyboardManager.keys)
end

function KeyboardManager.isKeyPressed(key)
    return (KeyboardManager.currState[key])
end

function KeyboardManager.isKeyOnePressed(key)
    return KeyboardManager.currState[key] and not KeyboardManager.prevState[key]
end

function KeyboardManager.isKeyReleased(key)
    return not KeyboardManager.currState[key] and KeyboardManager.prevState[key]
end

return KeyboardManager
