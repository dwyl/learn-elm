module Tests exposing (..)

import Test exposing (..)
import Expect
import FizzBuzz exposing (fizzBuzz)


all : Test
all =
    describe "FizzBuzz Test Suite"
        [ describe "module 3 numbers"
            [ test "3 should return 'Fizz'" <|
                \() ->
                    Expect.equal "Fizz" (fizzBuzz 3)
            , test "6 should return 'Fizz'" <|
                \() ->
                    Expect.equal "Fizz" (fizzBuzz 6)
            ]
        , describe "module 5 numbers"
            [ test "5 should return 'Buzz'" <|
                \() ->
                    Expect.equal "Buzz" (fizzBuzz 5)
            , test "10 should return 'Buzz'" <|
                \() ->
                    Expect.equal "Buzz" (fizzBuzz 10)
            , test "20 should return 'Buzz'" <|
                \() ->
                    Expect.equal "Buzz" (fizzBuzz 20)
            ]
        , describe "module 3 and 5 numbers"
            [ test "15 should return 'FizzBuzz'" <|
                \() ->
                    Expect.equal "FizzBuzz" (fizzBuzz 15)
            , test "30 should return 'Buzz'" <|
                \() ->
                    Expect.equal "FizzBuzz" (fizzBuzz 30)
            , test "60 should return 'Buzz'" <|
                \() ->
                    Expect.equal "FizzBuzz" (fizzBuzz 60)
            ]
        , describe "numers which not are module 3 neither 5"
            [ test "1 should return '1'" <|
                \() ->
                    Expect.equal "1" (fizzBuzz 1)
            , test "2 should return '2'" <|
                \() ->
                    Expect.equal "2" (fizzBuzz 2)
            , test "4 should return '4'" <|
                \() ->
                    Expect.equal "4" (fizzBuzz 4)
            , test "7 should return '7'" <|
                \() ->
                    Expect.equal "7" (fizzBuzz 7)
            ]
        ]
