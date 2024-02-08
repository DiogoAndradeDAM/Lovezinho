local UpdateManager     =   require "Lib/Behaviour/UpdateManager"
local DrawManager       =   require "Lib/Behaviour/DrawManager"


local Scene = {updateManager = UpdateManager.new(), drawManager = DrawManager.new(1)}
Scene.__index = Scene

--Abstract class

-- function Scene.new(params)
--     local o = setmetatable({}, Scene)
--     o.updateManager = params.updateManager
--     o.drawManager = params.drawManager
--     return o
-- end

function Scene:initialize()
    
end

function Scene:update(dt)
end

function Scene:draw()
end

return Scene