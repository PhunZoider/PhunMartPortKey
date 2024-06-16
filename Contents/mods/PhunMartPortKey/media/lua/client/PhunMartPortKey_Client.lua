if not isClient() then
    return
end
local PhunMart = PhunMart

if PhunMart then

    -- Handle when player receives the PORT item
    PhunMart:addHook("receiveItem", function(playerObj, item)
        if item.type == "PORT" then
            local dest = nil
            if type(item.value) == "table" then
                if #item.value > 1 then
                    -- if there is more than one table, assume we choose one from random
                    local i = ZombRand(#item.value) + 1
                    dest = item.value[i]
                elseif #item.value == 1 then
                    -- if there is only one value, use that
                    dest = item.value[1]
                end
            end
            if dest then
                playerObj:setX(dest.x + 0.5)
                playerObj:setY(dest.y + 0.5)
                playerObj:setZ(dest.z + 0.5)
                playerObj:setLx(dest.x + 0.5);
                playerObj:setLy(dest.y + 0.5);
                playerObj:setLz(dest.z + 0.5);
            end
        end
    end)

    -- Handle requests for the PORT icon. In this instance, there is only one
    PhunMart:addHook("getTexture", function(type, name)
        if type == "PORT" then
            return getTexture("media/textures/icon-travel.png")
        end
    end)

    -- Handle requests for the PORT label
    PhunMart:addHook("getLabel", function(type, name)
        if type == "PORT" then
            return getTextOrNull("IGUI_PhunMartPortKey.PortToX", name)
        end
    end)

end
