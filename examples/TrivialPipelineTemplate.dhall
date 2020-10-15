let Spinnaker = ../package.dhall

let myProject = { name = "my-project", team = "my-team", email = "myteam@example.com" }

let spinnaker = Spinnaker.schemas

let waitTimeId = "timeToWait"

let pipelineTemplate =
      spinnaker.PipelineTemplate::{
      , id = myProject.name
      , metadata = spinnaker.Metadata::{
        , name = "Wait Stage"
        , description = "Demonstrative wait stage."
        , owner = myProject.email
        }
      , variables = [ spinnaker.Variable::{ type = "int", name = waitTimeId } ]
      , pipeline = spinnaker.Pipeline::{
        , lastModifiedBy = Some myProject.team
        , stages =
          [ spinnaker.Stage::{
            , refId = "1"
            , name = "my wait stage"
            , type = "wait"
            , stageEnabled = Some spinnaker.StageEnabled::{
              , expression = "SUCCESS"
              }
            , waitTime = Some
                ( spinnaker.NatOrString.String
                    "\${ templateVariables.${waitTimeId} }"
                )
            }
          ]
        }
      }

let _testIdIsProjectName = assert : pipelineTemplate.id === myProject.name

in  pipelineTemplate
