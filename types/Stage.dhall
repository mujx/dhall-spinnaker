{ refId : Text
, name : Text
, type : Text
, alias : Optional Text
, preconditions : Optional (List ./Precondition.dhall)
, requisiteStageRefIds : Optional (List Text)
, location : Optional Text
, manifestName : Optional Text
, cloudProvider : Optional Text
, cloudProviderType : Optional Text
, mode : Optional Text
, continuePipeline : Optional Bool
, failPipeline : Optional Bool
, failOnFailedExpressions : Optional Bool
, account : Optional Text
, completeOtherBranchesThenFail : Optional Bool
, numRevisionsBack : Optional Natural
, url : Optional Text
, expectedArtifacts : Optional (List ./ExpectedArtifact.dhall)
, method : Optional Text
, statusUrlResolution : Optional Text
, stageEnabled : Optional ./StageEnabled.dhall
, replicas : Optional Text
, waitTime : Optional ./NatOrString.dhall
, overrideTimeout : Optional Bool
, cluster : Optional Text
, credentials : Optional Text
, regions : Optional (List Text)
, action : Optional Text
, scaleNum : Optional Natural
, scalePct : Optional Natural
, moniker : Optional ./Moniker.dhall
, capacity : Optional (List { mapKey : Text, mapValue : Text })
, resizeType : Optional Text
, target : Optional Text
, stageTimeoutMs : Optional Natural
, job : Optional Text
, markUnstableAsSuccessful : Optional Bool
, master : Optional Text
, parameters : Optional (List { mapKey : Text, mapValue : Text })
, onlyEnabled : Optional Bool
, selectionStrategy : Optional Text
, application : Optional Text
, executionOptions : Optional ./ExecutionOptions.dhall
, pipeline : Optional Text
, manifestArtifactId : Optional Text
, manifestArtifactAccount : Optional Text
, requiredArtifactIds : Optional (List Text)
, requiredArtifacts : Optional (List Text)
, namespaceOverride : Optional Text
, skipExpressionEvaluation : Optional Bool
, source : Optional Text
, trafficManagement : Optional ./TrafficManagement.dhall
, group : Optional Text
, clusters : Optional (List ./Cluster.dhall)
, options : Optional ./DeleteManifestOptions.dhall
, analysisType : Optional Text
, canaryConfig : Optional ./CanaryConfig.dhall
, extendedAttributes : Optional (List { mapKey : Text, mapValue : Text })
, baseLabel : Optional Text
, baseOs : Optional Text
, user : Optional Text
, packageArtifactIds : Optional (List Text)
, region : Optional Text
, rebake : Optional Bool
, useSourceCapacity : Optional Bool
, targetCluster : Optional Text
, disableTraffic : Optional Bool
, freeFormDetails : Optional Text
, stack : Optional Text
, instructions : Optional Text
, parameterValues : Optional (List { mapKey : Text, mapValue : Text })
, pipelineParameters : Optional (List { mapKey : Text, mapValue : Text })
, waitForCompletion : Optional Bool
}
