local placedProp = nil

local pitchValue = 0.0
local pitchSpeed = 1.0

local isRotating = false
local canToggle = true
local cooldownActive = false

-- ROTATION
local function startRotation()
    if isRotating then return end
    if not placedProp then return end

    isRotating = true

    print("^2[PROP]^0 Rotation ACTIVÉE ✔")

    CreateThread(function()
        while isRotating and placedProp do
            Wait(10)

            pitchValue = pitchValue - pitchSpeed

            if pitchValue <= -100 then
                pitchValue = -100
            end

            local rot = GetEntityRotation(placedProp, 2)
            SetEntityRotation(placedProp, rot.x, pitchValue, rot.z, 2, true)
        end
    end)
end

-- STOP
local function stopRotation()
    if not isRotating then return end

    isRotating = false

    print("^1[PROP]^0 Rotation STOP ✖")
end

-- COOLDOWN CLEAN
local function startCooldown()
    cooldownActive = true
    canToggle = false

    print("^3[PROP]^0 Cooldown 3000ms...")

    CreateThread(function()
        Wait(3000)

        cooldownActive = false
        canToggle = true

        print("^2[PROP]^0 Cooldown terminé ✔")
    end)
end

local function placeProp()
    if placedProp then
        print("^1[PROP]^0 Déjà un prop placé.")
        return
    end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local forward = GetEntityForwardVector(ped)

    local propCoords = coords + forward * 1.5

    placedProp = CreateObject(
        GetHashKey(Config.PropName),
        propCoords.x, propCoords.y, propCoords.z,
        true, true, true
    )

    SetEntityRotation(
        placedProp,
        Config.DefaultRotation.x,
        Config.DefaultRotation.y,
        Config.DefaultRotation.z,
        2,
        true
    )

    pitchValue = Config.DefaultRotation.y or 0.0

    print("^2[PROP]^0 Prop placé ✔")
end

-- INPUT
CreateThread(function()
    while true do
        Wait(0)

        if IsControlJustPressed(0, 38) then -- E

            -- BLOCK INPUT (IMPORTANT)
            if cooldownActive then
                goto continue
            end

            if not placedProp then
                print("^1[PROP]^0 Aucun prop.")
                goto continue
            end

            -- LOCK ANTI SPAM
            startCooldown()

            -- TOGGLE CLEAN
            if isRotating then
                stopRotation()
            else
                startRotation()
            end

            ::continue::
        end
    end
end)
-- PLACE COMMAND
RegisterCommand("placeprop", function()
    placeProp()
end)

-- DELETE (simple)
RegisterCommand("deleteprop", function()
    if placedProp then
        DeleteObject(placedProp)
        placedProp = nil
        print("^1[PROP]^0 Prop supprimé.")
    end
end)