{ baselineAnalysisOffsetInMins = None Text
, beginCanaryAnalysisAfterMins = None Text
, canaryAnalysisIntervalMins = None Text
, canaryConfigId = None Text
, canaryConfigName = None Text
, scopes = [] : List ../types/CanaryConfigScope.dhall
, scoreThresholds = None ../types/ScoreThresholds.dhall
, storageAccountName = None Text
, combinedCanaryResultStrategy = None Text
}
