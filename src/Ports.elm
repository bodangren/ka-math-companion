port module Ports exposing (processMath, renderMath)


port renderMath : { id : String, latex : String, displayMode : Bool } -> Cmd msg


port processMath : String -> Cmd msg
