# `elm-ui` a Language for _Reliable_ Layout and Interface


## _Why?_ 🤷 ... 😢 🌧  `|>` 😍🌈

@dwyl we _love_ the idea of having semantic and functional UIs
with no side-effects. Functional CSS allows anyone
to change _one_ style on a single element
without affecting any others.
For the past few years we have been using the Tachyons library
see: https://github.com/dwyl/learn-tachyons
Using Tachyons in dosens of projects
has been _good_ in small teams (_max 8 people_).
However we have found that even with a functional CSS library
(_that greatly reduces the possibility of cascading side effects_),
we still see redundant and unnecessary styles
and occasionally visual bugs are introduced that go undetected.
No CSS library we know of offers compile-time guarantees
that the layout/styles applied to a given element are _correct_.
That's where `elm-ui` comes in and changes the game!


## _What?_ 💭

`elm-ui` is a design system
for building semantic UI
with compile-time guarantees.

+ GitHub:
https://github.com/mdgriffith/elm-ui
+ Elm Package:
https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest

Matthew Griffith described it eloquently in his Elm Conf talk
"Building a Toolkit for Design":

[![elm-ui-tookit-for-design](https://user-images.githubusercontent.com/194400/70571846-7c240080-1b96-11ea-9dd2-cacae7110b54.png)](https://youtu.be/Ie-gqwSHQr0)
https://youtu.be/Ie-gqwSHQr0

> "_It's all right there.
There's no other place you have to go to modify this_."


`elm-ui` is to `HTML` and `CSS`
what `elm` is to `JavaScript`,
a way of making designing web applications fun again!
`elm-ui` offers compile-time guarantees
that your layout and styles work as expected.
You will see _helpful_ compiler errors/warnings
if you attempt to make a _breaking_ change to UI!

### Example Compile Time Warnings

In this case I have attempted to apply a `Float` of 2.5 to the `Border.rounded` (`border-radius`) property:
![image](https://user-images.githubusercontent.com/194400/70662062-69283380-1c5d-11ea-8d90-1d4f72d67ec6.png)

The same thing goes if I attempt to pass a `String` to `Border.rounded` e.g: `"2px"`
![image](https://user-images.githubusercontent.com/194400/70662334-ec498980-1c5d-11ea-9336-56f30db80270.png)
We get a type mismatch and know _exactly_ what needs to be fixed
in order for our view to compile.

If you make a typo in your layout/style it's won't compile:

![elm-ui-paddign-error](https://user-images.githubusercontent.com/194400/70667023-caed9b00-1c67-11ea-8396-0bf47d87a7d0.png)

Hopefully that gives you a _taste_
for the compiler warnings provided by `elm-ui`.
The best way to experience this further
is to start


## _How?_ 📝

In a new directory, initialise your `elm` workflow with the following command:
```sh
elm init
```

That will create an `elm.json` file similar to this one:
[`elm.json`]()

Next we will add the dependency for `mdgriffith/elm-ui`:
```sh
elm install mdgriffith/elm-ui
```
> **Note**: that command will only add an entry
in the `elm.json` `"dependencies"` section. <br />
`elm install` does not actually _install_ anything
until you attempt to compile the app.


Now create a directory called `src`
and a new file in the directory `src/Main.elm`.
Next _type_ (_or copy-paste_) the following code
into the `src/Main.elm` file:

```elm
module Main exposing (main)

import Element exposing (Element, alignRight, centerX, centerY, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    Element.layout []
        rowOfStuff


rowOfStuff : Element msg
rowOfStuff =
    row [ width fill, centerY, spacing 30 ]
        [ myElement
        , el [ centerX ] myElement
        , el [ alignRight ] myElement
        ]


myElement : Element msg
myElement =
    el
        [ Background.color (rgb255 75 192 169)
        , Font.color (rgb255 255 255 255)
        , Border.rounded 10
        , padding 30
        ]
        (text "stylish!")
```

> This is the canonical example in the docs:
https://github.com/mdgriffith/elm-ui
If you are unable to run the code on your `localhost`
try the Ellie version: https://ellie-app.com/3f2n4J5RnT3a1

In your terminal run:

```
elm reactor
```

Open the following page in your web browser:
http://localhost:8000/src/Main.elm

You should expect to see:

![elm-ui-basic-layout](https://user-images.githubusercontent.com/194400/70663573-90cccb00-1c60-11ea-8a1c-71d15d2b83ad.png)

Let's break down this code section by section:

The first line is the standard `Elm` module (export) directive.
```elm
module Main exposing (main)
```

The next section are the imports:
```elm
import Element exposing (Element, alignRight, centerX, centerY, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
```
These are fairly standard scoped `elm` import statements.

We are covering 4 out of 9 of the available `elm-ui` modules.
The one with the most features/functions is
[`Elemenent`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/Element)
which contains everything you need for creating standard HTML elements
including their layout and positioning.
[`Background`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/Element-Background),
[`Border`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/Element-Border)
and
[`Font`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/Element-Font)
are _exactly_ what you would expect them to be.




A note on long import lines:
if you attempt to split the `import Element` declaration into two lines:
```elm
import Element exposing (Element, alignRight, centerX, centerY, el, fill)
import Element exposing (padding, rgb255, row, spacing, text, width)
```
`elm-format` will re-format the two lines into one again ... we tried ... 🙄

The way to get around this is to follow the
[`elm` guide modules](https://guide.elm-lang.org/webapps/modules.html)
advice and avoid using `exposing` unless it's absolutely necessary.
So we can convert the super-long import  
(_which will only get longer as your view expands to include more style_):

From:

```elm
import Element exposing (Element, alignRight, centerX, centerY, el, fill, padding, rgb255, row, spacing, text, width)
```

To:

```elm
import Element as E exposing (Element, el, row)
```
This only makes the top level elements `el` and `row` available
for use in our view functions. The rest of the `elm-ui` functions
need to be prefixed with `E` e.g: `E.functionName`.
The advice from the creator of Elm
and other experienced Elm devs is:
avoid using uncontrolled import statements
e.g: `import Element exposing (..)`.
It might be tempting in the short-run to just "import everything",
but they rapidly become an unmaintainable headache.


The _full_ revised code would be:

```elm
module Main exposing (main)

import Element as E exposing (Element, el, row)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    E.layout []
        rowOfStuff


rowOfStuff : Element msg
rowOfStuff =
    row [ E.width E.fill, E.centerY, E.spacing 30 ]
        [ myElement
        , el [ E.centerX ] myElement
        , el [ E.alignRight ] myElement
        ]


myElement : Element msg
myElement =
    el
        [ Background.color (E.rgb255 75 192 169)
        , Font.color (E.rgb255 255 255 255)
        , Border.rounded 10
        , E.padding 30
        ]
        (E.text "stylish!")
```

Some people might feel that this tedious because it's more to type.
However it's _immediately_ clear where a given function "comes from"
and there is a much lower risk of naming conflicts.

<!--
Consider the following scenario:
Your App has a _dynamic_ (_or "responsive"_) navigation view function
that changes depending on the `width` of the viewport (_screen_).
The signature of the function might be something like this:

```elm
nav : Int -> Html Msg
nav width =
  if width > 600 then
    E.row [ E.width E.fill]
  else
    -- something else
    -- TODO: paste example of responsive Nav once we've created it!
```
-->












<br /><br />

### Drawbacks

`Colors` have to be specified in terms of **rgb** values.
i.e. you need to supply the individual values for `Red` `Blue` `Green` as `Int`.
e.g:
```elm
Background.color (rgb255 75 192 169)
```

If I attempt to invoke `rgb255 75, 192, 169` I will see the following error:

![elm-ui-rgb-error](https://user-images.githubusercontent.com/194400/70663222-cfae5100-1c5f-11ea-8fa6-6d4437e3af14.png)

This is a _small_ price to pay given that it allows us to _easily_
implement a color picker allowing people to easily select _any_ color
when they are [_categorising_](https://github.com/dwyl/app/issues/235)

![color-picker-dwyl-teal](https://user-images.githubusercontent.com/194400/70664979-72b49a00-1c63-11ea-80f4-fc533948f60f.png)

In the short-term if we have a _hex_ value e.g: `#4bc0a9`
that we need to convert to RGB,
~~simply use a free online tool:
https://www.rapidtables.com/convert/color/hex-to-rgb.html~~
pasting the _hex_ into google returns the RGB conversion.
e.g: https://www.google.com/search?q=%234bc0a9 <br />
A color explorer site like Color Hexa has even more detail.
e.g: https://color-hex.org/color/4bc0a9


### Debugging Layout with `Element.explain Debug.todo`

[Debug](https://package.elm-lang.org/packages/elm-lang/core/3.0.0/Debug)

<br /><br />

## References and Recommended Reading

+ `elm-ui` _examples_: https://github.com/bburdette/elm-ui-examples
+ Style framework (_built on `elm-ui`_):
https://github.com/lucamug/style-framework
+ Elm UI Explorer (Style Guide):
https://package.elm-lang.org/packages/kalutheo/elm-ui-explorer/4.0.0/


<br /><br />

## _Why NOT Just Use CSS_? 🤷


People who are learning `CSS`
(_or those who are too impatient to learn and just want it to "work now!"_),
often end up feeling like `CSS` is a wild beast that cannot be tamed.
There's a _reason_ why searching for
["CSS gif"](https://www.google.com/search?q=css+gif&tbm=isch)
returns this mess as the top result:

<div align="center">
  <a href="https://twitter.com/nicksherman/status/1091065393500704768">
      <img src="https://media.giphy.com/media/yYSSBtDgbbRzq/giphy.gif"
        width="500" alt="Peter Griffen - Family Guy - CSS Trouble">
  </a>
</div>

In reality, CSS _can_ be learned/mastered reasonably quickly
and _amazing_ things can be crafted. <br />
e.g:
http://www.csszengarden.com and https://www.cssdesignawards.com <br />

Sadly, it doesn't matter how well
_you_ - the conscientious developer/designer - learn CSS.
Unless you can ensure that _everyone_ in your team/company
has the same level of skill and care in their work,
it's _inevitable_ that over-time
duplicate and _conflicting_ styles will be added.

<div align="center">
  <a href="https://twitter.com/100soft">
      <img src="https://media.giphy.com/media/Jrl4FlTaymFFbNiwU5/giphy.gif"
        width="500" alt="dumpster fire">
  </a>
</div>

Take any popular website and run it through CSS Stats https://cssstats.com
to see how many styles are being used.
A good example is
[Twitter.com](https://cssstats.com/stats?url=https%3A%2F%2Ftwitter.com).
Their CSS is **632KB** (_or **113KB** when compressed+gzipped_).
https://cssstats.com/stats?url=https%3A%2F%2Ftwitter.com

![twitter-css-stats](https://user-images.githubusercontent.com/194400/70567485-f56b2580-1b8d-11ea-94c4-4e2ca8b5cd10.png)

That might not sound like a lot,
but for context **632KB** is enough to write a 100k+ word novel.
The point is: the developers/designers at Twitter - a tech company
with **billions** in revenue and some of the most talented people -
have _lost control_ over their CSS.

> **Twitter** created **Bootstrap**
"_the most popular front-end framework in the world_".
**Bootstrap	`v4`** is **123kb** (_uncompressed_)
and **23kb** (_compressed+gzipped_);
the _whole_ library including grid layout,
typography, colors, all components, forms and utilities.
Bootstrap is meant to be a _complete_ responsive grid-based design system
that _anyone_ can use to build their App/website.
And yet twitter, which has a _great_ in-house design team
with their own _system_ and component library,
have managed to create a **CSS monster**
that is **5 times** the size of all of **Bootstrap**.
Even if they had **20kb** of colors,
that's enough for 256 colors, it would still be less than **150kb**.


The problem isn't you,
or "other people",
the problem is the (_lack of a_) _system_.
If the _system_ you are using to create your layout/styles
does not give you any consistency guarantees at compilation time,
then you don't _have_ a good enough system and chaos is _guaranteed_.
