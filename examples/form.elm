-- Read all about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/user_input/forms.html


module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


init : Model
init =
    Model "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ viewInput "text" "Name" model.name Name
        , viewInput "password" "Password" model.password Password
        , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
        , viewValidation model
        ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
    if String.length model.password == 0 then
        div [] []
        -- empty
    else if String.length model.password > 0 && String.length model.password < 8 then
        div [ style "color" "red" ] [ text "Passwords must be longer than 8 characters." ]
    else if model.password == model.passwordAgain then
        div [ style "color" "green" ] [ text "OK" ]
    else
        div [ style "color" "red" ] [ text "Passwords do not match!" ]
