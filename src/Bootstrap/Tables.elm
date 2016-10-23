module Bootstrap.Tables exposing
  (
   TblOption(TableStriped, TableBordered, TableHover, TableCondensed),
   tbl, tblResponsive
  )


{-| Functions for bootstrap tables

# Tables
@docs TblOption, tbl, tblResponsive

-}


import Html exposing (..)
import Html.Attributes exposing (..)
import String


{-|
  Options for the visual appearance
-}
type TblOption
  = TableStriped
  | TableBordered
  | TableHover
  | TableCondensed


getTblOptionClass tblOption =
  case tblOption of
    TableStriped ->
      "table-striped"

    TableBordered ->
      "table-bordered"

    TableHover ->
      "table-hover"

    TableCondensed ->
      "table-condensed"


{-| Generates a table html element

    tbl [ TableStriped, TableHover ] [] [ tableHead, tableBody ]
-}
tbl : List TblOption -> List (Attribute msg) -> List (Html msg) -> Html msg
tbl tblOptions attributes htmlList =
  let
    tblOptionClasses =
      tblOptions
      |> List.map getTblOptionClass
      |> List.map ((++) " ")
      |> String.concat

    classes =
      "table" ++ tblOptionClasses

    newAttributes =
      class classes :: attributes
  in
    table newAttributes htmlList


{-|
  Wraps the table in a "table-responsive" div
-}
tblResponsive : List TblOption -> List (Attribute msg) -> List (Html msg) -> Html msg
tblResponsive tblOptions attributes htmlList =
  div
    [ class "table-responsive" ]
    [ tbl tblOptions attributes htmlList ]
