module Main exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (src, style)
import VitePluginHelper

type Msg = NoOp

main : Program () Int Msg
main =
    Browser.sandbox { init = 0, update = update, view = view }


update : Msg -> number -> number
update msg model = 0


view : Int -> Html Msg
view model =
    div [] [text "hello"]
