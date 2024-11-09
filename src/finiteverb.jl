"""A finitive form belongs to a conjugation, and has a verb type, person, number and gender."""
struct OSHFiniteVerb <: OSHMorphologicalForm
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
        conj = conjugation(code)
        if isnothing(conj) 
            @warn("Invalid code for finite verb $(code)")
            nothing 
            
        else
           OSHFiniteVerb(conj, verbtype(code), person(code), number(code), gender(code))
        end
    end
end

#=


"""Override Base.show for a gerundive form.
$(SIGNATURES)
"""
function show(io::IO, g::LMFGerundive)
    print(io, label(g))
end

"""Override Base.== for a gerundive form.
$(SIGNATURES)
"""
function ==(g1::LMFGerundive, g2::LMFGerundive)
    lmpGender(g1)  == lmpGender(g2) &&
    lmpCase(g1)  == lmpCase(g2) &&
    lmpNumber(g1)  == lmpNumber(g2) 
end
=#
"""Find conjugation for a verb form.
$(SIGNATURES)
"""
function conjugation(v::OSHFiniteVerb)
    v.conjugation
end



"""Find verb type for a verb form.
$(SIGNATURES)
"""
function verbtype(v::OSHFiniteVerb)
    v.verbtype
end


"""Find person for a verb form.
$(SIGNATURES)
"""
function person(v::OSHFiniteVerb)
    v.person
end


"""Find number for a verb form.
$(SIGNATURES)
"""
function number(v::OSHFiniteVerb)
    v.number
end



"""Find gender for a verb form.
$(SIGNATURES)
"""
function gender(v::OSHFiniteVerb)
    v.gender
end