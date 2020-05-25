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

type Msg = Increment | Decrement


-- Update
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


-- View
view model =
    div []
        [ button [ onClick Decrement] [ text "-"]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment] [ text "+"]
        ]            
    