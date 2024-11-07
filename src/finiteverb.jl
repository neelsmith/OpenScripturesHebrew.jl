struct OSHFiniteVerb <: OSHVerb
    conjugation::OSHConjugation
    verbtype::OSHVerbType
    person::OSHPerson
    number::OSHNumber
    gender::OSHGender
end


"""Construct a finite verb form from a morphological code.
$(SIGNATURES)
"""
function finiteverb(code::AbstractString) 
    if length(code) < 7
        @error("Invalid code for finite verb: $(code)")
        nothing
    else
        OSHFiniteVerb(conjugation(code), verbtype(code), person(code), number(code), gender(code))    
    end
end

function conjugation(v::OSHFiniteVerb)
    v.conjugation
end

function verbtype(v::OSHFiniteVerb)
    v.verbtype
end


function person(v::OSHFiniteVerb)
    v.person
end


function number(v::OSHFiniteVerb)
    v.number
end



function gender(v::OSHFiniteVerb)
    v.gender
end