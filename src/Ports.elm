port module Ports exposing (renderMath, processMath)


port renderMath : { id : String, latex : String, displayMode : Bool } -> Cmd msg


port processMath : String -> Cmd msg