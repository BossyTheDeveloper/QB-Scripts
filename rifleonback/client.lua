local attached = false
local attached_weapon = nil

RegisterCommand("attachweapon", function(source, args)
    local playerPed = PlayerPedId()

    if not attached then
        if IsPedArmed(playerPed, 4) then
            local _, weaponHash = GetCurrentPedWeapon(playerPed, true)
            if weaponHash == GetHashKey("WEAPON_CARBINERIFLE") or weaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") or weaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
                attached_weapon = CreateObject(GetHashKey("w_ar_carbinerifle"), 0, 0, 0, true, true, true)
                AttachEntityToEntity(attached_weapon, playerPed, GetPedBoneIndex(playerPed, 24818), -0.05, -0.15, 0.0, -180.0, 180.0, 0.0, true, true, false, true, 1, true)
                attached = true
                TriggerEvent("chat:addMessage", {args = {"^2Weapon attached to your back."}})
            else
                TriggerEvent("chat:addMessage", {args = {"^1You must have a rifle equipped to attach it to your back."}})
            end
        else
            TriggerEvent("chat:addMessage", {args = {"^1You must have a weapon equipped to attach it to your back."}})
        end
    else
        DeleteObject(attached_weapon)
        attached_weapon = nil
        attached = false
        TriggerEvent("chat:addMessage", {args = {"^2Weapon detached from your back."}})
    end
end)
