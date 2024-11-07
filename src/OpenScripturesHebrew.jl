module OpenScripturesHebrew
using EzXML

using Documenter, DocStringExtensions

export attributevalue, morphcode, parseword
export compilewords

export language, HebrewLanguage, AramaicLanguage
export pos, OSHAdjective, OSHAdverb, OSHConjunction, OSHNoun, OSHPronoun, OSHSuffix, OSHParticle, OSHVerb, OSHPreposition

include("bookids.jl")
include("morphcodes.jl")
include("xmlparsing.jl")



end # module OpenScripturesHebrew


