"""The OSH model of a pronoun form has gender, number, substantive state and a noun type."""
struct OSHPronoun <: OSHMorphologicalForm
    person::Union{OSHPerson, Nothing}
    gender::Union{OSHGender, Nothing}
    number::Union{OSHNumber, Nothing}
    type::OSHPronounType
end

function show(io::IO, pron::OSHPronoun)
    print(io, join(["pronoun ($(pron.type)):", pron.person, pron.gender, pron.number], " "))
end

"""Construct a pronoun from morphological code.
$(SIGNATURES)
"""
function pronoun(code::AbstractString)
    if length(code) == 3 
       OSHPronoun(nothing, nothing, nothing, pronountype(code[3]))
        
    elseif length(code) < 6
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