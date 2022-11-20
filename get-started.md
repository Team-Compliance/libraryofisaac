# Get Started

## Download

You can download Library of Isaac in several ways, so you can choose whichever one you prefer and fits your needs better.

### 1. Use the VsCode extension

Go to Visual Studio Code, search for `Library of Isaac` and download the extension. This extension will detect the modules your code uses and automatically handle adding just the necessary files.

### 2. Manually download the library

Go to the github repo [here ](https://github.com/Team-Compliance/libraryofisaac)and download the latest version. Note that if you're gonna take this approach you will have to manually remove the unnecessary files if you want to minimize the size of your mod.

### 3. Require the Library of Isaac mod in the workshop

If you want your mod to be as lightweight as possible you can also make your mod require the user to also have the Library of Isaac workshop mod. This of course introduces an inconvenience for the user and may cause some problems where the user simply didn't install the Library of Isaac mod.

## Using the library

To start using the library, you first need to initialize it. For that you need to require the file and call the `Init` function, passing the folder you put the library in:

```lua
local myFolder = "folder you put the library in"
local LOCAL_TSIL = require(myFolder .. ".TSIL")
LOCAL_TSIL.Init(myFolder)
```

{% hint style="info" %}
This needs to be done before you use any of the features in the library.
{% endhint %}

After that, you'll be able to access a global variable `TSIL` which has all of the library's features.

The whole library is separated into modules, and to use functions you use dots (`.`) instead of colons (`:`).&#x20;

In this example we count the number of rotten gapers that are currently in the room:

```lua
local rottenGapers = TSIL.Entities.GetEntities(
    EntityType.ENTITY_GAPER,
    TSIL.Enums.GaperVariant.ROTTEN_GAPERS
)

local numRottenGapers = TSIL.Utils.Tables.Count(rottenGapers)
```

{% hint style="info" %}
The `Utils` module is different to others modules, as it doesn't have any functions of its own, but has several other submodules.
{% endhint %}

## Reading the docs

### Optional arguments

Many functions don't require you to pass all the arguments. If that's the case the docs can indicate it in two ways.

* An equals symbol after the argument name followed by what the default would be.
* A question mark after the argument type.

### Variadic functions

When a function has an argument that is three dots, it's indicating that it's a variadic functions, which means that you can add as many arguments of that type as you want.

{% hint style="info" %}
This kind of arguments will always be the last one in the function.
{% endhint %}

### Optional returns

When the return type of a function is followed by a question mark it means that the function may return `nil` instead of whatever type it's supposed to return.

### Table types

A function that takes/returns a table might be indicated in several ways:

* `T[]`: This means a table where all the values are of type `T`.
* `<T, S>`: This means a table where the keys are of type `T` and the values of type `S`.
* `{x: T, y: S}`: This means a table with string keys called `x` and `y` that have associated values of types `T` and `S` respectively.
