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

## Minimum setup

### Initialise the package

**Elm is using Github to name and publish packages. So the first step when creating a new package is to create a new Github repository.**

Then we can initialise our new Elm package with the command `elm init`, this will create a `src` folder and a `elm.json` file.
This json file contains the description of our new project (name, author, version, dependencies,...). See https://elm-lang.org/0.19.0/init
to get more informaiton on how to create a new project.

As we are creating a package that will be `import`ed in other projects and not a full application in itself, we need first to update the `elm.json`

> The [elm/compiler](https://github.com/elm/compiler) repository contains the documentation for the two types of elm.json file (application and pakage), see https://github.com/elm/compiler/tree/master/docs/elm.json


So the `elm.json` file should have the following format:
```json
{
    "type": "package",
    "name": "dwyl/elm-criteria",
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

We will have a few more things to add later on to be able to publish our package (e.g license file, tests, documentation) but firt to be able to play with the code will come with we first create an example folder.

### Create the example folder

run `mkdir examples` to create the folder.

The `example` folder will allow us to test rapidly our implementation and ideas and make sure the code for the package is working correctly. At the end of the development process it will also be small project example that our users can take ideas from.

Create the elm example application: `cd examples && elm init`. This time the `type`'s' value in the generated `elm.json` doesn't need to be modified as it's already an application. Instead of using the `src` folder we can use the current folder of the application, change the value `  "source-directories": ["src"]` to   `"source-directories": ["."]`. It makes a bit easier to see the list of examples.


Let's create a simple (dummy for now) Elm app in `examples/Example.elm`:

```elm
import Browser
import Html exposing (Html, button, div, h1, text)


main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model = String

init : Model
init =
  "Hello"


-- UPDATE

type Msg = None

update : Msg -> Model -> Model
update msg model =
  case msg of
    None ->
      model

-- VIEW

view : Model -> Html Msg
view model =
  div [] [ h1 [] [text model] ]

```

Still in the `examples` folder run `elm reactor` and open the application on `http://localhost:8000/Example.elm`, you should see `Hello`


### Create the package

Now that we have the `Example.elm` file we can start creating our package and try to plug it and use it with our new example application.

Create a file `Criteria.elm` which will have for API only a `view` function (let's try to keep things simple while we make sure that everything is initialised and plugged together)

```elm
module Criteria exposing (view)
import Html exposing (Html, button, div, h1, text)

view : Html msg
view =
    div [] [ h1 [] [text "text from package"] ]
```

As our package is not yet published, to allow our example to use it we need to update the `elm.json` file to expose our new module:

```json
"source-directories": [
  ".",
  "../src"
],
```

Then in our `Example.elm` file we can use the `view` function by importing the package then using the function in the example's view

```elm
...
import Criteria
...
  view : Model -> Html Msg
  view model =
    div []
      [ h1 [] [text model]
      , Criteria.view
      ]
```

We have now a minimum version of a package (not published yet) and an example using it! We can start to think what are the next steps to be able to publish our first version!

# First version

From our requirement list above we can try to trim down the features and make a first basic version with the following elements

- a button/pillbox with a default text to open/close the filters
- 1 level of filters (instead of 2)
- a filter consist of a displayed text, a value linked to this text (similar to normal dropdown) and a filter can be selected or not.
- The package will accept a list of text/value filters

## Reusable?

Our main concern when creating the package is to make it **valuable** for our users and one way to do this is for the package to be **reusable** on different kind of projects.

When we think about reusable code we'll most often think about components. However Elm is a functional programming language and is not really designed for creating components. To try to understand this you can read/watch the following links

- https://twitter.com/czaplic/status/903266544544878592 (components are objects)
- https://www.reddit.com/r/elm/comments/6x5w07/components_in_elm_why_not_and_how/

- https://www.youtube.com/watch?v=DoA4Txr4GUs

- https://www.reddit.com/r/elm/comments/5oi8jx/creating_a_simple_reusable_view_module_in_elm/

- https://medium.com/@mickey.vip/an-approach-to-nested-reusable-view-functions-in-elm-a1531b9abaf3

- https://discourse.elm-lang.org/t/api-design-reusable-modules/2623

- https://github.com/evancz/elm-sortable-table

So instead of creating components we should focus on creating reusable view.
**Views are functions and Elm uses function composition to build applications.**

Some concepts to keep in mind (extract from the above links) while designing the API of the package:

- build reusable view not components (elm is a Functional Programming language not an Object-Oriented programming language)
- Keep the API simple and short
- Try to keep the types signature simple
- Single source of truth for the data to avoid synchronisation issues
- Avoid parent-child communication - don't build tree of objects/components

Now that we have a better idea of resusable code with Elm, let's start to design our API

## Designing the API
