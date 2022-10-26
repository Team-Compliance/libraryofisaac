--- Helper function to get the current dimension.
---@return Dimension @ If something fails, `Dimension.CURRENT` will be returned
function TSIL.Dimensions.GetDimension()
    local level = Game():GetLevel()
    local roomIndex = level:GetCurrentRoomIndex()

    for i = 0, 2 do
        if GetPtrHash(level:GetRoomByIdx(roomIndex, i)) == GetPtrHash(level:GetRoomByIdx(roomIndex, -1)) then
            ---@diagnostic disable-next-line: return-type-mismatch
            return i
        end
    end

    return TSIL.Enums.Dimension.CURRENT
end