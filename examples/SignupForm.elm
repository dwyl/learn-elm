module SignupForm exposing (..)

-- This is where our Elm logic lives.`module SignupForm` declares that this is
-- the SignupForm module, which is how other modules will reference this one
-- if they want to import it and reuse its code.


-- Elm’s "import" keyword works similarly to "require" in node.js.

import Html exposing (..)


-- The “exposing (..)” option says that we want to bring the Html module’s contents
-- into this file’s current namespace, so that instead of writing out
-- Html.form and Html.label we can use "form" and "label" without the "Html."

import Html.Events exposing (..)


-- This works the same way; we also want to import the entire
-- Html.Events module into the current namespace.

import Html.Attributes exposing (id, type_, for, value, class)


-- With this import we are only bringing a few specific functions into our
-- namespace, specifically "id", "type_", "for", "value", and "class".


view model =
    form [ id "signup-form" ]
        [ h1 [] [ text "Sensational Signup Form" ]
        , label [ for "username-field" ] [ text "username: " ]
        , input [ id "username-field", type_ "text", value model.username ] []
        , div [ class "validation-error" ] [ text model.errors.username ]
        , label [ for "password" ] [ text "password: " ]
        , input [ id "password-field", type_ "password", value model.password ] []
        , div [ class "validation-error" ] [ text model.errors.password ]
        , div [ class "signup-button" ] [ text "Sign Up!" ]
        ]


-- Take a look at this starting model we’re passing to our view function.
-- Note that in Elm syntax, we use = to separate fields from values
-- instead of : like JavaScript uses for its object literals.


getErrors model =
    { username =
        if model.username == "" then
            "Please enter a username!"
        else
            ""
    , password =
        if model.password == "" then
            "Please enter a password!"
        else
            ""
    }


initialErrors =
    { username = "", password = "" }

initialModel =
    { username = "", password = "", errors = initialErrors }

update msg model =
    if msg.msgType == "VALIDATE" then
        ( { model | errors = getErrors model }, Cmd.none )
    else
        ( model, Cmd.none )

main =
    Html.program
        { init = ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }

-- see: http://tech.noredink.com/post/129641182738/building-a-live-validated-signup-form-in-elm
