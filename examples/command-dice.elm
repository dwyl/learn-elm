module App exposing (Model, Msg(..), init, main, update, view)

import Browser exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import Random



-- MODEL


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 1, Cmd.none )



-- MESSAGES


type Msg
    = Roll
    | OnResult Int



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Roll ] [ text "Roll" ]
        , text (String.fromInt model)
        ]



-- -- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate OnResult (Random.int 1 6) )

        OnResult res ->
            ( res, Cmd.none )



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }
