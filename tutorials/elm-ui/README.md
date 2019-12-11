# `elm-ui` a Language for Layout and Interface


## _Why?_ 😢 `|>` 😍

@dwyl we _love_ the idea of having semantic and functional UIs
with no side-effects. Functional CSS allows anyone
to change _one_ style on a single element
without affecting any others.
For the past few years we have been using the Tachyons library
see: https://github.com/dwyl/learn-tachyons
It's been _good_ in small-ish teams (_max 8 people_),




Design System for Building Semantic Compiled UI

+ GitHub:
https://github.com/mdgriffith/elm-ui
+ Elm Package:
https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/

## _What?_

`elm-ui` is to `HTML` and `CSS`
what `elm` is to `JavaScript`.
`elm-ui` offers compile-time guarantees
that your layout and styles work as expected.

Matthew Griffith described it eloquently in his Elm Conf talk
"Building a Toolkit for Design":

[![elm-ui-tookit-for-design](https://user-images.githubusercontent.com/194400/70571846-7c240080-1b96-11ea-9dd2-cacae7110b54.png)](https://youtu.be/Ie-gqwSHQr0)
https://youtu.be/Ie-gqwSHQr0

> "_It's all right there.
There's no other place you have to go to modify this thing_."


## _How?_

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
in the `elm.json` `"dependencies"` section.
`elm install` does not actually _install_ anything.


### Debugging Layout with `Element.explain Debug.todo`

[Debug]
https://package.elm-lang.org/packages/elm-lang/core/3.0.0/Debug


## References and Recommended Reading

+ `elm-ui` _examples_: https://github.com/bburdette/elm-ui-examples
+


<br />

## _Why NOT Just Use CSS_?


People who are learning `CSS`
(_or those who are too impatient to learn and just want it to "work now"!_),
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
