module Main exposing (main)

import Element exposing (Element, alignRight, centerX, centerY, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    Element.layout []
        myRowOfStuff


myRowOfStuff : Element msg
myRowOfStuff =
    row [ width fill, centerY, spacing 30 ]
        [ myElement
        , el [ centerX ] myElement
        , el [ alignRight, padding ] myElement -- align the element to the right
        ]


myElement : Element msg
myElement =
    el
        [ Background.color (rgb255 240 0 245)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 3
        , padding 30
        ]
        (text "stylish!")
