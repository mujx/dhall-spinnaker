let ParameterConfig
    : Type
    = { default : Text
      , description : Text
      , hasOptions : Bool
      , label : Text
      , name : Text
      , options : Optional (List ./ParameterConfigOption.dhall)
      , pinned : Bool
      , required : Bool
      }

in  ParameterConfig
