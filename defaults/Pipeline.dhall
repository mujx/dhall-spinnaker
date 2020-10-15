{ appConfig = None (List { mapKey : Text, mapValue : Text })
, application = None Text
, name = None Text
, id = None Text
, index = None Natural
, updateTs = Some "0"
, parameterConfig = None (List ../types/ParameterConfig.dhall)
, limitConcurrent = True
, keepWaitingPipelines = False
, expectedArtifacts = None (List ../types/ExpectedArtifact.dhall)
, triggers = [] : List ../types/Trigger.dhall
, stages = [] : List ../types/Stage.dhall
, notifications = None (List ../types/Notification.dhall)
}
