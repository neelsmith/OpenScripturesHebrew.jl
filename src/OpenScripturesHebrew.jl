module OpenScripturesHebrew
using Downloads
using EzXML

using BrownDriverBriggs

using Documenter, DocStringExtensions

export attributevalue
export compilewords, compilewords_remote
export torah

export language, HebrewLanguage, AramaicLanguage
export speechpart
export parsecode, parseword

export OSHInfinitive, infinitive
export OSHFiniteVerb, finiteverb

export conjugation
export OSHQal, OSHHiphil, OSHPiel, OSHNiphal, OSHPual, OSHHophal, OSHQalPassive

export verbtype
export OSHPerfect, OSHSequentialPerfect, OSHImperfect, OSHSequentialImperfect, OSHJussive, OSHImperative, OSHCohortative

export person
export OSHFirstPerson, OSHSecondPerson, OSHThirdPerson

export number
export OSHSingular, OSHPlural, OSHDual

export gender
export OSHMasculine, OSHFeminine, OSHCommon

export nounstate
export OSHAbsolute, OSHConstruct

export resolvebdb

include("bookids.jl")


include("abstracttypes.jl")
include("type_enumerations.jl")

include("lang_pos.jl")


include("finiteverb.jl")
include("infinitive.jl")
include("participle.jl")
include("suffixes.jl")


include("morphcodes.jl")

include("bdb.jl")
include("xmlparsing.jl")





end # module OpenScripturesHebrew


