{ instanceMetadata = [] : List { mapKey : Text, mapValue : Text }
, backendServiceMetadata = [] : List { mapKey : Text, mapValue : Text }
, loadBalancers = [] : List Text
, authScopes = [] : List Text
, availabilityZones = [] : List { mapKey : Text, mapValue : List Text }
, capacity = None ../types/ClusterCapacity.dhall
, distributionPolicy.zones = [] : List Text
, labels = [] : List { mapKey : Text, mapValue : Text }
, disks = [] : List ../types/ClusterDisk.dhall
, tags = [] : List Text
, freeformDetails = None Text
, imageArtifactId = None Text
, stack = None Text
}
