## Lazy Loading

Sometimes we have a lot of data in our applications, and if we're displaying it all at once, it can be quite the burden on the DOM, causing the browser to slow down and feel laggy.

If we don't need to display all of the data at once, we can take advantage of a technique known as lazy loading. 

This involves displaying an initial set of data, then loading more as the user scrolls to the bottom of the page. It's how sites like Reddit, Instagram and Twitter can appear to have infinitely long feeds.

Let's look at how we can implement this in Elm.

To start, create the boilerplate for your Elm app in a file called `src/Main.elm`

``` elm
module Main exposing (..)

import Browser
import Html exposing (Html, div, text, ul)
import Html.Attributes exposing (style)


-- TYPES


type alias Model =
    {}


type Msg
    = Load



-- MAIN


main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    {}



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Load ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [] []



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
```

Then, the first thing we'll do is create our model. For this example we'll use a simple list of integers. So we need to simply set the Model's `type alias` to a list of integers (`List Int`) and create our initial model, a list of integers from 1 to 10.

``` elm
module Main exposing (..)

...

-- TYPES


type alias Model =
    List Int

...

-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]

...
```

Next we want to display the data on the page

``` elm
module Main exposing (..)

...

-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ ul [] (List.map displayNum model)
        ]


displayNum : Int -> Html Msg
displayNum num =
    div [ style "margin-bottom" "50px" ] -- Spread the data out so it takes up the whole page
        [ num |> String.fromInt |> text ] --Convert integer to string to display it as text

...

```

Here we render an unordered list that maps through our integers, displaying them each in a div.

Next, we need some way of being alerted that the user has scrolled to the bottom of the page. To do this we unfortunately need to use javascript, as Elm does not yet have an onScroll event.

``` elm
port module Main exposing (..) -- Mark this as a port module

...

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    scroll Load


port scroll : (Bool -> msg) -> Sub msg

```

Here we are doing a couple of things. An important part that can be easily missed is to use the word `port` in from of the module declaration. This needs to be done in order to define a port function. If you have many port functions, it may be best to define them all in one module together, but here as we only have one, we'll do it in the `Main` module.

Next, we're defining the `port` function `scroll`, and saying that it will receive a boolean from javascript. We then make sure to subscribe to that function, and passing in the update Msg we want to call when we receive it (`Load`).

For now, we'll update our `update` function to alert us when the `Load` message is called.

``` elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Load _ ->
            let
                a = 
                    Debug.log "message called" "Load"
            in
                ( newModel, Cmd.none )
```

Then we need to create our javascript to detect when a user has scrolled. We'll do this in an index.html file.

``` html
<html>
<head>
  <title>Elm Lazy Loading</title>
</head>
<body>
  <div id="elm"></div>
  <script src="main.js"></script>
  <script>
    var app = Elm.Main.init({
      node: document.getElementById("elm")
    })

    window.addEventListener("scroll", function (e) {
      // Detect whether user has scrolled to the bottom of the page
      // Then send message to the Elm app
      var top = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
      var height = (document.documentElement && document.documentElement.scrollHeight) || document.body.scrollHeight;

      // We send the message if they have scrolled to within 10% 
      // of the bottom of the page to create a smoother transition
      if (top + window.innerHeight >= height - (height / 10)) {
        app.ports.scroll.send(true);
      }
    })
  </script>
</body>
</html>
```

If you haven't already, you'll need to compile your Elm code to embed it in the html. Do this by running:
```
elm make src/Main.elm --output=main.js
```

Then we need to do is actually render our elm app. We do this by requiring our compiled Elm code and calling `Elm.Main.init`, passing it a dom node.

``` html
    <div id="elm"></div>
    <script src="main.js"></script>
    <script>
        var app = Elm.Main.init({
            node: document.getElementById("elm")
        })
    ...
    </script>
```

We save the initialised elm app to a variable, which we'll use later.

Next, we set up an event listener, to detect when a user scrolls

``` js
window.addEventListener("scroll", function (e) {
      var top = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
      var height = (document.documentElement && document.documentElement.scrollHeight) || document.body.scrollHeight;

      if (top + window.innerHeight >= height - (height / 10)) {
        app.ports.scroll.send(true);
      }
    })
```

Then, in the event listener, we calculate how far the user is from the bottom of the page. 

We do this using `document.body.scrollTop` (or `document.documentElement.scrollTop` depending on the browser) and add that to `window.innerHeight` to get the users current scroll position. We then compare that to `document.body.scrollHeight` (or `document.documentElement.scrollHeight`), which is the entire height of the page. 

If they are equal (or the users position is slightly greater), we know the user has scrolled to the bottom of the page. 

In this case we actually compare it to 90% of the page height (`height - (height / 10)`), meaning we'll detect when the user is within 10% of the bottom of the page. This will give a slightly smoother experience, as the data will have a chance to load before the user actually reaches the bottom of the page.

So then, if we determine the user has reached the bottom, we send a message to the Elm code, using the `app` variable we defined earlier and our Elm port function `scroll`:

``` js
app.ports.scroll.send(true);
```

We can now test that what we've got so far is working. Run 

```
elm reactor
```
in your terminal, and visit `localhost:8000/index.html` in your browser.

You should see our list of integers, and if you open your dev console and scroll to the bottom of the page, you should see our log:

<img width="400" alt="Elm message log" src="https://user-images.githubusercontent.com/8939909/52062580-aa918200-2568-11e9-8eba-2c9a31543b66.png">

The next step is to actually load/render some more data.

``` elm
-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Load _ ->
            let
                newModel =
                    model ++ List.map (\n -> List.length model + n) initialModel
            in
                ( newModel, Cmd.none )
```

Here we update our model in our `Load` message call. At this point we're simply doubling the size of the list, and displaying the next integers in the sequence, allowing us to endlessly scroll through an ever increasing list of numbers. 

(Note: For code simplicity, we're just doubling the size of the list on every call, but the more we scroll, the less efficient this function will get. We could solve this by utilising another field in the model which holds our previous update, then adding onto that).

Now if we recompile our code:

```
elm make src/Main.elm --output=main.js
```

and head back to the browser, we should see our infinite list of numbers:

<a href="https://gyazo.com/64d9a11952e434bfa513b06e84f87d10"><img src="https://i.gyazo.com/64d9a11952e434bfa513b06e84f87d10.gif" alt="Infinite number list" width="300"/></a>

Now that you've got the basic concept, you can switch out your `Load` function with anything you want. Display older blog posts, fetch random cat gifs from an API, whatever it is your app needs.