-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/buttons.html

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)


main =
  beginnerProgram { model = 0, view = view, update = update }

-- see: examples/external-css.elm
stylesheet =
    let
        tag = "link"
        attrs =
            [ attribute "rel"       "stylesheet"
            , attribute "property"  "stylesheet"
            , attribute "href"      "//unpkg.com/tachyons@4.6.1/css/tachyons.min.css"
            ]
        children = []
    in
        node tag attrs children


view model =
  div []
    [ stylesheet
    , button [ onClick Increment, class "btn btn-success" ] [ text "+" ]
    , div [] [ text (toString model) ]
    , button [ onClick Decrement, class "btn btn-warning" ] [ text "-" ]
    , button [ onClick Reset ] [ text "Reset" ]
    ]

type Msg = Increment | Decrement | Reset


update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

    Reset ->
      0
