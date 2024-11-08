"""The OSH model for an adjective form has gender, number, substantive state and a noun type."""
struct OSHAdjective <: OSHMorphologicalForm
    gender::Union{Nothing,OSHGender}
    number::Union{OSHNumber, Nothing}
    state::Union{OSHSubstantiveState, Nothing}
    type::OSHAdjectiveType
end


"""Construct an adjective from morphological code.
$(SIGNATURES)
"""
function adjective(code::AbstractString)
    #if length(code) == 3 && nountype(code[3]) isa OSHProperName
    #    OSHNoun(nothing, nothing, nothing, OSHProperName())
    if length(code) < 6
        @error("Invalid code for adjective $(code)")

    else
        thestate = substantive_state(code[6])
        thetype = adjectivetype(code[3])
        if isnothing(thestate) || isnothing(thetype)
            @error("Invalid adjective code $(code)")
            nothing
        else
            OSHAdjective(
            gender(code),
            number(code),
            thestate,
            thetype
            )
        end
    end
end


"""Find the gender for an adjective form.
$(SIGNATURES)
"""
function gender(a::OSHAdjective)
    a.gender
end

"""Find the number for an adjective form.
$(SIGNATURES)
"""
function number(a::OSHAdjective)
    a.number
end


"""Find the substantive state for an adjective form.
$(SIGNATURES)
"""
function substantive_state(a::OSHAdjective)
    a.state
end

"""Find the noun type for an adjective form.
$(SIGNATURES)
"""
function adjectivetype(a::OSHAdjective)
    a.type
end