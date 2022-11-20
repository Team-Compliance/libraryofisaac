# PillEffectType

| Enumerator | Value | Description                                                                                                                                                          |
| ---------- | ----- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| NULL       | -1    | No valid pill will have this type.                                                                                                                                   |
| POSITIVE   | 0     |                                                                                                                                                                      |
| NEGATIVE   | 1     |                                                                                                                                                                      |
| NEUTRAL    | 2     |                                                                                                                                                                      |
| MODDED     | 3     | This is not a real `PillEffectType`. Due to limitations in the API, getting the real type of modded pill effects is not possible, so this value is returned instead. |
