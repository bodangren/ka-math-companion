port module Ports exposing (processMath, renderMath, saveProgress, loadProgress, exportProgress, importProgress, progressReceived, progressImported)


port renderMath : { id : String, latex : String, displayMode : Bool } -> Cmd msg


port processMath : String -> Cmd msg


port saveProgress : String -> Cmd msg


port loadProgress : String -> Cmd msg


port exportProgress : String -> Cmd msg


port importProgress : String -> Cmd msg


port progressReceived : (String -> msg) -> Sub msg


port progressImported : (String -> msg) -> Sub msg
