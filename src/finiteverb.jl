struct OSHFiniteVerb <: OSHVerb
    conjugation::OSHConjugation
    verbtype::OSHVerbType
    person::OSHPerson
    number::OSHNumber
    gender::OSHGender
end

function finiteverb(code::AbstractString) 
    if length(code) < 7
        @error("Invalid code for finite verb: $(code)")
        nothing
    else
        OSHFiniteVerb(conjugation(code), verbtype(code), person(code), number(code), gender(code))    
    end
end