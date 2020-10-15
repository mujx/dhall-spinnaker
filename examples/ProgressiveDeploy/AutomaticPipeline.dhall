let Prelude = ../dependencies/Prelude.dhall

let List/map = Prelude.List.map

let Spinnaker = ../../package.dhall

let project = ./project.dhall

let spinnaker = Spinnaker.schemas

let Stages = ./Stages.dhall

let AppServer = ./AppServer.dhall

let Notification = ./Notification.dhall

let DeployTarget = ./DeployTarget.dhall

let appServerManifests =
      \(targets : List DeployTarget.Type) ->
        List/map
          DeployTarget.Type
          spinnaker.ExpectedArtifact.Type
          AppServer.manifest
          targets

let triggerOnGitRelease =
      \(targets : List DeployTarget.Type) ->
        spinnaker.Trigger::{
        , type = "git"
        , enabled = True
        , branch = Some "refs/tags/v\\d+\$"
        , expectedArtifactIds = Some
            ( List/map
                spinnaker.ExpectedArtifact.Type
                Text
                (\(manifest : spinnaker.ExpectedArtifact.Type) -> manifest.id)
                (appServerManifests targets)
            )
        , project = Some "zendesk"
        , slug = Some project.name
        , source = Some "github"
        }

let Pipeline/fromTargets =
      \(targets : List DeployTarget.Type) ->
        spinnaker.Pipeline::{
        , expectedArtifacts = Some (appServerManifests targets)
        , lastModifiedBy = Some project.team
        , notifications = Some [ Notification.slack ]
        , triggers = [ triggerOnGitRelease targets ]
        }

let staging
    : spinnaker.Pipeline.Type
    = let pipeline = Pipeline/fromTargets DeployTarget.staging

      in  pipeline
        with stages = Stages.staging

let production
    : spinnaker.Pipeline.Type
    = let pipeline = Pipeline/fromTargets DeployTarget.production

      in  pipeline
        with stages = Stages.production

in  { staging, production }
