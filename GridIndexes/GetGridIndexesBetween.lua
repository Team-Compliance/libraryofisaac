--- Helper function to get all the grid indexes between two others.
---
--- Note that the two grid indexes need to be in the same column or row.
---@param gridIndex1 integer
---@param gridIndex2 integer
---@param roomShape RoomShape
---@return integer[]
function TSIL.GridIndexes.GetGridIndexesBetween(gridIndex1, gridIndex2, roomShape)
    if gridIndex1 > gridIndex2 then
        local oldGridIndex1 = gridIndex1
        local oldGridIndex2 = gridIndex2
        gridIndex1 = oldGridIndex2
        gridIndex2 = oldGridIndex1
    end

    local delta = gridIndex2 - gridIndex1
    local gridWidth = TSIL.Rooms.GetRoomShapeGridWidth(roomShape)

    local isOnHorizontalLine = delta <= gridWidth
    if isOnHorizontalLine then
        local gridIndexes = {}
        for i = gridIndex1, gridIndex2, 1 do
            gridIndexes[#gridIndexes+1] = i
        end
        return gridIndexes
    end

    local isOnVerticalLine = delta % gridWidth == 0
    if isOnVerticalLine then
        local gridIndexes = {}
        for i = gridIndex1, gridIndex2, gridWidth do
            gridIndexes[#gridIndexes+1] = i
        end
        return gridIndexes
    end

    error("Failed to get the grid indexes between " .. gridIndex1 .. " and " .. gridIndex2 ..
    " for RoomShape " .. roomShape .. " since they are not on the same horizontal or vertical line.")
end