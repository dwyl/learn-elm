-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/buttons.html


module Main exposing (..)

import Browser
import Html exposing (button, div, text)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = 0, view = view, update = update }


view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] (List.map viewDot (List.range 1 model))
        , button [ onClick Increment ] [ text "+" ]
        ]


viewDot n =
    text "*"


type Msg
    = Increment
    | Decrement


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1
