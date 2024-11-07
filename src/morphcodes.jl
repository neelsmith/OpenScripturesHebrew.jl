abstract type OSHLanguage end

struct HebrewLanguage <: OSHLanguage end
struct AramaicLanguage <: OSHLanguage end

function language(codestring)::Union{OSHLanguage, Nothing}
    if isempty(codestring)
        @error("Invalid argument for morphological code: empty string")
        nothing
    elseif codestring[1] == 'H'
        HebrewLanguage()
    elseif codestring[1] == 'A'
        AramaicLanguage()
    else
        @error("Invalid language code $(codestring[1])")
        nothing
    end
end


abstract type OSHPartOfSpeech end
struct OSHAdjective <: OSHPartOfSpeech end
struct OSHConjunction <: OSHPartOfSpeech end
struct OSHAdverb <: OSHPartOfSpeech end
struct OSHNoun <: OSHPartOfSpeech end
struct OSHPronoun <: OSHPartOfSpeech end
struct OSHSuffix <: OSHPartOfSpeech end
struct  OSHParticle <: OSHPartOfSpeech end
struct OSHPreposition <: OSHPartOfSpeech end
struct OSHVerb <: OSHPartOfSpeech end



function pos(lang::OSHLanguage, codestring)
    @error("Function pos not implemented for $(typeof(lang))")
end

function pos(lang::HebrewLanguage, codestring)::Union{OSHPartOfSpeech, Nothing}
    if isempty(codestring)
        @error("Invalid argument for morphological code: empty string")
        nothing

    elseif codestring[2] == 'A'
        OSHAdjective()
    elseif codestring[2] == 'C'
        OSHConjunction()
    elseif codestring[2] == 'D'
        OSHAdverb()
    elseif codestring[2] == 'N'
        OSHNoun()
    elseif codestring[2] == 'P'
        OSHPronoun()
    elseif codestring[2] == 'R'
        OSHPreposition()        
    elseif codestring[2] == 'S'
        OSHSuffix()
    elseif codestring[2] == 'T'
        OSHParticle()
    elseif codestring[2] == 'V'
        OSHVerb()
    else
        @error("Invalid code for part of speech $(codestring[2]) (code $(codestring))")
        nothing
    end
end

#=
posstrings = Dict(
    'A' => "adjective",
    'C' => "conjunction",
    'D' => "adverb",
    'N' => "noun",
    'P' => "pronoun",
    'S' => "suffix",
    'T' => "particle",
    'V' => "verb"
)
    
=#