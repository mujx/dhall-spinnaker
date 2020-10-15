{-|
This package represents the dhall version of OpenAPI for Spinnaker. You'll notice
a lot of Optionals and very generic types. This is purposeful: OpenAPI does not have support for
union types, which would be necessary to eliminate the many Optionals in types like [Stage](./types/Stage.dhall).

Until Spinnaker publishes an OpenAPI spec for its Pipeline Configuration (JSON), we will need to hand-write these
types, or loosen them incrementally with auto-type-inference via `json-to-dhall`.
-}
let types = ./types.dhall

in  { schemas = ./schemas.dhall /\ { NatOrString = types.NatOrString } }
