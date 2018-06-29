function love.load()
    class = require "classic"
    vec3 = require "vec3"
    mat4 = require "mat4"
    poly = require "polyg"
    camera = 1000
    points = {
        vec3(-1, -1, -1),
        vec3(1, -1, -1),
        vec3(-1, 1, -1),
        vec3(1, 1, -1),
        vec3(-1, -1, 1),
        vec3(1, -1, 1),
        vec3(-1, 1, 1),
        vec3(1, 1, 1)
    }
    pnew = {}
    rx = 0
    ry = 0
    rz = 0
    canvas = love.graphics.newCanvas(200,150)
end

function love.update(dt)
    if love.keyboard.isDown("up") then
        rz = rz + dt
    elseif love.keyboard.isDown("down") then
        rz = rz - dt
    end
    if love.keyboard.isDown("right") then
        ry = ry + dt
    elseif love.keyboard.isDown("left") then
        ry = ry - dt
    end
    if love.keyboard.isDown(",") then
        rx = rx + dt
    elseif love.keyboard.isDown(".") then
        rx = rx - dt
    end
    local rotate = mat4:rt(rx, ry, rz)
    for i = 1, 8 do
        pnew[i] = rotate * points[i]
    end
end

function love.draw()
    love.graphics.setCanvas( canvas )
    love.graphics.clear()
    love.graphics.setLineStyle('rough')
    poly(pnew[1],pnew[2],pnew[3]):draw()
    poly(pnew[2],pnew[4],pnew[3]):draw()
    poly(pnew[1],pnew[3],pnew[5]):draw()
    poly(pnew[5],pnew[3],pnew[7]):draw()
    poly(pnew[1],pnew[5],pnew[6]):draw()
    poly(pnew[2],pnew[1],pnew[6]):draw()
    poly(pnew[3],pnew[4],pnew[7]):draw()
    poly(pnew[4],pnew[8],pnew[7]):draw()
    poly(pnew[2],pnew[6],pnew[4]):draw()
    poly(pnew[4],pnew[6],pnew[8]):draw()
    poly(pnew[5],pnew[7],pnew[8]):draw()
    poly(pnew[8],pnew[6],pnew[5]):draw()

    love.graphics.setCanvas()
    love.graphics.draw(canvas,0,0,0,4,4)

end
