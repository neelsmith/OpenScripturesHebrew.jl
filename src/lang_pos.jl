"""Find language for a OSH code string.
$(SIGNATURES)
"""
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

"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function speechpart(lang::OSHLanguage, codestring)
    @warn("Function speechpart not implemented for $(typeof(lang))")
    nothing
end

"""Find part of speech for a morphological code.
$(SIGNATURES)
"""
function speechpart(codestring)::Union{OSHPartOfSpeech, Nothing}
    speechpart(language(codestring), codestring)
end

"""Find Hebrew part of speech for a morphological code.
$(SIGNATURES)
"""
function speechpart(lang::HebrewLanguage, codestring)::Union{OSHPartOfSpeech, Nothing}
    if isempty(codestring)
        @error("Invalid argument for morphological code: empty string")
        nothing

    elseif codestring[2] == 'A'
        PoSAdjective()
    elseif codestring[2] == 'C'
        PoSConjunction()
    elseif codestring[2] == 'D'
        PoSAdverb()
    elseif codestring[2] == 'N'
        PoSNoun()
    elseif codestring[2] == 'P'
        PoSPronoun()
    elseif codestring[2] == 'R'
        PoSPrespeechpartition()        
    elseif codestring[2] == 'S'
        PoSSuffix()
    elseif codestring[2] == 'T'
        PoSParticle()

    elseif codestring[2] == 'V'
        if length(codestring) == 4
            PoSInfinitive()
        elseif codestring[4] == 'r' || codestring[4] == 's'
            PoSParticiple()
        else
            PoSFiniteVerb()
        end

    else
        @error("Invalid code for part of speech $(codestring[2]) (code $(codestring))")
        nothing
    end
end
