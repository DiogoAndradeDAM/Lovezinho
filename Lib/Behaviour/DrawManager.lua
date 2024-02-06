local DrawManager = {layers = {}}
DrawManager.__index = DrawManager

function DrawManager.new(layers)
    local o = setmetatable({}, DrawManager)
    o.layers = {}
    for i=1, layers do
        o.layers[i] = {}
    end
    return o
end

function DrawManager:draw()
    for i=1, #self.layers do
        for j=1, #self.layers[i] do
            if self.layers[i][j] ~= nil then
                self.layers[i][j]:draw()
            end
        end
    end
end

function DrawManager:add(params)
    assert(params.value ~= nil, "The value passed in DrawManager is nil type")
    -- assert(type(params.layer) == "number", "The layer passed in DrawManager is not a number type")
    table.insert(self.layers[params.layer], params.value)
end

function DrawManager:addFirst(params)
    table.insert(self.layers[params.layer], 1,  params.value)
end

function DrawManager:remove(params)

end

function DrawManager:clearLayer(layer)
    assert(type(layer) == "number", "The layer passed in DrawManager is not a number type")
    self.layers[layer] = {}
end

function DrawManager:clear()
    self.layers = {}
end

return DrawManager