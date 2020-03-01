module Element.Button exposing (beforeIconButton, standardButton)

import Element.Icon as Icon
import Html exposing (Html, a, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)


type alias ButtonProps msg =
    { text : String
    , onClick : msg
    , disabled : Bool
    }


standardButton : ButtonProps msg -> Html msg
standardButton props =
    if props.disabled then
        a [ class "el_btn el_btn__disabled", href "#" ] [ text props.text ]

    else
        a [ class "el_btn", onClick props.onClick, href "#" ] [ text props.text ]


type alias IconButtonProps msg =
    { text : String
    , onClick : msg
    , icon : Icon.Icon
    }


beforeIconButton : IconButtonProps msg -> Html msg
beforeIconButton props =
    let
        iconModifier =
            "el_beforeIconBtn__" ++ Icon.toButtonModifier props.icon
    in
    a [ class <| "el_beforeIconBtn " ++ iconModifier, onClick props.onClick, href "#" ] [ text props.text ]
