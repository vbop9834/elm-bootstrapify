module Bootstrap exposing
  (
   containerFluid, container, row, column,
   ColumnSize, ColumnType,
   formHorizontal, FormGroupOption, formLabel, formInput, formTextArea,
   ButtonOption, ButtonSizeModifier, btn,
   listGroup, listGroupItem,
   PanelType, panelGroup, panel, panelHeading, panelBody,
   PanelHeadingTitleType,
   NavbarType, navbar, navbarHeader, navbarBrand,
   NavbarListAdjustment, NavbarPillsOptions, NavbarOptions, navbarList,
   WellOption, well,
   pullRight, pageHeader, jumbotron,
   automationTag
  )
{-| The Bootstrap module contains all important bootstrap theming functions

# Grid
@docs containerFluid, container, row, column

# Column
@docs ColumnSize, ColumnType, column

# Forms
@docs formHorizontal, FormGroupOption, formLabel, formInput, formTextArea

# Buttons
@docs ButtonOption, ButtonSizeModifier, btn

# List Group
@docs listGroup, listGroupItem

# Panels
@docs PanelType, panelGroup, panel, panelHeading, panelBody

# Panel Headings
@docs PanelHeadingTitleType, panelHeading

# Navbar
@docs NavbarType, navbar, navbarHeader, navbarBrand

# Navbar List
@docs NavbarListAdjustment, NavbarPillsOptions, NavbarOptions, navbarList

# Wells
@docs WellOption, well

# Page
@docs pullRight, pageHeader, jumbotron

# Automation
@docs automationTag

-}

import Html exposing (..)
import Html.Attributes exposing (..)

import String

{-|
  this is for being able to write UI Automation selectors efficiently

    button [ automationTag "btn" "submit" ] []
-}
automationTag : String -> String -> Attribute msg
automationTag tag value =
  let
    tag = "data-uia-" ++ tag
  in
    attribute tag value

--Grid
----------------------------------------------------------------------------
{-|
  Generates a fluid container html element
    containerFluid [ ]
-}
containerFluid : List (Html msg) -> Html msg
containerFluid htmlList =
  div [ class "container-fluid" ] htmlList

{-|
  Generates a container html element
    container [ ]
-}
container : List (Html msg) -> Html msg
container htmlList =
  div [ class "container" ] htmlList

{-|
  Generates a row html element
    containerFluid
     [
      row
       [
       ]
     ]
-}
row : List (Html msg) -> Html msg
row htmlList =
  div [ class "row" ] htmlList

{-|
  Type to be used when determining column size
  Note that a row can only container up to 12 column size units
-}
type ColumnSize =
    One
  | Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Ten
  | Eleven
  | Twelve

{-|
  Type to be used when determining column size based on screen size
  Extra small devices Phones (<768px)
  Small devices Tablets (≥768px)
  Medium devices Desktops (≥992px)
  Large devices Desktops (≥1200px)
-}
type ColumnType =
    ExtraSmall ColumnSize
  | Small ColumnSize
  | Medium ColumnSize
  | Large ColumnSize

{-|
  Generates a column html element
    containerFluid
     [
      row
       [
        column [ ExtraSmall Twelve, Small Twelve, Medium Twelve, Large Twelve ]
         [
         ]
       ]
     ]
-}
column : List ColumnType -> List (Html msg) -> Html msg
column columns htmlList =
  let
    getColumnSizeString columnSize =
      case columnSize of
        One -> "1"
        Two -> "2"
        Three -> "3"
        Four -> "4"
        Five -> "5"
        Six -> "6"
        Seven -> "7"
        Eight -> "8"
        Nine -> "9"
        Ten -> "10"
        Eleven -> "11"
        Twelve -> "12"

    getColumnString columnType =
      case columnType of
        ExtraSmall columnSize ->
          "col-xs-" ++ (getColumnSizeString columnSize)
        Small columnSize ->
          "col-sm-" ++ (getColumnSizeString columnSize)
        Medium columnSize ->
          "col-md-" ++ (getColumnSizeString columnSize)
        Large columnSize ->
          "col-lg-" ++ (getColumnSizeString columnSize)

    flattenColumnList columnOne columnTwo =
      columnOne ++ " " ++ columnTwo

    columnClasses =
      columns
      |> List.map getColumnString
      |> List.foldr flattenColumnList ""
  in
    div [ class columnClasses ] htmlList

----------------------------------------------------------------------------

-- Forms
----------------------------------------------------------------------------

{-|
  Generates a row form-horizontal element
    formHorizontal
      [
      ]
-}
formHorizontal : List (Html msg) -> Html msg
formHorizontal htmlList =
  div [ class "form-horizontal" ] htmlList

{-|
  A set of different Form group options
-}
type FormGroupOption =
    FormGroupDefault
  | FormGroupSmall
  | FormGroupLarge

