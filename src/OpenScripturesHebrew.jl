module OpenScripturesHebrew
using EzXML

using Documenter, DocStringExtensions

export attributevalue, morphcode, parseword
export compilewordlist

export language, HebrewLanguage, AramaicLanguage

export pos, PoSAdjective, PoSAdverb, PoSConjunction, PoSNoun, PoSPronoun, PoSSuffix, PoSParticle, PoSPreposition
export PoSFiniteVerb, PoSInfinitive, PoSParticiple

export conjugation, verbtype
export isverb, isfiniteverb, isinfinitive, isparticiple

include("bookids.jl")


include("abstracttypes.jl")
include("morphology_values.jl")

include("lang_pos.jl")



include("finiteverb.jl")
include("infinitive.jl")
include("participle.jl")


include("verbcodes.jl")


include("xmlparsing.jl")





end # module OpenScripturesHebrew


