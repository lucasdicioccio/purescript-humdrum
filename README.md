# humdrum

A minimal boilerplate for inserting a PureScript-built JavaScript script
multiple times and parametrizing its entry point.

## why?

I'm writing blog posts at
[https://lucasdicioccio.github.io/](https://lucasdicioccio.github.io/) and I
would like to illustrate individual blog posts with interactive animations.

In such blog posts, each interactive animation will be a refinement of the
previous one. Hence, animations would share a large amount of code and logic.
I do not want to clutter my JavaScript diretory with one `.js` file per
animation. Instead, I'd like to have a single `.js` which is then parametrized
by passing a program. Giving such power to a JavaScript file is not much work
but the exact dance is a bit annoying to perform.

## usage

Insert a [HTML data-attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes#html_syntax) `data-humdrum-arg` to the `script` tag inserting your application.

Use the library function to either fetch or immediately process the attribute
value.


### example -- PureScript side

```purescript
module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

import HumDrum (mainWithDataArg)

main :: Effect Unit
main = do
  mainWithDataArg (log <<< show)
```

### example -- HTML side

```console
  <script src="js/my-app.js" data-humdrum-arg="hello"></script>
  <script src="js/my-app.js" data-humdrum-arg="world"></script>
```

Your console should show:

```console
(Just "hello")
(Just "world")
```

Confirming that the program is able to branch early based on the
`data-humdrum-arg` attribute selected.
