HC = require 'HC'
gravity = require('src/world/gravity')

local player = {}

function player.load()
    player.x = 200
    player.y = 200
    player.width = 16
    player.height = 24

    player.xacc = 1
    player.xspeed = 0
    player.x_maxspeed = 100
    player.yspeed = 0
    player.y_maxspeed = 800

    player.movingleft = false
    player.movingright = false

    player.hitbox = HC.rectangle(player.x - (player.width/2), player.y - (player.height/2), player.width, player.height)
end

function player.update(dt)

    player.yspeed = player.yspeed + gravity
    
    --y stuff
    for shape, delta in pairs(HC.collisions(player.hitbox)) do
        if player.yspeed > 0 then
            player.yspeed = 0
        end
    end

    if player.yspeed > player.y_maxspeed then
        player.yspeed = player.y_maxspeed
    elseif player.yspeed < -player.y_maxspeed then
        player.yspeed = -player.y_maxspeed
    end

    --x stuff
    if player.movingleft then
        player.xspeed = player.xspeed - player.xacc
    end

    if player.movingright then
        player.xspeed = player.xspeed + player.xacc
    end

    if player.movingleft == false and player.movingright == false then
        player.xspeed = 0
    end
    
    if player.xspeed > player.x_maxspeed then
        player.xspeed = player.x_maxspeed
    elseif player.xspeed < -player.x_maxspeed then
        player.xspeed = -player.x_maxspeed
    end

    --finally handle all movement
    player.x = player.x + (dt * player.xspeed)
    player.y = player.y + (dt * player.yspeed)

    player.hitbox:moveTo(player.x, player.y)
end

function player.draw(state)

    -- Temporary print
    love.graphics.print('PLAYER ', player.x, player.y)

end

function love.keypressed(key, scancode, isrepeat)

    if key == "a" then
        player.movingleft = true;
    end

    if key == "d" then
        player.movingright = true;
    end

    if key == "w" then
        player.yspeed = -300;
    end
end

function love.keyreleased(key, scancode, isrepeat)

    if key == "a" then
        player.movingleft = false;
    end

    if key == "d" then
        player.movingright = false;
    end
end

return player