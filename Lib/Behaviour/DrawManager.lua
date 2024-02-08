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

function DrawManager.isDrawManager(value)
    if getmetatable(value) == DrawManager then
        return true
    else
        return false
    end
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
    assert(params.layer > #self.layers, "ERROR: The layer passed in DrawManager:add is outside of the maximun number of layers")
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    table.insert(self.layers[params.layer], params.value)
end

function DrawManager:addFirst(params)
    assert(params.value ~= nil, "ERROR: The value passed in DrawManager:addFirst is a nil type")
    assert(params.layer > #self.layers, "ERROR: The layer passed in DrawManager:addFirst is outside of the maximun number of layers")
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    table.insert(self.layers[params.layer], 1,  params.value)
end

function DrawManager:remove(params)
    assert(params.value ~= nil, "ERROR: The value passed in DrawManager:remove is a nil type")
    assert(params.layer > #self.layers, "ERROR: The layer passed in DrawManager:remove is outside of the maximun number of layers")
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    for i = 1, #self.layers[params.layer] do
        if self.layers[params.layer][i] == params.value then
            table.remove(self.layers[params.layer], i)
            break
        end
    end
end

function DrawManager:removeFirst(params)
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    assert(params.layer > #self.layers, "ERROR: The layer passed in DrawManager:removeFirst is outside of the maximun number of layers")
    table.remove(self.layers[params.layer], 1)
end

function DrawManager:clearLayer(layer)
    Assert.isPositiveInteger({value = params.layer, name = "params.layer"})
    assert(params.layer > #self.layers, "ERROR: The layer passed in DrawManager:clearLayer is outside of the maximun number of layers")
    self.layers[layer] = {}
end

function DrawManager:clear()
    self.layers = {}
end

return DrawManager