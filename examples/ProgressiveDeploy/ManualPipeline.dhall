let Spinnaker = ../../package.dhall

let project = ./project.dhall

let spinnaker = Spinnaker.schemas

let Notification = ./Notification.dhall

let Stages = ./Stages.dhall

let versionToDeploy =
      spinnaker.ParameterConfig::{
      , default = ""
      , description =
          "Git Tag, i.e. v123. You can also deploy a -deploy branch."
      , label = "version"
      , name = "version"
      , pinned = True
      , required = True
      , options = None (List spinnaker.ParameterConfigOption.Type)
      }

let pipeline =
      spinnaker.Pipeline::{
      , parameterConfig = Some [ versionToDeploy ]
      , lastModifiedBy = Some project.team
      , notifications = Some [ Notification.slack ]
      }

let staging
    : spinnaker.Pipeline.Type
    = pipeline
      with stages = Stages.staging

let production
    : spinnaker.Pipeline.Type
    = pipeline
      with stages = Stages.production

in  { staging, production }
