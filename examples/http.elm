module Main exposing (Model, Msg(..), decodeGifUrl, getRandomGif, init, main, subscriptions, update, view)

import Browser exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Json.Decode exposing (Decoder, field, string)


main =
    Browser.element
        { init = init "kitten"
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { topic : String
    , gifUrl : String
    }


init : String -> () -> ( Model, Cmd Msg )
init topic _ =
    ( Model topic "waiting.gif"
    , getRandomGif topic
    )



-- UPDATE


type Msg
    = MorePlease
    | GotGif (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MorePlease ->
            ( model, getRandomGif model.topic )

        GotGif (Ok newUrl) ->
            ( Model model.topic newUrl, Cmd.none )

        GotGif (Err _) ->
            ( model, Cmd.none )



-- https://www.reddit.com/r/elm/comments/5wv2s6/what_does_the_cmdnone_do_in_an_update_statement/
-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text model.topic ]
        , button [ onClick MorePlease ] [ text "More Please!" ]
        , br [] []
        , img [ src model.gifUrl ] []
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- HTTP


getRandomGif : String -> Cmd Msg
getRandomGif topic =
    Http.get
        { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
        , expect = Http.expectJson GotGif decodeGifUrl
        }


decodeGifUrl : Decoder String
decodeGifUrl =
    field "data" (field "image_url" string)
