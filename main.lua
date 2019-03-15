-- Login Notification
-- first initialize a Frame object
local efLogin = CreateFrame("Frame")

-- Then register that frame to an event of your choice
efLogin:RegisterEvent("PLAYER_LOGIN")

-- Then set a script that is executed when the Event occurs
efLogin:SetScript("OnEvent", function(self, event, ...)
    if type(CharacterVar) ~= "number" then
        CharacterVar = 1
        ChatFrame1:AddMessage('Why hello there ' .. UnitName("Player") .. ', I see it is your first time logging in.')
    else
        if CharacterVar == 1 then
            ChatFrame1:AddMessage('Why hello there ' .. UnitName("Player") .. ', I see you have logged in ' .. CharacterVar .. ' time before.')
        else
            ChatFrame1:AddMessage('Why hello there ' .. UnitName("Player") .. ', I see you have logged in ' .. CharacterVar .. ' times before.')
        end
        CharacterVar = CharacterVar + 1
    end
end)

-- Combat Notification
local efCombat = CreateFrame("Frame")
efCombat:RegisterEvent("PLAYER_REGEN_DISABLED")
efCombat:SetScript("OnEvent", function(self, event, ...)
    ChatFrame1:AddMessage('You are now entering combat! Kill it!')
end)

-- Rest Notification
local efRest = CreateFrame("Frame")
efRest:RegisterEvent("PLAYER_UPDATE_RESTING")
efRest:SetScript("OnEvent", function(self, event)
    if IsResting() then
        ChatFrame1:AddMessage('You entered a rest area.  Gaining Bonus XP!')
    else
        ChatFrame1:AddMessage('You left a rest area.  No longer gaining bonus XP!')
    end    
end)