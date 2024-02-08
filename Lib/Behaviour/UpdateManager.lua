local UpdateManager = {objList = {}}
UpdateManager.__index = UpdateManager

function UpdateManager.new()
    local o = setmetatable({}, UpdateManager)
    o.objList = {}
    return o
end

function UpdateManager.isUpdateManager(value)
    if getmetatable(value) == UpdateManager then
        return true
    else
        return false
    end
end

function UpdateManager:update(dt)
    for key, value in ipairs(self.objList) do
        value.update(dt)
    end
end

function UpdateManager:add(obj)
    assert(obj ~= nil, "ERROR: The value passed in UpdateManager:add is nil")
    table.insert(self.objList, obj)
end

function UpdateManager:addFirst(obj)
    assert(obj ~= nil, "ERROR: The value passed in UpdateManager:addFirst is nil")
    table.insert(self.objList, 1, obj)
end

function UpdateManager:remove(obj)
    assert(obj ~= nil, "ERROR: The value passed in UpdateManager:remove is nil")
    for key, value in pairs(self.objList) do
        if value == obj then
            table.remove(self.objList, key)
            break
        end
    end
end

function UpdateManager:removeFirst()
    table.remove(self.objList, 1)
end

function UpdateManager:clear()
    self.objList = {}
end

return UpdateManager