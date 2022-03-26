-- Basic fuel API
-- Casb02 2022


function needfuel() 
    local low = turtle.getFuelLimit() * 0.1
    local leftover = turtle.getFuelLevel()
    if (leftover < low) then
        return true;
    else
        return false;
    end
end

function refillIfNeeded(slot)
    local endSlot = turtle.getSelectedSlot()
    local low = turtle.getFuelLimit() * 0.1
    local leftover = turtle.getFuelLevel()
    if (leftover < low)  then
        turtle.select(slot)

        local fuelCount = turtle.getItemCount()

        if (fuelCount < 8) then
            turtle.refuel()
        else
            turtle.refuel(8)
        end
    end

    turtle.select(endSlot)
end

return { refillIfNeeded = refillIfNeeded, needfuel = needfuel }