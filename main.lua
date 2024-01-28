Vector2     =       require     "Lib/Tools/Vector2"
Rectangle     =       require     "Lib/Tools/Rectangle"

function love.load()
    player = Rectangle.new(Vector2.new(10,10), 50, 50)
    other = Rectangle.new(Vector2.new(100,10), 50, 50)
    color = {1,0,0,1}
end

function love.update(dt)
    if love.keyboard.isDown("d") then
        player.position.x = player.position.x + (200 * dt)
    end
    if love.keyboard.isDown("a") then
        player.position.x = player.position.x - (200 * dt)
    end

    if other:intersect(player) then
        color = {0,1,0,1}
    else
        color = {1,0,0,1}
    end

    print(player:getLeft() .. " - " .. player:getRight() .. " | " .. player:getTop() .. " - " .. player:getBottom())
end

function love.draw()
    love.graphics.setColor(color)
    love.graphics.rectangle("fill", player.position.x, player.position.y, player.width, player.height)
    love.graphics.setColor({0,0,1,1})
    love.graphics.rectangle("fill", other.position.x, other.position.y, other.width, other.height)
end