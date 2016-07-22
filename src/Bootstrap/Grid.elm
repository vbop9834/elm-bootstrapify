module Bootstrap.Grid exposing
 (
  containerFluid, container, row, column,
  ColumnSize(One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten,Eleven,Twelve),
  ColumnType(ExtraSmall,Small,Medium,Large)
 )

{-| Bootstrap grid functions for generating html

# Grid
@docs containerFluid, container, row, column

# Column
@docs ColumnSize, ColumnType, column

-}

import Html exposing (..)
import Html.Attributes exposing (..)

--Grid
----------------------------------------------------------------------------
{-| Generates a fluid container html element

    containerFluid [ ]
-}
containerFluid : List (Html msg) -> Html msg
containerFluid htmlList =
  div [ class "container-fluid" ] htmlList

{-| Generates a container html element

    container [ ]
-}
container : List (Html msg) -> Html msg
container htmlList =
  div [ class "container" ] htmlList

{-| Generates a row html element

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

{-| Type to be used when determining column size
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

{-| Generates a column html element

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
