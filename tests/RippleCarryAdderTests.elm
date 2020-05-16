module RippleCarryAdderTests exposing (andGateTests, fullAdderTests, inverterTests, orGateTests)

import RippleCarryAdder exposing (..)
import Test exposing (..)
import Fuzz exposing (..)
import Expect exposing(Expectation)


inverterTests =
    describe "Inverter"
        [ test "output is 0 when the input is 1" <|
            \_ ->
                inverter 0
                    |> Expect.equal 1
        , test "output is 1 when the input is 0" <|
            \_ ->
                inverter 1
                    |> Expect.equal 0
        ]
        
andGateTests =
    describe "AND gate"        
        [ test "output is 0 when both inputs are 0" <|
            \_ ->
                andGate 0 0
                    |> Expect.equal 0
        , test "output is 0 when the first input is 0" <|
            \_ ->
                andGate 0 1
                    |> Expect.equal 0
        , test "output is 0 when the second input is 0" <|
            \_ ->
                andGate 1 0
                    |> Expect.equal 0
        , test "output is 1 when both inputs are 1" <|
            \_ ->
                andGate 1 1
                    |> Expect.equal 1
        ]

orGateTests =
    describe "OR gate"
        [ test "output is 0 when both inputs are 0" <|
            \_ ->
                orGate 0 0
                    |> Expect.equal 0
        , test "output is 1 when the first input is 1" <|
            \_ ->
                orGate 1 0
                    |> Expect.equal 1
        , test "output is 1 when the 2nd input is 1" <|
            \_ ->
                orGate 0 1
                    |> Expect.equal 1
        , test "output is 1 when both inputs are 1" <|
            \_ ->
                orGate 1 1
                    |> Expect.equal 1
        ]

fullAdderTests =
    describe "Full adder"        
        [ test "sum and carry-out are 0 when both inputs and carry-in are 0" <|
            \_ -> 
                fullAdder 0 0 0
                    |> Expect.equal { carry = 0, sum = 0 }
        , test "sum is 1 and carry-out is 0 when both inputs are 0, but carry-in is 1" <|
            \_ ->
                fullAdder 0 0 1
                    |> Expect.equal { carry = 0, sum = 1 }    
        , test "sum is 1 and carry-out is 0 when the first input is 0, the second input is 1 and carry-in is 0" <|
            \_ ->
                fullAdder 0 1 0
                    |> Expect.equal { carry = 0, sum = 1 }
        , test "sum is 0 and carry-out is 1 when the first input is 0, the second input is 1 and carry-in is 1" <|
            \_ ->
                fullAdder 0 1 1
                    |> Expect.equal { carry = 1, sum = 0}
        , test "sum is 1 and carry-out is 0 when the first input is 1, the second input is 0 and carry-in is 0" <|
            \_ ->
                fullAdder 1 0 0
                    |> Expect.equal {carry = 0, sum = 1}
        , test "sum is 0 and carry-out is 1 when the first input is 1, the second input is 0 and carry-in is 1" <|
            \_ ->
                fullAdder 1 0 1
                    |> Expect.equal {carry = 1, sum = 0}
        , test "sum is 0 and carry-out is 1 when the first input is 1, the second input is 1 and carry-in is 0" <|
            \_ ->
                fullAdder 1 1 0
                    |> Expect.equal {carry = 1, sum = 0}
        , test "sum is 1 and carry-out is 1 when the first input is 1, the second input is 1 and carry-in is 1" <|
            \_ ->
                fullAdder 1 1 1 
                    |> Expect.equal {carry = 1, sum = 1}
        ]