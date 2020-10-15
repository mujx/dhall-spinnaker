let DeployTarget = Text

let staging
    : List DeployTarget
    = [ "some-server-1" ]

let production
    : List DeployTarget
    = [ "some-server-2", "some-server-3", "some-server-4" ]

in  { Type = DeployTarget, staging, production }
