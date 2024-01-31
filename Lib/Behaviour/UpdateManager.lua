local UpdateManager = {}

function UpdateManager.new()
    local o = setmetatable({}, UpdateManager)
    o.__index = UpdateManager
    o.objList = {}
    return o
end

function UpdateManager:update(dt)
    for key, value in ipairs(self.objList) do
        value.update(dt)
    end
end

function UpdateManager:add(obj)
    table.insert(self.objList, obj)
end

function UpdateManager:remove(obj)
    for key, value in pairs(self.objList) do
        if value == obj then
            table.remove(self.objList, key)
            break
        end
    end
end

function UpdateManager:clear()
    self.objList = {}
end

return UpdateManager