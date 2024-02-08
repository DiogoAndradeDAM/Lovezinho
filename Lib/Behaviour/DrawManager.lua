local Assert    =   require "Lib/Error/Assert"

local DrawManager = {layers = {}}
DrawManager.__index = DrawManager

function DrawManager.new(layers)
    Assert.isPositiveInteger({value = layers, name = "layers"})
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
    assert(params.value ~= nil, "ERROR: The value passed in DrawManager:add is a nil type")
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    table.insert(self.layers[params.layer], params.value)
end

function DrawManager:addFirst(params)
    assert(params.value ~= nil, "ERROR: The value passed in DrawManager:addFirst is a nil type")
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    table.insert(self.layers[params.layer], 1,  params.value)
end

function DrawManager:remove(params)
    assert(params.value ~= nil, "ERROR: The value passed in DrawManager:remove is a nil type")
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    for i = 1, #self.layers[params.layer] do
        if self.layers[params.layer][i] == params.value then
            table.remove(self.layers[params.layer], i)
        end
    end
end

function DrawManager:removeFirst(params)
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    table.remove(self.layers[params.layer], 1)
end

function DrawManager:clearLayer(layer)
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    self.layers[layer] = {}
end

function DrawManager:clear()
    self.layers = {}
end

return DrawManager