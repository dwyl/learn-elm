module Main exposing (Model, main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Round


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { weight : Float, height : Float }


init : Model
init =
    Model 0 0


type Msg
    = Weight String
    | Height String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Weight val ->
            { model | weight = Maybe.withDefault 0 (String.toFloat val) }

        Height val ->
            { model | height = Maybe.withDefault 0 (String.toFloat val) }


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "weight in kilogram", onInput Weight ] []
        , input [ type_ "text", placeholder "height in meter", onInput Height ] []
        , div []
            [ model.weight / model.height ^ 2 |> Round.round 3 |> (++) "BMI: " |> text
            ]
        ]
