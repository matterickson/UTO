local Menu = {}

function Menu.newMenuState()
    local state = {}

    -- Setup
    state.name = 'menu'

    -- Give functions
    state.update = Menu.update
    state.draw = Menu.draw
    state.enter = Menu.enter
    state.exit = Menu.exit

    return state
end

function Menu.update(state, dt)
end


function Menu.draw(state)

    -- Temporary print
    love.graphics.print('MENU', 100, 100)
end

-- On entering the gamestate
function Menu.enter(state, params)
end

-- On leaving the gamestate
function Menu.exit(state, params)
end

return Menu