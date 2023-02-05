# RoomSpecific

## Overview

| Return Value | Function |
| - | - |
| boolean | [InBeastRoom](roomspecific.md#inbeastroom)()) |
| boolean | [InCrawlSpace](roomspecific.md#incrawlspace)()) |
| boolean | [InDeathCertificateArea](roomspecific.md#indeathcertificatearea)()) |
| boolean | [InDevilsCrownTreasureRoom](roomspecific.md#indevilscrowntreasureroom)()) |
| boolean | [InGenesisRoom](roomspecific.md#ingenesisroom)()) |
| boolean | [InHomeCloset](roomspecific.md#inhomecloset)()) |
| boolean | [InMegaSatanRoom](roomspecific.md#inmegasatanroom)()) |
| boolean | [InMineShaft](roomspecific.md#inmineshaft)()) |
| boolean | [InSecretExit](roomspecific.md#insecretexit)()) |
| boolean | [InSecretShop](roomspecific.md#insecretshop)()) |
| boolean | [InStartingRoom](roomspecific.md#instartingroom)()) |

## Functions

### InBeastRoom()

`boolean InBeastRoom()`

Helper function to check if the players are in the beast room. 

### InCrawlSpace()

`boolean InCrawlSpace()`

Helper function for determining whether the current room is a crawl space. Use this function over comparing to `RoomType.DUNGEON` or `GridRoom.DUNGEON_IDX` since there is a special case of the player being in a boss fight that take place in a dungeon. 

### InDeathCertificateArea()

`boolean InDeathCertificateArea()`

Helper function to detect if the current room is one of the rooms in the Death Certificate area. 

### InDevilsCrownTreasureRoom()

`boolean InDevilsCrownTreasureRoom()`

Helper function to check if the players are in a devils crown treasure room. 

### InGenesisRoom()

`boolean InGenesisRoom()`

Helper function to check if the players are in the genesis room. 

### InHomeCloset()

`boolean InHomeCloset()`

Helper function to check if the players are in any of the home closets. 

### InMegaSatanRoom()

`boolean InMegaSatanRoom()`

Helper function to check if the players are in the Mega Satan room. 

### InMineShaft()

`boolean InMineShaft()`

Helper function to determine if the current room is part of the Repentance "escape sequence" in the Mines/Ashpit. 

### InSecretExit()

`boolean InSecretExit()`

Helper function for checking if the current room is a secret exit that leads to a Repentance floor. 

### InSecretShop()

`boolean InSecretShop()`

Helper function for checking if the current room is a secret shop (from the Member Card collectible). 
Secret shops are simply copies of normal shops, but with the backdrop of a secret room. In other words, they will have the same room type, room variant, and room sub-type of a normal shop. Thus, the only way to detect them is by using the grid index. 

### InStartingRoom()

`boolean InStartingRoom()`

Helper function to determine whether or not the current room is the starting room of a floor. It only returns true for the starting room of the primary dimension (meaning that being in the starting room of the mirror world does not count). 

