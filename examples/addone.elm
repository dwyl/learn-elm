module Main exposing (..)

import Html exposing (text)


addOne : Int -> Int
addOne x =
    Debug.log "addOne" x + 1


main =
    text (String.fromInt (addOne 41))
