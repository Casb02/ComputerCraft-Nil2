-- Imports
local fuelcheck = dofile("nultwee/turtle_utils/fuelcheck.lua")
local watcher = dofile("nultwee/turtle_utils/fuelcheck.lua")

print("Starting chopper")


-- INFO
-- Slot 16 = DUEL
-- Slot 15 = SPALING
-- Slot 1 - 14 = WOOD


-- refuel on startup
turtle.refuel(4)


-- Chop function
function doChop ()
    print("start chopper!")

    --First mine the front block
    turtle.dig()
    
    turtle.forward()

    -- go to the top!
    while turtle.inspectUp()
    do
        turtle.digUp()
        turtle.up()
    end

    -- go down when empty bottem
    while turtle.inspectDown() == false
    do
        turtle.down()
    end
    turtle.back()
end

function placeTree() 

    local treeSlot = turtle.getItemDetail(15)

    if (treeSlot == nil) then
        print("no trees found!")
    end

    turtle.select(15)
    turtle.place()
end

while true do
    if watcher.isBlockTag("minecraft:logs") then
        doChop()
        placeTree()
        fuelcheck.refillIfNeeded(16)
    end
end

