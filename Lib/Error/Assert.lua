local Vector2       = require   "Lib/Tools/Vector2"
local Rectangle     = require   "Lib/Tools/Rectangle"

Assert = {}
Assert.__index = Assert

function Assert.isPositiveNumber(params)
    if type(params.value) ~= "number" then
        error(("The variable \"%s\" is not a number type, your type is %s"):format(params.name, tostring(params.value)), 2)
    elseif params.value < 0 then
        error(("The variable \"%s\" is not a positive number, your value is %s"):format(params.name, tostring(params.value)), 2)
    end
end

function Assert.isInteger(params)
    if params.value ~= math.floor(params.value) then
        error(("The variable \"%s\" is not a integer, your value is %s"):format(params.name, tostring(params.value)), 2)
    end
end

function Assert.isPositiveInteger(params)
    Assert.isPositiveNumber(params)
    Assert.isInteger(params)
end

function Assert.isVector2(params)
    if not Vector2.isVector2(params.value) then
        error(("The variable \"%s\" is not a Vector2 instance, your type is %s"):format(params.name, tostring(params.value)), 2)
    end
end

function Assert.isRectangle(params)
    if not Rectangle.isRectangle(params.value) then
        error(("The variable \"%s\" is not a Rectangle instance, your type is %s"):format(params.name, tostring(params.value)), 2)
    end
end

return Assert