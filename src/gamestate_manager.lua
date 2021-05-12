local Manager = {}

function Manager.newManager()
    local manager = {}

    -- Give functions
    manager.update = Manager.update
    manager.draw = Manager.draw
    manager.addState = Manager.addState
    manager.getState = Manager.getState
    manager.setState = Manager.setState

    -- Gamestates
    manager.gamestates = {}
    manager.currentGamestate = nil

    return manager
end

function Manager.update(manager, dt)

    -- Update current gamestate
    if manager.currentGamestate then
        manager.currentGamestate:update(dt)
    end
end

function Manager.draw(manager)
    
    -- Draw current gamestate
    if manager.currentGamestate then
        manager.currentGamestate:draw()
    end
end

--[[ Adds a new gamestate to the gamestate manager
    Takes a table with at least the following:
        name (string),
        update (function),
        draw (function),
        enter (function),
        exit (function),
]]
function Manager.addState(manager, gamestate)

    -- Checks for a gamestate (maybe check for the required functions?)
    if gamestate then
        manager.gamestates[gamestate.name] = gamestate

        -- Return true for success
        return true
    end
end

--[[ Changes the current gamestate
    gamestate_name (string),
    Takes additional exit and enter params tables (that are fed into the enter/exit function calls of the gamestate)
]]
function Manager.setState(manager, gamestate_name, enter_params, exit_params)

    -- Check gamestate exists
    if manager.gamestates[gamestate_name] then
        local enter_params = enter_params or {}
        local exit_params = exit_params or {}

        -- Exit current gamestate
        if manager.currentGamestate then
            manager.currentGamestate:exit(exit_params)
        end

        -- Change gamestates
        manager.currentGamestate = manager.gamestates[gamestate_name]

        -- Enter new gamestate
        manager.currentGamestate:enter(enter_params)

        -- Return true for success
        return true
    end
end

--[[ Gets a gamestate from the manager
    If given a gamestate name (string) it returns the respective gamestate
    Otherwise, it returns the current gamestate
]]
function Manager.getState(manager, gamestate_name)
    if gamestate_name then
        return manager.gamestates[gamestate_name]
    else
        return manager.currentGamestate
    end
end

return Manager