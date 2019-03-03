-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/buttons.html


module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, view = view, update = update }


type alias Model =
    Int


init : Model
init =
    0


type Msg
    = Increment
    | Decrement


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Decrement ] [ text "-" ]
        ]
