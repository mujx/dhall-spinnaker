# Spinnaker

Use the "schema" syntax to create type-safe and unit-testable Spinnaker pipelines.

## Usage

```dhall
let Spinnaker = ./package.dhall

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
```

## Examples

### Toy PipelineTemplate

```bash
dhall-to-json --file ./examples/TrivialPipelineTemplate.dhall
```

### Progressive Deployment

### Automatic Deployment

When pushing a git tag with `vX` to GitHub, the following pipeline will kick off a deploy to staging:

```bash
dhall-to-json <<< '(./examples/ProgressiveDeploy/AutomaticPipeline.dhall).staging'
```

Here's all you gotta change for production:

```bash
dhall-to-json <<< '(./examples/ProgressiveDeploy/AutomaticPipeline.dhall).production'
```

### Manual Deployment

When you want to deploy some branch, tag, or commit, use the following pipeline:

```bash
dhall-to-json <<< '(./examples/ProgressiveDeploy/ManualPipeline.dhall).staging'
```

Here's all you gotta change for production:

```bash
dhall-to-json <<< '(./examples/ProgressiveDeploy/ManualPipeline.dhall).staging'
```

### Type-check existing JSON

#### Disclaimer

Spinnaker has no OpenAPI spec. Yikes. Therefore these types, defaults, etc are hand-typed. They are likely not exhaustive. Certain types of stages, preconditions, and other unions are probably not done. If you run into a type error when converting an existing pipeline to Dhall, feel free to change the types and make a PR!

The best we can do until they create a spec is use their ["functional" test fixtures](https://github.com/spinnaker/deck/blob/e4b0d1849a6ce9da2554f08493136eb7aa722148/test/functional/cypress/fixtures/google/pipelines_list/pipelineConfigs.json).

Run this locally and you'll see a massive list of pipelines converted to Dhall. If this doesn't error, it means you've got a valid Dhall expression that matches our best approximation of Spinnaker's types!

```bash
json-to-dhall '(List ./types/Pipeline.dhall)' --file ./fixtures/pipelines.json
```

#### Type-check your own JSON

```bash
json-to-dhall ./types/Pipeline.dhall --file ./path/to/your/pipeline.json
```

If you want to check a stage, a pipeline template, whatever, use the appropriate Dhall type!

```bash
json-to-dhall ./types/Stage.dhall --file ./path/to/your/stage.json
json-to-dhall ./types/PipelineTemplate.dhall --file ./path/to/your/pipelineTemplate.json
```
