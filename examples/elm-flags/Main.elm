module Main exposing (..)

import Html exposing (..)


type alias Model =
    { url : String
    , title : String
    }



-- Our Flags type alias must match the data passed to it from the index.html


type alias Flags =
    { url : String
    }


initialModel : Model
initialModel =
    { url = ""
    , title = "This is the current URL: "
    }


main : Program Flags Model Msg
main =
    programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- init function to take the initial model but change url to the url flag passed to it


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { initialModel
        | url = flags.url
      }
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    div []
        [ span []
            [ text (model.title) ]
        , span [] [ text (model.url) ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Example ->
            ( model, Cmd.none )


type Msg
    = Example
