module Main exposing (..)

import Browser
import Browser.Events exposing (onResize)
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
import Html exposing (Html)
import Html.Attributes as HA exposing (id)
import Svg exposing (..)
import Svg.Attributes as SA exposing (..)



{- main =
   Element.layout [] view
-}


type alias Model =
    { width : Int
    , height : Int
    }


type Msg
    = WindowResized Int Int 


defaultModel =
    Model 0 0


init : (Int,Int) -> ( Model, Cmd Msg )
init (width, height) =
    ( Model width height, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WindowResized w h->
            ( Model w h, Cmd.none )


subscriptions model =
  onResize WindowResized 

t : Model -> Html Msg
t model =
    Element.layout [] <| view model


main =
    Browser.element
        { init = init
        , view = t 
        , update = update
        , subscriptions = subscriptions
        }


view : Model -> Element Msg
view model =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.fill
        ]
        [ header
        , middle model
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
        , menuButton
        , menuButton
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


middle : Model -> Element msg
middle model =
    row
        [ Element.height Element.fill
        , Element.width Element.fill
        , "sant" |> HA.id >> Element.htmlAttribute
        ]
        [ sidebar
        , svgBody model
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

svgBody : Model -> Element msg
svgBody model =
  let
      vb = "0 " ++ "0 " ++ String.fromInt model.height ++ " " ++ String.fromInt model.width
  in
  
    html <|
        svg
            [ SA.viewBox vb 
            , SA.fill "green"
            , SA.id "MainSVGBody"
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
