local mat4 = class:extend()

function mat4:new(a)
    if a then
        self[1] = {unpack(a[1])}
        self[2] = {unpack(a[2])}
        self[3] = {unpack(a[3])}
        self[4] = {unpack(a[4])}
    else
        self[1] = {1, 0, 0, 0}
        self[2] = {0, 1, 0, 0}
        self[3] = {0, 0, 1, 0}
        self[4] = {0, 0, 0, 1}
    end
end

function mat4:__mul(a)
    if a:is(mat4) then
        local c = {{}, {}, {}, {}}
        for i = 1, 4 do
            for j = 1, 4 do
                local d = 0
                for k = 1, 4 do
                    d = d + a[i][k] * self[k][j]
                end
                c[i][j] = d
            end
        end
        return mat4(c)
    elseif a:is(vec3) then
        local x, y, z, f
        x = self[1][1] * a.x + self[1][2] * a.y + self[1][3] * a.z + self[1][4] * 1
        y = self[2][1] * a.x + self[2][2] * a.y + self[2][3] * a.z + self[2][4] * 1
        z = self[3][1] * a.x + self[3][2] * a.y + self[3][3] * a.z + self[3][4] * 1
        f = 1 - z / camera
        x = x / f
        y = y / f
        z = z / f
        return vec3(x, y, z)
    end
end

function mat4:__add(a)
    local c = {{}, {}, {}, {}}
    for i = 1, 4 do
        for j = 1, 4 do
            c[i][j] = self[i][j] + a[i][j]
        end
    end
    return mat4(c)
end

function mat4:__sub(a, b)
    local c = {{}, {}, {}, {}}
    for i = 1, 4 do
        for j = 1, 4 do
            c[i][j] = self[i][j] - a[i][j]
        end
    end
    return mat4(c)
end

function mat4:rt(x, y, z)
    local cosa, sina
    local mx = mat4()
    cosa = math.cos(x)
    sina = math.sin(x)
    mx[2] = {0, cosa, -sina, 0}
    mx[3] = {0, sina, cosa, 0}
    local my = mat4()
    cosa = math.cos(y)
    sina = math.sin(y)
    my[1] = {cosa, 0, sina, 0}
    my[3] = {-sina, 0, cosa, 0}
    local mz = mat4()
    cosa = math.cos(z)
    sina = math.sin(z)
    mz[1] = {cosa, -sina, 0, 0}
    mz[2] = {sina, cosa, 0, 0}
    local m = mx * my * mz
    return m
end

function mat4:sc(x, y, z)
    local m = mat4()
    m[1][1] = x
    m[2][2] = y
    m[3][3] = z
    return m
end

function mat4:tr(x, y, z)
    local m = mat4()
    m[1][4] = x
    m[2][4] = y
    m[3][4] = z
    return m
end

function mat4:p()
    print(unpack(self[1]))
    print(unpack(self[2]))
    print(unpack(self[3]))
    print(unpack(self[4]))
end

return mat4
