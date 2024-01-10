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
        , fill
        , height
        , padding
        , paddingXY
        , rgb255
        , rgb
        , row
        , spacing
        , text
        , width
        , pointer
        , mouseOver
        )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    Element.layout [] view


view =
    Element.column
        [ width fill
        , height fill
        ]
        [ header
        , middle
        , footer
        ]


header =
    row
        [ width fill
        , Border.width 1
        , paddingXY 20 10
        ]
        [ text "Logo"
        , menuButton
        ]


menuButton =
    el
        [ alignRight
        , padding 10
        , Border.width 1
        , Border.rounded 4
        , pointer
        , mouseOver [Background.color (rgb 0 1 0)]
        ]
        (text "MenuButton")


middle =
    row
        [ height fill
        , width fill
        ]
        [ sidebar
        , content
        ]


sidebar =
    column
        [ height fill
        , Border.width 1
        ]
        [ text "Item1"
        , text "Item2"
        ]


content =
    el
        [ width fill
        , height fill
        ]
    <|
        el
            [ centerX
            , centerY
            ]
            (text "Content")


footer =
    el
        [ Border.width 1
        , width fill
        ]
        (text "Footer")