{-|
  Generates a formGroup html element
    formHorizontal
     [
      formGroup FormGroupDefault
        [
        ]
     ]
-}
formGroup : FormGroupOption -> List (Html msg) -> Html msg
formGroup formGroupOption htmlList =
  let
    formGroupOptionClass =
      case formGroupOption of
        FormGroupDefault -> ""
        FormGroupSmall -> "form-group-sm"
        FormGroupLarge -> "form-group-lg"
    formGroupClass =
      "form-group " ++ formGroupOptionClass
  in
    div [ class formGroupClass ] htmlList

{-|
  Generates a formLabel html element
    formHorizontal
     [
      formGroup FormGroupDefault
        [
         formLabel [] []
        ]
     ]
-}
formLabel : List (Attribute msg) -> List (Html msg) -> Html msg
formLabel attributes htmlList =
  let
    attributes = class "control-label" :: attributes
  in
    label attributes htmlList

{-|
  Generates a formInput html element
    formHorizontal
     [
      formGroup FormGroupDefault
        [
         formInput [] []
        ]
     ]
-}
formInput : List (Attribute msg) -> List (Html msg) -> Html msg
formInput attributes htmlList =
  let
    attributes = class "form-control" :: attributes
  in
    input attributes htmlList

{-|
  Generates a form text area html element
    formHorizontal
     [
      formGroup FormGroupDefault
        [
         formTextArea [] []
        ]
     ]
-}
formTextArea : List (Attribute msg) -> List (Html msg) -> Html msg
formTextArea attributes htmlList =
  let
    attributes = class "form-control" :: attributes
  in
    textarea attributes htmlList

----------------------------------------------------------------------------

--Buttons
----------------------------------------------------------------------------

{-|
  A set of options for rendering a btn
-}
type ButtonOption =
    BtnDefault
  | BtnPrimary
  | BtnSuccess
  | BtnWarning
  | BtnInfo
  | BtnDanger

{-|
  A set of sizes for rendering a btn
-}
type ButtonSizeModifier =
    BtnLarge
  | BtnBlock
  | BtnSmall
  | BtnExtraSmall
  | NavbarBtn

{-|
  Generates a button html element
    btn BtnPrimary [ BtnBlock, BtnLarge ] [] [ text "Hello world!" ]
-}
btn : ButtonOption -> List ButtonSizeModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btn btnOption btnModifiers attributes htmlList =
  let
    getButtonModifierClass btnModifier =
      case btnModifier of
        BtnLarge -> "btn-lg"
        BtnBlock -> "btn-block"
        BtnSmall -> "btn-sm"
        BtnExtraSmall -> "btn-xs"
        NavbarBtn -> "navbar-btn"
  in
    let
    -----------------------------------------------------------------------
      buttonOptionClass =
        case btnOption of
          BtnDefault -> "btn-default"
          BtnPrimary -> "btn-primary"
          BtnSuccess -> "btn-success"
          BtnInfo -> "btn-info"
          BtnDanger -> "btn-danger"
          BtnWarning -> "btn-warning"
    -----------------------------------------------------------------------
      classes =
         let
           buttonModifierClasses =
             btnModifiers
             |> List.map getButtonModifierClass
             |> List.map (\class -> class ++ " ")
             |> String.concat
         in
           "btn " ++ buttonOptionClass ++ " " ++ buttonModifierClasses
    -----------------------------------------------------------------------
      attributes = class classes :: attributes
    -----------------------------------------------------------------------
    in
      button attributes htmlList

----------------------------------------------------------------------------

--List group
----------------------------------------------------------------------------

{-|
  Generates a list group html element
    listGroup [] []
-}
listGroup : List (Html msg) -> Html msg
listGroup htmlList =
  div [ class "list-group" ] htmlList

{-|
  Generates a list group item html element
    listGroup []
     [
      listGroupItem [] []
     ]
-}
listGroupItem : List (Attribute msg) -> List (Html msg) -> Html msg
listGroupItem attributes htmlList =
  let attributes = class "list-group-item" :: attributes
  in
    a attributes htmlList

----------------------------------------------------------------------------

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

{-|
  Generates a panelGroup html element
    panelGroup [] []
-}
panelGroup : List (Html msg) -> Html msg
panelGroup htmlList =
  div [ class "panel-group" ] htmlList

{-|
  Generates a panel html element
    panel PrimaryPanel [] []
-}
panel : PanelType -> List (Attribute msg) -> List (Html msg) -> Html msg
panel panelType attributes htmlList =
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
      attributes = class ("panel " ++ panelTypeClass) :: attributes
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

{-|
  Generates a panelHeading html element
    panelHeading PanelH3 [] []
-}
panelHeading : PanelHeadingTitleType -> List (Attribute msg) -> List (Html msg) -> Html msg
panelHeading panelHeadingTitleType attributes htmlList =
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
    attributes = class "panel-heading" :: attributes
    htmlList = panelHeadingTitleHtml :: htmlList
  in
    div attributes htmlList

