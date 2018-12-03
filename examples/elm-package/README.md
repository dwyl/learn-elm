# What

A step by step guide on how to create a dropdown/filters
Elm package that you can reuse on your projects.

This Readme will not only show you how to use the package on your project but
also how it is created and published.
The process of writing this step by step guide
is to force us to question the choices we make for the package's implementation
and to discover some new questions problems that we will need to answer.
This will help us to improve and enhance the package and
hopefully motivate also others to contribute to the project.

This document aims to reflect and describe as we implement the package our thoughts, ideas and solutions. **It is our learning process for creating a useful and reusable Elm package.**

# Requirements

**Before creating a new elm package, it's a good idea to read the
[design guidlines](https://package.elm-lang.org/help/design-guidelines) documentation:**

> Design for a concrete use case

This is the research phase and it should help you to answer why
we want to create a package. In our case we want to be able to
have a list of selectable filters on multiple levels.
[Searching](https://package.elm-lang.org/) for similar existing packages with the terms
`filter` or `dropdown` wasn't very fruitful.
This research step is in progress and creating this guide is also a way to learn
how to create a useful elm package.

> Avoid gratuitous abstraction

We'll try to avoid abstracting too soon and we'll try to keep the API simple and useful.
For example the first version of the package limit the level of filters to 2
instead of having an unlimited number of levels. This will simplify the API and UI.

> Write helpful documentation with examples

Read https://package.elm-lang.org/help/documentation-format.
The second link in this section (https://package.elm-lang.org/help/docs-preview) returns 404
and will be removed (see https://discourse.elm-lang.org/t/docs-preview-404s/1687)

The last three sections of the guidelines
(`The data structure is always the last argument`, `Keep tags and record constructors secret` and `Naming`)
are a bit more technical and we will come back to them when we start building our package

This guide help us to define our requirements for the package:

![filters](https://user-images.githubusercontent.com/6057298/49383414-9409ae80-f710-11e8-9a00-e092bbf4ad29.png)

- Open/Close filter when click on the pill
- Close filter when click outside of the dropdown/filters.
  This allow to use multiple dropdown but only have one open at a time (similar to normal dropdown)
- Allow to select first and second level filters
- The module must be responsive. On mobile the filter will take the full screen
- When a filter is selected it is underlined
- The user must be able to use the dropdown/filter with the keyboard
- A first level filter can be open/close if it contains sub filters
- The user can reset the filters by clicking on the "x" button



# How

1. Create the package (ie create **documentation**, test and code)
2. Publish the package
3. Use the package

## Initialise the package

First we need to initialise our new package. Run the command `elm init`, this will create a `src` folder and the `elm.json` file.
This json file contains the description of our new project (name, author, version, dependencies,...). See https://elm-lang.org/0.19.0/init
to get more informaiton on how to create a new project.

As we are creating a package that will be `import`ed in other projects and not a full application in itself, we need first to update the `elm.json`

> The [elm/compiler](https://github.com/elm/compiler) repository contains the documentation for the two types of elm.json file (application and pakage), see https://github.com/elm/compiler/tree/master/docs/elm.json


So the `elm.json` file should have the following format:
```
{
    "type": "package",
    "name": "dwyl/dropdown-filters",
    "summary": "Dropdown with selectable filters",
    "license": "BSD-3-Clause",
    "version": "1.0.0",
    "exposed-modules": [],
    "elm-version": "0.19.0 <= v < 0.20.0",
    "dependencies": {
        "elm/core": "1.0.0 <= v < 2.0.0"
    },
    "test-dependencies": {}
}
```

- Make sure the `type` value is `package`
- update the name of your package. The name must be the name of the repository of the package
- `exposed-modules` will contain the modules' name that will exposed the API of the package
- `dependencies` is the list of dependencies necessary for the package. This will be updated if necessary when a new package is installed with `elm install`
