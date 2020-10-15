let Spinnaker = ../../package.dhall

let spinnaker = Spinnaker.schemas

let project = ./project.dhall

let slack =
      spinnaker.Notification::{
      , address = Some "${project.name}-deploys"
      , level = Some "pipeline"
      , type = Some "slack"
      , when = Some [ "pipeline.complete", "pipeline.failed" ]
      }

in  { slack }
