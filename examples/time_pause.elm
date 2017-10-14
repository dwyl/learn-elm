-- from: https://guide.elm-lang.org/architecture/effects/time.html
-- with: https://stackoverflow.com/questions/38708911/cancel-subscriptions-in-elm


module Main exposing (..)

import Html exposing (Html)


--import Html

import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { time : Time
    , paused : Bool
    }


init : ( Model, Cmd Msg )
init =
    ( Model 0 False, Cmd.none )


type Msg
    = Tick Time
    | PauseStart


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            if not model.paused then
                ( Model newTime False, Cmd.none )
            else
                ( model, Cmd.none )

        PauseStart ->
            ( Model model.time (not model.paused), Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick


clock : Time -> Html Msg
clock time =
    let
        sAngle =
            turns (Time.inMinutes time)

        sHandX =
            toString (50 + 40 * cos sAngle)

        sHandY =
            toString (50 + 40 * sin sAngle)
    in
        svg [ viewBox "0 0 100 100", width "300px" ]
            [ circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
            , line [ x1 "50", y1 "50", x2 sHandX, y2 sHandY, stroke "#023963" ] []
            ]


view : Model -> Html Msg
view model =
    let
        btnText =
            if model.paused then
                "Start"
            else
                "Pause"
    in
        Html.div []
            [ clock model.time
            , Html.button [ onClick PauseStart ] [ Html.text btnText ]
            ]
