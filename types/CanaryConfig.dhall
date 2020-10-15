{ baselineAnalysisOffsetInMins : Optional Text
, beginCanaryAnalysisAfterMins : Optional Text
, canaryAnalysisIntervalMins : Text
, canaryConfigId : Optional Text
, canaryConfigName : Optional Text
, lifetimeDuration : Optional Text
, metricsAccountName : Text
, scopes : List ./CanaryConfigScope.dhall
, scoreThresholds : Optional ./ScoreThresholds.dhall
, storageAccountName : Text
, combinedCanaryResultStrategy : Optional Text
}
