{--
    You *can* load an external CSS file in Elm, but currently,
    in Pure Elm that means adding a style element to the body instead of the head.

    It does cause a flash of unstyled content, so I think it's only useful
    for testing in Reactor.
    source: https://gist.github.com/coreytrampe/a120fac4959db7852c0f
--}


module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


stylesheet =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" "//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
            ]

        children =
            []
    in
        node tag attrs children


main =
    let
        inner =
            div [ id "inner", class "container" ] [ h1 [ class "text-center" ] [ text "hello flash of unstyled content" ] ]

        hero =
            div [ id "hero", class "jumbotron" ] [ inner ]
    in
        div [ id "outer" ] [ stylesheet, hero ]
