HC = require 'HC'
player = require('src/gameobjects/player')

local Game = {}

gameobjects = {}

function Game.newGameState()
    local state = {}

    -- Setup
    state.name = 'game'

    -- Give functions
    state.update = Game.update
    state.draw = Game.draw
    state.enter = Game.enter
    state.exit = Game.exit

    rect = HC.rectangle(200,400,400,20)
    player.load()
    gameobjects['player'] = player

    return state
end

function Game.update(state, dt)

    for key,object in pairs(gameobjects) do
        object.update(dt);
    end
end

function Game.draw(state)
    player.draw(state);
    rect:draw('fill')
end

-- On entering the gamestate
function Game.enter(state, params)
end

-- On leaving the gamestate
function Game.exit(state, params)
end

return Game