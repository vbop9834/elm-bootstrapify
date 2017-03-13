# elm-bootstrapify
Supports Bootstrap 3 and Elm 0.17-0.18
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
## Updating
### Disclaimer
This library is still in development so the types and names of functions may change. Always be sure to perform a diff before upgrading!
### Process
Before updating, it is recommended to perform a diff of the version you are attempting to merge and the version that is depended on.

Navigate to root directory of your project and type
```
elm-package diff JeremyBellows/elm-bootstrapify 2.0.1 8.0.1
```

Be sure to replace 2.0.1 with the version of elm-bootstrapify that is depended on.
Replace 8.0.1 with the version of elm-bootstrapify that you want to use.

If the diff is desirable, then change the version number of elm-bootrapify in `elm-package.json`.

It should look like
```
"JeremyBellows/elm-bootstrapify": "9.0.0 <= v < 10.0.0",
```

Execute the following command
```
elm package install JeremyBellows/elm-bootstrapify
```

[ For further reading, click here to be taken to the elm-package documentation. ] (https://github.com/elm-lang/elm-package#updating-dependencies)
