module BlogPost exposing (main)

import Browser
import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (style)


-- MODEL

type alias Model =
    { title : String
    , content : List String
    , author : String
    , date : String
    }


initialModel : Model
initialModel =
    { title = "Your Blog Post Title Here"
    , content =
        [ "This is the first paragraph of your blog post. Start your blog post by engaging your readers with interesting facts or statements."
        , "This is the second paragraph. Continue to develop your ideas. Make sure to break your content into readable chunks to make it easier for your readers to digest."
        ]
    , author = "Your Name"
    , date = "March 15, 2024"
    }


-- VIEW

view : Model -> Html msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , p [] [ text ("Posted by " ++ model.author ++ " on " ++ model.date) ]
        , div []
            (List.map (\paragraph -> p [] [ text paragraph ]) model.content)
        ]


-- MAIN

main : Program () Model msg
main =
    Browser.sandbox { init = initialModel, update = \_ model -> model, view = view }
