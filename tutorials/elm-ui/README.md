# `elm-ui` a Language for _Reliable_ Layout and Interface

_This_ tutorial aims to take a complete beginner -
who has never seen any `elm-ui` -
to a basic understanding in 10 minutes.

<br />

## _Why?_ 🤷 ... 😢 🌧  `|>` 😍🌈

Few people _love_ writing CSS.
Most people just want to build their App
_without_ the headache of knowing how to position things.
**`elm-ui`** lets you build beautiful,
fast and responsive UIs in `elm`,
without writing _any_ CSS!
But `elm-ui` goes _way_ beyond _just_ a design system.
Since it's built using pure `elm` functions,
it gives you ***compile-time guarantees*** that your layout/styles
are valid. So not only is it easier/faster to build the UI,
it makes **extending and _maintaining_** your App ***effortless***!

> @dwyl we _love_ the idea of having semantic, functional and responsive UIs
with no side effects. <br />
**Functional CSS** libraries allow anyone on a team
to change _one_ style on a single element
without affecting any others. <br />
For the past few years we have been using the Tachyons library
see:
[github.com/dwyl/**learn-tachyons**](https://github.com/dwyl/learn-tachyons)
and it's been a breath of fresh air.
Using Tachyons in dozens of projects
has been _good_ in small teams (_0-12 people_)
and we have had _far_ fewer UI bugs than before adopting Tachyons.
_However_ we have found that even with a functional CSS library
(_that greatly reduces the possibility of cascading side effects_),
we still see redundant and unnecessary styles
and _occasionally_ visual bugs are introduced that go undetected.
No CSS library or pre-processor we know of offers compile-time guarantees
that the layout/styles applied to a given element are _correct_.
That's where `elm-ui` comes in and changes the game!

<br />

## _What?_ 💭

`elm-ui` is a design system
for building semantic UI
with compile-time guarantees.


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
`elm-ui` will provide you with _helpful_ compiler errors/warnings
if you attempt to make a _breaking_ change to UI!


### Example Compile Time Warnings

In this case I have attempted to apply a `Float`
of `2.5` to the `Border.rounded` (`border-radius`) property:
![elm-ui-compilation-error-float](https://user-images.githubusercontent.com/194400/70662062-69283380-1c5d-11ea-8d90-1d4f72d67ec6.png)

The same thing goes if we attempt to pass a `String`
to `Border.rounded` e.g: `"2px"`
![elm-ui-compiler-error-string](https://user-images.githubusercontent.com/194400/70662334-ec498980-1c5d-11ea-9336-56f30db80270.png)
We get a type mismatch and know _exactly_ what needs to be fixed
for our view to compile.

If you make a typo in your layout/style it won't compile:

![elm-ui-paddign-error](https://user-images.githubusercontent.com/194400/70667023-caed9b00-1c67-11ea-8396-0bf47d87a7d0.png)

Hopefully that gives you a _taste_
for the compiler warnings provided by `elm-ui`. <br />
The best way to experience this further
is to fire up your text editor and start coding!


## _How?_ 📝

In a new directory, initialise your `elm` workflow with the following command:
```sh
elm init
```

That will prompt you to create an `elm.json` file similar to this one:
[`elm.json`](https://github.com/dwyl/learn-elm/blob/master/tutorials/elm-ui/elm.json)

Next we will add the dependency for `mdgriffith/elm-ui`:
```sh
elm install mdgriffith/elm-ui
```
> **Note**: that command will only add an entry
in the `elm.json` `"dependencies"` section. <br />
`elm install` does not actually _install_ anything
until you attempt to compile the app.


Now create a directory called `src`
and a new file in the directory `src/Main.elm`. <br />
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

> This is the example in the official `elm-ui` docs:
https://github.com/mdgriffith/elm-ui <br />
try the Ellie version: https://ellie-app.com/7vDrXpCckNWa1

In your terminal run:

```
elm reactor
```

Open the following page in your web browser:
http://localhost:8000/src/Main.elm

You should expect to see:

![elm-ui-basic-layout](https://user-images.githubusercontent.com/194400/70663573-90cccb00-1c60-11ea-8a1c-71d15d2b83ad.png)

If you open the elements tab of Dev Tools in your browser
you will see the HTML code (_generated by the `elm` compiler_):

![generated-html](https://user-images.githubusercontent.com/194400/70762204-b08aee80-1d47-11ea-9d5f-bd8e121a42d8.png)

The in-line CSS classes are generated at compile time
and included in `<style>` blocks.
Semantic class names are inserted into the `<div>` elements.
For a list of these class names, see:
[`Style.elm#L131`](https://github.com/mdgriffith/elm-ui/blob/53a2732d9533c242c7690e16506b673af982032a/src/Internal/Style.elm#L131). <br />
As far as generated HTML goes this is not _too_ bad.
It's common for `elm` apps to get a 100 score for accessibility,
speed, SEO and progressiveness on Google's
[Lighthouse Score](https://developers.google.com/web/tools/lighthouse).
Under the hood `elm-ui` is just using
[`elm/html`](https://github.com/mdgriffith/elm-ui/blob/53a2732d9533c242c7690e16506b673af982032a/src/Element.elm#L215)
(_the core html package_) so the resulting rendered html
should be pretty similar to standard a `elm` view.


<!--
If you are curious what those `<s>` and `<u>` HTML elements are,

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/s
<s> element renders text with a strikethrough, or a line through it.

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/u
The HTML Unarticulated Annotation Element (<u>)
represents a span of inline text which should be rendered
in a way that indicates that it has a non-textual annotation.
-->

### Code _Explanation_


Let's break down the `elm` code section by section:

The first line is the standard `elm` module (export) directive.

```elm
module Main exposing (main)
```

This needs to be here for the `elm` compiler to know the entry point.
You will have seen this line all throughout the
[elm guide](https://guide.elm-lang.org).
More detail is given below on the `main` function.

The next section are the imports:

```elm
import Element exposing (Element, alignRight, centerX, centerY, el, fill, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
```

These are fairly standard scoped `elm` `import` statements
they should be familiar to anyone who has read the **Modules** section of the
[elm guide](https://guide.elm-lang.org/webapps/modules.html).

In this simple example we are using
4 out of 9 of the available `elm-ui` modules.
The one with the most features/functions is
[`Element`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/Element)
which contains everything you need for creating standard HTML elements
including their layout and positioning.
[`Background`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/Element-Background),
[`Border`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/Element-Border)
and
[`Font`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/Element-Font)
are _exactly_ what you would expect them to be,
a collection of functions related to styling those properties.
We will cover each of these in more detail later on as needed,
however I encourage you to click the links
and scroll through available functions
to get an idea for what they can do.

### The `main` function

Let's continue looking at the 3 sections of code.
`main` assembles the rest of the code so it can be exposed
to the `elm` compiler.


```elm
main =
    Element.layout []
        rowOfStuff
```
This function creates an `Element.layout`
which is the root node for your app/view.
It has the class of `ui` which has the following definition:
```css
.ui {
    width: 100%;
    height: auto;
    min-height: 100%;
    z-index: 0;
}
```
In this case it takes up the full width and height of the view port.
But it could also be used for just a portion of the screen
if you are just getting started using `elm` at
[work](https://elm-lang.org/news/how-to-use-elm-at-work)


#### Side Note on Naming Conventions

Naming the entry point function `main` is not just a _convention_,
it's a compiler requirement.
If you try renaming `main` to something else in both places it appears,
your code won't compile.
You will see the following error message
in your browser (_running `elm reactor`_):

![main-not-defined](https://user-images.githubusercontent.com/194400/70759502-8123b400-1d3e-11ea-8ee9-2c1751455a6d.png)

And the following compiler warning if you attempt to compile it:

![compiler-warning-no-main](https://user-images.githubusercontent.com/194400/70759831-8df4d780-1d3f-11ea-8369-b12108062f16.png)

This is a _good_ thing, because it means all `elm` programs are consistent.
You won't see the `main` function of a program being named `app` or `myfunc`
which means there are fewer chances of confusion for beginners.



### Row Of Elements

`row` is a layout wrapper function for holding other elements in a row.

```elm
rowOfStuff : Element msg
rowOfStuff =
    row [ width fill, centerY, spacing 30 ]
        [ myElement
        , el [ centerX ] myElement
        , el [ alignRight ] myElement
        ]
```

the `row` function creates a `<div>` with the CSS class `r`.
Which is defined as:
```css
.r {
    display: flex;
    flex-direction: row;
}
```
`display:flex` has full support on all modern/recent web browsers. <br />
see: https://caniuse.com/#feat=mdn-css_properties_display_flex <br />
More detail:
https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout

The first argument to `row` is a `list` of attributes:

```elm
row [ width fill, centerY, spacing 30 ]
```

In this case `width fill` means the
row should occupy the full width of the viewport. <br />
`centerY` means the row should be _vertically_ aligned
to the center of the page. <br />
`spacing 30` is the spacing between the row elements,
in this case a _minimum_ of `30 pixels`.

![spacing-vs-padding](https://user-images.githubusercontent.com/194400/70792908-287e0680-1d92-11ea-9971-77e440d99c4d.png)

If you constrain the window you will see the `spacing 30` in action:

![minimum-spacing](https://user-images.githubusercontent.com/194400/70793014-52372d80-1d92-11ea-8090-fb7b6316b8eb.png)

It preserves the spacing between elements so it always looks good.
We will see a more real-world example of this later.


The _second_ argument to the `row` function
is a `list` child of nodes:

```elm
[ myElement
, el [ centerX ] myElement
, el [ alignRight ] myElement
]
```
The first `myElement` has no style/position applied to it
so it will just appear on the left of the row.
the next `myElement` is wrapped in a container `el` (`<div>`)
and given an attribute of `centerX` to ensure that it is
centered _horizontally_ in the middle of the page.
The third `myElement` is also wrapped in an `el`
which has the `alignRight` attribute,
which as it's name suggests,
aligns the element to right of the parent element.



#### Individual Element

In `elm-ui` the **`el`** function
is a general purpose "container" element
similar to `<div>` in HTML.
`el` is used to apply styles/properties
to the child elements it contains.
The _first_ argument to the `el` function
is a list of the style attributes to be applied.
The `myElement` function uses the `el` function
to create a `<div>` element with specific attributes
and a child `text` node with the text "stylish!" in it.

```elm
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

In this case the **`el`**
a list with the following attributes:

```elm
[ Background.color (rgb255 75 192 169)
, Font.color (rgb255 255 255 255)
, Border.rounded 10
, padding 30
]
```
+ `Background.color (rgb255 75 192 169)` - Apply a **`teal`** background color
to the `el`.
+ `Font.color (rgb255 255 255 255)` - use a **`white`** font color.
+ `Border.rounded 10` - round the borders of all four corners of the `el`.
+ `padding 30` - apply a padding between the outside of the `el` and the `text`.


> If _anything_ is unclear about this initial example of using `elm-ui`,
please
[_ask_ questions](https://github.com/dwyl/learn-elm/issues)
so that we can clarify for _everyone_ reading.



#### A Note on Long `import` lines

You may have noticed that the import line for the `Element` module
is rather long, and the more `elm-ui` features you use the longer it will get!
If you attempt to split the `import Element` declaration into two lines:
```elm
import Element exposing (Element, alignRight, centerX, centerY, el, fill)
import Element exposing (padding, rgb255, row, spacing, text, width)
```
`elm-format` will re-format the two lines into one again ... we tried ... 🙄

The way to get around this is to follow the
[`elm` guide modules](https://guide.elm-lang.org/webapps/modules.html)
advice and avoid using `exposing` unless it's absolutely necessary.
So we can convert the super-long import  
(_which will only get longer as your view expands to include more styles_),

From:

```elm
import Element exposing (Element, alignRight, centerX, centerY, el, fill, padding, rgb255, row, spacing, text, width)
```

To:

```elm
import Element as E exposing (Element, el, layout, row)
```
This only makes the top level elements `el`, `layout` and `row` available
for use in our view functions. The rest of the `elm-ui` functions
need to be prefixed with `E` e.g: `E.functionName`.
The advice from the creator of Elm
and other experienced Elm devs is:
"_avoid using unqualified import statements_"
e.g: `import Element exposing (..)`.
It might be tempting in the short-run to just "import everything",
but they rapidly become an unmaintainable headache.


The _full_ revised code would be:

```elm
module Main exposing (main)

import Element as E exposing (Element, el, layout, row)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


main =
    layout []
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

Some people might feel that this is tedious because it's more to type.
However it's _immediately_ clear where a given function "comes from"
and there is a much lower risk of naming conflicts.

We recommend adopting this `E.` prefix approach
because it's the method recommended/used by Evan.

> See "Using Modules" section at the end of:
https://guide.elm-lang.org/webapps/modules.html








### Debugging Layout with `Element.explain Debug.todo`

Using elm's built in
[Debug](https://package.elm-lang.org/packages/elm-lang/core/3.0.0/Debug)
functionality,
`elm-ui` allows you to _visually_ debug your UI
simply by adding the following function call
as an element in the attributes list of any `el` call.

Take the example above and add `Element.explain Debug.todo`
in the list of attributes for the `layout` function:

```elm
main =
    layout [Element.explain Debug.todo]
        rowOfStuff
```

The result is a gold border around the whole of the `layout` container element:

![element.explain-Debug.todo](https://user-images.githubusercontent.com/194400/70936533-62713600-203a-11ea-8101-5df5a9c07709.png)

This also added a dashed border around the `row` element.

If we instead move the `Element.explain Debug.todo`
to the List of attributes for the `row`:

```elm
rowOfStuff : Element msg
rowOfStuff =
    row [ width fill, centerY, spacing 30, Element.explain Debug.todo ]
        [ myElement
        , el [ centerX ] myElement
        , el [ alignRight ] myElement
        ]
```

The result is:

![debug-row](https://user-images.githubusercontent.com/194400/70936813-0d81ef80-203b-11ea-9c86-078e5dfb2164.png)

This has applied the **gold** border to the **`row`**
and dashed border to the individual row items.
You will notice that because two the _children_ of the `row`
are in fact `el` (_container/wrapper_) elements
which then contain the `myElement` (`el`),
when the `Element.explain` is applied to the `row`,
it adds a _double_ dashed border to the elements that are nested.

Our final debug option is to apply `Element.explain` debugging
to just a _single_ `el` in the `row`:

```elm
rowOfStuff : Element msg
rowOfStuff =
    row [ width fill, centerY, spacing 30 ]
        [ myElement
        , el [ centerX, Element.explain Debug.todo ] myElement
        , el [ alignRight ] myElement
        ]
```

This allows us to pinpoint the _single_ `el` in the `row` if we need to.

<br />
<hr />

# Want _More_?

If you enjoyed learning the basics of `elm-ui`
and want to learn a _lot_ more by building a complete app, <br />
please drop a comment/like
on the following issue:
https://github.com/dwyl/learn-elm/issues/152


<hr />
<br />

## References and Recommended Reading


+ GitHub Project:
https://github.com/mdgriffith/elm-ui
+ Elm Package:
https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest
+ Examples:
https://github.com/mdgriffith/elm-ui/tree/master/examples
+ `elm-ui` _examples_: https://github.com/bburdette/elm-ui-examples
+ Style framework (_built on `elm-ui`_):
https://github.com/lucamug/style-framework
+ Elm UI Explorer (Style Guide):
https://package.elm-lang.org/packages/kalutheo/elm-ui-explorer/4.0.0/
+ Brief intro to `elm-ui`
https://orasund.gitbook.io/elm-cookbook/frameworks-1/elm-ui-1

<br /><br />

## _Why NOT Just Use CSS_? 🤷


People who are learning `CSS`
(_or those who are too busy/impatient to learn
  and just want it to "work now!"_),
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
http://www.csszengarden.com and https://www.cssdesignawards.com or
CSS Super Powers: https://youtu.be/mNKz3devFAw and _drawing_ in CSS:
https://medium.com/coding-artist/a-beginners-guide-to-pure-css-images-ef9a5d069dd2

Sadly, it doesn't matter how well
_you_ - the conscientious developer/designer - learn CSS.
Unless you can ensure that _everyone_ in your team/company
has the same level of skill and care in their work,
it's _inevitable_ that over time
duplicate and _conflicting_ styles will be added.

<div align="center">
  <a href="https://twitter.com/100soft">
      <img src="https://media.giphy.com/media/Jrl4FlTaymFFbNiwU5/giphy.gif"
        width="500" alt="dumpster fire">
  </a>
</div>

Take any popular website and run it through CSS Stats https://cssstats.com
to see how many styles are being used. <br />
A good example is
[Twitter.com](https://cssstats.com/stats?url=https%3A%2F%2Ftwitter.com).
Their CSS is **632KB** (_or **113KB** when compressed+gzipped_). <br />
https://cssstats.com/stats?url=https%3A%2F%2Ftwitter.com

![twitter-css-stats](https://user-images.githubusercontent.com/194400/70567485-f56b2580-1b8d-11ea-94c4-4e2ca8b5cd10.png)

That might not sound like a lot,
but for context **632KB** is enough to write a 100k+ word novel! <br />
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

<br />

### Drawbacks?

So far in using `elm-ui` we have only spotted one potential drawback.
All `Colors` (_for text, borders or backgrounds_)
have to be specified in terms of **rgb** values.
i.e. you need to supply the individual values for `Red` `Blue` `Green` as `Int`.
e.g:
```elm
Background.color (rgb255 75 192 169)
```

If we attempt to invoke `rgb255 75, 192, 169`
we will see the following error:

![elm-ui-rgb-error](https://user-images.githubusercontent.com/194400/70663222-cfae5100-1c5f-11ea-8fa6-6d4437e3af14.png)

We feel this is a _comparatively small_ price to pay
given that it means colors can be checked at compile time.
It allows us to _easily_
implement a color picker allowing people to easily select _any_ color
when they are [_categorising_](https://github.com/dwyl/app/issues/235) their thoughts.

![color-picker-dwyl-teal](https://user-images.githubusercontent.com/194400/70664979-72b49a00-1c63-11ea-80f4-fc533948f60f.png)

In the short-term if we have a _hex_ value e.g: `#4bc0a9`
that we need to convert to RGB,
~~simply use a free online tool:
https://www.rapidtables.com/convert/color/hex-to-rgb.html~~
pasting the _hex_ into google returns the RGB conversion.
e.g: https://www.google.com/search?q=%234bc0a9 <br />
A color explorer site like Color Hexa has even more detail.
e.g: https://color-hex.org/color/4bc0a9
