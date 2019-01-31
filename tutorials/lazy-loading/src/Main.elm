port module Main exposing (..)

import Browser
import Html exposing (Html, div, text, ul)
import Html.Attributes exposing (style)


-- TYPES


type alias Model =
    List Int


type Msg
    = Load Bool



-- MAIN


main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Load _ ->
            let
                newModel =
                    model ++ List.map (\n -> List.length model + n) initialModel
            in
                ( newModel, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ ul [] (List.map displayNum model)
        ]


displayNum : Int -> Html Msg
displayNum num =
    div [ style "margin-bottom" "50px" ]
        [ num |> String.fromInt |> text ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    scroll Load


port scroll : (Bool -> msg) -> Sub msg
