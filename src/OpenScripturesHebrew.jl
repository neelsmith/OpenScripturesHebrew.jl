module OpenScripturesHebrew


import Base: show
import Base: ==


using Downloads
using EzXML

using BrownDriverBriggs

using Documenter, DocStringExtensions

export attributevalue
export compilewords, compilewords_remote
export torah, prophets, writings, tanakh

export language, HebrewLanguage, AramaicLanguage
export speechpart, isverb
export PoSAdjective, PoSConjunction, PoSAdverb, PoSNoun, PoSPronoun, PoSParticle, PoSPreposition, PoSSuffix
export PoSParticiple,PoSInfinitive, PoSFiniteVerb

export parsecode, parsetuple

export OSHInfinitive, infinitive
export OSHFiniteVerb, finiteverb
export OSHParticiple, participle
export OSHNoun, noun

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

export substantive_state
export OSHAbsolute, OSHConstruct

export nountype
export OSHGentilic, OSHCommonNoun, OSHProperName

export voice
export OSHActive, OSHPassive

export resolvebdb

include("bookids.jl")


include("abstracttypes.jl")
include("type_enumerations.jl")

include("lang_pos.jl")


include("finiteverb.jl")
include("infinitive.jl")
include("participle.jl")
include("nouns.jl")
include("suffixes.jl")


include("morphcodes.jl")

include("bdb.jl")
include("xmlparsing.jl")





end # module OpenScripturesHebrew


