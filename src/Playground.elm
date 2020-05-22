module Playground exposing (signUp, add, addOne, doubleScores, guardiansWithShortNames)

import Regex

scoreMultiplier = 2
highestScores = [ 315, 320, 312, 370, 337, 318, 314 ]

doubleScores scores =
    List.map (\x -> x * scoreMultiplier) scores

addOne : number -> number
addOne y = y + 1    

add : Int -> (Int -> Int)
add n1 n2 = n1 + n2

guardiansWithShortNames : List String -> Int
guardiansWithShortNames guardians =
    guardians
        |> List.map String.length
        |> List.filter (\x -> x < 6)
        |> List.length

signUp : String -> String -> Result String String
signUp email ageStr =
    case String.toInt ageStr of
        Nothing ->
            Err "Age must be an integer."        

        Just age ->
            let
                emailPattern =
                    "\\b[A-Za-z0-9. %+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

                regex =
                    Maybe.withDefault Regex.never <|
                        Regex.fromString emailPattern

                isValidEmail =
                    Regex.contains regex email
            in
            if age < 13 then
                Err "You need to be at least 13 years old to sign up."

            else if isValidEmail then
                Ok "Your account has been created successfully!"

            else
                Err "You entered an invalid email."
