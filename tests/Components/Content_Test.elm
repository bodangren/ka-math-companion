module Components.Content_Test exposing (suite)

import Components.Content as Content
import Data.LessonContent exposing (LessonContent, explanation)
import Html
import Test
import Test.Html.Query as Query
import Test.Html.Selector exposing (text)


suite : Test.Test
suite =
    Test.describe "Components.Content"
        [ Test.test "viewLessonContent renders introduction" <|
            \_ ->
                let
                    content : LessonContent
                    content =
                        { unitSlug = "test"
                        , lessonSlug = "test"
                        , introduction = [ explanation "Test introduction" ]
                        , workedExamples = []
                        , commonMistakes = []
                        , checks = []
                        }
                in
                Content.viewLessonContent content
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Test introduction" ]
        , Test.test "viewLessonContent renders section headers" <|
            \_ ->
                let
                    content : LessonContent
                    content =
                        { unitSlug = "test"
                        , lessonSlug = "test"
                        , introduction = []
                        , workedExamples = []
                        , commonMistakes = []
                        , checks = []
                        }
                in
                Content.viewLessonContent content
                    |> Html.div []
                    |> Query.fromHtml
                    |> Query.has [ text "Introduction", text "Worked Examples", text "Check Your Understanding" ]
        ]