module Main exposing (..)

import Element
    exposing
        ( Element
        , alignRight
        , centerX
        , centerY
        , el
        , explain
        , fill
        , height
        , padding
        , rgb255
        , row
        , spacing
        , text
        , width
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
        ]
        [ text "Logo"
        , el [ alignRight ] (text "MyMenuButton")
        ]


middle =
    row
        [ explain Debug.todo
        , height fill
        , width fill
        ]
        [ text "Content" ]


footer =
    text "Footer"
