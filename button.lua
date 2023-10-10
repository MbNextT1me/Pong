-- button.lua
local Button = {}
Button.__index = Button

function Button.new(x, y, width, height, text, bgImage)
    local self = setmetatable({}, Button)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.selected = false
    self.text = text
    self.bgImage = bgImage
    return self
end


function Button:draw()
    -- Отрисовываем кнопку
    if self.bgImage then
        -- Если кнопка не выбрана, то затемняем
        if self.selected == false then
            love.graphics.setColor(0.7, 0.7, 0.7) -- Устанавливаем темный цвет
            love.graphics.draw(self.bgImage, self.x, self.y, 0, self.width / self.bgImage:getWidth(), self.height / self.bgImage:getHeight())
            love.graphics.setColor(1, 1, 1) -- Восстанавливаем цвет в значение по умолчанию
        else
            love.graphics.draw(self.bgImage, self.x, self.y, 0, self.width / self.bgImage:getWidth(), self.height / self.bgImage:getHeight())
        end
    else
        love.graphics.setColor(1, 1, 1)
        if self.selected then
            love.graphics.setColor(0, 0, 0)
        end
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
        love.graphics.setColor(1, 1, 1)
    end
end



return Button
