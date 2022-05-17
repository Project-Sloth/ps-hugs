local spawned = {}

function SpawnPeds()
    for i=1,#Config.Ped do
        local hash = Config.Ped[i].hash or `mp_m_freemode_01`
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Wait(1)
        end
        spawned[i] = CreatePed(3, hash, Config.Ped[i].coords, false, true)
        local model = spawned[i]
        TaskStartScenarioInPlace(model, "WORLD_HUMAN_SMOKING_POT", 0, true)
        FreezeEntityPosition(model, true)
        SetEntityInvincible(model, true)
        SetBlockingOfNonTemporaryEvents(model, true)
        if Config.Ped[i].type == "qb-clothing" then -- QB CLOTHING
            local data = json.decode(Config.Ped[i].data)
            for i = 0, 11 do
                SetPedComponentVariation(model, i, 0, 0, 0)
            end
            for i = 0, 7 do
                ClearPedProp(model, i)
            end
            if not data["facemix"] or not data["face2"] then
                data["facemix"].shapeMix = data["facemix"].defaultShapeMix
                data["facemix"].skinMix = data["facemix"].defaultSkinMix
            end
            SetPedHeadBlendData(model, data["face"].item, data["face2"].item, nil, data["face"].texture, data["face2"].texture, nil, data["facemix"].shapeMix, data["facemix"].skinMix, nil, true)
            SetPedComponentVariation(model, 4, data["pants"].item, 0, 0)
            SetPedComponentVariation(model, 4, data["pants"].item, data["pants"].texture, 0)
            SetPedComponentVariation(model, 2, data["hair"].item, 0, 0)
            SetPedHairColor(model, data["hair"].texture, data["hair"].texture)
            SetPedHeadOverlay(model, 2, data["eyebrows"].item, 1.0)
            SetPedHeadOverlayColor(model, 2, 1, data["eyebrows"].texture, 0)
            SetPedHeadOverlay(model, 1, data["beard"].item, 1.0)
            SetPedHeadOverlayColor(model, 1, 1, data["beard"].texture, 0)
            SetPedHeadOverlay(model, 5, data["blush"].item, 1.0)
            SetPedHeadOverlayColor(model, 5, 1, data["blush"].texture, 0)
            SetPedHeadOverlay(model, 8, data["lipstick"].item, 1.0)
            SetPedHeadOverlayColor(model, 8, 1, data["lipstick"].texture, 0)
            SetPedHeadOverlay(model, 4, data["makeup"].item, 1.0)
            SetPedHeadOverlayColor(model, 4, 1, data["makeup"].texture, 0)
            SetPedHeadOverlay(model, 3, data["ageing"].item, 1.0)
            SetPedHeadOverlayColor(model, 3, 1, data["ageing"].texture, 0)
            SetPedComponentVariation(model, 3, data["arms"].item, 0, 2)
            SetPedComponentVariation(model, 3, data["arms"].item, data["arms"].texture, 0)
            SetPedComponentVariation(model, 8, data["t-shirt"].item, 0, 2)
            SetPedComponentVariation(model, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)
            SetPedComponentVariation(model, 9, data["vest"].item, 0, 2)
            SetPedComponentVariation(model, 9, data["vest"].item, data["vest"].texture, 0)
            SetPedComponentVariation(model, 11, data["torso2"].item, 0, 2)
            SetPedComponentVariation(model, 11, data["torso2"].item, data["torso2"].texture, 0)
            SetPedComponentVariation(model, 6, data["shoes"].item, 0, 2)
            SetPedComponentVariation(model, 6, data["shoes"].item, data["shoes"].texture, 0)
            SetPedComponentVariation(model, 1, data["mask"].item, 0, 2)
            SetPedComponentVariation(model, 1, data["mask"].item, data["mask"].texture, 0)
            SetPedComponentVariation(model, 10, data["decals"].item, 0, 2)
            SetPedComponentVariation(model, 10, data["decals"].item, data["decals"].texture, 0)
            SetPedComponentVariation(model, 7, data["accessory"].item, 0, 2)
            SetPedComponentVariation(model, 7, data["accessory"].item, data["accessory"].texture, 0)
            SetPedComponentVariation(model, 5, data["bag"].item, 0, 2)
            SetPedComponentVariation(model, 5, data["bag"].item, data["bag"].texture, 0)
            if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
                SetPedPropIndex(model, 0, data["hat"].item, data["hat"].texture, true)
            else
                ClearPedProp(model, 0)
            end
            if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
                SetPedPropIndex(model, 1, data["glass"].item, data["glass"].texture, true)
            else
                ClearPedProp(model, 1)
            end
            if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
                SetPedPropIndex(model, 2, data["ear"].item, data["ear"].texture, true)
            else
                ClearPedProp(model, 2)
            end
            if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
                SetPedPropIndex(model, 6, data["watch"].item, data["watch"].texture, true)
            else
                ClearPedProp(model, 6)
            end
            if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
                SetPedPropIndex(model, 7, data["bracelet"].item, data["bracelet"].texture, true)
            else
                ClearPedProp(model, 7)
            end
            if data["eye_color"].item ~= -1 and data["eye_color"].item ~= 0 then
                SetPedEyeColor(model, data['eye_color'].item)
            end 
            if data["moles"].item ~= -1 and data["moles"].item ~= 0 then
                SetPedHeadOverlay(model, 9, data['moles'].item, (data['moles'].texture / 10))  
            end  
            SetPedFaceFeature(model, 0, (data['nose_0'].item / 10))
            SetPedFaceFeature(model, 1, (data['nose_1'].item / 10))
            SetPedFaceFeature(model, 2, (data['nose_2'].item / 10))
            SetPedFaceFeature(model, 3, (data['nose_3'].item / 10))
            SetPedFaceFeature(model, 4, (data['nose_4'].item / 10))
            SetPedFaceFeature(model, 5, (data['nose_5'].item / 10))
            SetPedFaceFeature(model, 6, (data['eyebrown_high'].item / 10))
            SetPedFaceFeature(model, 7, (data['eyebrown_forward'].item / 10))
            SetPedFaceFeature(model, 8, (data['cheek_1'].item / 10))
            SetPedFaceFeature(model, 9, (data['cheek_2'].item / 10))
            SetPedFaceFeature(model, 10,(data['cheek_3'].item / 10))
            SetPedFaceFeature(model, 11, (data['eye_opening'].item / 10))
            SetPedFaceFeature(model, 12, (data['lips_thickness'].item / 10))
            SetPedFaceFeature(model, 13, (data['jaw_bone_width'].item / 10))
            SetPedFaceFeature(model, 14, (data['jaw_bone_back_lenght'].item / 10))
            SetPedFaceFeature(model, 15, (data['chimp_bone_lowering'].item / 10))
            SetPedFaceFeature(model, 16, (data['chimp_bone_lenght'].item / 10))
            SetPedFaceFeature(model, 17, (data['chimp_bone_width'].item / 10))
            SetPedFaceFeature(model, 18, (data['chimp_hole'].item / 10))
            SetPedFaceFeature(model, 19, (data['neck_thikness'].item / 10))
        end
        if Config.Ped[i].type == "fivem-appearance" then -- FIVEM APPEARANCE
            local data = json.decode(Config.Ped[i].data)
            for i=1,#data.components do
                SetPedComponentVariation(model, data.components[i].component_id, data.components[i].drawable, data.components[i].texture)
            end
            for i=1,#data.props do
                SetPedPropIndex(model,data.props[i].prop_id,data.props[i].drawable,data.props[i].texture)
            end
            for i = 1, #data.faceFeatures do
                SetPedFaceFeature(ped, i-1, data.faceFeatures[i])
            end

            SetPedHeadBlendData(model,
                tonumber(data.headBlend['shapeFirst']),
                tonumber(data.headBlend['shapeSecond']),
                false,
                tonumber(data.headBlend['skinFirst']),
                tonumber(data.headBlend['skinSecond']),
                false,
                tonumber(data.headBlend['shapeMix']),
                tonumber(data.headBlend['skinMix']),
                false,
                false
            )
            local overlaydata = {
                ["blemishes"] = {id = 0, color = 0},
                ["beard"] = {id = 1, color = 1},
                ["eyebrows"] = {id = 2, color = 1},
                ["ageing"] = {id = 3, color = 0},
                ["makeUp"] = {id = 4, color = 2},
                ["blush"] = {id = 5, color = 2},
                ["complexion"] = {id = 6, color = 0},
                ["sunDamage"] = {id = 7, color = 0},
                ["lipstick"] = {id = 8, color = 2},
                ["moleAndFreckles"] = {id = 9, color = 0},
                ["chestHair"] = {id = 10, color = 1},
                ["bodyBlemishes"] = {id = 11, color = 0},
            }
            for k,v in pairs(data.headOverlays) do
                SetPedHeadOverlay(model, overlaydata[k].id, tonumber(v.style), tonumber(v.opacity))
                SetPedHeadOverlayColor(model, overlaydata[k].id, overlaydata[k].color, tonumber(v.color), tonumber(v.color))
            end
            SetPedEyeColor(model, data.eyeColor)
            SetPedHairColor(model,data.hair.color,data.hair.highlight)
        end
        local tattoos = json.decode(Config.Ped[i].tattoos)
        for i=1,#tattoos do
            SetPedDecoration(model, tattoos[i].collection, tattoos[i].nameHash)
        end
    end
