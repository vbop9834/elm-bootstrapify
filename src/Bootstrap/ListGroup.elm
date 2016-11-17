module Bootstrap.ListGroup exposing
  (
   listGroup, listGroupItem
  )

{-| Functions for generating List group html

# List Group
@docs listGroup, listGroupItem

-}

import Html exposing (..)
import Html.Attributes exposing (..)

--List group
----------------------------------------------------------------------------

{-| Generates a list group html element

    listGroup [] []
-}
listGroup : List (Html msg) -> Html msg
listGroup htmlList =
  div [ class "list-group" ] htmlList

{-| Generates a list group item html element

    listGroup []
     [
      listGroupItem [] []
     ]
-}
listGroupItem : List (Attribute msg) -> List (Html msg) -> Html msg
listGroupItem extraAttributes htmlList =
  let attributes = class "list-group-item" :: extraAttributes
  in
    a attributes htmlList

----------------------------------------------------------------------------
