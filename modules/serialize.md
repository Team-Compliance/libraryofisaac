---
description: >-
  Functions used to serialize Isaac classes that allows us to save them using
  the Save Manager.
---

# Serialize

## Overview

| Return Value                                                         | Function                                                                                                                                |
| -------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| T                                                                    | [CopyIsaacAPIClass](serialize.md#copyisaacapiclass)(`T` class)                                                                          |
| [BitSet128](https://wofsauge.github.io/IsaacDocs/rep/BitSet128.html) | [DeserializeBitSet128](serialize.md#deserializebitset128)(`table` bitSet128)                                                            |
| [Color](https://wofsauge.github.io/IsaacDocs/rep/Color.html)         | [DeserializeColor](serialize.md#deserializecolor)(`table` color)                                                                        |
| unknown                                                              | [DeserializeIsaacAPIClass](serialize.md#deserializeisaacapiclass)(`unknown` serializedIsaacAPIClass)                                    |
| [KColor](https://wofsauge.github.io/IsaacDocs/rep/KColor.html)       | [DeserializeKColor](serialize.md#deserializekcolor)(`table` kColor)                                                                     |
| [RNG](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)             | [DeserializeRNG](serialize.md#deserializerng)(`table` rng)                                                                              |
| [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)       | [DeserializeVector](serialize.md#deserializevector-table-vector)(`table` vector)                                                        |
| boolean                                                              | [IsCopyableIsaacAPIClass](serialize.md#iscopyableisaacapiclass)(`unknown` object)                                                       |
| boolean                                                              | [IsSerializationBrand](serialize.md#isserializationbrand)(`unknown` key)                                                                |
| boolean                                                              | [IsSerializedBitSet128](serialize.md#isserializedbitset128)(`unknown` object)                                                           |
| boolean                                                              | [IsSerializedColor](serialize.md#isserializedcolor)(`unknown` object)                                                                   |
| boolean                                                              | [IsSerializedIsaacAPIClass](serialize.md#isserializedisaacapiclass)(`unknown` object)                                                   |
| boolean                                                              | [IsSerializedKColor](serialize.md#isserializedkcolor)(`unknown` object)                                                                 |
| boolean                                                              | [IsSerializedRNG](serialize.md#isserializedrng)(`unknown` object)                                                                       |
| boolean                                                              | [IsSerializedVector](serialize.md#isserializedvector)(`unknown` object)                                                                 |
| unknown                                                              | [SerializeBitSet128](serialize.md#serializebitset128)([`BitSet128` ](https://wofsauge.github.io/IsaacDocs/rep/BitSet128.html)bitSet128) |
| unknown                                                              | [SerializeColor](serialize.md#serializecolor-color-color)([`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) color)         |
| unknown                                                              | [SerializeIsaacAPIClass](serialize.md#serializeisaacapiclass)(`unknown` class)                                                          |
| unknown                                                              | [SerializeKColor](serialize.md#serializekcolor)([`KColor`](https://wofsauge.github.io/IsaacDocs/rep/KColor.html) kColor)                |
| unknown                                                              | [SerializeRNG](serialize.md#serializerng)([`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) rng)                               |
| unknown                                                              | [SerializeVector](serialize.md#serializevector)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) vector)                |

## Functions

### CopyIsaacAPIClass()

`T CopyIsaacAPIClass(T class)`

Helper function to generically copy an Isaac API class without knowing what specific type of class it is.

For the list of supported classes, see the [`CopyableIsaacAPIClassType`](../custom-enums/copyableisaacapiclasstype.md) enum.

### DeserializeBitSet128()

[`BitSet128`](https://wofsauge.github.io/IsaacDocs/rep/BitSet128.html) `DeserializeBitSet128(table bitSet128)`

Helper function to convert a serialized object to a normal `BitSet128` object.

### DeserializeColor()

[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) `DeserializeColor(table color)`

Helper function to convert a serialized object to a normal `Color` object.

### DeserializeIsaacAPIClass()

`unknown DeserializeIsaacAPIClass(unknown serializedIsaacAPIClass)`

Helper function to generically deserialize an Isaac API class without knowing what specific type of class it is.

For the list of supported classes, see the [`CopyableIsaacAPIClassType`](../custom-enums/copyableisaacapiclasstype.md) enum.

### DeserializeKColor()

[`KColor`](https://wofsauge.github.io/IsaacDocs/rep/KColor.html) `DeserializeKColor(table kColor)`

Helper function to convert a serialized object to a normal `KColor` object.

### DeserializeRNG()

[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) `DeserializeRNG(table rng)`

Helper function to convert a serialized object to a normal `RNG` object.

### DeserializeVector(`table` vector)

[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) `DeserializeVector(table vector)`

Helper function to convert a serialized object to a normal `Vector` object.

### IsCopyableIsaacAPIClass()

`boolean IsCopyableIsaacAPIClass(unknown object)`

Helper function to generically check if a given object is a copyable Isaac API class.

For the list of supported classes, see the [`CopyableIsaacAPIClassType`](../custom-enums/copyableisaacapiclasstype.md) enum.

### IsSerializationBrand()

`boolean IsSerializationBrand(unknown key)`

In order to find out what type of serialized Isaac API class this is, we search through the serialized table for brands.

### IsSerializedBitSet128()

`boolean IsSerializedBitSet128(unknown object)`

Used to determine is the given table is a serialized `BitSet128` object created by the `deepCopy` function.

### IsSerializedColor()

`boolean IsSerializedColor(unknown object)`

Used to determine is the given table is a serialized `Color` object created by the `deepCopy` function.

### IsSerializedIsaacAPIClass()

`boolean IsSerializedIsaacAPIClass(unknown object)`

Helper function to generically check if a given Lua table is a serialized Isaac API class.

For the list of supported classes, see the [`CopyableIsaacAPIClassType`](../custom-enums/copyableisaacapiclasstype.md) enum.

### IsSerializedKColor()

`boolean IsSerializedKColor(unknown object)`

Used to determine is the given table is a serialized `KColor` object created by the `deepCopy` function.

### IsSerializedRNG()

`boolean IsSerializedRNG(unknown object)`

Used to determine is the given table is a serialized `RNG` object created by the `DeepCopy` function.

### IsSerializedVector()

`boolean IsSerializedVector(unknown object)`

Used to determine is the given table is a serialized `Vector` object created by the `deepCopy` function.

### SerializeBitSet128()

`unknown SerializeBitSet128(`[`BitSet128` ](https://wofsauge.github.io/IsaacDocs/rep/BitSet128.html)`bitSet128)`

Helper function to convert a `BitSet128` object to a serialized version.

### SerializeColor([`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) color)

`unknown SerializeColor(`[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) `color)`

Helper function to convert a `Color` object to a serialized version.

### SerializeIsaacAPIClass()

`unknown SerializeIsaacAPIClass(unknown class)`

Helper function to generically serialize an Isaac API class without knowing what specific type of class it is.

For the list of supported classes, see the [`CopyableIsaacAPIClassType`](../custom-enums/copyableisaacapiclasstype.md) enum.

### SerializeKColor()

`unknown SerializeKColor(`[`KColor`](https://wofsauge.github.io/IsaacDocs/rep/KColor.html) `kColor)`

Helper function to convert a `KColor` object to a serialized version.

### SerializeRNG()

`unknown SerializeRNG(`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) `rng)`

Helper function to convert a `RNG` object to a serialized version.

### SerializeVector()

`unknown SerializeVector(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) `vector)`

Helper function to convert a `Vector` object to a serialized version.
