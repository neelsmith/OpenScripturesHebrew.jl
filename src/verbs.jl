abstract type OSHConjugation end

struct OSHQal <: OSHConjugation end
struct OSHHiphil <: OSHConjugation end
struct OSHPiel <: OSHConjugation end
struct OSHNiphal <: OSHConjugation end
struct OSHPual <: OSHConjugation end
struct OSHHophal <: OSHConjugation end
struct OSHTiphil <: OSHConjugation end
struct OSHQalPassive <: OSHConjugation end
struct OSHHishtaphel <: OSHConjugation end



"""Find conjugation of a Hebrew verb.
$(SIGNATURES)
"""
function conjugation(lang::HebrewLanguage, codestring)::Union{OSHConjugation, Nothing}
    if isempty(codestring)
        @error("Invalid argument for morphological code: empty string")
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
    else
    end
end

#=
 'f' => 1
  'o' => 1

  'r' => 1

 
  
  'v' => 2
  'l' => 1
=#