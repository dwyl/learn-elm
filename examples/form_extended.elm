-- Implementation of the Exercises for the Forms section of the Elm Architecture Tutotial
-- http://guide.elm-lang.org/architecture/user_input/forms.html
-- Elm Version 0.18


module Main exposing (..)

import Html exposing (..)
import Html as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String
import Char exposing (isDigit, isUpper, isLower)


-- see: http://package.elm-lang.org/packages/elm-lang/core/latest/Char


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }


type Validation
    = None
    | Ok
    | Error String


type alias Model =
    { name : String
    , password : String
    , pwAgain : String
    , age : String
    , valid : Validation
    }


model : Model
model =
    { name = ""
    , password = ""
    , pwAgain = ""
    , age = ""
    , valid = None
    }


type Msg
    = Name String
    | Password String
    | PwAgain String
    | Age String
    | Check


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PwAgain pwAgain ->
            { model | pwAgain = pwAgain }

        Age age ->
            { model | age = age }

        Check ->
            { model | valid = validate model }



-- this validation isn't great, can you help improve it?


validate : Model -> Validation
validate model =
    if model.password /= model.pwAgain then
        Error "Passwords don't match"
    else if String.length model.password < 8 then
        Error "Password must be 8 characters or more"
    else if not (String.any isDigit model.password) then
        Error "Password must contain digits"
    else if not (String.any isUpper model.password) then
        Error "Password must contain uppercase"
    else if not (String.any isLower model.password) then
        Error "Password must contain lowercase"
    else if String.length model.age == 0 then
        Error "Enter age"
    else if not (String.all isDigit model.age) then
        Error "Age must be a number"
    else
        Ok



-- Html Msg is a chunk of html that can product msg vals!


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "Re-enter Password", onInput PwAgain ] []
        , input [ type_ "text", placeholder "Age", onInput Age ] []
        , button [ onClick Check ] [ text "Submit" ]
        , viewValidation model
        ]


viewValidation : Model -> Html Msg
viewValidation model =
    let
        ( color, message ) =
            case model.valid of
                Ok ->
                    ( "green", "OK" )

                Error err ->
                    ( "red", err )

                None ->
                    ( "black", "Enter your details" )
    in
        div [ style [ ( "color", color ) ] ] [ text message ]
