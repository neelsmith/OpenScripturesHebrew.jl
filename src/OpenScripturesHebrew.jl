module OpenScripturesHebrew
using Downloads
using EzXML

using Documenter, DocStringExtensions

export attributevalue
export compilewords, compilewords_remote
export torah

export language, HebrewLanguage, AramaicLanguage
export pos
export parsecode, parseword

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
include("suffixes.jl")


include("morphcodes.jl")


include("xmlparsing.jl")





end # module OpenScripturesHebrew


