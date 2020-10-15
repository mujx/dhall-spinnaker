let StatusPrecondition
    : Type
    = { context : { stageStatus : Text, stageName : Text }
      , type : Text
      , failPipeline : Bool
      }

in  StatusPrecondition
