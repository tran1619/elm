module Playground exposing (add, addOne, doubleScores, guardiansWithShortNames)

scoreMultiplier = 2
highestScores = [ 315, 320, 312, 370, 337, 318, 314 ]

doubleScores scores =
    List.map (\x -> x * scoreMultiplier) scores

addOne : number -> number
addOne y = y + 1    

add : Int -> Int -> Int
add num1 num2 =
    num1 + num2

{- Takes a list of strings and 
    returns an integer value
-}
guardiansWithShortNames guardians =
    guardians
        |> List.map String.length
        |> List.filter (\x -> x < 6)
        |> List.length