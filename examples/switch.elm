module Main exposing (main, switch, tupleToList)

import Html exposing (text)


switch : ( a, b ) -> ( b, a )
switch ( x, y ) =
    ( y, x )


main =
    switch ( "A", "B" )
        |> tupleToList
        |> String.concat
        |> text


tupleToList ( a, b ) =
    [ a, b ]
