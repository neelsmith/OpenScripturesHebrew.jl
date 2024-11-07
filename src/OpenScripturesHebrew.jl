module OpenScripturesHebrew
using EzXML

using Documenter, DocStringExtensions

export attributevalue, morphcode, parseword
export compilewordlist

export language, HebrewLanguage, AramaicLanguage

export pos, OSHAdjective, OSHAdverb, OSHConjunction, OSHNoun, OSHPronoun, OSHSuffix, OSHParticle, OSHVerb, OSHPreposition

export conjugation, verbtype
export isverb, isfiniteverb, isinfinitive

include("bookids.jl")


include("abstracttypes.jl")
include("morphology_values.jl")

include("lang_pos.jl")
include("verbs.jl")
include("infinitive.jl")


include("xmlparsing.jl")





end # module OpenScripturesHebrew


