function isBlockTag(name)
    local success, data = turtle.inspect()
    if success then
        if data.tags[name] then
            return true;
        end
        return false;
    end
end

function isBlockName(name)
    local success, data = turtle.inspect()
    if success then
        if data.name == name then
            return true;
        end
        return false;
    end
end

return { isBlockTag = isBlockTag, isBlockName = isBlockName }