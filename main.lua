-- Requires
local Gamestate_manager = require 'src.gamestate_manager'
local Game = require 'src.gamestates.game'
local Menu = require 'src.gamestates.menu'

function love.load()

    -- Creates a new gamestate manager
    manager = Gamestate_manager.newManager()

    -- Add gamestates
    manager:addState(Game.newGameState())
    manager:addState(Menu.newMenuState())

    -- Set state
    manager:setState('game')
end

function love.update(dt)

    -- Update gamestate manager
    manager:update(dt)
end

function love.draw()

    -- Draw gamestate manager
    manager:draw()
end