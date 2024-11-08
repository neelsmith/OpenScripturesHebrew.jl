"""The OSH model a noun form has gender, number, substantive state and a noun type."""
struct OSHPronoun <: OSHMorphologicalForm
    person::Union{OSHPerson, Nothing}
    gender::OSHGender
    number::OSHNumber
    type::OSHPronounType
end


"""Construct a pronoun from morphological code.
$(SIGNATURES)
"""
function pronoun(code::AbstractString)
    #if length(code) == 3 && nountype(code[3]) isa OSHProperName
    #    OSHNoun(nothing, nothing, nothing, OSHProperName())
        
    if length(code) < 6
        @error("Invalid code for pronoun $(code)")

    else
        thetype = pronountype(code[3])
        OSHPronoun(
            person(code),
            gender(code),
            number(code),
            thetype
        )

    end
end


"""Find the gender for a pronoun form.
$(SIGNATURES)
"""
function gender(p::OSHPronoun)
    p.gender
end

"""Find the number for a pronoun form.
$(SIGNATURES)
"""
function number(p::OSHPronoun)
    p.number
end


"""Find the substantive state for a pronoun form.
$(SIGNATURES)
"""
function substantive_state(p::OSHPronoun)
    p.state
end

"""Find the noun type for a pronoun form.
$(SIGNATURES)
"""
function pronountype(p::OSHPronoun)
    p.type
end