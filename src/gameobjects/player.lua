local Player = {}

Player.x = 200
Player.y = 200
Player.movingLeft = false
Player.movingright = false
Player.speed = 50
Player.sprite = love.graphics.newImage('media/character_idle.png')

function Player.update(dt)
    if Player.movingleft then
        Player.x = Player.x - (dt * Player.speed)
    end
    if Player.movingright then
        Player.x = Player.x + (dt * Player.speed)
    end
end

function Player.draw(state)

    -- Temporary print
    love.graphics.draw(Player.sprite, Player.x, Player.y)

end

function love.keypressed(key, scancode, isrepeat)
    if key == "a" then
        Player.movingleft = true;
    end
    if key == "d" then
        Player.movingright = true;
    end
end

function love.keyreleased(key, scancode, isrepeat)
    if key == "a" then
        Player.movingleft = false;
    end
    if key == "d" then
        Player.movingright = false;
    end
end

return Player
