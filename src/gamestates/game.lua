local Game = {}
player = require('src/gameobjects/player')

function Game.newGameState()
    local state = {}

    -- Setup
    state.name = 'game'

    -- Give functions
    state.update = Game.update
    state.draw = Game.draw
    state.enter = Game.enter
    state.exit = Game.exit

    player.draw(state)

    return state
end

function Game.update(state, dt)
end


function Game.draw(state)

    -- Temporary print
    love.graphics.print('GAME', 100, 100)
end

-- On entering the gamestate
function Game.enter(state, params)
end

-- On leaving the gamestate
function Game.exit(state, params)
end

return Game