# `elm-ui` a Language for Layout and Interface


## _Why?_ 😢 `|>` 😍

People who are learning `CSS`
(_or those who are too impatient to learn and just want it to "work now"!_),
often end up feeling like `CSS` is a wild beast that cannot be tamed.

<div align="center">
  <a href="https://twitter.com/nicksherman/status/1091065393500704768">
      <img src="https://media.giphy.com/media/yYSSBtDgbbRzq/giphy.gif"
        width="500" alt="Peter Griffen - Family Guy - CSS Trouble">
  </a>
</div>


In reality, CSS _can_ be learned/mastered reasonably quickly
and _amazing_ things can be made e.g:
http://www.csszengarden.com and https://www.cssdesignawards.com

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
A good example is [Twitter.com](https://twitter.com)
Their CSS is **632kb**

![twitter-css-stats](https://user-images.githubusercontent.com/194400/70567485-f56b2580-1b8d-11ea-94c4-4e2ca8b5cd10.png)

That might not sound like a lot,
but scroll down to the part that says **1024 total color declarations**:

![twitter-css-stats-colors](https://user-images.githubusercontent.com/194400/70567583-1df31f80-1b8e-11ea-99d2-0c78a6f88a5d.png)

Can you tell the difference between those shades of grey, blue and _white_??
The point is that the developers/designers at Twitter - a tech company
with **billions** in revenue and some of the most talented people -
do not have _control_ over their CSS.

> Twitter are the creators of Bootstrap
"_the most popular front-end framework in the world_".
**Bootstrap	`v4`** is **123kb** (_uncompressed_)
and **23kb** (_compressed+gzipped_).
The _whole_ library including grid layout,
typography, colors, all compontents, forms and utilities.
Bootstrap is meant to be a _complete_ responsive grid-based design system
that _anyone_ can use to build their App/website.
And yet twitter, which has a _great_ in-house design team
with their own _system_ and component library,
have managed to build a



The problem isn't you, the problem is the (_lack of a_) _system_.


@dwyl we _love_ the idea of having semantic and functional UIs
with no side-effects. Functional CSS allows you to change one style
without affecting any others. For the past few years
https://github.com/dwyl/learn-tachyons



Design System for Building Semantic Compiled UI

+ GitHub:
https://github.com/mdgriffith/elm-ui
+ Elm Package:
https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/

## _What?_

`elm-ui` is to `HTML` and `CSS`
what `elm` is to `JavaScript`.
`elm-ui` offers compile-time guarantees that your layout and styles.


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


## References and Recommended Reading

+ `elm-ui` _examples_: https://github.com/bburdette/elm-ui-examples
+