end

function LoadAnim(ad)
    while not HasAnimDictLoaded(ad) do
        RequestAnimDict(ad)
        Wait(1)
    end
end

function GetClosestHug(coords)
    local coords = coords
    for i=1,#spawned do 
        local ecoords = GetEntityCoords(spawned[i])
        local dist = #(coords-ecoords)
        if dist < 2 then
            return spawned[i]
        end
    end
end

RegisterNetEvent('ps-hugs:client:hug', function(coords)
    local model = GetClosestHug(coords)
    TaskPlayAnim(model, "mp_ped_interaction", "kisses_guy_a", 8.00, -8.00, 5000, 51, 0.00, 0, 0, 0)
end)

RegisterNetEvent('ps-hugs:client:idle', function(coords)
    local model = GetClosestHug(coords)
    TaskPlayAnim(model, "amb@world_human_aa_smoke@male@idle_a", "idle_c", 8.00, -8.00, -1, 51, 0.00, 0, 0, 0)
end)

CreateThread(function()
    SpawnPeds()
    local alreadyEnteredZone = false
    local text = ' <b>[E] </b> Hug'
    while true do
        Wait(3)
        local ped = PlayerPedId()
        local inZone = false
        local coords = GetEntityCoords(ped)
        local model = GetClosestHug(coords)
        local spawn = GetEntityCoords(model)
        local ehead = GetEntityHeading(model)
        local dist = #(coords-vector3(spawn.x,spawn.y,spawn.z))
        if dist <= 1.5 then
            inZone = true
            if IsControlJustReleased(0, 38) then
                LoadAnim("mp_ped_interaction")
                local newcoords = GetEntityForwardVector(model) * 0.4 + vector3(spawn.x,spawn.y,spawn.z-1)
                SetEntityCoords(ped, newcoords)
                SetEntityHeading(ped, ehead-180)
                FreezeEntityPosition(ped, true)
                TaskPlayAnim(ped, "mp_ped_interaction", "kisses_guy_a", 8.00, -8.00, 5000, 51, 0.00, 0, 0, 0)
                TaskPlayAnim(model, "mp_ped_interaction", "kisses_guy_a", 8.00, -8.00, 5000, 51, 0.00, 0, 0, 0)
                TriggerServerEvent('hud:server:RelieveStress', 100) -- stress from hud
                TriggerServerEvent("ps-hugs:server:hug",spawn)
                Wait(5000)
                FreezeEntityPosition(ped, false)
                TriggerServerEvent("ps-hugs:server:idle",spawn)
            end
        else
            Wait(5000)
        end

        if inZone and not alreadyEnteredZone then
            alreadyEnteredZone = true
            TriggerEvent('cd_drawtextui:ShowUI', 'show', text)
        end

        if not inZone and alreadyEnteredZone then
            alreadyEnteredZone = false
            TriggerEvent('cd_drawtextui:HideUI')
        end
    end
end)