{-|
  Generates a panelBody html element
    panelBody [] []
-}
panelBody : List (Attribute msg) -> List (Html msg) -> Html msg
panelBody attributes htmlList =
  let
    attributes = class "panel-body" :: attributes
  in
    div attributes htmlList

----------------------------------------------------------------------------

--Navbar
----------------------------------------------------------------------------

{-|
  Different types of Navbar styles
-}
type NavbarType =
    DefaultNavbar
  | InverseNavbar
  | FormNavbar

{-|
  Generates a navbar html element
    navbar DefaultNavbar [] []
-}
navbar : NavbarType ->  List (Attribute msg) -> List (Html msg) -> Html msg
navbar navbarType attributes htmlList =
  let
    navbarTypeClass =
      case navbarType of
        DefaultNavbar -> "navbar-default"
        InverseNavbar -> "navbar-inverse"
        FormNavbar -> "navbar-form"
    navbarClass = "navbar " ++ navbarTypeClass
    attributes = class navbarClass :: attributes
  in
    nav attributes htmlList

{-|
  Generates a navbar header html element
    navbarHeader [] []
-}
navbarHeader : List (Attribute msg) -> List (Html msg) -> Html msg
navbarHeader attributes htmlList =
  let
    attributes = class "navbar-header" :: attributes
  in
    div attributes htmlList

{-|
  Generates a navbarBrand html element
    navbarBrand [] []
-}
navbarBrand : List (Attribute msg) -> List (Html msg) -> Html msg
navbarBrand attributes htmlList =
  let
    attributes = class "navbar-brand" :: attributes
  in
    a attributes htmlList

{-|
  A set of options for adjusting a navbar list
-}
type NavbarListAdjustment =
    NavbarDefault
  | NavbarRight
  | NavbarLeft
  | NavbarJustified

{-|
  Option for Navbar Pills
-}
type NavbarPillsOptions =
    PillsNotStacked
  | PillsStacked

{-|
  A set of Navbar Options
-}
type NavbarOptions =
    NavbarNav
  | NavbarTabs
  | NavbarPills NavbarPillsOptions

{-|
  Generates a navbarList html element
    navbarList (NavbarPills PillsStacked) NavbarRight []
     [
     ]
-}
navbarList : NavbarOptions -> NavbarListAdjustment -> List (Attribute msg) -> List (Html msg) -> Html msg
navbarList navbarOption navbarListAdjustment attributes htmlList =
  let
    navbarListAdjustmentClass =
      case navbarListAdjustment of
        NavbarDefault -> ""
        NavbarLeft -> "navbar-left"
        NavbarRight -> "navbar-right"
        NavbarJustified -> "nav-justified"
    getNavbarPillsOptionClass pillsOption =
      case pillsOption of
        PillsNotStacked -> ""
        PillsStacked -> "nav-stacked"
    getNavbarOptionClass navbarOption =
      case navbarOption of
        NavbarNav -> "navbar-nav"
        NavbarTabs -> "navbar-tabs"
        NavbarPills pillsOption -> "nav-pills " ++ (getNavbarPillsOptionClass pillsOption)
    navbarClass = "nav " ++ (getNavbarOptionClass navbarOption) ++ " " ++ navbarListAdjustmentClass
    attributes = class navbarClass :: attributes
  in
    ul attributes htmlList

----------------------------------------------------------------------------

--Well Well Well...  https://youtu.be/4iZOL63vej8?t=44
----------------------------------------------------------------------------

{-|
  Different Size Wells!
-}
type WellOption =
    WellNormal
  | WellSmall
  | WellLarge

{-|
  Generates a well html element
    well WellLarge [] []
-}
well : WellOption -> List (Attribute msg) -> List (Html msg) -> Html msg
well wellOption attributes htmlList =
  let
    wellOptionClass =
      case wellOption of
        WellNormal -> ""
        WellSmall -> "well-sm"
        WellLarge -> "well-lg"
    attributes = class ("well " ++ wellOptionClass) :: attributes
  in
    div attributes htmlList

----------------------------------------------------------------------------

-- Page
----------------------------------------------------------------------------

{-|
  Generates a div with the pull-right class
    pullRight [] []
-}
pullRight : List (Attribute msg) -> List (Html msg) -> Html msg
pullRight attributes htmlList =
  let
    attributes = class "pull-right" :: attributes
  in
    div attributes htmlList

{-|
  Generates a page header html element
    pageHeader [] []
-}
pageHeader : List (Attribute msg) -> List (Html msg) -> Html msg
pageHeader attributes htmlList =
  let
    attributes = class "page-header" :: attributes
  in
    div attributes htmlList

{-|
  Generates a jumbotron html element
    jumbotron [] []
-}
jumbotron : List (Attribute msg) -> List (Html msg) -> Html msg
jumbotron attributes htmlList =
  let
    attributes = class "jumbotron" :: attributes
  in
    div attributes htmlList

----------------------------------------------------------------------------
