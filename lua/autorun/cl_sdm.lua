if not CLIENT then return end
local deathColor = Color(179,124,87)
gameevent.Listen("entity_killed")
hook.Add("entity_killed", "sdm_entitykilled", function(data)
    timer.Simple(0, function()
        local attacker = Entity(data.entindex_attacker)
        local victim = Entity(data.entindex_killed)

        if victim ~= LocalPlayer() then return end

        if IsValid(attacker) and attacker ~= LocalPlayer() and data.damagebits == (2 or 8194 or 64 or 128 or 0) then
            local attackerName = ""
            if attacker:IsPlayer() then
                attackerName = attacker:Name()
            elseif attacker:IsNPC() then
                attackerName = "[NPC] " .. attacker:GetNWString("Name", "Error: no name found")
            else
                attackerName = "Unknown attacker type"
            end
            chat.AddText(deathColor, "[SDM] You have died to " .. attackerName)
        elseif data.damagebits == 32 then
            chat.AddText(deathColor, "[SDM] You fell to your death")
        elseif data.damagebits == 64 then
            chat.AddText(deathColor, "[SDM] You exploded")
        elseif data.damagebits == 8 then
            chat.AddText(deathColor, "[SDM] You burned to death")
        elseif data.damagebits == 1 then
            chat.AddText(deathColor, "[SDM] You got crushed to death")
        else
            chat.AddText(deathColor, "[SDM] You died")
        end
    end)
end)

print("[SDM] Loaded")