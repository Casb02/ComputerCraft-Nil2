
function getFreeSpace(rStart, rEnd)

    -- Save the slot so we can change it back later when the search is doen
    local endSlot = turtle.getSelectedSlot()

    --Check empty slot
    for i=rStart, rEnd do
        turtle.select(i)
        if (turtle.getItemDetail() == nil) then
            turtle.select(endSlot)
            return i;
        end
    end

    -- If all spaces are full return nil
    turtle.select(endSlot)
    return nil;
end

function purgeRange(rStart, rEnd)
    -- Save the slot so we can change it back later when the search is doen
    local endSlot = turtle.getSelectedSlot()

    --Purge all in range
    for i=rStart, rEnd do
        turtle.select(i)
        if turtle.getItemDetail() then
            turtle.drop()
        end
    end
    turtle.select(endSlot)
    return true;
end

return { getFreeSpace = getFreeSpace, purgeRange = purgeRange }