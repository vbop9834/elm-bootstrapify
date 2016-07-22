module Bootstrap exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import String

--this is for being able to write UI Automation selectors efficiently
automationTag : String -> String -> Attribute msg
automationTag tag value =
  let
    tag = "data-uia-" ++ tag
  in
    attribute tag value

--Grid
----------------------------------------------------------------------------
containerFluid : List (Html msg) -> Html msg
containerFluid htmlList =
  div [ class "container-fluid" ] htmlList

container : List (Html msg) -> Html msg
container htmlList =
  div [ class "container" ] htmlList

row : List (Html msg) -> Html msg
row htmlList =
  div [ class "row" ] htmlList

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

type ColumnType =
    ExtraSmall ColumnSize
  | Small ColumnSize
  | Medium ColumnSize
  | Large ColumnSize

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

--Forms
----------------------------------------------------------------------------

formHorizontal : List (Html msg) -> Html msg
formHorizontal htmlList =
  div [ class "form-horizontal" ] htmlList

formGroup : List (Html msg) -> Html msg
formGroup htmlList =
  div [ class "form-group" ] htmlList

formLabel : List (Attribute msg) -> List (Html msg) -> Html msg
formLabel attributes htmlList =
  let
    attributes = class "control-label" :: attributes
  in
    label attributes htmlList

formInput : List (Attribute msg) -> List (Html msg) -> Html msg
formInput attributes htmlList =
  let
    attributes = class "form-control" :: attributes
  in
    input attributes htmlList

formTextArea : List (Attribute msg) -> List (Html msg) -> Html msg
formTextArea attributes htmlList =
  let
    attributes = class "form-control" :: attributes
  in
    textarea attributes htmlList

----------------------------------------------------------------------------

--Buttons
----------------------------------------------------------------------------

type ButtonOption =
    BtnDefault
  | BtnPrimary
  | BtnSuccess
  | BtnWarning
  | BtnInfo
  | BtnDanger

type ButtonModifier =
    BtnLarge
  | BtnBlock
  | BtnSmall
  | BtnExtraSmall
  | NavbarBtn

btn : ButtonOption -> List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
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

listGroup : List (Html msg) -> Html msg
listGroup htmlList =
  div [ class "list-group" ] htmlList

listGroupItem : List (Attribute msg) -> List (Html msg) -> Html msg
listGroupItem attributes htmlList =
  let attributes = class "list-group-item" :: attributes
  in
    a attributes htmlList

----------------------------------------------------------------------------

--Panels
----------------------------------------------------------------------------

type PanelType =
    Normal
  | Primary
  | Success
  | Info
  | Warning
  | Danger

panelGroup : List (Html msg) -> Html msg
panelGroup htmlList =
  div [ class "panel-group" ] htmlList


panel : PanelType -> List (Attribute msg) -> List (Html msg) -> Html msg
panel panelType attributes htmlList =
  let
    getPanelTypeClass panelType =
      case panelType of
        Normal -> "panel-default"
        Primary -> "panel-primary"
        Success -> "panel-success"
        Info -> "panel-info"
        Warning -> "panel-warning"
        Danger -> "panel-danger"
  in
    let
      panelTypeClass = getPanelTypeClass panelType
      attributes = class ("panel " ++ panelTypeClass) :: attributes
    in
      div attributes htmlList

type PanelHeadingTitleType =
    DefaultTitle String
  | PanelH1 String
  | PanelH2 String
  | PanelH3 String
  | PanelH4 String
  | PanelH5 String

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

panelBody : List (Attribute msg) -> List (Html msg) -> Html msg
panelBody attributes htmlList =
  let
    attributes = class "panel-body" :: attributes
  in
    div attributes htmlList

----------------------------------------------------------------------------

--Navbar
----------------------------------------------------------------------------

type NavbarType =
    DefaultNavbar
  | InverseNavbar
  | FormNavbar

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

navbarFixedToTop : NavbarType ->List (Attribute msg) -> List (Html msg) -> Html msg
navbarFixedToTop navbarType attributes htmlList =
  let
    attributes = class "navbar-fixed-top" :: attributes
  in
    navbar navbarType attributes htmlList

navbarHeader : List (Attribute msg) -> List (Html msg) -> Html msg
navbarHeader attributes htmlList =
  let
    attributes = class "navbar-header" :: attributes
  in
    div attributes htmlList

navbarBrand : List (Attribute msg) -> List (Html msg) -> Html msg
navbarBrand attributes htmlList =
  let
    attributes = class "navbar-brand" :: attributes
  in
    a attributes htmlList

type NavbarListAdjustment =
    NavbarDefault
  | NavbarRight
  | NavbarLeft
  | NavbarJustified

type NavbarPillsOptions =
    PillsNotStacked
  | PillsStacked

type NavbarOptions =
    NavbarNav
  | NavbarTabs
  | NavbarPills NavbarPillsOptions

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

navbarCollapse : List (Attribute msg) -> List (Html msg) -> Html msg
navbarCollapse attributes htmlList =
  let
    attributes = class "collapse navbar-collapse" :: attributes
  in
    div attributes htmlList

----------------------------------------------------------------------------

--Well Well Well...  https://youtu.be/4iZOL63vej8?t=44
----------------------------------------------------------------------------

type WellOption =
    WellNormal
  | WellSmall
  | WellLarge

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

-- Misc
----------------------------------------------------------------------------

pullRight : List (Attribute msg) -> List (Html msg) -> Html msg
pullRight attributes htmlList =
  let
    attributes = class "pull-right" :: attributes
  in
    div attributes htmlList

pageHeader : List (Attribute msg) -> List (Html msg) -> Html msg
pageHeader attributes htmlList =
  let
    attributes = class "page-header" :: attributes
  in
    div attributes htmlList

jumbotron : List (Attribute msg) -> List (Html msg) -> Html msg
jumbotron attributes htmlList =
  let
    attributes = class "jumbotron" :: attributes
  in
    div attributes htmlList

----------------------------------------------------------------------------
