module Main exposing (main)

import Browser
import Element.Button exposing (beforeIconButton, standardButton)
import Element.Icon as Icon
import Html exposing (Html, article, div, p, text)
import Html.Attributes exposing (class)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type ClickState
    = Standard
    | Downloading
    | UnClick


type alias Model =
    ClickState


init : () -> ( Model, Cmd Msg )
init _ =
    ( UnClick, Cmd.none )



-- UPDATE


type Msg
    = StandardClick
    | DownloadClick


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        StandardClick ->
            ( Standard, Cmd.none )

        DownloadClick ->
            ( Downloading, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    article [ class "ly_cont" ]
        [ div [ class "bl_buttonSimulation" ]
            [ standardButton { onClick = StandardClick, disabled = False, text = "標準ボタン" }
            , standardButton { onClick = StandardClick, disabled = True, text = "標準ボタン" }
            , beforeIconButton { onClick = DownloadClick, icon = Icon.Download, text = "ダウンロード" }
            , p [ class "bl_buttonSimulation_clickState" ]
                [ text <|
                    case model of
                        Standard ->
                            "標準ボタンがクリックされました"

                        Downloading ->
                            "ダウンロードボタンがクリックされました"

                        UnClick ->
                            ""
                ]
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
