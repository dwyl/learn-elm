module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


pluralize singular plural quantity =
    if quantity == 1 then
        singular
    else
        plural


main =
    text <| toString <| List.map (pluralize "leaf" "leaves") [ 1, 2, 3 ]
