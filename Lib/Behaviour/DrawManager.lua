local DrawManager = {}

function DrawManager.new(params)
    local o = setmetatable({}, DrawManager)
    o.__index = DrawManager
    o.layers = {}
    for key, value in pairs(params.layers) do
        o.layers[key] = {}
    end
    return o
end

function DrawManager:draw()

end

function DrawManager:add(params)

end
function DrawManager:remove(params)

end

function DrawManager:clearLayer(layer)

end

function DrawManager:clear()
    
end