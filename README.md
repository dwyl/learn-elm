# learn `elm`

## Why?

> It's _difficult_ to _introduce_ elm to someone
who has _never_ heard of it before without sounding "_evangelical_" ... <br />
We've tried our best to be "_objective_" and ***factual***.
if you spot any inaccuracy or anything
unclear/unexplained, _please_ help us _improve_ by opening an issue: https://github.com/dwyl/learn-elm/issues

_Most_ of us are _already comfortable_ with `JavaScript`
and it is _still_ (_and will remain_) the
[_**most popular programming language**_](https://stackoverflow.com/research/developer-survey-2016#technology)
whereas `elm-lang` is not _even_ on the [_radar_](https://stackoverflow.com/research/developer-survey-2016)
... so _**why**_ should we even _consider_ it?

The _reason(s)_ you should be considering `elm` are _**NOT**_ (_limited to_)
the "_standard_" (_valid_) _tech_-based arguments:

+ "[_**Pure**_](https://drboolean.gitbooks.io/mostly-adequate-guide/content/ch3.html)"
_functional style_ means all your functions are _**predictable**_ and thus _**very testable**_.
+ [***Immutable state***](http://softwareengineering.stackexchange.com/questions/235558/what-is-state-mutable-state-and-immutable-state) means there are _fewer_ (_often zero_)
["_**side effects**_"](http://softwareengineering.stackexchange.com/questions/40297/what-is-a-side-effect)
+ _**Fewer language features**_ [**_lowers_ cognitive load**](https://blog.prototypr.io/design-principles-for-reducing-cognitive-load-84e82ca61abd) when you're reading (_other people's_) code.
+ **_Much_ less to learn** than comparable "Stacks" e.g:
  + **React** + Redux + Flow + Immutable + Babel + all the other setup-code...
  + **Angular 2** + Typescript + Babel + ReactiveX + etc. (_bottom line is: elm is `less` to learn_!)
+ _**much faster**_ than React.js or Angular 2 in _all_ "[***benchmarks***](http://elm-lang.org/blog/blazing-fast-html-round-two)"
+ **Built-in ["_Time Travelling_" Debugger](https://www.youtube.com/watch?v=DSjbTC-hvqQ&feature=youtu.be&list=PLglJM3BYAMPH2zuz1nbKHQyeawE4SN0Cd&t=1633)**
 that lets you record and replay actions in a user session (_thus **eliminating** the need for manually writing Selenium/Nightwatch tests!_)
+ _**helpful/friendly compiler `error` messages**_ that _tells you **exactly**_
what is wrong _before_ you attempt to view your app in the browser/device.
+ Evan surveyed the _existing_ web programming languages for his
University thesis and Elm is the `result` of that study (_borrows ideas from several places and assembles them into a cohesive beautiful package much how Apple made the original iPhone..._)

The _reason(s)_ we [@**dwyl**](https://twitter.com/dwylhq) are _exploring_
the `elm` _ecosystem_ is because it has:
+ _thriving **community** where everyone is welcome_
+ _clear **leadership** from nice + smart people and_
+ _excellent **documentation** (which greatly reduces frustration for beginners)_
+ _a shared **mission** to built the **best** graphical user interfaces for the web!_

these are a _few_ of [our **_favourite_ things**](https://youtu.be/0IagRZBvLtw).


> @rtfeldman put it best in his [**6 Months of Elm in Production** talk](https://youtu.be/R2FtMbb-nLs?t=47m36s) (_which we **highly recommend** watching!_)<br />
"_If you take **two products** and **compare** them on **feature-checklists** <br />
that gets you a **very inaccurate picture**
of what it's going to be like to actually **use them**_."

![6-months-of-elm-comparison](https://cloud.githubusercontent.com/assets/194400/20147838/be5d2746-a6a1-11e6-91af-5149c5bf345b.jpg)



## What?

### `Elm` is a programming language for creating web browser-based graphical user interfaces. Elm is `purely functional`, and is developed with `emphasis` on `usability`, `performance`, and `robustness`. It advertises "`no runtime exceptions` in practice," made possible by the Elm compiler's `static type` checking.

> It's _difficult_ to _overstate_ how _game-changing_ `elm`,
the `elm-architecture` and `elm-platform` are to web development right now! The fact that Dan Abramov was "_inspired_" by Elm (architecture and debugger) for Redux and React Hot-Reloader
respectively, should tell you that there's "_something_" here worth exploring ...

### Great Video Intro to Elm (_by Jessic Kerr_)

We _highly_ recommend watching Jessica Kerr's
"***Adventures in Elm***" from GOTO Conference 2016:
[![image](https://cloud.githubusercontent.com/assets/194400/22403008/7a878200-e602-11e6-9239-e292fa97c6e1.png)](https://youtu.be/cgXhMc8M4X4)

https://youtu.be/cgXhMc8M4X4

### Isn't "Functional Programming" _Difficult_...?

If you `feel` like _**F**unctional **P**rogramming_ is "_complicated_" you aren't _alone_,
it's a _perfectly normal_ sentiment:

> I _tried_ functional programming in JavaScript before, it was _confusing_...

All we can say to that is:

[![dont-panic](https://cloud.githubusercontent.com/assets/194400/20135968/74ed05d6-a66a-11e6-9f30-f50f911053e6.png)](
  https://en.wikipedia.org/wiki/Phrases_from_The_Hitchhiker%27s_Guide_to_the_Galaxy#Don.27t_Panic)

_Trust_ us, the non-mathematician people (_without a Computer Science
or "Engineering" background_) <br />
_initially_ `felt` Functional Programming
was a _steep_ learning curve, <br />
_because_ it's _quite_ different from what we were _used_ to
(_procedural/imperative/mutable_...)

We `found` that the elm language is actually really small and focussed<br />
and when we break it down there are only a handful of concepts <br />
we need to _understand_ before we can start reading/writing code.

> **Tip**: if you want to _understand_ the core concepts,
jump to the [Language](#) section below.

## Who?

If you haven't felt the _pain_ of trying to debug/maintain/extend
code you did not _originally write_, or have not worked
on a sufficiently large app to `feel` the
"_fix one thing breaks two other features_" ["_whack-a-mole_"](https://youtu.be/GVJL9oXgsAA),
you _might not_ not see the _benefit_ of the `elm` ecosystem ...

But we _urge_ you to consider the list in the "Why?" section (_above_)
and if _any_ of those points appeals to you, <br />
give elm ***5 minutes*** of your
time _**today**_ to _try_ the "_**Quick-Start**" below_!


## How?

The best place to start is with the "_Official Guide_". But we have _condensed_ their "Install" guide into the **5-minute** instructions below:

### Pre-requisites

+ A **Computer** with:
  + **Node.js _Installed_** (_if you don't already have node get it here_: https://nodejs.org/en/download/ )
  + **Text Editor** (_any will do but we recommend_ https://atom.io/ _because it has good a Elm syntax/plugin_)
+ Internet Access (_just so you can install elm and the modules_)
+ Some **JavaScript/Node.js Knowledge** (_ideally you have built a basic Node/JS app before ...
  but no "major" experience required/expected_)

### _Recommended_ Pre-Elm Learning: Elm Architecture

While it's not a "Pre-requisite",
we (_highly_) _recommend_ learning/understanding
**The Elm _Architecture_** ("TEA")
`before` learning Elm (_the **language**_)
to _flatten_ the
["Elm learning curve"](https://github.com/dwyl/learn-elm/issues/45).
To that end, we wrote an _introductory **step-by-step**_
tutorial for the Elm Architecture in JavaScript:
[github.com/dwyl/**learn-elm-architecture**-in-**javascript**](https://github.com/dwyl/learn-elm-architecture-in-javascript)

### Quick-Start (_5 Mins_)

Enough talk, let's see an _example_!

#### 1. Clone this repository

On your local machine, open a terminal window and run the following command:

```sh
git clone https://github.com/dwyl/learn-elm.git && cd learn-elm
```

#### 2. Install

Install the node.js dependencies (`elm` platform):

```sh
npm install
```
> **Note**: We install `elm` (_the `elm' compiler_) _locally_ for the "_quick-start_".
If you decide to use it for your own project(s), you _can_ install it _globally_ using
`npm install -g elm`

#### 3. Hello {Name}!

+ Open the `examples/hello-world.elm` file in your editor.
+ Move your cursor to the 3<sup>rd</sup> line and change `name` to your name!

#### 4. Server Time!

Run the `elm-reactor` command to start the _server._

Elm-reactor started the server on your localhost.

```sh
node_modules/.bin/elm-reactor
```

> Note if you install elm _globally_ you will be able to type `elm-reactor`
without the `node_modules/.bin/` (_relative path_)

> If you're curious why you're running a server to view the output of your ```elm``` code, it's because ```elm``` is compiled to JavaScript, and it's fiddly to have to compile your code manually every time you want to see the output. With ```elm-reactor``` this is handled for you. Read more about it here: http://elmprogramming.com/elm-reactor.html


#### 5. View in Browser

View the entire repository in your web browser by going to http://localhost:8000/

Click on _example/hello-world.elm_ to see your Hello World! This shows how it
would compile into `HTML` _without_ having to use `elm-make` (which we'll save
for later)!


#### 6. _Reflect_

You just saw how _easy_ it is to get started with `elm`, how do you `feel`?
Was it "_difficult_"? Better or _worse_ than you experience learning any other technical concept/tool/language?

Please share your thoughts!

<br />


### In-depth Step-by-Step Tutorial (_60mins_)

The _best_ place to start your elm journey is with the "_Official Guide_"
http://guide.elm-lang.org/ which is available on Evan's GitHub at: https://github.com/evancz/guide.elm-lang.org

> At the time of writing, the _entire_ "_Official_" guide to Elm (GitBook)
(_written by the creator of elm and improved by the community_) is ***111 pages***:
https://www.gitbook.com/book/evancz/an-introduction-to-elm/details
which means it's readable in _less than a day_.

### Front-end Masters Workshop

It's _not often_ we find a _half-decent_ tutorial on a subject we are trying to learn.
We were _delighted_ to discover that [**Richard Feldman**](https://github.com/rtfeldman)
(_one of the `core` contributors to `elm`_) has produced a workshop (_videos + learning materials_)
for learning `elm`: https://frontendmasters.com/workshops/elm/ + https://github.com/rtfeldman/elm-workshop

While it costs **$39** we think it's an _absolute bargain_!

> **Note** if you have a lack of funds to pay for a _subscription_
to get access to the workshop, contact us! (_we can help!_)

> `@TODO`: write _comprehensive_ notes on the content in the workshop!


### Install the Elm Platform _Globally_ on your Computer

Yes, install it _globally_ so you get the `elm-compiler` and `elm-platform` which
allows you to use the `elm-make` command in your terminal:

```js
npm install elm -g
```
> avoid using [`sudo`](http://stackoverflow.com/questions/16151018/npm-throws-error-without-sudo)
as you _really_ should be following the [principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege).

Remember, if you are adding elm to a project which will be deployed on a hosting service (such a heroku) you will need to add elm to the dependencies, in your package.json.
```js
npm install elm --save
```

### Install Elm Format

There are many things to love about ```elm``` but something you can appreciate right away is elm-format. It's a tool that formats your ```elm``` code so that it is consistent with the community standard format.

**Installation instructions**
1. Download the current version of elm-format found at https://github.com/avh4/elm-format
2. Unzip the downloaded file and move the elm-format executable to a location in your PATH variable. If the unzipped file is in your Downloads folder, you could move it with the following terminal command: `mv ~/Downloads/elm-format /usr/local/bin/elm-format`, which will move it to the default path.
3. Install the elm-format package in your text editor. In Atom, type `apm install elm-format` into the terminal, or install via Packages (filter by `elm`)
4. Set elm-format to format your work on save. In Atom, Open Settings `CMD + ,` (Linux: `ctrl + ,`), click Packages, filter by 'elm', then click on the elm-format package's settings button. Set the `elm-format` command path setting and ensure the 'format on save' checkbox is selected.

For more advice on `elm` development environment setup: https://github.com/knowthen/elm/blob/master/DEVSETUP.md

### Language

> Help Wanted summarizing the language features!
> for now see: http://elm-lang.org/docs/syntax

## Testing
Ready to start testing?
Simply follow these 3 steps:

1) ``` npm i -g elm-test```

2) ``` elm test init ```
  This will set up your test environment and give you 7 dummy tests in your newly created test folder

3) Run ```elm test``` or the **very nice** ```elm test --watch``` which will re-run your tests as you write them

The general format of the tests are:
```elm
describe "Dummy test"
    [ test "dummy test description" <|
      \() ->
        Expect.equal actualValue expectedValue
    ]
```
For example:
``` elm
all : Test
all =
  describe "My first test"
      [ test "Addition test works correctly" <|
        \() ->
            Expect.equal (2 + 2) 4
      , test "Our subtraction function works correctly" <|
        \() ->
          -- here we are pretending we have a subtract function that takes 2 arguments
            Expect.equal (subtract 10 5) 5
      ]
```

More info on testing can be found [here](https://medium.com/@_rchaves_/testing-in-elm-93ad05ee1832#.3i3ibxcxz) and [here](http://package.elm-lang.org/packages/elm-community/elm-test/2.1.0)

### Circle CI

To set up your elm project on Circle CI, copy over our ```circle.yml``` and ```circle-dependencies.sh``` and follow the instructions on [our Circle CI tutorial](https://github.com/dwyl/learn-circleci)

## Flags
Flags allow you to pass data from Javascript to Elm as part of the initial state of your application.

See our working flags example [here](https://github.com/dwyl/learn-elm/tree/master/examples/elm-flags). Here we pass the URL from Javascript to Elm (via the script tags in our index.html).

Run ```npm install```,```elm-package install``` and ```npm start``` to see the output

## Reading

### Elm-specific Articles

+ How to use Elm at work: http://elm-lang.org/blog/how-to-use-elm-at-work
(_or work for DWYL where you're actively encouraged to use it!_)
+ JavaScript interoperability: https://guide.elm-lang.org/interop/javascript.html
+ How to add Elm to _existing_ JS codebase: http://tech.noredink.com/post/126978281075/walkthrough-introducing-elm-to-a-js-web-app
+ How Elm made our work better (_success story_):
http://futurice.com/blog/elm-in-the-real-world

### General Functional Programming (background reading)

+ Objects Should Be Immutable: http://www.yegor256.com/2014/06/09/objects-should-be-immutable.html

## Videos

+ Mutable vs Immutable: https://youtu.be/5qQQ3yzbKp8
+ Learning Functional Programming with JavaScript (Anjana Vakil): https://youtu.be/e-5obm1G_FY
+ Functional Programming from First Principles (Erik Meijer): https://youtu.be/a-RAltgH8tw
+ Teaching functional programming to noobs (Rob Martin): https://youtu.be/bmFKEewRRQg
+ Functional Programming is Terrible (Rúnar Bjarnason): https://youtu.be/hzf3hTUKk8U

### Promising but incomplete:
+ Learn You an `Elm` http://learnyouanelm.github.io/ (_lots of "Todo" items and last updated 2 months ago_)
