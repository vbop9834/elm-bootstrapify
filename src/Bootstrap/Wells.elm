module Bootstrap.Wells exposing
  (
   WellOption(WellNormal,WellSmall,WellLarge),
   well
  )

{-| Functions for generating bootstrap wells

# Wells
@docs WellOption, well

-}

import Html exposing (..)
import Html.Attributes exposing (..)

--Well Well Well...  https://youtu.be/4iZOL63vej8?t=44
----------------------------------------------------------------------------

{-|
  Different Size Wells!
-}
type WellOption =
    WellNormal
  | WellSmall
  | WellLarge

{-| Generates a well html element

    well WellLarge [] []
-}
well : WellOption -> List (Attribute msg) -> List (Html msg) -> Html msg
well wellOption extraAttributes htmlList =
  let
    wellOptionClass =
      case wellOption of
        WellNormal -> ""
        WellSmall -> "well-sm"
        WellLarge -> "well-lg"
    attributes = class ("well " ++ wellOptionClass) :: extraAttributes
  in
    div attributes htmlList

----------------------------------------------------------------------------
