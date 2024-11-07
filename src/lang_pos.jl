
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


function verbpos(lang::OSHLanguage, codestring)::Union{OSHPartOfSpeech, Nothing}
    if isparticiple(codestring)
        PosParticiple()
    elseif isinfinitive(codestring)
        PoSInfinitive() 
    elseif isfiniteverb(codestring)        
       PosFiniteVerb()
        
    else
        @error("Could not find valid verb type $(codestring)")
        nothing
    end
end

function pos(codestring)::Union{OSHPartOfSpeech, Nothing}
    pos(language(codestring), codestring)
end

"""Find part of speech for a Hebrew token.
$(SIGNATURES)
"""
function pos(lang::HebrewLanguage, codestring)::Union{OSHPartOfSpeech, Nothing}
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
        PoSPreposition()        
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
