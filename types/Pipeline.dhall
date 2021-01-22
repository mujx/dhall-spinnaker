{ appConfig : Optional (List { mapKey : Text, mapValue : Text })
, application : Optional Text
, name : Optional Text
, id : Optional Text
, spelEvaluator : Optional Text
, index : Optional Natural
, lastModifiedBy : Optional Text
, updateTs : Optional Text
, parameterConfig : Optional (List ./ParameterConfig.dhall)
, limitConcurrent : Bool
, keepWaitingPipelines : Bool
, expectedArtifacts : Optional (List ./ExpectedArtifact.dhall)
, triggers : List ./Trigger.dhall
, stages : List ./Stage.dhall
, notifications : Optional (List ./Notification.dhall)
}
