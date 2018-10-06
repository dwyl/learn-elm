module Main exposing (..)

import Html exposing (text)


addOne : Int -> Int
addOne x =
    Debug.log "addOne" x + 1


main =
    text (toString (addOne 41))
