module Main exposing (main)

import Element exposing (Element, alignRight, centerX, centerY, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    Element.layout []
        rowOfStuff


rowOfStuff : Element msg
rowOfStuff =
    row [ width fill, centerY, spacing 30 ]
        [ myElement
        , el [ centerX ] myElement
        , el [ alignRight ] myElement
        ]


myElement : Element msg
myElement =
    el
        [ Background.color (rgb255 75 192 169)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 10
        , padding 30
        ]
        (text "stylish!")
