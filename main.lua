-- Requires
local Gamestate_manager = require 'src.gamestate_manager'

function love.load()

    -- Creates a new gamestate manager
    manager = Gamestate_manager.new_manager()
end

function love.update(dt)

    -- Update gamestate manager
    manager:update(dt)
end

function love.draw()

    -- Draw gamestate manager
    manager:draw()
end