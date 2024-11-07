module OpenScripturesHebrew
using EzXML


include("morphcodes.jl")
include("xmlparsing.jl")

export attributevalue, morphcode, parseword


export language, HebrewLanguage, AramaicLanguage
export pos, OSHAdjective, OSHAdverb, OSHConjunction, OSHNoun, OSHPronoun, OSHSuffix, OSHParticle, OSHVerb, OSHPreposition



end # module OpenScripturesHebrew


