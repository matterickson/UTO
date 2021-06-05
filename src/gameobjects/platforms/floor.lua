local floor = {}

floor.x = 100
floor.y = 300
floor.width = 500
floor.height = 50

function floor.update(dt)

end

function floor.draw(state)

    -- Temporary print
    love.graphics.rectangle('fill', floor.x, floor.y, floor.width, floor.height)
end

return floor