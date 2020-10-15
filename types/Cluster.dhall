{ instanceMetadata : List { mapKey : Text, mapValue : Text }
, backendServiceMetadata : List { mapKey : Text, mapValue : Text }
, imageArtifactId : Optional Text
, associatePublicIpAddress : Bool
, application : Text
, automaticRestart : Bool
, regional : Bool
, cloudProvider : Text
, subnet : Text
, strategy : Text
, network : Text
, zone : Text
, account : Text
, loadBalancers : List Text
, instanceType : Text
, authScopes : List Text
, disableTraffic : Bool
, targetSize : Natural
, availabilityZones : List { mapKey : Text, mapValue : List Text }
, capacity : Optional ./ClusterCapacity.dhall
, onHostMaintenance : Text
, distributionPolicy : { zones : List Text }
, imageSource : Text
, labels : List { mapKey : Text, mapValue : Text }
, selectZones : Bool
, serviceAccountEmail : Text
, freeFormDetails : Optional Text
, region : Text
, minCpuPlatform : Text
, disks : List ./ClusterDisk.dhall
, stack : Optional Text
, canIpForward : Bool
, provider : Text
, tags : List Text
, preemptible : Bool
}
