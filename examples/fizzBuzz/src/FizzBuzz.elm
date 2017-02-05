-- We are exposing all functions inside our module. This will allow us to reuse
-- functions we have defined here in other modules.


module FizzBuzz exposing (..)

-- Import Html module exposing to this context all functions inside that module
-- this means, we can call its functions without having to prepend the name of the module
-- so we can call [text](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html#text)
-- just using the name function 'text' instead of 'Html.text'

import Html exposing (..)


-- Now we are importing List an String modules. In this case we are not exposing
-- any function, so we if we want to use any of their function we have to access
-- to them prepending the name of the module like `List.map` or `String.isEmpty`

import List
import String


-- Under this lines we are defining our fizzbuzz function. The first line is
-- the function type annotation, it is telling that our function is going to
-- receive a Int (integer) as a parameter and it is going to return a String.
-- This will help us know how the function works, and also will help to the elm
-- compiler to raise errors if we are calling or returning other types when we
-- are using that function.


fizzBuzz : Int -> String
fizzBuzz n =
    let
        -- if a number module 3 is 0 then we will return Just "Fizz"
        -- otherwise we will return Nothing
        fizz n =
            if (n % 3 == 0) then
                Just "Fizz"
            else
                Nothing

        -- if a number module 5 is 0 then we will return Just "Buzz"
        -- otherwise we will return Nothing
        buzz n =
            if (n % 5 == 0) then
                Just "Buzz"
            else
                Nothing
    in
        -- We will map our list with fizz an buzz funtions over
        -- an anonimous function executing them with our input number 'n'
        -- if any of them return Nothing, it will be filtered and it won't be
        -- in the returned list.
        List.filterMap (\fn -> fn n) [ fizz, buzz ]
            |> String.concat
            -- concat them
            |>
                \fizzbuzz ->
                    if (String.isEmpty fizzbuzz) then
                        toString n
                        -- if for that imput is not Fizz, neither Buzz
                        -- we will return a string with the input number
                    else
                        fizzbuzz



-- Elm programs define a main function, that gets run when the program starts.
-- This main function will render Html with a list of the one hundred first
-- fizzbuzz numbers.


main : Html msg
main =
    let
        fizzNumbers : List (Html msg)
        fizzNumbers =
            -- Generate a list with numbers between 1 and 100
            -- then we will map them to the fizzBuzz of that number
            -- wrapped in a Html li element
            List.range 1 100
                |> List.map fizzBuzz
                |> List.map text
                |> List.map List.singleton
                |> List.map (li [])
    in
        ul [] fizzNumbers
