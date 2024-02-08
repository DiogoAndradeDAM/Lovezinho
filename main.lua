Vector2         =               require    "Lib/Tools/Vector2"
Rectangle       =               require    "Lib/Tools/Rectangle"
Mathf           =               require    "Lib/Tools/Mathf"
DrawManager     =               require    "Lib/Behaviour/DrawManager"
UpdateManager   =               require    "Lib/Behaviour/UpdateManager"
Scene           =               require    "Lib/Behaviour/Scene"
Component2D     =               require    "Lib/2D/Component2D"
Assert          =               require    "Lib/Error/Assert"
KeyboardManager =               require    "Lib/Input/Keyboard/KeyboardManager"

function love.load()
    KeyboardManager.init({'w', 'a', 'd', 's'})
end

function love.update(dt)
    KeyboardManager.update()

    if KeyboardManager.isKeyOnePressed('d') then
        print("Hello World")
    end
end

function love.draw()
end