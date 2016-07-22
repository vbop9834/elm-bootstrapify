# elm-bootstrapify
Supports Bootstrap 3 and Elm 0.17
## Purpose
Elm-bootstrapify aims to elminate bootstrap styling rendering errors using precise type safety techniques.
## Installation
In the project directory type

```
elm package install JeremyBellows/elm-bootstrapify
```

## Example
```
module ExampleView exposing (..)

import Bootstrap.Grid exposing (..)
import Bootstrap.Wells exposing (..)

import Html

let view =
  containerFluid
   [
    row
     [
      column [ ExtraSmall Two, Small Two, Medium Four, Large Four ] [],
      column [ ExtraSmall Ten, Small Ten, Medium Eight, Large Eight ]
       [
        well WellLarge []
         [
          Html.h1 []
           [
            Html.text "Hello World!"
           ]
         ]
       ]
     ]
   ]
```
