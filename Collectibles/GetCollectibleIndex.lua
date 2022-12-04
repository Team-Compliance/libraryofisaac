---@class CollectibleIndex

--- Mods may have to keep track of data relating to a collectible. Finding an index for these kinds
--- of data structures is difficult, since collectibles are respawned every time a player re-enters a
--- room (like all other pickups), so the `PtrHash` will change.
---
--- Use this function to get a unique index for a collectible to use in these data structures.
---
--- Collectibles are a special case of pickups: they cannot be pushed around. (They actually can be
--- pushed, but usually will stay on the same grid index.) Thus, it is possible to generate a
--- somewhat reliable non-stateful index for collectibles. We use a 4-tuple of the room list index,
--- the grid index of the collectible in the room, the collectible's `SubType`, and the collectible's
--- `InitSeed`.
---
--- Collectibles that are shifted by Tainted Isaac's mechanic will have unique collectible indexes
--- because the `SubType` is different. (The collectible entities share the same `InitSeed` and
--- `PtrHash`.)
---
--- Collectibles that are rolled (with e.g. a D6) will have unique collectible indexes because the
--- `SubType` and `InitSeed` are different. If you want to track collectibles independently of any
--- rerolls, then you can use the `PtrHash` as an index instead. (The `PtrHash` will not persist
--- between rooms, however.)
---
--- Note that:
--- - The grid index is a necessary part of the collectible index because Diplopia and Crooked Penny
---   can cause two or more collectibles with the same `SubType` and `InitSeed` to exist in the same
---   room.
--- - This index will fail in the case where the player uses Diplopia or a successful Crooked Penny
---   seven or more times in the same room, since that will cause two or more collectibles with the
---   same grid index, `SubType`, and `InitSeed` to exist. (More than seven is required in non-1x1
---   rooms.)
--- - The `SubType` is a necessary part of the collectible index because Tainted Isaac will
---   continuously cause collectibles to morph into new sub-types with the same `InitSeed`.
--- - Using a collectible's position as part of the index is problematic, since players can push a
---   pedestal. (Even using the grid index does not solve this problem, since it is possible in
---   certain cases for collectibles to be spawned at a position that is not aligned with the grid,
---   and the pedestal pushed to an adjacent tile, but this case should be extremely rare.)
--- - Mega Chests spawn two collectibles on the exact same position. However, both of them will have
---   a different `InitSeed`, so this is not a problem for this indexing scheme.
--- - The indexing scheme used is different for collectibles that are inside of a Treasure Room or
---   Boss Room, in order to handle the case of the player seeing the same collectible again in a
---   post-Ascent Treasure Room or Boss Room. A 5-tuple of stage, stage type, grid index, `SubType`,
---   and `InitSeed` is used in this case. (Using the room list index or the room grid index is not
---   suitable for this purpose, since both of these values can change in the post-Ascent rooms.)
---   Even though Treasure Rooms and Boss Rooms are grouped together in this scheme, there probably
---   will not be collectibles with the same grid index, SubType, and InitSeed.
---@param collectible EntityPickup
---@return CollectibleIndex
function TSIL.Collectibles.GetCollectibleIndex(collectible)
    if not (collectible.Type == EntityType.ENTITY_PICKUP and
        collectible.Variant == PickupVariant.PICKUP_COLLECTIBLE) then
        error("The \"GetCollectibleIndex\" function was given a non-collectible: " .. collectible.Type)
    end

    local level = Game():GetLevel();
    local stage = level:GetStage();
    local stageType = level:GetStageType();
    local room = Game():GetRoom();
    local roomType = room:GetType();
    local gridIndex = room:GetGridIndex(collectible.Position);
    local roomListIndex = level:GetCurrentRoomDesc().ListIndex

    local collectibleIndex

    if roomType == RoomType.ROOM_TREASURE or roomType == RoomType.ROOM_BOSS then
        collectibleIndex = {
            stage = stage,
            stageType = stageType,
            gridIndex = gridIndex,
            subtype = collectible.SubType,
            initSeed = collectible.InitSeed
        }
    else
        collectibleIndex = {
            roomListIndex = roomListIndex,
            stageType = stageType,
            gridIndex = gridIndex,
            subtype = collectible.SubType,
            initSeed = collectible.InitSeed
        }
    end

    -- local proxy = {}

    -- local mt = {
    --     __index = collectibleIndex,
    --     __newindex = function()
    --         error("Attempt to update a read-only table", 2)
    --     end,
    --     __eq = function(t1, t2)
    --         local ci1 = getmetatable(t1).__proxy
    --         local ci2 = getmetatable(t2).__proxy

    --         for key, value in pairs(ci1) do
    --             if value ~= ci2[key] then
    --                 return false
    --             end
    --         end

    --         return true
    --     end,
    --     __proxy = collectibleIndex
    -- }

    -- setmetatable(proxy, mt)

    return collectibleIndex
end
