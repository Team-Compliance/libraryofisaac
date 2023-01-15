---Helper function to check if the current run can unlock achievements.
---
---Done by trying to spawn a greed donation machine and checking if it
---actually spawn.
function TSIL.Run.CanRunUnlockAchievements()
    local greedDonation = TSIL.EntitySpecific.SpawnSlot(
        TSIL.Enums.SlotVariant.GREED_DONATION_MACHINE,
        0,
        Vector.Zero
    )

    local canUnlockAchievements = greedDonation:Exists()
    greedDonation:Remove()

    return canUnlockAchievements
end