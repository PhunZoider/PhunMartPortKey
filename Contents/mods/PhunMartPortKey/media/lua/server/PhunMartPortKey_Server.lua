if not isServer() then
    return
end
local PhunMart = PhunMart

if PhunMart then
    -- listen for event to say that the itemdef queue is ready to process
    Events[PhunMart.events.OnItemQueueFilesReadyToProcess].Add(function()
        -- add the portkey file
        PhunMart:queueFileForItemProcessing("PhunMart_PortItems")
    end)

    -- listen for event to say that the shop files have been loaded
    -- We will manually append another item for processing
    Events[PhunMart.events.OnShopQueueProcessed].Add(function()
        -- add the portkey file
        local shop = {
            key = "SHOP:TRAVEL:budget_travel",
            label = "Budget Travel",
            inherits = "base:shop",
            type = "PORT",
            backgroundImage = "machine-budget-travel",
            filters = {
                files = "PhunMart_PortItems.lua",
                tags = "port"
            },
            sprites = {
                east = "phunmart_01_4",
                south = "phunmart_01_5"
            }
        }
        PhunMart:queueRawShopToProcess(shop)
    end)
end
