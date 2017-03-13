port module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)


{- Defining ports
   Here we are going to define ports where our elm application
   is going to send or receive messages to or from JavaScript

   The JavaScript code we have written is in the index.html
-}
-- we will send a message with the name of the file we want to play


port play : String -> Cmd msg



-- we will send a message to stop the current audio


port stop : () -> Cmd msg



-- we will send a message to pause the current audio


port pause : () -> Cmd msg



-- we will receive a message from javascript when an audio ends


port ended : (() -> msg) -> Sub msg


type alias Model =
    { playing : Bool
    }


model : Model
model =
    Model False


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type Msg
    = Play String
    | Stop
    | Pause


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Play song ->
            -- When a Play message is received, we wil send through our port
            -- a message with the name of the file we want to play
            ( { model | playing = True }, play song )

        Stop ->
            -- When a Stop message is received, we wil send through our port
            -- a message (an empty tuple) to JavaScript
            ( { model | playing = False }, stop () )

        Pause ->
            -- When a Pause message is received, we wil send through our port
            -- a message (an empty tuple) to JavaScript
            ( { model | playing = False }, pause () )


view : Model -> Html Msg
view model =
    let
        playPauseBtn =
            if (model.playing) then
                button [ onClick Pause ] [ text "Pause" ]
            else
                button [ onClick (Play "audio.mp3") ] [ text "Play" ]
    in
        div []
            [ playPauseBtn
            , button [ onClick Stop ] [ text "Stop" ]
            ]



{-
   Here we will be listening for our elm 'ended' port
   to Stop our player (we need to update our model with 'playing' = False)
-}


subscriptions : Model -> Sub Msg
subscriptions model =
    ended (always Stop)
