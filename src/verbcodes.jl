
"""Find Hebrew conjugation object for a character code.
$(SIGNATURES)
"""
function conjugation(lang::HebrewLanguage, code::Char)
    if code == 'q'
        OSHQal()        
    elseif code == 'h'
        OSHHiphil()
    elseif code == 'p'
        OSHPiel()  
    elseif code == 'N'
        OSHNiphal()  
    elseif code == 'P'
        OSHPual()        
    elseif code == 'H'
        OSHHophal()    
    elseif code == 't'
        OSHTiphil()  
    elseif code == 'Q'
        OSHQalPassive()  
    elseif code == 'v'
        OSHHishtaphel() 
    elseif code == 'f'
        OSHHithpalpel() 
    elseif code == 'o'
        OSHPolel()  
    elseif code == 'r'
        OSHHithpolel()         
    elseif code == 'l'
        OSHPilpel()                                                                
    else
        @error("Unrecognized value for conjugation $(codestring)")
    end
end

"""Find conjugation for a Hebrew verb code.
$(SIGNATURES)
"""
function conjugation(lang::HebrewLanguage, codestring::AbstractString)::Union{OSHConjugation, Nothing}
    if isempty(codestring) || length(codestring) < 3
        @error("Invalid argument for conjugation $(codestring)")
        nothing
    else
        conjugation(lang, codesring[3])
    end
end

"""Find Hebrew verb type ("tense") for a morphological code.
$(SIGNATURES)
"""
function verbtype(lang::HebrewLanguage, codestring)::Union{OSHVerbType, Nothing}
    if isempty(codestring) || length(codestring) < 4
        @error("Invalid argument for verbtype $(codestring)")
        nothing
    elseif codestring[4] == 'p'
        OSHPerfect() 
    elseif codestring[4] == 'q'
        OSHSequentialPerfect()         
    elseif codestring[4] == 'i'
        OSHImperfect()         
    elseif codestring[4] == 'w'
        OSHSequentialImperfect() 

    elseif codestring[4] == 'j'
        OSHJussive()
    elseif codestring[4] == 'v'
        OSHImperative()
    elseif codestring[4] == 'h'
        OSHCohortative()                 

    else
        @error("Unrecognized code for verb type: $(codestring[4]) in $(codestring)")
        nothing
    end
end

