{ repoType = "github"
, cloudProviders = "kubernetes"
, dataSources =
  { disabled = [] : List Text
  , enabled =
    [ "executions"
    , "serverGroups"
    , "canaryConfigs"
    , "securityGroups"
    , "loadBalancers"
    ]
  }
, description = None Text
, enableRerunActiveExecutions = None Bool
, enableRestartRunningExecutions = None Bool
, isntancePort = None Natural
, trafficGrards = None (List Text)
}
