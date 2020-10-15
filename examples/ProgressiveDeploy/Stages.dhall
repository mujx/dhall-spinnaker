let Prelude = ../dependencies/Prelude.dhall

let List/map = Prelude.List.map

let Spinnaker = ../../package.dhall

let spinnaker = Spinnaker.schemas

let DeployTarget = ./DeployTarget.dhall

let AppServer = ./AppServer.dhall

let staging =
      List/map
        { index : Natural, value : DeployTarget.Type }
        spinnaker.Stage.Type
        AppServer.deployToTarget
        (Prelude.List.indexed DeployTarget.Type DeployTarget.staging)

let production =
      List/map
        { index : Natural, value : DeployTarget.Type }
        spinnaker.Stage.Type
        AppServer.deployToTarget
        (Prelude.List.indexed DeployTarget.Type DeployTarget.production)

in  { staging, production }
