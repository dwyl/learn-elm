module Main exposing (main)

import Element as E exposing (Element, el, row)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    E.layout []
        rowOfStuff


rowOfStuff : Element msg
rowOfStuff =
    row [ E.width E.fill, E.centerY, E.spacing 30 ]
        [ myElement
        , el [ E.centerX ] myElement
        , el [ E.alignRight ] myElement
        ]


myElement : Element msg
myElement =
    el
        [ Background.color (E.rgb255 75 192 169)
        , Font.color (E.rgb255 255 255 255)
        , Border.rounded 10
        , E.padding 30
        ]
        (E.text "stylish!")
