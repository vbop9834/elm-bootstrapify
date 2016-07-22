module Bootstrap.Buttons exposing
  (
   ButtonOption(BtnDefault, BtnPrimary, BtnSuccess, BtnWarning, BtnInfo, BtnDanger),
   ButtonSizeModifier(BtnLarge, BtnBlock, BtnSmall, BtnExtraSmall, NavbarBtn),
   btn
  )

{-| Functions for bootstrap buttons

# Buttons
@docs ButtonOption, ButtonSizeModifier, btn

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
