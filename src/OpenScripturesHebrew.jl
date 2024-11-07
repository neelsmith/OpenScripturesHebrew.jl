module OpenScripturesHebrew
using EzXML

using Documenter, DocStringExtensions

export attributevalue, morphcode, parseword
export compilewords

export language, HebrewLanguage, AramaicLanguage
export pos, OSHAdjective, OSHAdverb, OSHConjunction, OSHNoun, OSHPronoun, OSHSuffix, OSHParticle, OSHVerb, OSHPreposition
export conjugation 


include("bookids.jl")


include("abstracttypes.jl")
include("lang_pos.jl")
include("verbs.jl")
include("infinitive.jl")


include("xmlparsing.jl")





end # module OpenScripturesHebrew


