module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Random


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions model =
    Sub.none



-- MODEL


type alias Model =
    { dieFace1 : Int
    , dieFace2 : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model 4 2, Cmd.none )



-- VIEW


view model =
    div []
        [ img [ src (makeSrcUrl model.dieFace1), height 100, width 100 ] []
        , img [ src (makeSrcUrl model.dieFace2), height 100, width 100 ] []
        , br [] []
        , button [ onClick Roll ] [ text "roll" ]
        ]


makeSrcUrl num =
    "./images/dice_" ++ String.fromInt num ++ ".jpg"



-- UPDATE


type Msg
    = Roll
    | NewFace ( Int, Int )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewFace (Random.pair (Random.int 1 6) (Random.int 1 6)) )

        NewFace ( newFace1, newFace2 ) ->
            ( Model newFace1 newFace2, Cmd.none )
