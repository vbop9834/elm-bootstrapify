module Bootstrap.Panels exposing
  (
   PanelType(NormalPanel,PrimaryPanel,SuccessPanel,InfoPanel,WarningPanel,DangerPanel),
   panelGroup,
   panel,
   panelHeading,
   panelBody,
   PanelHeadingTitleType(DefaultTitle,PanelH1,PanelH2,PanelH3,PanelH4,PanelH5)
  )

{-| Functions for generating bootstrap panels

# Panels
@docs PanelType, panelGroup, panel, panelHeading, panelBody

# Panel Headings
@docs PanelHeadingTitleType, panelHeading

-}

import Html exposing (..)
import Html.Attributes exposing (..)

--Panels
----------------------------------------------------------------------------

{-|
  A set of options for Panels
-}
type PanelType =
    NormalPanel
  | PrimaryPanel
  | SuccessPanel
  | InfoPanel
  | WarningPanel
  | DangerPanel

{-| Generates a panelGroup html element

    panelGroup [] []
-}
panelGroup : List (Html msg) -> Html msg
panelGroup htmlList =
  div [ class "panel-group" ] htmlList

{-| Generates a panel html element

    panel PrimaryPanel [] []
-}
panel : PanelType -> List (Attribute msg) -> List (Html msg) -> Html msg
panel panelType extraAttributes htmlList =
  let
    getPanelTypeClass panelType =
      case panelType of
        NormalPanel -> "panel-default"
        PrimaryPanel -> "panel-primary"
        SuccessPanel -> "panel-success"
        InfoPanel -> "panel-info"
        WarningPanel -> "panel-warning"
        DangerPanel -> "panel-danger"
  in
    let
      panelTypeClass = getPanelTypeClass panelType
      attributes = class ("panel " ++ panelTypeClass) :: extraAttributes
    in
      div attributes htmlList

{-|
  Types of Panel Headings
-}
type PanelHeadingTitleType =
    DefaultTitle String
  | PanelH1 String
  | PanelH2 String
  | PanelH3 String
  | PanelH4 String
  | PanelH5 String

{-| Generates a panelHeading html element

    panelHeading PanelH3 [] []
-}
panelHeading : PanelHeadingTitleType -> List (Attribute msg) -> List (Html msg) -> Html msg
panelHeading panelHeadingTitleType extraAttributes extraHtmlList =
  let
    getPanelHeadingTitleHtml panelHeadingTitleType =
      case panelHeadingTitleType of
        DefaultTitle content -> text content
        PanelH1 content -> h1 [] [ text content ]
        PanelH2 content -> h2 [] [ text content ]
        PanelH3 content -> h3 [] [ text content ]
        PanelH4 content -> h4 [] [ text content ]
        PanelH5 content -> h5 [] [ text content ]

    panelHeadingTitleHtml = getPanelHeadingTitleHtml panelHeadingTitleType
    attributes = class "panel-heading" :: extraAttributes
    htmlList = panelHeadingTitleHtml :: extraHtmlList
  in
    div attributes htmlList

{-| Generates a panelBody html element

    panelBody [] []
-}
panelBody : List (Attribute msg) -> List (Html msg) -> Html msg
panelBody extraAttributes htmlList =
  let
    attributes = class "panel-body" :: extraAttributes
  in
    div attributes htmlList

----------------------------------------------------------------------------
