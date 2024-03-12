local tips = { 
    "Dont forget to use /calladmin if you need a staff members assistance", 
    "Make sure to join the support discord over @ discord.gg/linkhere",
    "Please follow all rules, failure in doing so will result in a warning / ban",
} -- change tips to whatever you like
local tipIndex = 1

function sendTip()
    TriggerEvent('chat:addMessage', 
        {
            template = '<div style=color: #ffffff;">[Server Tip]</div> <div style="color: #b3b3b3;">{0}</div>',
            args = { tips[tipIndex] }
        }
    )
    tipIndex = tipIndex + 1 
    if tipIndex > #tips then
        tipIndex = 1
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60*1000)
        sendTip()
    end
end)
