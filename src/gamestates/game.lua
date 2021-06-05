local Game = {}
player = require('src/gameobjects/player')
floor = require('src/gameobjects/platforms/floor')
gravity = require('src/world/gravity')

gameobjects = {}
floors = {}

function Game.newGameState()
    local state = {}

    -- Setup
    state.name = 'game'

    -- Give functions
    state.update = Game.update
    state.draw = Game.draw
    state.enter = Game.enter
    state.exit = Game.exit

    gameobjects['player'] = player
    table.insert(floors, floor);

    return state
end

function Game.update(state, dt)
    gravity.update(dt, gameobjects, floors)

    for key,object in pairs(gameobjects) do
        object.update(dt);
    end
end

function Game.draw(state)

    player.draw(state);
    floor.draw(state);
end

-- On entering the gamestate
function Game.enter(state, params)
end

-- On leaving the gamestate
function Game.exit(state, params)
end

return Game