module Bootstrap.Page exposing
  (
   pullRight,
   pageHeader,
   jumbotron,
   automationTag
  )
{-| Bootstrap page functions

# Page
@docs pullRight, pageHeader, jumbotron

# Automation
@docs automationTag

-}


import Html exposing (..)
import Html.Attributes exposing (..)

import String

{-| This is for being able to write UI Automation selectors efficiently

    button [ automationTag "btn" "submit" ] []
-}
automationTag : String -> String -> Attribute msg
automationTag tag value =
  let
    dataTag = "data-uia-" ++ tag
  in
    attribute dataTag value

-- Page
----------------------------------------------------------------------------

{-| Generates a div with the pull-right class

    pullRight [] []
-}
pullRight : List (Attribute msg) -> List (Html msg) -> Html msg
pullRight extraAttributes htmlList =
  let
    attributes = class "pull-right" :: extraAttributes
  in
    div attributes htmlList

{-| Generates a page header html element

    pageHeader [] []
-}
pageHeader : List (Attribute msg) -> List (Html msg) -> Html msg
pageHeader extraAttributes htmlList =
  let
    attributes = class "page-header" :: extraAttributes
  in
    div attributes htmlList

{-| Generates a jumbotron html element

    jumbotron [] []
-}
jumbotron : List (Attribute msg) -> List (Html msg) -> Html msg
jumbotron extraAttributes htmlList =
  let
    attributes = class "jumbotron" :: extraAttributes
  in
    div attributes htmlList

----------------------------------------------------------------------------
