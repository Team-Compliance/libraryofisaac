# Library of Isaac

<img src="https://imgur.com/3Z6cAMm.png" alt="Library of Isaac Logo" width="300"></img>

The Library of Isaac is a universal lua library, full of any tool you could ever think of needing for Isaac modding. Check out the docs [here](https://team-compliance.gitbook.io/library-of-isaac/).

## About

The goal of this library is to provide Isaac mod developers with a complete toolbox that makes creating mods a far easier and faster experience than ever before.

- **Type Safety:** Despite lua not being inherently type safe itself, the library makes use of the [Sumneko's Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) and the [Filloax's Binding of Isaac API autocomplete extension](https://marketplace.visualstudio.com/items?itemName=Filloax.isaac-lua-api-vscode) to add type annotations to all of the functions.
- **Lightweight:** The library has been built so if any non essential files are removed, everything will still work seamlessly. This allows developers to only keep the files they need to avoid unnecessary clutter in their mod. This is made better thanks to the [Visual Studio Code extension](https://marketplace.visualstudio.com/items?itemName=ThiccoCatto.library-of-isaac-extension), which automates this process for you.
- **Performace:** If multiple mods are using the same features of the library, only one instance of the library runs concurrently, preventing redundant code execution and optimizing performance.

## Getting started
There are several ways of using the library:
- **Install the extension.** This is the recommended way of using it. Get the extension [here](https://marketplace.visualstudio.com/items?itemName=ThiccoCatto.library-of-isaac-extension). Run the `Initialize Library of Isaac Project` command to start and the `Build Library of Isaac Project` command to minimize the library.
- **Add the library as a submodule.** If you are using a git repository you should be able to require this repo as a submodule. This makes updating to new versions much easier.
- **Download the library.** You can also simply download this repo as a zip file and put it in your mod.
- **Require the library mod.** If you want to make your mod as lightweight as possible, you can ask your users to download the library mod from the workshop. This is not recommended however, since it adds an extra download step for the user.

For a more comprehensive explanation, read the `Get Started` section of the docs.

Note that most of the code here was taken from [`isaacscript-common`](https://isaacscript.github.io/isaacscript-common), a bigger and more complete Isaac library that you should check out if you want a more type-safe solution.
Note that in shared features between this library and isaacscript, this library may have bugs that are not present in isaacscript.
