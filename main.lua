Vector2     =       require     "Lib/Tools/Vector2"
Rectangle     =       require     "Lib/Tools/Rectangle"
Mathf   =            require    "Lib/Tools/Mathf"
Component2D   =            require    "Lib/2D/Component2D"
DrawManager   =            require    "Lib/Behaviour/DrawManager"
UpdateManager   =            require    "Lib/Behaviour/UpdateManager"

function love.load()
    player = Rectangle.new(Vector2.new(10,10), 50, 50)
    other = Rectangle.new(Vector2.new(100,10), 50, 50)
    color = {1,0,0,1}
    corpse = Component2D.new({
        position = Vector2.new(200, 200),
        body = player,
        color = {1,0,0,1}
    })
    corpse2 = Component2D.new({
        position = Vector2.new(240, 200),
        body = player,
        color = {0,1,0,1}
    })
    myUpdateManager = UpdateManager.new()
    myDrawManager = DrawManager.new(5)
    myUpdateManager:add(corpse)
    myDrawManager:add({layer = 1, value = corpse})
    myDrawManager:add({layer = 2, value = corpse2})
end

function love.update(dt)
    if love.keyboard.isDown("d") then
        corpse.position.x = corpse.position.x + (200 * dt)
    end
    if love.keyboard.isDown("a") then
        corpse.position.x = corpse.position.x - (200 * dt)
    end

    if love.keyboard.isDown("x") then
        player:inflate(20, 20)
    end
    if love.keyboard.isDown("z") then
        player:inflate(-20, -20)
    end

    myUpdateManager:update(dt)
    

    if other:intersect(player) then
        color = {0,1,0,1}
    else
        color = {1,0,0,1}
    end

end

function love.draw()
    -- love.graphics.setColor(color)
    -- love.graphics.rectangle("fill", player.position.x, player.position.y, player.width, player.height)
    -- love.graphics.setColor({0,0,1,1})
    -- love.graphics.rectangle("fill", other.position.x, other.position.y, other.width, other.height)
    myDrawManager:draw()
end