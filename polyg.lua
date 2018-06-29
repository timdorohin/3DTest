local poly = class:extend()

function poly:new(a, b, c)
    self[1] = a
    self[2] = b
    self[3] = c
end

function poly:normal()
    local norm = ((self[2] - self[1]) ^ (self[3] - self[1])):unit()
    norm = vec3(0, 0, 1) * norm
    return norm
end

function poly:draw()
    local normal = self:normal()
    if normal > 0 then
        love.graphics.setColor(normal, normal, normal, 1)
        --love.graphics.line(25*self[2].x+100, 25*self[2].y+75, 25*norm.x+100, 25*norm.y+75)
        love.graphics.polygon(
            "fill",
            25 * self[1].x + 100,
            25 * self[1].y + 75,
            25 * self[2].x + 100,
            25 * self[2].y + 75,
            25 * self[3].x + 100,
            25 * self[3].y + 75
        )
        love.graphics.setColor(1, 1, 1, 1)
    end
end

return poly
