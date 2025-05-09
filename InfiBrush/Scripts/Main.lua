--Infinite Brush Mod for Drive Beyond Horizons. Created by Zodiac!

RegisterKeyBind(Key.F8, function()
    print("[InfiBrush] F8 pressed — scanning for RustBrush_C and PolishBrush_C...")

    local targetClasses = {
        "RustBrush_C",
        "PolishBrush_C"
    }

    local propsToTry = { "Quantity", "Uses", "Count", "Charges", "Durability" }

    for _, className in ipairs(targetClasses) do
        local items = FindAllOf(className)

        for _, item in ipairs(items) do
            local modified = false

            for _, prop in ipairs(propsToTry) do
                local ok, value = pcall(function() return item[prop] end)
                if ok and value ~= nil then
                    local setOk = pcall(function()
                        item[prop] = 999999
                    end)

                    if setOk then
                        print("[InfiBrush] Set", prop, "Successful For:", item:GetFullName())
                        modified = true
                        break
                    end
                end
            end

            if not modified then
                print("[InfiBrush] No valid field found for:", item:GetFullName())
            end
        end
    end

    return false
end)
