let Spinnaker = ../../package.dhall

let DeployTarget = ./DeployTarget.dhall

let project = ./project.dhall

let spinnaker = Spinnaker.schemas

let manifest =
      \(deployTarget : DeployTarget.Type) ->
        spinnaker.ExpectedArtifact::{
            , defaultArtifact = None spinnaker.DefaultArtifact.Type
            , displayName = Some "app-server-${deployTarget}"
            , id = "3258c2d1-40ac-4ae0-b81b-04067f733474"
            , matchArtifact = spinnaker.MatchArtifact::{
              , artifactAccount = Some "github"
              , customKind = Some True
              , id = Some "5153f072-fa1a-4440-b4b8-13c83687532f"
              , name = "kubernetes/${deployTarget}/app-server.yml"
              , type = Some "github/file"
              }
            }

let deployToTarget =
      \(targetWithIndex : { index : Natural, value : DeployTarget.Type }) ->
        spinnaker.Stage::{
            , refId = Natural/show targetWithIndex.index
            , name = "deploy app server to ${targetWithIndex.value}"
            , type = "deployManifest"
            , account = Some targetWithIndex.value
            , cloudProvider = Some "kubernetes"
            , manifestArtifactId = Some (manifest targetWithIndex.value).id
            , moniker = Some spinnaker.Moniker::{ app = Some project.name }
            , namespaceOverride = Some project.name
            , source = Some "artifact"
            }

in  { manifest, deployToTarget }
