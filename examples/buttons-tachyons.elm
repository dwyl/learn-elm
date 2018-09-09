-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/buttons.html


module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = 0, view = view, update = update }



-- see: examples/external-css.elm


stylesheet =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "//unpkg.com/tachyons@4.6.1/css/tachyons.min.css"
            ]

        children =
            []
    in
    node tag attrs children


view model =
    div [ class "f-headline w-third tc ml5" ]
        [ stylesheet
        , button [ onClick Increment, class "bw2 br2 b--green bg-light-green green pa2 white fw4 w4 tc ttu tracked" ] [ text "+" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Decrement, class "bw2 br2 b--blue bg-light-blue blue pa2 white fw4 w4 tc ttu tracked" ] [ text "-" ]
        , button [ onClick Reset, class "bw2 br2 red b--red hover-bg-light-red mt2 pa2 white fw4 tc ttu tracked" ] [ text "Reset" ]
        ]


type Msg
    = Increment
    | Decrement
    | Reset


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0
