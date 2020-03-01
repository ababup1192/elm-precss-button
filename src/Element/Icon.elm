module Element.Icon exposing (Icon(..), toButtonModifier)


type Icon
    = Download


toButtonModifier : Icon -> String
toButtonModifier icon =
    case icon of
        Download ->
            "download"
