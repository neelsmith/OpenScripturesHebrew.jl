
# Enumeration of conjugations:

struct OSHQal <: OSHConjugation end
struct OSHHiphil <: OSHConjugation end
struct OSHPiel <: OSHConjugation end
struct OSHNiphal <: OSHConjugation end
struct OSHPual <: OSHConjugation end
struct OSHHophal <: OSHConjugation end
struct OSHTiphil <: OSHConjugation end
struct OSHQalPassive <: OSHConjugation end
struct OSHHishtaphel <: OSHConjugation end
struct OSHHithpalpel <: OSHConjugation end
struct OSHPolel <: OSHConjugation end
struct OSHHithpolel <: OSHConjugation end
struct OSHPilpel <: OSHConjugation end



"""Find conjugation of a Hebrew verb.
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
