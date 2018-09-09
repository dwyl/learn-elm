module Main exposing (..)

import Html exposing (text)


switch : ( a, b ) -> ( b, a )
switch ( x, y ) =
    ( y, x )


main =
    text (toString (switch ( "A", "B" )))
