module OpenScripturesHebrew
using EzXML

using Documenter, DocStringExtensions

export attributevalue, morphcode, parseword
export compilewordlist

export language, HebrewLanguage, AramaicLanguage
export pos
export parsecode

export OSHInfinitive, infinitive
export OSHFiniteVerb, finiteverb

export conjugation, verbtype, person, number, gender


include("bookids.jl")


include("abstracttypes.jl")
include("type_enumerations.jl")

include("lang_pos.jl")


include("finiteverb.jl")
include("infinitive.jl")
include("participle.jl")


include("morphcodes.jl")


include("xmlparsing.jl")





end # module OpenScripturesHebrew


