Vector2     =       require     "Lib/Tools/Vector2"
Rectangle     =       require     "Lib/Tools/Rectangle"
Mathf   =            require    "Lib/Tools/Mathf"
Component2D   =            require    "Lib/2D/Component2D"
DrawManager   =            require    "Lib/Behaviour/DrawManager"
UpdateManager   =            require    "Lib/Behaviour/UpdateManager"
Assert  =                require        "Lib/Error/Assert"

function love.load()
    local body = Rectangle.new(Vector2.one(), 64, 64)
    Assert.isVector2({value = body, name = "body"})
end

function love.update(dt)
end

function love.draw()

end