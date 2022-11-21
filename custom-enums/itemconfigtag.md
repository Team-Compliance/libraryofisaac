# ItemConfigTag



| Enumerator         | Value | Description                                                                                                                                       |
| ------------------ | ----- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| DEAD               | 1<<0  | Dead things (for the Parasite unlock)                                                                                                             |
| SYRINGE            | 1<<1  | Syringes (for Little Baggy and the Spun transformation)                                                                                           |
| MOM                | 1<<2  | Mom's things (for Mom's Contact and the Yes Mother transformation)                                                                                |
| TECH               | 1<<3  | Technology items (for the Technology Zero unlock)                                                                                                 |
| BATERRY            | 1<<4  | Battery items (for the Jumper Cables unlock)                                                                                                      |
| GUPPY              | 1<<5  | Guppy items (Guppy transformation)                                                                                                                |
| FLY                | 1<<6  | Fly items (Beelzebub transformation)                                                                                                              |
| BOB                | 1<<7  | Bob items (Bob transformation)                                                                                                                    |
| MUSHROOM           | 1<<8  | Mushroom items (Fun Guy transformation)                                                                                                           |
| BABY               | 1<<9  | Baby items (Conjoined transformation)                                                                                                             |
| ANGEL              | 1<<10 | Angel items (Seraphim transformation)                                                                                                             |
| DEVIL              | 1<<11 | Devil items (Leviathan transformation)                                                                                                            |
| POOP               | 1<<12 | Poop items (Oh Shit transformation)                                                                                                               |
| BOOK               | 1<<13 | Book items (Book Worm transformation)                                                                                                             |
| SPIDER             | 1<<14 | Spider items (Spider Baby transformation)                                                                                                         |
| QUEST              | 1<<15 | Quest item (cannot be rerolled or randomly obtained)                                                                                              |
| MONSTER\_MANUAL    | 1<<16 | Can be spawned by Monster Manual                                                                                                                  |
| NO\_GREED          | 1<<17 | Cannot appear in Greed Mode                                                                                                                       |
| FOOD               | 1<<18 | Food item (for Binge Eater)                                                                                                                       |
| TEARS\_UP          | 1<<19 | Tears up item (for Lachryphagy unlock)                                                                                                            |
| OFFENSIVE          | 1<<20 | Whitelisted item for Tainted Lost                                                                                                                 |
| NO\_KEEPER         | 1<<21 | Blacklisted item for Keeper and Tainted Keeper                                                                                                    |
| NO\_LOST BR        | 1<<22 | Blacklisted item for The Lost's Birthright                                                                                                        |
| STARS              | 1<<23 | Star themed items (for the Planetarium unlock)                                                                                                    |
| SUMMONABLE         | 1<<24 | Summonable items (for Tainted Bethany)                                                                                                            |
| NO\_CANTRIP        | 1<<25 | Can't be obtained in Cantripped challenge                                                                                                         |
| WISP               | 1<<26 | Active items that have wisps attached to them (Automatically set)                                                                                 |
| UNIQUE\_FAMILIAR   | 1<<27 | Unique familiars that cannot be duplicated                                                                                                        |
| NO\_CHALLENGE      | 1<<28 | Items that should not be obtainable in challenges                                                                                                 |
| NO\_DAILY          | 1<<29 | Items that should not be obtainable in daily runs                                                                                                 |
| LAZ\_SHARED        | 1<<30 | Items that should be shared between Tainted Lazarus' forms. Different from `LAZ_SHARED GLOBAL` in that it applies stat changes to both characters |
| LAZ\_SHARED GLOBAL | 1<<31 | Items that should be shared between Tainted Lazarus' forms. Different from `LAZ_SHARED` in that it doesn't apply stat changes to both characters  |
| NO\_EDEN           | 1<<32 | Items that will not be a random starting item for Eden and Tainted Eden                                                                           |

