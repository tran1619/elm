module Counter exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


-- Main
main =
    Browser.sandbox
        { init = 0
        , view = view
        , update = update
        }

type Msg = Increment5 | Increment | Decrement | Decrement5


-- Update
update msg model =
    case msg of
        Increment5 ->
            model + 5
        Increment ->
            model + 1

        Decrement ->
            model - 1
        Decrement5 ->
            model - 5


-- View
view model =
    div []
        [ button [ onClick Decrement5 ] [ text "-5"]
        , button [ onClick Decrement] [ text "-"]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment] [ text "+"]
        , button [ onClick Increment5] [ text "+5"]
        ]            
    