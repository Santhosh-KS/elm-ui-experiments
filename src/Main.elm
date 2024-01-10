module Main exposing (..)

import Element
    exposing
        ( Element
        , alignRight
        , centerX
        , centerY
        , column
        , el
        , explain
        , html
        , mouseOver
        , padding
        , paddingXY
        , pointer
        , rgb
        , row
        )
import Element.Background as Background
import Element.Border as Border
import Svg exposing (..)
import Svg.Attributes as SA exposing (..)


main =
    Element.layout [] view


view =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.fill
        ]
        [ header
        , middle
        , footer
        ]


header =
    row
        [ Element.width Element.fill
        , Border.width 1
        , paddingXY 20 10
        ]
        [ Element.text "Logo"
        , menuButton
        ]


menuButton =
    el
        [ alignRight
        , padding 10
        , Border.width 1
        , Border.rounded 4
        , pointer
        , mouseOver [ Background.color (rgb 0 1 0) ]
        ]
        (Element.text "MenuButton")


middle =
    row
        [ Element.height Element.fill
        , Element.width Element.fill
        ]
        [ sidebar
        , svgBody
        ]


sidebar =
    column
        [ Element.height Element.fill
        , Border.width 1
        ]
        [ Element.text "Item1"
        , Element.text "Item2"
        ]


content =
    el
        [ Element.width Element.fill
        , Element.height Element.fill
        ]
    <|
        el
            [ centerX
            , centerY
            ]
            (Element.text "Content")


svgBody =
    html <|
        svg
            [ SA.viewBox "0 0 100 100"
            , SA.fill "green"
            ]
            [ Svg.rect
                [ SA.fill "Red"
                , SA.width "100%"
                , SA.height "100%"
                , SA.opacity "40%"
                ]
                []
            ]


footer =
    el
        [ Border.width 1
        , Element.width Element.fill
        ]
        (Element.text "Footer")
