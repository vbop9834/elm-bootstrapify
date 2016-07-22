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
    tag = "data-uia-" ++ tag
  in
    attribute tag value

-- Page
----------------------------------------------------------------------------

{-| Generates a div with the pull-right class

    pullRight [] []
-}
pullRight : List (Attribute msg) -> List (Html msg) -> Html msg
pullRight attributes htmlList =
  let
    attributes = class "pull-right" :: attributes
  in
    div attributes htmlList

{-| Generates a page header html element

    pageHeader [] []
-}
pageHeader : List (Attribute msg) -> List (Html msg) -> Html msg
pageHeader attributes htmlList =
  let
    attributes = class "page-header" :: attributes
  in
    div attributes htmlList

{-| Generates a jumbotron html element

    jumbotron [] []
-}
jumbotron : List (Attribute msg) -> List (Html msg) -> Html msg
jumbotron attributes htmlList =
  let
    attributes = class "jumbotron" :: attributes
  in
    div attributes htmlList

----------------------------------------------------------------------------
