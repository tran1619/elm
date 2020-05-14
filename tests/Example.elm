module Example exposing (guardianNames, suite, main)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Html exposing (..)


suite : Test
suite =
    test "two plus two equals four"
    <|  \_ ->  (2 + 2)
        |> Expect.equal 4

guardianNames =
    test "only 2 guardians have names with less than 6 characters" <|
        \_ ->
            let
                guardians =
                    [ "Star-lord", "Groot", "Gamora", "Drax", "Rocket" ]
            in
            guardians
                |> List.map String.length
                |> List.filter (\x -> x < 6)
                |> List.length
                |> Expect.equal 2

add a b = a + b

multiply c d = c * d

divide e f = e / f
main =
    Html.text 
        <| toString 
        <| add 5 
        <| multiply 10 
        <| divide 30 10