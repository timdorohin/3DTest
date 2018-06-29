local vec3 = class:extend()

function vec3:new(x, y, z)
    self.x = x or 0
    self.y = y or 0
    self.z = z or 0
end

function vec3:p()
    print(self.x, self.y, self.z)
end

function vec3:__unm(a)
    local x = -a.x
    local y = -a.y
    local z = -a.z
    return vec3(x, y, z)
end

function vec3:__mul(a)
    if type(a) == "number" then
        local x = self.x * a
        local y = self.y * a
        local z = self.z * a
        return vec3(x, y, z)
    else
        local c = self.x * a.x + self.y * a.y + self.z * a.z
        return c
    end
end

function vec3:__add(a)
    local x = self.x + a.x
    local y = self.y + a.y
    local z = self.z + a.z
    return vec3(x, y, z)
end

function vec3:__sub(a)
    local x = self.x - a.x
    local y = self.y - a.y
    local z = self.z - a.z
    return vec3(x, y, z)
end

function vec3:__pow(a)
    local x = self.y * a.z - self.z * a.y
    local y = self.z * a.x - self.x * a.z
    local z = self.x * a.y - self.y * a.x
    return vec3(x, y, z)
end

function vec3:__div(a)
    local x = self.x / a
    local y = self.y / a
    local z = self.z / a
    return vec3(x, y, z)
end

function vec3:len()
    return math.sqrt(self.x ^ 2 + self.y ^ 2 + self.z ^ 2)
end

function vec3:unit()
    return self / self:len()
end

return vec3
