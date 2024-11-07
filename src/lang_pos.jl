
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


function pos(lang::OSHLanguage, codestring)
    @error("Function pos not implemented for $(typeof(lang))")
end


"""Find part of speech for a Hebrew token.
$(SIGNATURES)
"""
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
