{ name : Text
, email : Text
, repoType : Text
, repoProjectKey : Text
, repoSlug : Text
, cloudProviders : Text
, permissions : { EXECUTE : List Text, READ : List Text, WRITE : List Text }
, dataSources : { disabled : List Text, enabled : List Text }
, description : Optional Text
, enableRerunActiveExecutions : Optional Bool
, enableRestartRunningExecutions : Optional Bool
, isntancePort : Optional Natural
, trafficGrards : Optional (List Text)
}
