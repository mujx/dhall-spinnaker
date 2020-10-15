{ enabled : Bool
, type : Text
, source : Optional Text
, expectedArtifactIds : Optional (List Text)
, attributeConstraints : Optional ./AttributeConstraints.dhall
, organization : Optional Text
, payloadConstraints : Optional (List { mapKey : Text, mapValue : Text })
, pubsubSystem : Optional Text
, repository : Optional Text
, subscriptionName : Optional Text
, branch : Optional Text
, slug : Optional Text
, project : Optional Text
}
