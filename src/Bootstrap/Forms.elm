module Bootstrap.Forms exposing
  (
   FormAlignmentOption(FormDefault, FormHorizontal, FormInline),
   form,
   formGroup,
   FormGroupOption(FormGroupDefault, FormGroupSmall, FormGroupLarge),
   formLabel,
   formInput,
   formTextArea
  )

{-| Bootstrap functions pertaining to forms

# Forms
@docs FormAlignmentOption, form, formGroup, FormGroupOption, formLabel, formInput, formTextArea

-}

import Html exposing (..)
import Html.Attributes exposing (..)

-- Forms
----------------------------------------------------------------------------

{-| Options for Form Alignment

    case formAlignmentOption of
      FormDefault -> ""
      FormHorizontal -> "form-horizontal"
      FormInline -> "form-inline"
-}
type FormAlignmentOption =
    FormDefault
  | FormHorizontal
  | FormInline

{-| Generates a form with the supplied alignment

    form FormDefault [ onSubmit SomeMsg ]
     [
     ]
-}
form : FormAlignmentOption -> List (Attribute msg) -> List (Html msg) -> Html msg
form formAlignmentOption extraAttributes htmlList =
  let
    formAlignmentClass =
      case formAlignmentOption of
        FormDefault -> ""
        FormHorizontal -> "form-horizontal"
        FormInline -> "form-inline"
    attributes = class formAlignmentClass :: extraAttributes
  in
    Html.form attributes htmlList

{-|
  A set of different Form group options
-}
type FormGroupOption =
    FormGroupDefault
  | FormGroupSmall
  | FormGroupLarge

{-| Generates a formGroup html element

    form FormDefault [ onSubmit SomeMsg ]
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

{-| Generates a formLabel html element

    form FormDefault [ onSubmit SomeMsg ]
     [
      formGroup FormGroupDefault
        [
         formLabel [] []
        ]
     ]
-}
formLabel : List (Attribute msg) -> List (Html msg) -> Html msg
formLabel extraAttributes htmlList =
  let
    attributes = class "control-label" :: extraAttributes
  in
    label attributes htmlList

{-| Generates a formInput html element

    form FormDefault [ onSubmit SomeMsg ]
     [
      formGroup FormGroupDefault
        [
         formInput [] []
        ]
     ]
-}
formInput : List (Attribute msg) -> List (Html msg) -> Html msg
formInput extraAttributes htmlList =
  let
    attributes = class "form-control" :: extraAttributes
  in
    input attributes htmlList

{-| Generates a form text area html element

    form FormDefault [ onSubmit SomeMsg ]
     [
      formGroup FormGroupDefault
        [
         formTextArea [] []
        ]
     ]
-}
formTextArea : List (Attribute msg) -> List (Html msg) -> Html msg
formTextArea extraAttributes htmlList =
  let
    attributes = class "form-control" :: extraAttributes
  in
    textarea attributes htmlList

----------------------------------------------------------------------------
