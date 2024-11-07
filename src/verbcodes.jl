
"""True if code string represents a verb (finite or infinitive form).
$(SIGNATURES)
"""
function isverb(codestring)::Bool
    #pos(language(codestring), codestring) isa OSHVerb
end


"""True if code string represents a finite verb form.
$(SIGNATURES)
"""
function isfiniteverb(codestring)::Bool
    #isverb(codestring) && !(isinfinitive(codestring)) && !(isparticiple(codestring))
end


"""True if code string represents an infinitive verb form.
$(SIGNATURES)
"""
function isinfinitive(codestring)::Bool
    #isverb(codestring) && length(codestring) == 4
end


function isparticiple(codestring)::Bool
    #isverb(codestring) && length(codestring) == 7 && 
   # (codestring[4] == 'r' || codestring[4] == 's')
end


"""Find conjugation for a Hebrew verb code.
$(SIGNATURES)
"""
function conjugation(lang::HebrewLanguage, codestring)::Union{OSHConjugation, Nothing}
    if isempty(codestring) || length(codestring) < 3
        @error("Invalid argument for conjugation $(codestring)")
        nothing
    elseif codestring[3] == 'q'
        OSHQal()        
    elseif codestring[3] == 'h'
        OSHHiphil()
    elseif codestring[3] == 'p'
        OSHPiel()  
    elseif codestring[3] == 'N'
        OSHNiphal()  
    elseif codestring[3] == 'P'
        OSHPual()       
    elseif codestring[3] == 'H'
        OSHHophal()    
    elseif codestring[3] == 't'
        OSHTiphil()  
    elseif codestring[3] == 'Q'
        OSHQalPassive()  
    elseif codestring[3] == 'v'
        OSHHishtaphel() 
    elseif codestring[3] == 'f'
        OSHHithpalpel() 
    elseif codestring[3] == 'o'
        OSHPolel()  
    elseif codestring[3] == 'r'
        OSHHithpolel()         
    elseif codestring[3] == 'l'
        OSHPilpel()                                                                
    else
        @error("Unrecognized value for conjugation $(codestring)")
    end
end

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
    end
end