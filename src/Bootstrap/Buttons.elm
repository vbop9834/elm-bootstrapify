module Bootstrap.Buttons exposing
  (
   ButtonOption(BtnDefault, BtnPrimary, BtnSuccess, BtnWarning, BtnInfo, BtnDanger, BtnLink),
   ButtonSizeModifier(BtnLarge, BtnBlock, BtnSmall, BtnExtraSmall, NavbarBtn ),
   ButtonModifier(BtnCollapse),
   btn
  )

{-| Functions for bootstrap buttons

# Buttons
@docs ButtonOption, ButtonSizeModifier, ButtonModifier, btn

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import String

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
  | BtnLink

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
  Modifiers for button attributes
-}
type ButtonModifier =
    BtnCollapse String

getButtonModifierClass btnModifier =
  case btnModifier of
    BtnLarge -> "btn-lg"
    BtnBlock -> "btn-block"
    BtnSmall -> "btn-sm"
    BtnExtraSmall -> "btn-xs"
    NavbarBtn -> "navbar-btn"

getButtonModifierAttribute btnModifier =
  case btnModifier of
    BtnCollapse target -> [ attribute "data-toggle" "collapse", attribute "data-target" target ]

{-| Generates a button html element

    btn BtnPrimary [ BtnBlock, BtnLarge ] [ BtnCollapse "#idOfElement, .orClass" ] [] [ text "Hello world!" ]
-}
btn : ButtonOption -> List ButtonSizeModifier -> List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btn btnOption btnSizeModifiers btnModifiers attributes htmlList =
  let
    buttonModifierClasses =
     btnSizeModifiers
     |> List.map getButtonModifierClass
     |> List.map (\class -> class ++ " ")
     |> String.concat
    -----------------------------------------------------------------------
    buttonModifierAttributes =
     btnModifiers
     |> List.map getButtonModifierAttribute
     |> List.concat
    -----------------------------------------------------------------------
    buttonOptionClass =
      case btnOption of
        BtnDefault -> "btn-default"
        BtnPrimary -> "btn-primary"
        BtnSuccess -> "btn-success"
        BtnInfo -> "btn-info"
        BtnDanger -> "btn-danger"
        BtnWarning -> "btn-warning"
        BtnLink -> "btn-link"
    -----------------------------------------------------------------------
    classes =
     "btn " ++ buttonOptionClass ++ " " ++ buttonModifierClasses
    -----------------------------------------------------------------------
    btnModifierAttributes =
      buttonModifierAttributes ++ attributes
    -----------------------------------------------------------------------
    newAttributes = class classes :: btnModifierAttributes
    -----------------------------------------------------------------------
  in
    button newAttributes htmlList

----------------------------------------------------------------------------
